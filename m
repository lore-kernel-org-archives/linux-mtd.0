Received: from 228-216.205.122.dellhost.com ([216.205.122.228] helo=lakeshoremicro.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16df0h-0002ZS-00
	for <linux-mtd@lists.infradead.org>; Wed, 20 Feb 2002 22:14:47 +0000
Message-ID: <000301c1ba5d$91441e90$0101a8c0@dellc800>
From: "Mark Meade" <mark@lakeshoremicro.com>
To: <linux-mtd@lists.infradead.org>
Subject: Re: DiskOnChip 2000 and Millenium support in GRUB bootloader 
Date: Wed, 20 Feb 2002 17:25:24 -0500
MIME-Version: 1.0
Content-Type: text/plain;
	charset="Windows-1252"
Content-Transfer-Encoding: 7bit
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

On 19 Feb 2002, Ilguiz Latypov wrote:

> Can anybody with DOC Millenium try the patch?  It's
>     patches/grub-2002-02-19-doc.patch

Hi,

I have an 8MB DOC Millenium, and have been booting successfully with the mtd-patched LILO.

I was able to apply the patch, and successfully build the grub_firmware file.  I've
followed the instructions posted earlier on this list (using doc_loadbios), but I can't
seem to make it boot.

I'm trying to boot from the DOC ISA eval board on a PC with an AMI BIOS -- and I believe
"boot from NETWORK" should call INT 18h.  I also tried booting from a floppy with the boot
record modified to call int 18.  In either case, my PC doesn't seem to recognize the DOC
at boot time.

I'd love to help out in testing this part -- Can I provide any more information, or maybe
I'm just missing something easy?

Regards,

Mark
