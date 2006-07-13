Received: from herkules.vianova.fi ([194.100.28.129] helo=mail.vianova.fi)
	by canuck.infradead.org with smtp (Exim 4.62 #1 (Red Hat Linux))
	id 1G13JS-0005f6-WF
	for linux-mtd@lists.infradead.org; Thu, 13 Jul 2006 11:41:22 -0400
Date: Thu, 13 Jul 2006 18:41:10 +0300
From: Ville Herva <vherva@vianova.fi>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] [MTD] block2mtd.c: Remove unnecessary parsing of empty
	boot-time argument
Message-ID: <20060713154110.GE15078@vianova.fi>
References: <20060707122221.GW6240@vianova.fi>
	<20060711062342.GY6240@vianova.fi>
	<20060712095048.GB14333@wohnheim.fh-wedel.de>
	<20060712172359.GZ15078@vianova.fi>
	<20060713133959.GA24056@wohnheim.fh-wedel.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20060713133959.GA24056@wohnheim.fh-wedel.de>
Cc: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
Reply-To: vherva@vianova.fi
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Statically compiled block2mtd driver with no boot-time parameter works, but
it does unnecessarily printk

   error: cannot open device ""

since argument parsing is invoked even when no argument is supplied.
This is harmless as no "" device is found, but perhaps worth correcting.

This is an incremental patch against the "Make kernel boot command line
arguments work (try 3)" patch.


From: Ville Herva <vherva@vianova.fi>
Signed-off-by: Ville Herva <vherva@vianova.fi>
Acked-by: Joern Engel <joern@wohnheim.fh-wedel.de>

--- linux-2.6.17.3.NEW3/drivers/mtd/devices/block2mtd.c	2006-07-07 15:05:40.000000000 +0300
+++ linux-2.6.17.3.NEW4/drivers/mtd/devices/block2mtd.c	2006-07-13 18:28:31.000000000 +0300
@@ -507,7 +507,8 @@ static int __init block2mtd_init(void)
 	INFO("version " VERSION);
 
 #ifndef MODULE	
-	ret = block2mtd_setup2(block2mtd_paramline);
+	if (strlen(block2mtd_paramline))
+		ret = block2mtd_setup2(block2mtd_paramline);
 	block2mtd_init_called = 1;
 #endif
 
