Received: from myyr.colleduc.ee ([193.40.113.30] helo=kiire.colleduc.ee)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CWE8U-0000cv-0w
	for linux-mtd@lists.infradead.org; Mon, 22 Nov 2004 08:21:43 -0500
Message-ID: <41A1E7DE.6010005@smartlink.ee>
Date: Mon, 22 Nov 2004 15:21:34 +0200
From: Kalev Lember <kalev@smartlink.ee>
MIME-Version: 1.0
To: skorinkod@mosk.ru
References: <200411221211.12394.skorinkod@mosk.ru>	<41A1BE40.2000106@colleduc.ee>
	<200411221339.15109.skorinkod@mosk.ru>
In-Reply-To: <200411221339.15109.skorinkod@mosk.ru>
Content-Type: multipart/mixed; boundary="------------010000020402090302080109"
Cc: linux-mtd@lists.infradead.org
Subject: Re: mkfs.ext3 - segmentation fault
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------010000020402090302080109
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Dmitry Skorinko wrote:

>try current cvs and have same :((   :
>  
>
Try the attached patch.

-- 
Best regards,
Kalev Lember

--------------010000020402090302080109
Content-Type: text/plain;
 name="inftlmount.c.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="inftlmount.c.diff"

Index: inftlmount.c
===================================================================
RCS file: /home/cvs/mtd/drivers/mtd/inftlmount.c,v
retrieving revision 1.15
diff -u -r1.15 inftlmount.c
--- inftlmount.c	5 Nov 2004 21:55:55 -0000	1.15
+++ inftlmount.c	22 Nov 2004 13:17:53 -0000
@@ -389,8 +389,6 @@
 	struct erase_info *instr = &inftl->instr;
 	int physblock;
 
-	instr->mtd = inftl->mbd.mtd;
-
 	DEBUG(MTD_DEBUG_LEVEL3, "INFTL: INFTL_formatblock(inftl=%p,"
 		"block=%d)\n", inftl, block);
 
@@ -400,6 +398,7 @@
 	   _first_? */
 
 	/* Use async erase interface, test return code */
+	instr->mtd = inftl->mbd.mtd;
 	instr->addr = block * inftl->EraseSize;
 	instr->len = inftl->mbd.mtd->erasesize;
 	/* Erase one physical eraseblock at a time, even though the NAND api

--------------010000020402090302080109--
