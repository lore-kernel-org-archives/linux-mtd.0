Received: from imladris.infradead.org
	([194.205.184.45] helo=infradead.org ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16hzJ3-0000o3-00
	for <linux-mtd@lists.infradead.org>; Mon, 04 Mar 2002 20:43:37 +0000
Date: Mon, 4 Mar 2002 20:54:46 +0000 (GMT)
From: ilatypov@infradead.org
To: Mark Meade <mark@lakeshoremicro.com>,
    David Woodhouse <dwmw2@infradead.org>
cc: Linux MTD mailing list <linux-mtd@lists.infradead.org>
Subject: Re: DiskOnChip 2000 and Millenium support in GRUB bootloader
Message-ID: <Pine.LNX.4.44.0203042053180.29985-100000@infradead.org>
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

Thanks a lot for your contribution.  I totally missed the DoC segment
issue you have identified.  What was your fix?  Do you copy %cs to %ds in
case doc_stage1 is IPL itself?  Are there any extra things to be done to 
make the code eXecute-In-Place?

I will modify the checksum program to generate a different value when
"--enable-diskonchip-ipl" option is supplied to the configure script.

I will also add an option to hook to the diskless boot int 18h handler.  

I found a detailed explanation of the PC BIOS startup at
    http://etherboot.sourceforge.net/doc/html/devman-3.html

Dave, is DoC Millennium documentation still available?  Mark has made
significant testing and coding with the GRUB patch.

Mark, my DoC Millennium modifications to the MTD GRUB patch were based on 
the doc2000.c kernel driver code from MTD repository.  Perhaps, I wasn't 
careful enough in copying the necessary operations.

Ilguiz

On Fri, 1 Mar 2002, Mark Meade wrote:

> 1) Some BIOS's don't like extensions without correct checksums.
[..]
> 2) For some reason, my BIOS won't let me override the int 19 handler.  
[..]
> 3) I made additional minor changes in doc_stage1.S to save and restore
> the doc segment correctly.  The boot block on a Millennium is an XIP
> block; _start is not running at 0x20000 in this case.
[..]
