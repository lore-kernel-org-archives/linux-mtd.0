Received: from bear.ext.ti.com ([192.94.94.41])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WNycc-0004tm-JD
 for linux-mtd@lists.infradead.org; Thu, 13 Mar 2014 05:56:03 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: Brian Norris <computersforpeace@gmail.com>, Elie De Brauwer
 <eliedebrauwer@gmail.com>
Subject: RE: [PATCH 1/2] mtd: nand: add erased-page bitflip correction
Date: Thu, 13 Mar 2014 05:55:32 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EAB2F71@DBDE04.ent.ti.com>
References: <1394529112-9659-1-git-send-email-computersforpeace@gmail.com>
 <20980858CB6D3A4BAE95CA194937D5E73EAB1679@DBDE04.ent.ti.com>
 <531FF16F.7060808@gmail.com>
 <CAGWqfijgOL4Qk4axrPo=Z2vcq_upBCM-jQCm-wkSs12RqTeR8Q@mail.gmail.com>
 <532005C6.3090805@gmail.com>
 <CAGWqfigu3GFPS3Ykap4_hjkMtEUCv8bXGOt2h7GGQ=Sgip=DdQ@mail.gmail.com>
 <20140313052219.GQ31517@norris-Latitude-E6410>
In-Reply-To: <20140313052219.GQ31517@norris-Latitude-E6410>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: Huang Shijie <b32955@freescale.com>, Kent Li <kent.li@radisys.com>,
 HOUR Frederic <frederic.hour@safran-engineering.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Artem
 Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

All,

>From: Brian Norris [mailto:computersforpeace@gmail.com]
>On Wed, Mar 12, 2014 at 01:45:15PM +0100, Elie De Brauwer wrote:
>> On Wed, Mar 12, 2014 at 7:59 AM, Brian Norris <computersforpeace@gmail.c=
om> wrote:
>> > On 03/11/2014 10:59 PM, Elie De Brauwer wrote:
[...]
>> > I'm a little confused by the number of different patches out here. I'l=
l
>> > summarize what I understand, but please correct if I'm wrong:
>> >
>> > [A] First, you (Elie) sent a series of patches that made it to v7 [1].
>> > This utilizes a special GPMI hardware feature that can tell report an
>> > ECC chunk as "erased" based on how many 0 bits it has (between 0 and
>> > some threshold). This still required a fallback to count the number of
>> > bits whenever it's under this threshold
>> >
>> > [B] Then, you sent an additional patch [2] (on top of [1]) which tries
>> > to cache the syndrome related to a fully erased page (no bitflips) for
>> > speeding up some comparisons. You provided benchmarks in [3]
>> >
>> > [C] Finally, Huang followed up with his own patch [4]. It doesn't do
>> > anything specific to GPMI really, and it encouraged me to just submit =
my
>> > own patch (the current thread) for nand_base.
>> >
>> > But I can't tell what to do with your performance numbers. I see resul=
ts
>> > for [1] and for [1]+[2], but I don't see any results for [4].
>> >
>> > Finally, is [4] supposed to replace your (Elie's) work from [1] and [2=
],
>> > or supplement it? It sounded like you two were encouraging me to merge
>> > it by itself.
>>
>> Your archeological research is  correct. During A-B I followed a track i=
n
>> which I believed was a water-tight system using as much as possible
>> assist  from hardware as possible. But Huang turned this into something
>> more usable using more internal knowledge of the working of the
>> BCH syndromes.
>
>OK, so if an approach like [C] stabilizes, that should replace [A] and [B]=
?
>
>> >> What my tests haves learned me is that there's probably very little t=
o
>> >> gain in the
>> >> actual optimization of the erased-page correction, but the magic lies=
 in quickly
>> >> and efficiently determining if a read-page is actually an all-0xff
>> >> case with a bitflip
>> >> causing the BCH block to detect it as an error.
>> >
>> > I'm not quite sure what you're saying here. What do you mean
>> > "erased-page correction" vs. "determining ... all-0xff"? Aren't those
>> > the same thing?
>> >
>>
>> I meant there are two things:
>> a) "erase-page correction": if you have an erased page with bitflips,
>>  count and correct them. (E.g. the for loop with the hweight and
>> a potential break when you each a threshold, possible with an in
>> place setting of the to 0xff of the byte in question or followed by
>> a memset to 0xff at the end).
>> b) "determining you read an erased page". In case of the i.mx (and
>> thus GPMI) the BCH block can tell you three things:
>>  1. I read all 0xff's
>>  2. I read some data and nothing got corrected
>>  3. I read something but failed to correct it.
>> The third case can have two causes:
>>  3.a you read valid data with bitflips exceeding what the BCH could
>> correct
>>  3.b you read an erased page with bitflips.
>>
>> Obviously case 3.b is what this discussion is all about, and my quest
>> revolved around a means to quickly identify case '3.b'.
>
>Yes, 3.a vs. 3.b is the big problem.
>
>> And once you're in case '3' it's difficult to actually distinguish betwe=
en
>> 3.a and 3.b (think of a page wich consists out of 99.99% 1-bits but
>> has bitflips exceeding the threshold), You could only identify this by
>> looking at the syndrome data (which should be 0xff) but which is not
>> at hand in the GPMI.
>
>So if you can't distinguish between 3.a and 3.b, then you're in the same
>boat as many other hardware/drivers. But if you can do something special
>with the hardware, that is still potentially very interesting.
>
>(BTW, I don't think saving the syndrome bytes is a very good approach
>here. It seems like that would only help for very specific patterns.)
>
I think for OMAP NAND driver there needs to be some help on "1." also.
There is no hardware support in GPMC (Ti's controller) to find out if the
(read_data + read_oob) =3D=3D 0xff. So you have to do this comparison in
software. And, thus there is performance penalty right at first-step.
(I'm trying to get the statistics of this soon).

So, for OMAP NAND driver flow becomes..
1. There needs to be something without much performance penalty to=20
filter out 'erased-pages without bit-flips'. And this points to basic quest=
ion,
which was asked by Brain earlier [1] and wasn't sure about ..
"Does OOB=3D=3Dall(0xff) can be assumed that pages_is_erased ?"
OR
"Is there any combination of data which produces all(0xff) ECC ?"

Then, statement "3." (3a and 3b) remains similar  to GPMI (FSL Controller) =
driver.


[1] http://lists.infradead.org/pipermail/linux-mtd/2014-March/052472.html

with regards, pekon
