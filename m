Received: from web52703.mail.yahoo.com ([206.190.39.154])
	by canuck.infradead.org with smtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CRaHv-0008Rk-6a
	for linux-mtd@lists.infradead.org; Tue, 09 Nov 2004 13:00:18 -0500
Message-ID: <20041109180010.96702.qmail@web52703.mail.yahoo.com>
Date: Tue, 9 Nov 2004 10:00:10 -0800 (PST)
From: Michael <xemc@yahoo.com>
To: sam <sam.hsu@southpro.com.tw>
In-Reply-To: <4190F0A5.80609@southpro.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-mtd@lists.infradead.org
Subject: Re: jffs2 root filesystem
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



> FAT: bogus logical sector size 5349

This is wierd.  I wonder if it's trying to mount it as a FAT
filesystem first.  Most people usually include 'rootfstype=jffs2'
in the command line.

> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at
> 0x00000000:
> 0x0016 instead

I think there's mention of this in the mailing list.  Can you try
searching the archives and see what this indicates?

> Freeing init memory: 64K
> Warning: unable to open an initial console.
> Kernel panic: No init found. Try passing init= option to kernel.
> ..................

> why can't i use mtd as my root disk

It looks like you ARE using MTD for your root disk.  I usually get
this "unable to open an initial console" warning / error when the
device file /dev/console doesn't exist.  Perhaps the above error is
messing up the root filesystem.

BTW, have you tried booting off a ramdisk and manually mounting
that partition?  That should clear up most of the issues that you'd
run into, but it's much easier to debug.

I hope this makes sense and that it helps.

Mike
