Received: from 228-216.205.122.dellhost.com ([216.205.122.228] helo=lakeshoremicro.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16gzSZ-0003Ts-00
	for <linux-mtd@lists.infradead.org>; Sat, 02 Mar 2002 02:41:19 +0000
Message-ID: <001801c1c195$4d195c00$0101a8c0@dellc800>
From: "Mark Meade" <mark@lakeshoremicro.com>
To: <linux-mtd@lists.infradead.org>
Cc: "Ilguiz Latypov" <ilatypov@superbt.com>
Subject: Re: DiskOnChip 2000 and Millenium support in GRUB bootloader 
Date: Fri, 1 Mar 2002 21:51:39 -0500
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

On Thu, 28 Feb 2002, Ilguiz Latypov wrote:

> I changed stage1/doc_stage1{,b}.S so that the GRUB firmware
> will correctly replace the BIOS extension initialization code of DoC
> Millennium.

Ilguiz,

I've downloaded your latest GRUB patches, and I've discovered a few minor problems:

1) Some BIOS's don't like extensions without correct checksums.  I modified doc_stage1.S
and added Makefile calls to the "makerom" program (originally found in /mtd/boot).  This
fixes the checksum problem; now the code to install the int 19 handler will be executed.

2) For some reason, my BIOS won't let me override the int 19 handler.  To get around this,
I changed it to an int 18 handler, and this works fine when the BIOS is set to boot from
"Network".  Using int 18 rather than 19 also allows me to boot from the hard drive without
having to remove the DOC.

IMHO, it might be a good idea to allow the use of int 18 or int 19 as a compile time
option.

3) I made additional minor changes in doc_stage1.S to save and restore the doc segment
correctly.   The boot block on a Millennium is an XIP block; _start is not running at
0x20000 in this case.

At this point, I get all the way to the "Jumping to Grub" message, and then it locks up.
I suspect that there might be a problem in the logic that copies stage2 from the DOC to
0x8200.  I haven't found any documentation on Millennium pipeline reads, so I might need
some help here :-).

I'm an open source newbie, so if you think these changes will do you any good, let me know
how to get them to you.

Regards,

Mark
