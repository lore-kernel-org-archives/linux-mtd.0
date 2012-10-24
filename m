Received: from e23smtp06.au.ibm.com ([202.81.31.148])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TQtJH-0001Ni-NJ
 for linux-mtd@lists.infradead.org; Wed, 24 Oct 2012 05:15:20 +0000
Received: from /spool/local
 by e23smtp06.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linux-mtd@lists.infradead.org> from <hejianet@linux.vnet.ibm.com>;
 Wed, 24 Oct 2012 15:13:03 +1000
Received: from d23av03.au.ibm.com (d23av03.au.ibm.com [9.190.234.97])
 by d23relay05.au.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
 q9O54w5S63504616
 for <linux-mtd@lists.infradead.org>; Wed, 24 Oct 2012 16:04:58 +1100
Received: from d23av03.au.ibm.com (loopback [127.0.0.1])
 by d23av03.au.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id
 q9O5F5ND001379
 for <linux-mtd@lists.infradead.org>; Wed, 24 Oct 2012 16:15:05 +1100
Received: from [127.0.0.1] ([9.123.236.215])
 by d23av03.au.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with ESMTP id
 q9O5EoYi000886
 for <linux-mtd@lists.infradead.org>; Wed, 24 Oct 2012 16:15:04 +1100
Message-ID: <50877953.9040602@linux.vnet.ibm.com>
Date: Wed, 24 Oct 2012 13:14:59 +0800
From: hejianet <hejianet@linux.vnet.ibm.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: [question]MTD:unstable bit issues?
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

My hardware: vcs452 nandflash
my kernel:2.6.16(I know it is too old:(,but this problem seems not
relevant to the kernel version)

test steps:
1.copy a 100M file to the nand flash partition from remote client
2.use fsync to flush the mem to flash
3.use md5 to check whether the original file is different from the
copied one
4.repeat power-cuts test for 5 times, when booting up, it will check
the md5 again.
5.do step1 again

after a whole night test,(power-cut for 100 times), the step 4 failed.
1)there are some bytes changed:
-----------------------------------------------------
-original-file D0 40 E8 3E 00 00 BA 1A D0 40 0A 00 43 00 00 00
+file-in-flash D0 40 0F 41 00 00 BA 1A D0 40 0A 00 43 00 00 00
----------------------------------------------------- 
2)a 4k bytes hole with all 0 in the flash file.
-----------------------------------------------------
-original-file DD AF C8 EE 57 EB 84 CE A1 7F B1 38 E7 22 51 2F
-    94 AE 77 5B 48 EA 61 8C 09 BB C5 74 6E B1 87 D2 
-    A9 32 8D 2A E7 7F D2 C3 DB 1A 92 E7 66 7C B8 4E 
......
     
+file-in-flash 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 
+    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 
......
-----------------------------------------------------

I search google and find it might be relevant to "unstable bits
issue"(bit-flip) in nand.
I wonder is the bit-flip the possible reason to cause such a 4k all-zero
hole?
Thanks for any suggestion.

B.R.
Jia
