Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IjCMD-0000fm-1V
	for linux-mtd@lists.infradead.org; Sat, 20 Oct 2007 12:19:08 +0100
Date: Sat, 20 Oct 2007 13:11:26 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
Subject: [PATCH] BUG() when passing illegal parameters to decode_rs8() or
	decode_rs16()
Message-ID: <20071020111126.GE32465@lazybastard.org>
References: <1192656803-32151-1-git-send-email-mattjreimer@gmail.com>
	<20071020104226.GD32465@lazybastard.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20071020104226.GD32465@lazybastard.org>
Cc: David Woodhouse <dwmw2@infradead.org>, Thomas Gleixner <tglx@linutronix.de>,
	Matt Reimer <mreimer@vpop.net>, linux-mtd@lists.infradead.org,
	mattjreimer@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Returning -ERANGE should never happen.

--- linux-2.6.22cow/lib/reed_solomon/decode_rs.c~rs_ERANGE	2006-10-13 15:58:51.000000000 +0200
+++ linux-2.6.22cow/lib/reed_solomon/decode_rs.c	2007-10-20 13:07:57.000000000 +0200
@@ -39,8 +39,7 @@
 
 	/* Check length parameter for validity */
 	pad = nn - nroots - len;
-	if (pad < 0 || pad >= nn)
-		return -ERANGE;
+	BUG_ON(pad < 0 || pad >= nn);
 
 	/* Does the caller provide the syndrome ? */
 	if (s != NULL)
