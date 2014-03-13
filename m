Received: from comal.ext.ti.com ([198.47.26.152])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WNzeC-0005y0-3g
 for linux-mtd@lists.infradead.org; Thu, 13 Mar 2014 07:01:45 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: RE: [PATCH 1/2] mtd: nand: add erased-page bitflip correction
Date: Thu, 13 Mar 2014 07:01:13 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EAB2FD2@DBDE04.ent.ti.com>
References: <1394529112-9659-1-git-send-email-computersforpeace@gmail.com>
 <20980858CB6D3A4BAE95CA194937D5E73EAB1679@DBDE04.ent.ti.com>
 <531FF16F.7060808@gmail.com>
 <CAGWqfijgOL4Qk4axrPo=Z2vcq_upBCM-jQCm-wkSs12RqTeR8Q@mail.gmail.com>
 <532005C6.3090805@gmail.com>
 <CAGWqfigu3GFPS3Ykap4_hjkMtEUCv8bXGOt2h7GGQ=Sgip=DdQ@mail.gmail.com>
 <20140313052219.GQ31517@norris-Latitude-E6410>
 <20980858CB6D3A4BAE95CA194937D5E73EAB2F71@DBDE04.ent.ti.com>
 <20140313062845.GT31517@norris-Latitude-E6410>
In-Reply-To: <20140313062845.GT31517@norris-Latitude-E6410>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: Kent Li <kent.li@radisys.com>, Elie De Brauwer <eliedebrauwer@gmail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>, HOUR
 Frederic <frederic.hour@safran-engineering.com>,
 Huang Shijie <b32955@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,

>From: Brian Norris [mailto:computersforpeace@gmail.com]
>Hi Pekon,
>
>On Thu, Mar 13, 2014 at 05:55:32AM +0000, Pekon Gupta wrote:
>> >From: Brian Norris [mailto:computersforpeace@gmail.com]
>> >On Wed, Mar 12, 2014 at 01:45:15PM +0100, Elie De Brauwer wrote:
>> >> b) "determining you read an erased page". In case of the i.mx (and
>> >> thus GPMI) the BCH block can tell you three things:
>> >>  1. I read all 0xff's
>> >>  2. I read some data and nothing got corrected
>> >>  3. I read something but failed to correct it.
>> >> The third case can have two causes:
>> >>  3.a you read valid data with bitflips exceeding what the BCH could
>> >> correct
>> >>  3.b you read an erased page with bitflips.
>> >>
>> >> Obviously case 3.b is what this discussion is all about, and my quest
>> >> revolved around a means to quickly identify case '3.b'.
>> >
>> >Yes, 3.a vs. 3.b is the big problem.
>[...]
>
>> I think for OMAP NAND driver there needs to be some help on "1." also.
>> There is no hardware support in GPMC (Ti's controller) to find out if th=
e
>> (read_data + read_oob) =3D=3D 0xff. So you have to do this comparison in
>> software.
>
>Really? So if you read a blank (all 0xff) page that has no bitflips, you
>see an ECC error? I'm sorry, but I didn't realize that's how your
>hardware worked.=20
>
Yes, it is like that.
Therefore if the driver does not filter out "blank (all 0xff) pages) before
'read_data + read_oob' being fed to ELM engine you see "uncorrectable" erro=
r.


> That's the worst hardware ECC design I've seen so far
>:(
>
- GPMC and ELM hardware engines were design during OMAP3 and earlier
  time-frames. When only 1-bit Hamming was enough, and there were
  hardly any bit-flips seen on erased-pages :-).
- And I don't think h/w IP designers have too much visibility on actual usa=
ge
  and software framework of these engines. So this remained un-changed.
However, I do have internally raised this issue of getting a feature added
in hardware to check for all(0xff). But still we have to support legacy dev=
ices.


>So currently, omap2.c tries to mitigate the overhead of checking 1 (and
>3.b) by using a fixed-offset "programmed" marker, right? But this isn't
>workable for all platforms (why, exactly?)
>
Because this 'special marker' is not present in ecc_layout of all ECC schem=
es=20
supported by ROM code. (its only present in BCH8_HW). And so for other
ECC schemes (like BCH16) we have to fall-back on driver to manually compare
and filter out completely 'erased-pages'.


> so you're trying to remove
>this marker in your patch sets, right? (Could you possibly move the
>marker somewhere else, depending on the platform? But admittedly, this
>is still fragile.)
>
Yes, that is what my patch [2] does. I can move the marker to a location
in 'ecc_layout.oobfree' space but then other problems.
(1) This would require change in ecc.layout, for which I don't know how
  legacy devices will behave.
(2) And ECC marker location on an 'erased-page' is still susceptible to
 bit-flips, which will make it detectible as programmed page. And then
 again when ELM tries to correct it, it will show "un-correctable" errors.


>In any case, if the special marker approach fails, you're falling back
>to an approach similar to the Freescale approach (and mine), with a few
>extra tweaks.
>
Yes, so I want to effectively do away with "special marker approach".

I'm very much open to use your nand_base.c approach. But I'm just
trying to get more optimal solution in terms of performance.
because there would be anyways some performance hit to filter-out
erased-pages (without bit-flip) pages in OMAP NAND driver.
Then if there is another iteration to filter-out erased-pages (with bit-fli=
ps)
in nand_base.c, the driver's performance will be hit. (especially for MLC
and NAND devices at lower technologies).


>> And, thus there is performance penalty right at first-step.
>> (I'm trying to get the statistics of this soon).
>
>Yes, that would be nice.
>
>Brian

[2] http://lists.infradead.org/pipermail/linux-mtd/2014-January/051585.html


with regards, pekon
