Received: from tomts19.bellnexxia.net ([209.226.175.73] helo=tomts19-srv.bellnexxia.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17ZOLx-0003vU-00
	for <linux-mtd@lists.infradead.org>; Tue, 30 Jul 2002 05:11:21 +0100
Date: Tue, 30 Jul 2002 00:11:18 -0400 (EDT)
From: Ilguiz Latypov <ilatypov@superbt.com>
To: Mark Meade <mark@lakeshoremicro.com>
cc: linux-mtd@lists.infradead.org
Subject: Re: [patch] doc_stage1.S : GRUB on DoC
In-Reply-To: <200207161454984.SM02488@there>
Message-ID: <Pine.LNX.4.44.0207300002170.7104-100000@server.superbt.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Mark,

On Tue, 16 Jul 2002, Mark Meade wrote:

> These changes *should* also work for the DoC 2000, but I have not verified 
> this.  Changes will be necessary to the makefile and/or makecsum.c to 
> duplicate whatever code is at 0x100..0x1FF to 0x200..0x2FF.

Your unification patch has worked with DiskOnChip 2000 without a hitch.  I 
adjusted the stage2/Makefile.am file to reflect the simplified build 
procedure.  Thanks a bunch.  

There is no longer any hassle guessing page size for DoC Millennium at
compile time.  And DoC 2000 code will no longer depend on DoC 2000
pecularity with interleaving pages.

I added floppy disk BIOS number (0) as a last resort when looking for boot
configuration file.  Would you mind testing the aggregate patch I stored
under

    patches/grub-2002-07-29-doc.patch

Ilguiz

I believe the compile time difference will

> Ilguiz -- is the DOC_MIL_KEEP_IPL option still used?
