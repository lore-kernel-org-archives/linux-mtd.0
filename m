Received: from netserv.ipi.ac.ru ([83.149.245.1] helo=ipi.ac.ru)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DfcJh-0005K5-08
	for linux-mtd@lists.infradead.org; Tue, 07 Jun 2005 07:32:22 -0400
From: "Timofei V. Bondarenko" <tim@ipi.ac.ru>
To: Vitaly Wool <vwool@ru.mvista.com>
In-Reply-To: <42A5627B.6060609@ru.mvista.com>
References: <426F719A.2000903@ipi.ac.ru>
	<20050606133406.GD31739@wohnheim.fh-wedel.de>	<42A4572C.8020107@ipi.ac.ru>
	<20050606141453.GF31739@wohnheim.fh-wedel.de>	<42A460BB.50800@ipi.ac.ru>
	<20050606162648.GJ31739@wohnheim.fh-wedel.de>	<42A47E7D.2060302@ipi.ac.ru>
	<20050606174443.GA24857@wohnheim.fh-wedel.de>
	<42A55B15.8000506@ipi.ac.ru> <42A5627B.6060609@ru.mvista.com>
Content-Type: text/plain; charset=UTF-8
Date: Tue, 07 Jun 2005 15:34:45 +0400
Message-Id: <1118144085.1565.13.camel@bfin.ipi.ac.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: misaligned memory access in cmdlinepart.c
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2005-06-07 at 13:01 +0400, Vitaly Wool wrote:
> Hi Timofei,
> I guess you should use a mail client that doesn't expand tabs to spaces, 
> like sylpheed or pine.
> 
> >> JЖrn Engel wrote:
> >>
> >> Doesn't apply with patch -p1.  Can you respin the patch against mtd
> >> cvs and make sure it does?  If in doubt, read:
> >> http://www.zip.com.au/~akpm/linux/patches/stuff/tpp.txt

I'm apologize for my unusual inaccuracy.
Now, the tabs are preserved; patch -p1 looks happy.
For cvslog:

---
the this_mtd structure should be aligned
---

diff -u -p -r1.17 cmdlinepart.c
--- mtd/drivers/mtd/cmdlinepart.c	26 Nov 2004 11:18:47 -0000	1.17
+++ mtd/drivers/mtd/cmdlinepart.c	7 Jun 2005 08:02:00 -0000
@@ -239,7 +239,8 @@ static int mtdpart_setup_real(char *s)
 				&num_parts,	/* out: number of parts */
 				0,		/* first partition */
 				(unsigned char**)&this_mtd, /* out: extra mem */
-				mtd_id_len + 1 + sizeof(*this_mtd));
+				mtd_id_len + 1 + sizeof(*this_mtd) + 
+				sizeof(void*)-1 /*alignment*/);
 		if(!parts)
 		{
 			/*
@@ -252,7 +253,10 @@ static int mtdpart_setup_real(char *s)
 			 return 0;
 		 }
 
-		/* enter results */	    
+		/* align this_mtd */
+		this_mtd = (struct cmdline_mtd_partition *) 
+		     ALIGN((unsigned long)this_mtd, sizeof(void*));
+		/* enter results */
 		this_mtd->parts = parts;
 		this_mtd->num_parts = num_parts;
 		this_mtd->mtd_id = (char*)(this_mtd + 1);
