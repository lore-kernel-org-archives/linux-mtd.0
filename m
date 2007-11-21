Received: from e34.co.us.ibm.com ([32.97.110.152])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1IusuO-0001hG-MQ
	for linux-mtd@lists.infradead.org; Wed, 21 Nov 2007 11:58:47 -0500
Received: from d03relay02.boulder.ibm.com (d03relay02.boulder.ibm.com
	[9.17.195.227])
	by e34.co.us.ibm.com (8.13.8/8.13.8) with ESMTP id lALGwRI7016878
	for <linux-mtd@lists.infradead.org>; Wed, 21 Nov 2007 11:58:27 -0500
Received: from d03av01.boulder.ibm.com (d03av01.boulder.ibm.com [9.17.195.167])
	by d03relay02.boulder.ibm.com (8.13.8/8.13.8/NCO v8.7) with ESMTP id
	lALGwLJw078944
	for <linux-mtd@lists.infradead.org>; Wed, 21 Nov 2007 09:58:24 -0700
Received: from d03av01.boulder.ibm.com (loopback [127.0.0.1])
	by d03av01.boulder.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	lALGwKnm003882
	for <linux-mtd@lists.infradead.org>; Wed, 21 Nov 2007 09:58:21 -0700
Date: Wed, 21 Nov 2007 10:58:17 -0600
From: Josh Boyer <jwboyer@linux.vnet.ibm.com>
To: "Gregory CLEMENT" <gclement00@gmail.com>
Subject: Re: Some news for this: [PATCH] [MTD] BLOCK_RO: Readonly Block
	Device Layer Over MTD ?
Message-ID: <20071121105817.3adbfbb5@weaponx>
In-Reply-To: <305035a40711210828k65174f44t3d64e9ee33fe26bf@mail.gmail.com>
References: <305035a40711210627p1ea1f2c0me1ee1f8e8d124552@mail.gmail.com>
	<20071121160804.GC20871@lazybastard.org>
	<305035a40711210828k65174f44t3d64e9ee33fe26bf@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: =?UTF-8?B?SsO2cm4=?= Engel <joern@logfs.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 21 Nov 2007 17:28:05 +0100
"Gregory CLEMENT" <gclement00@gmail.com> wrote:

> 2007/11/21, J=C3=B6rn Engel <joern@logfs.org>:
> > On Wed, 21 November 2007 15:27:19 +0100, Gregory CLEMENT wrote:
> > >
> > > I come back with my question because it seems that last time I sent
> > > this mail mtd mailing list was done during few weeks, so maybe  this
> > > mail was lost.
> >
> > What problem does the driver solve?
> It allow  to use cramfs/squashfs/fat in read-only on NAND flash for
> embedded systems.

Not really.  It allows you to put one of those filesystems into
NAND using a bad-block aware program initially, and mount it.  It
doesn't handle run-time bit flips or errors from what I can see.

josh
