Received: from smtp13.dti.ne.jp ([202.216.228.48])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 178NgT-0003lg-00
	for <linux-mtd@lists.infradead.org>; Thu, 16 May 2002 17:00:53 +0100
Received: from localhost (PPPa3256.tokyo-ip.dti.ne.jp [210.170.214.2]) by smtp13.dti.ne.jp (8.12.1/3.7W) with ESMTP id g4GG0oSW009927 for <linux-mtd@lists.infradead.org>; Fri, 17 May 2002 01:00:50 +0900 (JST)
Date: Fri, 17 May 2002 01:17:32 +0900 (JST)
Message-Id: <20020517.011732.74751668.takasi-y@ops.dti.ne.jp>
To: linux-mtd@lists.infradead.org
Subject: can't erase "sharp".
From: Takashi YOSHII <takasi-y@ops.dti.ne.jp>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
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

I'm using drivers/mtd/chip/sharp.c (I know it's "obsolete", though).
And, found "eraseall" command doesn't work upon it.
The operation stops at 0%, and the command never exit.

I added few lines(see the patch below), and it works, perhaps...
I'm not sure if it is correct (especially when signals received).

Could someone tell me the right answer, please?
Regards,
/ yoshii

Index: drivers/mtd/chips/sharp.c
===================================================================
RCS file: /home/cvs/mtd/drivers/mtd/chips/sharp.c,v
retrieving revision 1.7
diff -u -r1.7 sharp.c
--- drivers/mtd/chips/sharp.c	13 Feb 2002 15:49:07 -0000	1.7
+++ drivers/mtd/chips/sharp.c	16 May 2002 15:25:33 -0000
@@ -409,7 +409,10 @@
 
 	while(len){
 		ret = sharp_erase_oneblock(map, &sharp->chips[chipnum], adr);
-		if(ret)return ret;
+		if(ret){
+			instr->state = MTD_ERASE_FAILED;
+			return ret;
+		}
 
 		adr += mtd->erasesize;
 		len -= mtd->erasesize;
@@ -421,6 +424,7 @@
 		}
 	}
 
+	instr->state = MTD_ERASE_DONE;
 	if(instr->callback)
 		instr->callback(instr);
 
