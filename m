Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1IutFD-0005U8-2x
	for linux-mtd@lists.infradead.org; Wed, 21 Nov 2007 12:20:17 -0500
Date: Wed, 21 Nov 2007 18:15:02 +0100
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Josh Boyer <jwboyer@linux.vnet.ibm.com>
Subject: Re: Some news for this: [PATCH] [MTD] BLOCK_RO: Readonly Block Device
	Layer Over MTD ?
Message-ID: <20071121171501.GE20871@lazybastard.org>
References: <305035a40711210627p1ea1f2c0me1ee1f8e8d124552@mail.gmail.com>
	<20071121160804.GC20871@lazybastard.org>
	<305035a40711210828k65174f44t3d64e9ee33fe26bf@mail.gmail.com>
	<20071121105817.3adbfbb5@weaponx>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20071121105817.3adbfbb5@weaponx>
Cc: linux-mtd@lists.infradead.org, =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>,
	Gregory CLEMENT <gclement00@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 21 November 2007 10:58:17 -0600, Josh Boyer wrote:
> > 2007/11/21, Jörn Engel <joern@logfs.org>:
> > >
> > > What problem does the driver solve?
> > It allow  to use cramfs/squashfs/fat in read-only on NAND flash for
> > embedded systems.
> 
> Not really.  It allows you to put one of those filesystems into
> NAND using a bad-block aware program initially, and mount it.  It
> doesn't handle run-time bit flips or errors from what I can see.

Whether that is necessary I cannot tell.  Maybe some people have
hardware where this isn't an issue.

But why yet another mtdblock driver?  Is there a reason not to add the
required bits to mtdblock_ro.c?

Jörn

-- 
Correctness comes second.
Features come third.
Performance comes last.
Maintainability is easily forgotten.
