Received: from [213.239.205.147] (helo=debian.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BkhHg-0001vE-I5
	for linux-mtd@lists.infradead.org; Wed, 14 Jul 2004 06:46:45 -0400
From: Thomas Gleixner <tglx@linutronix.de>
To: Pathompong Puengrostham <jay4mail@yahoo.com>
In-Reply-To: <40F50325.3000404@yahoo.com>
References: <40F4B205.6060902@yahoo.com> <40F4BD37.4090500@yahoo.com>
	<1089790912.5274.61.camel@thomas.tec.linutronix.de>
	<40F50325.3000404@yahoo.com>
Content-Type: multipart/mixed; boundary="=-4V0Cs3wSyrPkAzqnFqJ6"
Message-Id: <1089801596.5255.73.camel@thomas.tec.linutronix.de>
Mime-Version: 1.0
Date: Wed, 14 Jul 2004 12:39:56 +0200
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 on NAND, Magic bitmask 0x1985 not found
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-4V0Cs3wSyrPkAzqnFqJ6
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2004-07-14 at 11:55, Pathompong Puengrostham wrote:

> The chip I'm using do autoincrement but I thought that after CE goes
> high I have to send the read command again which is not correct.
> Now I don't set NAND_NO_AUTOINCR and it works good. But I still need the
> delays.

Can you try this one ? It's against current CVS code.

tglx



--=-4V0Cs3wSyrPkAzqnFqJ6
Content-Disposition: attachment; filename=nand_base.diff
Content-Type: text/x-patch; name=nand_base.diff; charset=
Content-Transfer-Encoding: 7bit

? nand.diff
? nand_base.diff
Index: nand_base.c
===================================================================
RCS file: /home/cvs/mtd/drivers/mtd/nand/nand_base.c,v
retrieving revision 1.112
diff -u -r1.112 nand_base.c
--- nand_base.c	13 Jul 2004 08:28:21 -0000	1.112
+++ nand_base.c	14 Jul 2004 10:45:55 -0000
@@ -964,34 +964,34 @@
 		oobofs += mtd->oobsize - hweccbytes * eccsteps;
 		page++;
 		numpages--;
-		if (!numpages)
-			break;
-		
+
 		/* Apply delay or wait for ready/busy pin 
 		 * Do this before the AUTOINCR check, so no problems
 		 * arise if a chip which does auto increment
 		 * is marked as NOAUTOINCR by the board driver.
+		 * Do this also before returning, so the chip is
+		 * ready for the next command.
 		*/
 		if (!this->dev_ready) 
 			udelay (this->chip_delay);
 		else
 			while (!this->dev_ready(mtd));	
+
+		/* All done, return happy */
+		if (!numpages)
+			return 0;
+		
 			
 		/* Check, if the chip supports auto page increment */ 
 		if (!NAND_CANAUTOINCR(this))
 			this->cmdfunc (mtd, NAND_CMD_READ0, 0x00, page);
 	}
-	res = 0;
 	/* 
-	 * Terminate the read command. This is faster than sending a reset command or 
-	 * applying a 20us delay before issuing the next programm sequence.
-	 * This is not a problem for all chips, but I have found a bunch of them.
-	 * FIXME, CHECKME: Does this work on systems, where CE is not driven
-	 * by an GPIO pin ?
+	 * Terminate the read command. We come here in case of an error
+	 * So we must issue a reset command.
 	 */
 out:	 
-	this->select_chip(mtd, -1);
-	this->select_chip(mtd, chipnr);
+	this->cmdfunc (mtd, NAND_CMD_RESET, -1, -1);
 	return res;
 }
 #endif
@@ -1248,14 +1248,6 @@
 		} else		
 			read += mtd->oobblock;
 
-		if (read == len)
-			break;	
-
-		/* For subsequent reads align to page boundary. */
-		col = 0;
-		/* Increment page address */
-		realpage++;
-
 		/* Apply delay or wait for ready/busy pin 
 		 * Do this before the AUTOINCR check, so no problems
 		 * arise if a chip which does auto increment
@@ -1266,6 +1258,14 @@
 		else
 			while (!this->dev_ready(mtd));	
 			
+		if (read == len)
+			break;	
+
+		/* For subsequent reads align to page boundary. */
+		col = 0;
+		/* Increment page address */
+		realpage++;
+
 		page = realpage & this->pagemask;
 		/* Check, if we cross a chip boundary */
 		if (!page) {
@@ -1345,19 +1345,21 @@
 		thislen = min_t(int, thislen, len);
 		this->read_buf(mtd, &buf[i], thislen);
 		i += thislen;
+		
+		/* Apply delay or wait for ready/busy pin 
+		 * Do this before the AUTOINCR check, so no problems
+		 * arise if a chip which does auto increment
+		 * is marked as NOAUTOINCR by the board driver.
+		*/
+		if (!this->dev_ready) 
+			udelay (this->chip_delay);
+		else
+			while (!this->dev_ready(mtd));	
+
 		/* Read more ? */
 		if (i < len) {
 			page++;
 			col = 0;
-			/* Apply delay or wait for ready/busy pin 
-			 * Do this before the AUTOINCR check, so no problems
-			 * arise if a chip which does auto increment
-			 * is marked as NOAUTOINCR by the board driver.
-			*/
-			if (!this->dev_ready) 
-				udelay (this->chip_delay);
-			else
-				while (!this->dev_ready(mtd));	
 
 			/* Check, if we cross a chip boundary */
 			if (!(page & this->pagemask)) {

--=-4V0Cs3wSyrPkAzqnFqJ6--
