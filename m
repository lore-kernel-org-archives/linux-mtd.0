Received: from eagle.basari.net.tr ([213.248.128.40])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17cikI-0004PI-00
	for <linux-mtd@lists.infradead.org>; Thu, 08 Aug 2002 09:34:15 +0100
Received: from nurpinar ([195.142.234.243]) by eagle.basari.net.tr
          (InterMail vK.4.02.00.10 201-232-116-110 license c1a63c2345dd5b62855a869805df768e)
          with SMTP id <20020808083058.KPE1736.eagle@nurpinar>
          for <linux-mtd@lists.infradead.org>;
          Thu, 8 Aug 2002 11:30:58 +0300
Message-ID: <001301c23eb6$4a184630$3064000a@nurpinar>
From: "nur" <nurpinar@basari.net.tr>
To: <linux-mtd@lists.infradead.org>
Subject: kernel 2.2.18
Date: Thu, 8 Aug 2002 11:33:32 +0300
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

I receive this error every time i compile kernel with doc2000 or doc 2001
support
I do something wrong?
Thanks


cc -D__KERNEL__ -I/usr/src/rtlinux_kernel_2.2.18-rtl/include -Wall -Wstrict-
prototypes -O2 -fomit-frame-pointer -fno-strict-aliasing -pipe -fno-strength
-reduce
-m486 -DCPU=486 -DMODULE   -c -o doc2000.o doc2000.c
doc2000.c: In function `init_doc2000':
doc2000.c:1090: warning: implicit declaration of function
`inter_module_register'
doc2000.c: At top level:
doc2000.c:1094: parse error before `cleanup_doc2000'
doc2000.c:1095: warning: return-type defaults to `int'
doc2000.c: In function `cleanup_doc2000':
doc2000.c:1109: warning: implicit declaration of function
`inter_module_unregister'
doc2000.c:1110: warning: control reaches end of non-void function
doc2000.c: In function `__cleanup_module_inline':
doc2000.c:1112: warning: return from incompatible pointer type
make[2]: *** [doc2000.o] Error 1
make[2]: Leaving directory `/usr/src/rtlinux_kernel_2.2.18-rtl/drivers/mtd'
make[1]: *** [_modsubdir_mtd] Error 2
make[1]: Leaving directory `/usr/src/rtlinux_kernel_2.2.18-rtl/drivers'
make: *** [_mod_drivers] Error 2
