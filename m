Received: from h-66-134-95-69.snvacaid.covad.net ([66.134.95.69]
	helo=mail.plexio.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19B4K5-0005OD-7P
	for <linux-mtd@lists.infradead.org>; Thu, 01 May 2003 04:01:25 +0100
From: Stephen Lee <splee@plexio.com>
To: Mark Meade <mark@lakeshoremicro.com>
In-Reply-To: <200304302128.41316.mark@lakeshoremicro.com>
References: <1051745960.27756.15.camel@ralph.plexio.private>
	 <1051749228.27798.28.camel@ralph.plexio.private>
	 <200304302128.41316.mark@lakeshoremicro.com>
Message-Id: <1051758076.27756.38.camel@ralph.plexio.private>
Mime-Version: 1.0
Date: 30 Apr 2003 20:01:16 -0700
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: mtd <linux-mtd@lists.infradead.org>
Subject: Re: Which version of M-SYS DFORMAT?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2003-04-30 at 18:29, Mark Meade wrote:
> On Wednesday 30 April 2003 08:33 pm, Stephen Lee wrote:
> > Replying to my own message. The answer is that "dformat /win:d800
> > /BDKF0:grub_firware" only works with v5.14. The next question is did I
> > screwup the mtd patch? It doesn't appear to be as all kinds of
> > MTD-related kernel config settings appeared after patching. I should
> > also mention that Grub was installed correctly onto the DOC2000 as it
> > booted up to the Grub prompt as expected. The only thing I can't do is
> > mount /dev/nftla1 to install the kernel and menu.lst. Suggestions?
> 
> Stephen,
> 
> I apologize if the instructions aren't clear - if you use version 5.x of 
> DFORMAT, you'll have to use your patched kernel twice.  In order to mount 
> /dev/nftla1 and copy the bzImage to the DiskOnChip, you would need to boot 
> from a hard drive using the patched kernel, or insmod the appropriately 
> patched modules.
> 
> Once you are able to copy the kernel to /dev/nftla1, the patched kernel will 
> also be necessary to boot directly from the DiskOnChip.
> 
Thanks Mark. That did it. Now I've managed to fdisk and install the
kernel and menu.list onto the DOC but upon reboot, Grub command line
appears but Grub cannot find the root device (refering to the Grub
root). Entering "root (<tab>" only gives fd0 or hd0 as the choices.
"dc0" is not available. Did I do something wrong during building of
Grub-mtd? The main difficulty in build mtd-compliant Grub was making
sure the autoconf and automake versions were correct. In the end I did
get grub_firmware in the stage1 directory but how to be sure the build
was correct?

Thanks again,
Stephen
