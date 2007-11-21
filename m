Received: from miranda.se.axis.com ([193.13.178.8])
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IuwTC-0006xj-8D
	for linux-mtd@lists.infradead.org; Wed, 21 Nov 2007 20:46:52 +0000
Received: from lnxricardw.se.axis.com (lnxricardw.se.axis.com [10.13.11.219])
	by miranda.se.axis.com (8.13.4/8.13.4/Debian-3sarge3) with ESMTP id
	lALKkXdl003009
	for <linux-mtd@lists.infradead.org>; Wed, 21 Nov 2007 21:46:33 +0100
Date: Wed, 21 Nov 2007 21:46:16 +0100 (CET)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Linux mtd <linux-mtd@lists.infradead.org>
Subject: Re: Some news for this: [PATCH] [MTD] BLOCK_RO: Readonly Block Device
	Layer Over MTD ?
In-Reply-To: <20071121105817.3adbfbb5@weaponx>
Message-ID: <Pine.LNX.4.64.0711212145070.24710@lnxricardw.se.axis.com>
References: <305035a40711210627p1ea1f2c0me1ee1f8e8d124552@mail.gmail.com>
	<20071121160804.GC20871@lazybastard.org>
	<305035a40711210828k65174f44t3d64e9ee33fe26bf@mail.gmail.com>
	<20071121105817.3adbfbb5@weaponx>
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


On Wed, 21 Nov 2007, Josh Boyer wrote:

> > > What problem does the driver solve?
> > It allow  to use cramfs/squashfs/fat in read-only on NAND flash for
> > embedded systems.
>
> Not really.  It allows you to put one of those filesystems into
> NAND using a bad-block aware program initially, and mount it.  It
> doesn't handle run-time bit flips or errors from what I can see.

Won't ECC take care of spurious bit flips?

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
