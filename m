Received: from [202.98.123.42] (helo=mail.ocdtt.com ident=postfix)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15wGMR-0002vS-00
	for <linux-mtd@lists.infradead.org>; Wed, 24 Oct 2001 06:13:52 +0100
Received: from ocdtt.com (unknown [61.139.82.145])
	by mail.ocdtt.com (Postfix) with ESMTP id 37E7113D8F
	for <linux-mtd@lists.infradead.org>; Wed, 24 Oct 2001 13:05:34 +0800 (CST)
Message-ID: <3BD64DC2.3E3E79F1@ocdtt.com>
Date: Wed, 24 Oct 2001 13:12:34 +0800
From: Chen Yaoming <ming@ocdtt.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: mtd_debug damaged my rom monitor
Content-Type: text/plain; charset=gb2312
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

# ./mtd_debug write /dev/mtd0 0x100000 16 /boot/vmlinuz

The command above damaged my rom monitor at FLASH offset 0.
Actually the code in mtd_debug.c can't recognize hex digital due to its
the string to digital conversion
functions called is atol(). I think it should be strtol() as in erase.c
to reach the versatility.

Here is the patch.

--- mtd_debug.c.orig    Tue Oct  9 06:00:06 2001
+++ mtd_debug.c Wed Oct 24 11:34:49 2001
@@ -386,13 +386,13 @@
                showinfo (fd);
                break;
          case OPT_READ:
-               err = flash_to_file (fd,atol (argv[3]),atol
(argv[4]),argv[5]);
+               err = flash_to_file (fd,strtol (argv[3],NULL,0),strtol
(argv[4],NULL,0),argv[5]);
                break;
          case OPT_WRITE:
-               err = file_to_flash (fd,atol (argv[3]),atol
(argv[4]),argv[5]);
+               err = file_to_flash (fd,strtol (argv[3],NULL,0),strtol
(argv[4],NULL,0),argv[5]);
                break;
          case OPT_ERASE:
-               err = erase_flash (fd,atol (argv[3]),atol (argv[4]));
+               err = erase_flash (fd,strtol (argv[3],NULL,0),strtol
(argv[4],NULL,0));
                break;
         }
