Received: from 228-216.205.122.dellhost.com ([216.205.122.228] helo=lakeshoremicro.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16eMCE-0006WW-00
	for <linux-mtd@lists.infradead.org>; Fri, 22 Feb 2002 20:21:34 +0000
Message-ID: <000b01c1bbe0$0e801cf0$0101a8c0@dellc800>
From: "Mark Meade" <mark@lakeshoremicro.com>
To: "Ilguiz Latypov" <ilatypov@superbt.com>
Cc: <linux-mtd@lists.infradead.org>
References: <Pine.LNX.4.44.0202221157280.8089-100000@server.superbt.com>
Subject: Re: DiskOnChip 2000 and Millenium support in GRUB bootloader 
Date: Fri, 22 Feb 2002 15:32:20 -0500
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

On Fri, 22 Feb 2002, Ilguiz Latypov wrote:

> The source code for doc_loadbios is in the util/ directory of the Linux
> MTD CVS repository.
>
 > Mind upgrading autoconf and automake?

Thanks, Ilguiz.  I now have the latest from the CVS archive, and I also upgraded autoconf
and automake.  Everything went flawlessly.

The doc_loadbios output to /dev/mtd0 is off by 512 bytes (when I use an offset of 1024):

*** doc_loadbios.c Fri Feb 22 15:22:17 2002
--- doc_loadbios.c.orig Fri Feb 22 15:16:30 2002
***************
*** 89,98 ****
       perror("read");
       goto error;
      }
-     if (lseek(ofd, 0L, SEEK_SET) < 0) {
-      perror("lseek");
-      goto error;
-     }
     }

     erase.length = meminfo.erasesize;
--- 89,94 ----

After making that change, the grub_firmware appears to be in the correct place (0x400),
and the IPL is still at 0x0 and 0x200.

I created an ext2 partition and copied the necessary files to /boot and /boot/grub.

My system now recognizes that something is there, but refuses to boot:
    Searching for boot record from SCSI: Not Found.

I'll keep trying; if you have any ideas, let me know.

Regards,

Mark
