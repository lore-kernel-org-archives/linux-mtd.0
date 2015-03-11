Received: from mailout.micron.com ([137.201.242.129])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YVkMk-0004t4-58
 for linux-mtd@lists.infradead.org; Wed, 11 Mar 2015 17:24:18 +0000
From: "Jeff Lauruhn (jlauruhn)" <jlauruhn@micron.com>
To: Andrea Scian <rnd4@dave-tech.it>, Richard Weinberger <richard@nod.at>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>
Subject: RE: RFC: detect and manage power cut on MLC NAND
Date: Wed, 11 Mar 2015 17:23:42 +0000
Message-ID: <0D23F1ECC880A74392D56535BCADD7354973D072@NTXBOIMBX03.micron.com>
References: <54FEDC42.2060407@dave-tech.it>
 <CAFLxGvx2WMZXvy7f_YyefgAFKDKgMoeoeqt905M1pJFJ28dXrw@mail.gmail.com>
 <1426058414.1567.2.camel@sauron.fi.intel.com> <5500037A.9010509@nod.at>
 <1426064733.1567.6.camel@sauron.fi.intel.com> <55000637.1030702@nod.at>
 <550074D2.1070406@dave-tech.it>
In-Reply-To: <550074D2.1070406@dave-tech.it>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: mtd_mailinglist <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Power loss is actually very complex.  The Write Protect (WP) pin was added =
to NAND help lock the NAND when a power loss event is detected.  I have ext=
ensive information on NAND and would be happy to discuss.  =20


Jeff Lauruhn
NAND Application Engineer
Embedded Business Unit
Micron Technology, Inc


-----Original Message-----
From: linux-mtd [mailto:linux-mtd-bounces@lists.infradead.org] On Behalf Of=
 Andrea Scian
Sent: Wednesday, March 11, 2015 10:01 AM
To: Richard Weinberger; dedekind1@gmail.com
Cc: mtd_mailinglist
Subject: Re: RFC: detect and manage power cut on MLC NAND


Hi all,

and thanks for you feedback.
You can find my comments below.

Il 11/03/2015 10:09, Richard Weinberger ha scritto:
> Am 11.03.2015 um 10:05 schrieb Artem Bityutskiy:
>> On Wed, 2015-03-11 at 09:57 +0100, Richard Weinberger wrote:
>>> Hi!
>>>
>>> Am 11.03.2015 um 08:20 schrieb Artem Bityutskiy:
>>>> On Tue, 2015-03-10 at 13:51 +0100, Richard Weinberger wrote:
>>>>>> WDYT about this?
>>>>>> If it sounds reasonable is there any suggestion where to place such =
a code?
>>>>> Customers often use DYI uninterruptible power supplies using capacito=
rs.
>>>>> But managing a power cut is the least problem you have with MLC NAND.
>>>> Why is it the least problem, what is the hardest one? I thought=20
>>>> this one is the hardest.
>>> IMHO the hardest ones are the problems we don't know yet as NAND=20
>>> vendors are not really chatty about the MLC constraints.
>>> We don't know much about data retention for example. At least we=20
>>> have not much hard facts. Most of our knowledge is hearsay.
>> Well, but from the problems we know paired pages seems to be the=20
>> biggest one. E.g., what do we do if VID header gets corrupted because=20
>> of an interrupted write to the page paired with the VID header page?=20
>> Sounds like a hard problem to me.
> It is a hard problem. But at least we know about it.
>

IIUC can I summarize like the following

1) power cut is one of the big problem we know about MLC NAND flash with UB=
I
2) we are unaware of other big issue with MLC NAND

Unfortunately I don't really know the MTD/UBI/UBIFS internals but (correct =
me if I'm wrong) to me solving the power cut issue only by software (by usi=
ng proper data structure, redundancy, NAND flash operation jornal and so on=
) is pretty hard to implement inside the Linux MTD stack.

On the other hand, stuff like scrubbing (e.g. having a task like GC that pe=
riodically scrub the required NAND erase block), paired page (e.g.
carefully selecting LEB to PEB mapping to avoid reading/writing data into p=
aired page in a wrong way) are still to be implemented but have, somehow, l=
ess impact on the whole MTD stack.

For sure I'm missing some other MLC NAND issue, but the above are the one t=
hat I'm aware of.

WDYT?

Best Regards,

--=20

Andrea SCIAN

DAVE Embedded Systems


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
