Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13k6jQ-0007ml-00
	for mtd-list@infradead.org; Fri, 13 Oct 2000 16:26:48 +0100
Received: from fep04.swip.net ([130.244.199.132] helo=fep04-svc.swip.net)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13k6jO-0007mf-00
	for mtd@infradead.org; Fri, 13 Oct 2000 16:26:46 +0100
Received: from win95 ([130.244.212.33]) by fep04-svc.swip.net
          (InterMail vM.5.01.01.01 201-252-104) with SMTP
          id <20001013152612.CUTE12426.fep04-svc.swip.net@win95>
          for <mtd@infradead.org>; Fri, 13 Oct 2000 17:26:12 +0200
From: "Bjorn Eriksson" <mdeans@algonet.se>
To: <mtd@infradead.org>
Subject: Three change suggestions to nand.c and friends.
Date: Fri, 13 Oct 2000 17:26:16 +0200
Message-ID: <000b01c03529$edc4c1c0$0800a8c0@win95.inteloop.se>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


 1) Right now the code needs the moddi3() helper to perform it's checks. I
suggest adding the requirement that {.oobblock} must be a power of two.

 Also, the '(to + len)' part can be rewritten as 'len' since (a+b)%c ->
(a%c+b%c)%c.

+++ mtd/nand.c  Fri Oct 13 16:50:37 2000
@@ -30,13 +31,69 @@
 #define set_current_state(x) current->state = (x);
 #endif

+#ifdef CONFIG_MTD_OOBBLOCK_POWOf2
+#define OOBblockMOD(numer, denom) ((numer) & (denom-1))
+#else
+#define OOBblockMOD(numer, denom) ((numer) % (denom))
+#endif

@@ -350,7 +411,7 @@
 #endif

        /* Do not allow unaligned writes */
-       if ((to % mtd->oobblock) || ((to + len) % mtd->oobblock)) {
+       if (OOBblockMOD(to, mtd->oobblock) || OOBblockMOD(len,
mtd->oobblock)) {
                DEBUG (MTD_DEBUG_LEVEL1,
                        "nand_write_ecc: Unaligned address\n");
                return -EINVAL;
=============================================

 2) I've also rewritten nand.c changing all 'NAND_CTRL |= this->CLE;' ->
NAND_SET_CMD et.al. Different hardware different support code.

=====================

 3) I moved nand_flash_ids[] to a new file, nand_ids.h since nand.h is
included in several different places and not all .c-files that #include it
needs nand_flash_ids[] (thus creating dups).


 Opinions, ideas? Shall I commit?


//Björnen.




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
