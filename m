Received: from miranda.se.axis.com ([193.13.178.8])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Iv6xD-0004HK-Kg
	for linux-mtd@lists.infradead.org; Thu, 22 Nov 2007 02:58:38 -0500
Received: from lnxricardw.se.axis.com (lnxricardw.se.axis.com [10.13.11.219])
	by miranda.se.axis.com (8.13.4/8.13.4/Debian-3sarge3) with ESMTP id
	lAM7wNbd003692
	for <linux-mtd@lists.infradead.org>; Thu, 22 Nov 2007 08:58:23 +0100
Date: Thu, 22 Nov 2007 08:58:06 +0100 (CET)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Linux mtd <linux-mtd@lists.infradead.org>
Subject: Re: Some news for this: [PATCH] [MTD] BLOCK_RO: Readonly Block Device
	Layer Over MTD ?
In-Reply-To: <20071121213257.GI20871@lazybastard.org>
Message-ID: <Pine.LNX.4.64.0711220847110.523@lnxricardw.se.axis.com>
References: <305035a40711210627p1ea1f2c0me1ee1f8e8d124552@mail.gmail.com>
	<20071121160804.GC20871@lazybastard.org>
	<305035a40711210828k65174f44t3d64e9ee33fe26bf@mail.gmail.com>
	<20071121105817.3adbfbb5@weaponx>
	<Pine.LNX.4.64.0711212145070.24710@lnxricardw.se.axis.com>
	<20071121213257.GI20871@lazybastard.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Wed, 21 Nov 2007, J=F6rn Engel wrote:

> > Won't ECC take care of spurious bit flips?

> Single-bit, yes.  Once you accumulated a bunch of them in proximity, it
> may no longer work.

Yes that is true of course.

Does anyone know of any tests or evaluations run on NAND flash chips, more=
=20
than what can be found out from the data sheets?

We ran some tests on an ST 256 Mbit flash here to try and get some grip on=
=20
the various bit flipping mechanisms.

At least for this chip, it seemed that if a block has only been written a=
=20
few times, then there seems to be virtually no limit to how many times it=
=20
can be read without bit flips occurring (the test ran for three months=20
with continuous reading of the same block, during which over 4.5e+10=20
reads were performed). On the other hand, if the block was written the=20
maximum specified number of times (100 000 for this chip), bit flips would=
=20
start occurring after 15 million reads.

(We also wrote a block far over the specified limit, about 1.7 million=20
times. In this case, bit flips during read started occurring after about=20
200 000 reads.)

Of course, this was a random sample of a single chip type used in a=20
specific hardware environment, so it would be interesting to see if anyone=
=20
else has done any similar test.

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
