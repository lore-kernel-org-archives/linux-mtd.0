Received: from netserv.ipi.ac.ru ([83.149.245.1] helo=ipi.ac.ru)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DNYCs-0001c9-TX
	for linux-mtd@lists.infradead.org; Mon, 18 Apr 2005 11:30:41 -0400
Received: from [83.149.245.1] (netserv.ipi.ac.ru [83.149.245.1])
	by ipi.ac.ru (8.12.8p1/8.12.2) with ESMTP id j3IFUZr1013482
	for <linux-mtd@lists.infradead.org>; Mon, 18 Apr 2005 19:30:36 +0400
Message-ID: <4263D29B.704@ipi.ac.ru>
From: "Timofei V. Bondarenko" <timm@ipi.ac.ru>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: multipart/mixed; boundary="------------080100000507020106050904"
Subject: Bug: misaligned memory access in cmdlinepart.c
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Date: Mon, 18 Apr 2005 15:30:42 -0000

This is a multi-part message in MIME format.
--------------080100000507020106050904
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

in mtdpart_setup_real()/newpart() command line parser
'this_mtd' structure can be misaligned,
it may cause exception on some kind of CPU.

That happened because the structure got mixed with partition names 
allocated in a variable length area.

I've attached a simle patch, not very elegant though.

Regards.
	Timofei.

--------------080100000507020106050904
Content-Type: text/plain;
 name="alignnewpart.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="alignnewpart.diff"

--- cmdlinepart.c	2005-04-18 18:06:43.000000000 +0400
+++ bfin/uClinux-dist/linux-2.6.x/drivers/mtd/cmdlinepart.c	2005-04-18 18:40:02.971778640 +0400
@@ -234,12 +234,14 @@ static int mtdpart_setup_real(char *s)
 		 * parse one mtd. have it reserve memory for the
 		 * struct cmdline_mtd_partition and the mtd-id string.
 		 */
+#define THIS_MTD_ALIGN_CONST (sizeof(void*)-1)
 		parts = newpart(p + 1,		/* cmdline */
 				&s,		/* out: updated cmdline ptr */
 				&num_parts,	/* out: number of parts */
 				0,		/* first partition */
 				(unsigned char**)&this_mtd, /* out: extra mem */
-				mtd_id_len + 1 + sizeof(*this_mtd));
+				mtd_id_len + 1 + sizeof(*this_mtd) + 
+                                THIS_MTD_ALIGN_CONST);
 		if(!parts)
 		{
 			/*
@@ -252,7 +254,11 @@ static int mtdpart_setup_real(char *s)
 			 return 0;
 		 }
 
-		/* enter results */	    
+		/* align this_mtd */
+                this_mtd = (struct cmdline_mtd_partition *) 
+                  (~THIS_MTD_ALIGN_CONST & 
+                    THIS_MTD_ALIGN_CONST + (unsigned long)(char*)this_mtd);
+		/* enter results */
 		this_mtd->parts = parts;
 		this_mtd->num_parts = num_parts;
 		this_mtd->mtd_id = (char*)(this_mtd + 1);

--------------080100000507020106050904--
