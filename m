Received: from wiproecmx1.wipro.com ([164.164.31.5])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BjxA2-0007D9-GA
	for linux-mtd@lists.infradead.org; Mon, 12 Jul 2004 05:31:49 -0400
Received: from ec-vwall-out3.wipro.com (ec-vwall-out3.wipro.com [10.200.52.29])
	by wiproecmx1.wipro.com (8.12.9-20031013/8.12.9) with ESMTP id
	i6C9VbhV020557 for <linux-mtd@lists.infradead.org>;
	Mon, 12 Jul 2004 15:01:37 +0530 (IST)
Received: from ec-vwall-out3.wipro.com (localhost.wipro.com [127.0.0.1])
	by localhost.localdomain (Postfix) with ESMTP id 5E0621D22C7
	for <linux-mtd@lists.infradead.org>;
	Mon, 12 Jul 2004 14:54:43 +0530 (IST)
Received: from blr-ec-bh3.wipro.com (blr-ec-bh3.wipro.com [10.200.50.93])
	by ec-vwall-out3.wipro.com (Postfix) with ESMTP id 52BED1D22CF
	for <linux-mtd@lists.infradead.org>;
	Mon, 12 Jul 2004 14:54:43 +0530 (IST)
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 12 Jul 2004 15:01:36 +0530
Message-ID: <E7E0E9AD7DC3F548ACE3AAD6D2A02CBD02FEA325@blr-ec-msg05.wipro.com>
From: <sadashivan.manickam@wipro.com>
To: <linux-mtd@lists.infradead.org>
Subject: JFFS2 Compilation Error
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

We are getting a compilation error in JFFS2.

We are using Linux Kernel 2.4.17 on MIPS processor.
We have downloaded the following MTD source from the CVS snapshot
"mtd-snapshot-20040630.tar.bz2".


This is error message we are getting:
Any suggestion will be of great help.

------------------------------------------------------------------------
----

