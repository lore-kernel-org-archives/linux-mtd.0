Received: from ns1.ixmail.hkcix.com ([202.181.230.228] helo=ixmail.hkcix.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15s2Wb-0006gS-00
	for <linux-mtd@lists.infradead.org>; Fri, 12 Oct 2001 14:38:53 +0100
Received: from uniquemodem.com ([202.181.182.134])
	by ixmail.hkcix.com (8.11.5/8.10.2) with ESMTP id f9CDfZE29617
	for <linux-mtd@lists.infradead.org>; Fri, 12 Oct 2001 21:41:36 +0800
Message-ID: <3BC6F486.8E307E2F@uniquemodem.com>
Date: Fri, 12 Oct 2001 21:47:50 +0800
From: data <data@uniquemodem.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Parse error before 'do' in chipreg.c 
Content-Type: text/plain; charset=us-ascii
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

Dear David,

Thanks for your help. I have got the patch file for module.h and
download the up-to-date patch file from your server.

However, I apply the pre-patch-2.2.20-10 to the kernel  2.2.18, it
couldn't get through. I download the 2.2.19 from the
kernel.org and apply the patch again, it goes through ok. After apply
the mtd patch into this kernel, I re-compile the
kernel again. This time, I failed and cannot get through. I have
attached the log file below for your reference.

Do you know what has happened? Please let me know what the solution is.

Best regards,

Jimmy Chun

Build Log:

make[4]: Entering directory `/home/root/linux-2.2.19/drivers/mtd/chips'
cc -D__KERNEL__ -I/usr/src/linux/include -Wall -Wstrict-prototypes -O2
-fomit-frame-pointer -fno-strict-aliasing -pipe -fno-strength-reduce
-m486 -DCPU=486   -DEXPORT_SYMTAB -c chipreg.c
In file included from chipreg.c:12:
/usr/src/linux/include/linux/mtd/compatmac.h:287: warning: static
declaration for `try_inc_mod_count' follows non-static
cc -D__KERNEL__ -I/usr/src/linux/include -Wall -Wstrict-prototypes -O2
-fomit-frame-pointer -fno-strict-aliasing -pipe -fno-strength-reduce
-m486 -DCPU=486   -c -o cfi_probe.o cfi_probe.c
In file included from /usr/src/linux/include/linux/mtd/mtd.h:12,
                 from /usr/src/linux/include/linux/mtd/map.h:10,
                 from cfi_probe.c:17:
/usr/src/linux/include/linux/mtd/compatmac.h:287: warning: static
declaration for `try_inc_mod_count' follows non-static
cc -D__KERNEL__ -I/usr/src/linux/include -Wall -Wstrict-prototypes -O2
-fomit-frame-pointer -fno-strict-aliasing -pipe -fno-strength-reduce
-m486 -DCPU=486   -c -o cfi_cmdset_0002.o cfi_cmdset_0002.c
In file included from /usr/src/linux/include/linux/mtd/mtd.h:12,
                 from /usr/src/linux/include/linux/mtd/map.h:10,
                 from cfi_cmdset_0002.c:26:
/usr/src/linux/include/linux/mtd/compatmac.h:287: warning: static
declaration for `try_inc_mod_count' follows non-static
cc -D__KERNEL__ -I/usr/src/linux/include -Wall -Wstrict-prototypes -O2
-fomit-frame-pointer -fno-strict-aliasing -pipe -fno-strength-reduce
-m486 -DCPU=486   -c -o gen_probe.o gen_probe.c
In file included from /usr/src/linux/include/linux/mtd/mtd.h:12,
                 from gen_probe.c:9:
/usr/src/linux/include/linux/mtd/compatmac.h:287: warning: static
declaration for `try_inc_mod_count' follows non-static
gen_probe.c:48: parse error before `EXPORT_SYMTAB_not_defined'
gen_probe.c:48: warning: type defaults to `int' in declaration of
`EXPORT_SYMTAB_not_defined'
gen_probe.c:48: warning: data definition has no type or storage class
make[4]: *** [gen_probe.o] Error 1
make[4]: Leaving directory `/home/root/linux-2.2.19/drivers/mtd/chips'
make[3]: *** [first_rule] Error 2
make[3]: Leaving directory `/home/root/linux-2.2.19/drivers/mtd/chips'
make[2]: *** [_subdir_chips] Error 2
make[2]: Leaving directory `/home/root/linux-2.2.19/drivers/mtd'
make[1]: *** [_subdir_mtd] Error 2
make[1]: Leaving directory `/home/root/linux-2.2.19/drivers'
make: *** [_dir_drivers] Error 2
