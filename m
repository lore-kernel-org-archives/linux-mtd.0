Received: from mailout.micron.com ([137.201.242.129])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YVnzp-0000RQ-9V
 for linux-mtd@lists.infradead.org; Wed, 11 Mar 2015 21:16:54 +0000
From: "Jeff Lauruhn (jlauruhn)" <jlauruhn@micron.com>
To: Richard Weinberger <richard@nod.at>, Andrea Scian <rnd4@dave-tech.it>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>
Subject: RE: RFC: detect and manage power cut on MLC NAND
Date: Wed, 11 Mar 2015 21:16:16 +0000
Message-ID: <0D23F1ECC880A74392D56535BCADD7354973D2A1@NTXBOIMBX03.micron.com>
References: <54FEDC42.2060407@dave-tech.it>
 <CAFLxGvx2WMZXvy7f_YyefgAFKDKgMoeoeqt905M1pJFJ28dXrw@mail.gmail.com>
 <1426058414.1567.2.camel@sauron.fi.intel.com> <5500037A.9010509@nod.at>
 <1426064733.1567.6.camel@sauron.fi.intel.com> <55000637.1030702@nod.at>
 <550074D2.1070406@dave-tech.it>
 <0D23F1ECC880A74392D56535BCADD7354973D072@NTXBOIMBX03.micron.com>
 <55007B79.2090705@nod.at>
In-Reply-To: <55007B79.2090705@nod.at>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 mtd_mailinglist <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Glad to help out.  I train FAE's and customers on many aspects of NAND incl=
uding MLC. =20


Jeff Lauruhn
NAND Application Engineer
Embedded Business Unit
Micron Technology, Inc


-----Original Message-----
From: linux-mtd [mailto:linux-mtd-bounces@lists.infradead.org] On Behalf Of=
 Richard Weinberger
Sent: Wednesday, March 11, 2015 10:29 AM
To: Jeff Lauruhn (jlauruhn); Andrea Scian; dedekind1@gmail.com
Cc: Boris Brezillon; mtd_mailinglist
Subject: Re: RFC: detect and manage power cut on MLC NAND

Jeff,

Am 11.03.2015 um 18:23 schrieb Jeff Lauruhn (jlauruhn):
> Power loss is actually very complex.  The Write Protect (WP) pin was adde=
d to NAND help lock the NAND when a power loss event is detected.  I have e=
xtensive information on NAND and would be happy to discuss.  =20
>=20

it would be wonderful if you could share knowledge on MLC NAND.
I'm very interested in supporting MLC in UBI (and UBIFS).
UBI was designed with SLC NAND in mind, now with MLC some things have chang=
ed.

Thanks,
//richard

> Jeff Lauruhn
> NAND Application Engineer
> Embedded Business Unit
> Micron Technology, Inc
>=20
>=20
> -----Original Message-----
> From: linux-mtd [mailto:linux-mtd-bounces@lists.infradead.org] On=20
> Behalf Of Andrea Scian
> Sent: Wednesday, March 11, 2015 10:01 AM
> To: Richard Weinberger; dedekind1@gmail.com
> Cc: mtd_mailinglist
> Subject: Re: RFC: detect and manage power cut on MLC NAND
>=20
>=20
> Hi all,
>=20
> and thanks for you feedback.
> You can find my comments below.
>=20
> Il 11/03/2015 10:09, Richard Weinberger ha scritto:
>> Am 11.03.2015 um 10:05 schrieb Artem Bityutskiy:
>>> On Wed, 2015-03-11 at 09:57 +0100, Richard Weinberger wrote:
>>>> Hi!
>>>>
>>>> Am 11.03.2015 um 08:20 schrieb Artem Bityutskiy:
>>>>> On Tue, 2015-03-10 at 13:51 +0100, Richard Weinberger wrote:
>>>>>>> WDYT about this?
>>>>>>> If it sounds reasonable is there any suggestion where to place such=
 a code?
>>>>>> Customers often use DYI uninterruptible power supplies using capacit=
ors.
>>>>>> But managing a power cut is the least problem you have with MLC NAND=
.
>>>>> Why is it the least problem, what is the hardest one? I thought=20
>>>>> this one is the hardest.
>>>> IMHO the hardest ones are the problems we don't know yet as NAND=20
>>>> vendors are not really chatty about the MLC constraints.
>>>> We don't know much about data retention for example. At least we=20
>>>> have not much hard facts. Most of our knowledge is hearsay.
>>> Well, but from the problems we know paired pages seems to be the=20
>>> biggest one. E.g., what do we do if VID header gets corrupted=20
>>> because of an interrupted write to the page paired with the VID header =
page?
>>> Sounds like a hard problem to me.
>> It is a hard problem. But at least we know about it.
>>
>=20
> IIUC can I summarize like the following
>=20
> 1) power cut is one of the big problem we know about MLC NAND flash=20
> with UBI
> 2) we are unaware of other big issue with MLC NAND
>=20
> Unfortunately I don't really know the MTD/UBI/UBIFS internals but (correc=
t me if I'm wrong) to me solving the power cut issue only by software (by u=
sing proper data structure, redundancy, NAND flash operation jornal and so =
on) is pretty hard to implement inside the Linux MTD stack.
>=20
> On the other hand, stuff like scrubbing (e.g. having a task like GC that =
periodically scrub the required NAND erase block), paired page (e.g.
> carefully selecting LEB to PEB mapping to avoid reading/writing data into=
 paired page in a wrong way) are still to be implemented but have, somehow,=
 less impact on the whole MTD stack.
>=20
> For sure I'm missing some other MLC NAND issue, but the above are the one=
 that I'm aware of.
>=20
> WDYT?
>=20
> Best Regards,
>=20

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