make[3]: Entering directory `/home/sadashivan/temp/linux/fs/jffs2'
/usr/bin/tl_mips-linux-gcc -I
/home/sadashivan/temp/linux/include/asm/gcc -D__KERNEL__
-I/home/sadashivan/temp/linux/include -Wall -Wstrict-prototypes
-Wno-trigraphs -O2 -fomit-frame-pointer -fno-strict-aliasing -fno-common
-G 0 -mno-abicalls -fno-pic -mcpu=3Dr4600 -mips2 -Wa,--trap -pipe    -c =
-o
compr.o compr.c
In file included from compr.h:28,
                 from compr.c:16:
nodelist.h: In function `__ref_totlen':
nodelist.h:316: warning: implicit declaration of function `BUG_ON'
compr.c: In function `jffs2_compress':
compr.c:80: warning: implicit declaration of function
`list_for_each_entry'
compr.c:80: `list' undeclared (first use in this function)
compr.c:80: (Each undeclared identifier is reported only once
compr.c:80: for each function it appears in.)
compr.c:80: parse error before `{'
compr.c:102: break statement not within loop or switch
compr.c:103: case label not within a switch statement
compr.c:107: parse error before `{'
compr.c:125: continue statement not within a loop
compr.c:75: label `out' used but not defined
compr.c:63: warning: `this' might be used uninitialized in this function
compr.c:146: warning: control reaches end of non-void function
compr.c: At top level:
compr.c:147: parse error before `if'
compr.c:149: warning: type defaults to `int' in declaration of `datalen'
compr.c:149: `best_slen' undeclared here (not in a function)
compr.c:149: warning: data definition has no type or storage class
compr.c:150: warning: type defaults to `int' in declaration of
`output_buf'
compr.c:150: `best' undeclared here (not in a function)
compr.c:150: warning: data definition has no type or storage class
compr.c:151: parse error before `->'
compr.c:156: warning: type defaults to `int' in declaration of `ret'
compr.c:156: `best' undeclared here (not in a function)
compr.c:156: warning: data definition has no type or storage class
compr.c:157: parse error before `}'
compr.c:166: warning: type defaults to `int' in declaration of `datalen'
compr.c:166: redefinition of `datalen'
compr.c:149: `datalen' previously defined here
compr.c:166: `cdatalen' undeclared here (not in a function)
compr.c:166: warning: data definition has no type or storage class
compr.c:167: parse error before `++'
compr.c: In function `jffs2_decompress':
compr.c:194: `list' undeclared (first use in this function)
compr.c:194: parse error before `{'
compr.c:180: warning: `this' might be used uninitialized in this
function
compr.c:210: warning: control reaches end of non-void function
compr.c: At top level:
compr.c:211: parse error before string constant
compr.c:211: warning: type defaults to `int' in declaration of `printk'
compr.c:211: warning: function declaration isn't a prototype
compr.c:211: warning: data definition has no type or storage class
compr.c: In function `jffs2_register_compressor':
compr.c:237: `list' undeclared (first use in this function)
compr.c:237: parse error before `{'
compr.c:240: label `out' used but not defined
compr.c: At top level:
compr.c:242: parse error before `}'
compr.c:243: parse error before `&'
compr.c:243: warning: type defaults to `int' in declaration of
`list_add_tail'
compr.c:243: warning: function declaration isn't a prototype
compr.c:243: conflicting types for `list_add_tail'
/home/sadashivan/temp/linux/include/linux/list.h:69: previous
declaration of `list_add_tail'
compr.c:243: warning: data definition has no type or storage class
compr.c:244: parse error before `:'
compr.c: In function `jffs2_unregister_compressor':
compr.c:269: `list' undeclared (first use in this function)
compr.c:269: parse error before `{'
compr.c:271: warning: control reaches end of non-void function
compr.c: In function `jffs2_list_compressors':
compr.c:286: `list' undeclared (first use in this function)
compr.c:286: parse error before `{'
compr.c:282: warning: `this' might be used uninitialized in this
function
compr.c:293: warning: control reaches end of non-void function
compr.c: At top level:
compr.c:294: parse error before `return'
compr.c: In function `jffs2_stats':
compr.c:309: `list' undeclared (first use in this function)
compr.c:309: parse error before `{'
compr.c:299: warning: `this' might be used uninitialized in this
function
compr.c:319: warning: control reaches end of non-void function
compr.c: At top level:
compr.c:320: parse error before `do'
compr.c: In function `jffs2_compressor_Xable':
compr.c:359: `list' undeclared (first use in this function)
compr.c:359: parse error before `{'
compr.c: At top level:
compr.c:365: parse error before `}'
compr.c:367: parse error before string constant
compr.c:367: warning: type defaults to `int' in declaration of `printk'
compr.c:367: warning: function declaration isn't a prototype
compr.c:367: warning: data definition has no type or storage class
compr.c: In function `jffs2_set_compressor_priority':
compr.c:385: `list' undeclared (first use in this function)
compr.c:385: parse error before `{'
compr.c:389: label `reinsert' used but not defined
compr.c: At top level:
compr.c:391: parse error before `}'
compr.c:393: parse error before string constant
compr.c:393: warning: type defaults to `int' in declaration of `printk'
compr.c:393: warning: function declaration isn't a prototype
compr.c:393: warning: data definition has no type or storage class
compr.c:400: parse error before `&'
compr.c:400: warning: return-type defaults to `int'
compr.c:400: warning: function declaration isn't a prototype
compr.c: In function `list_for_each_entry':
compr.c:401: `this' undeclared (first use in this function)
compr.c:401: `comp' undeclared (first use in this function)
compr.c: At top level:
compr.c:407: parse error before `&'
compr.c:407: warning: type defaults to `int' in declaration of
`list_add_tail'
compr.c:407: warning: function declaration isn't a prototype
compr.c:407: warning: data definition has no type or storage class
make[3]: *** [compr.o] Error 1
make[3]: Leaving directory `/home/sadashivan/temp/linux/fs/jffs2'
make[2]: *** [first_rule] Error 2
make[2]: Leaving directory `/home/sadashivan/temp/linux/fs/jffs2'
make[1]: *** [_subdir_jffs2] Error 2
make[1]: Leaving directory `/home/sadashivan/temp/linux/fs'
make: *** [_dir_fs] Error 2

------------------------------------------------------------------------
----

Regards,
Sadashivan
