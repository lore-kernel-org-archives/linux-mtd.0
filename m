Received: from [216.205.122.228] (helo=imagequestdesign.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16kU28-0005Mh-00
	for <linux-mtd@lists.infradead.org>; Mon, 11 Mar 2002 17:56:28 +0000
Content-Type: text/plain;
  charset="iso-8859-15"
From: Mark Meade <mark@lakeshoremicro.com>
To: linux-mtd@lists.infradead.org
Date: Mon, 11 Mar 2002 13:06:35 -0500
Cc: ilatypov@superbt.com
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: DiskOnChip 2000 and Millenium support in GRUB bootloader
Message-Id: <200203111306968.SM01632@there>
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

On Sun, 10 Mar 2002, Ilguiz Latypov wrote:

> I was able to test the grub_firmware file produced by the patch on a 64M
> DoC 2000.  Yes, I could get to the GRUB prompt and play with "root (dc0,"
> command.  GRUB can access the configuration file and the kernel image
> stored in ext2 partition.  The partition was created on top of NFTL block
> device layer.
>
> Mark Meade has offered few improvements to the patch.  I think there are 2 
> latest changes that may be of interest to you:
>
>  a) New configuration option --enable-diskonchip-biosnetboot will make 
>      GRUB firmware to attach itself to INT 18h (BIOS network boot) rather 
>      than to INT 19h (BIOS bootstrap loader).  If you try that option, 
>      enable network boot in BIOS as well.
>
>   b) The DoC SlowIO register is no longer read when fetching the data 
>      from the flash memory.
>
> I updated the patch.  It is available at
>    
> http://savannah.gnu.org/patch/?func=detailpatch&patch_id=164&group_id=68

Ilguiz,

I have been testing your latest patch with the DoC Millennium.  I'm able to 
get a GRUB prompt only after forcing the 512-byte-page code (doc_stage1b.S) 
to address 0x100.

Normally, it looks like the 256-byte/page code ends up at 0x100, and the 
512-byte at 0x200.  With the DoC 2000, this insures that the proper code 
(loaded by the IPL) ends up at 0x100.

Since the Millennium is XIP, jumping to 0x100 ends up running 256-byte-page 
code, which doesn't work in this case.

You mentioned that there are DoC Millennium parts based on 256-byte-page 
chips -- so my hack to force the 512-byte code to 0x100 will not work 
correctly for all Millennium parts.

Any thoughts or ideas?

Thanks,

Mark
