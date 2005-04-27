Received: from netserv.ipi.ac.ru ([83.149.245.1] helo=ipi.ac.ru)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DQkKg-0001NU-Nq
	for linux-mtd@lists.infradead.org; Wed, 27 Apr 2005 07:03:56 -0400
Received: from [83.149.245.1] (netserv.ipi.ac.ru [83.149.245.1])
	by ipi.ac.ru (8.12.8p1/8.12.2) with ESMTP id j3RB3sr1031124
	for <linux-mtd@lists.infradead.org>; Wed, 27 Apr 2005 15:03:55 +0400
Message-ID: <426F719A.2000903@ipi.ac.ru>
Date: Wed, 27 Apr 2005 15:03:54 +0400
From: "Timofei V. Bondarenko" <timm@ipi.ac.ru>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: misaligned memory access in cmdlinepart.c
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

in mtdpart_setup_real()/newpart() command line parser
'this_mtd' structure can be misaligned,
it may cause exception on some kind of CPU.

That happened because the structure allocated in a variable length area 
and got mixed with partition names.

The patch follows.

Regards.
	Timofei.

--- cmdlinepart.c	2005-04-18 18:06:43.000000000 +0400
+++ linux-2.6.x/drivers/mtd/cmdlinepart.c	2005-04-18 18:40:02.971778640 
+0400
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
