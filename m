Received: from polonez.inetia.pl ([195.114.161.60])
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AHraR-0007tY-89
	for <linux-mtd@lists.infradead.org>; Thu, 06 Nov 2003 21:22:39 +0000
Received: from www.n1.pl (www.n1.pl [195.114.173.151])
 by polonez.inetia.pl (Sun Internet Mail Server sims.4.0.1999.06.13.00.20)
 with ESMTP id <0HNY008298P5TZ@polonez.inetia.pl> for
 linux-mtd@lists.infradead.org; Thu,  6 Nov 2003 22:22:17 +0100 (MET)
Date: Thu, 06 Nov 2003 22:21:11 +0100
From: andrzej.mialkowski@inetia.pl
In-reply-to: <1067268357.3f9d3905c3fc9@imail.internetia.pl>
To: andrzej.mialkowski@inetia.pl
Message-id: <1068153671.3faabb47862b2@imail.internetia.pl>
MIME-version: 1.0
References: <1067268357.3f9d3905c3fc9@imail.internetia.pl>
Content-type: text/plain; charset=ISO-8859-2
Content-transfer-encoding: 7BIT
cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH] parse_redboot_partitions not always works correctly
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Single char autocorrection of address calculation in legacy mode (not used in 
regular cases). 
-                        flash_base = buf[i].flash_base & (master->size - 1); 
+                        flash_base = buf[i].flash_base & ~(master->size - 1); 

Andrzej 
