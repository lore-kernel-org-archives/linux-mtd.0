Received: from desire.actrix.co.nz ([203.96.16.164])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1ATt80-0006um-Lq
	for <linux-mtd@lists.infradead.org>; Wed, 10 Dec 2003 01:27:01 +0000
Received: from there (203-96-48-55-tollfree.actrix.co.nz [203.96.48.55])
	by desire.actrix.co.nz (Postfix) with SMTP id C4B8C16D29
	for <linux-mtd@lists.infradead.org>;
	Wed, 10 Dec 2003 14:25:15 +1300 (NZDT)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Charles Manning <manningc2@actrix.gen.nz>
To: linux-mtd@lists.infradead.org
Date: Wed, 10 Dec 2003 14:32:13 +1300
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <20031210012515.C4B8C16D29@desire.actrix.co.nz>
Subject: mtd: Config.in syntax broken for olde kernels?
Reply-To: manningc2@actrix.gen.nz
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Some of us old'uns still use 2.4.18 etc. Ok, ok I know I should get with the 
90's.....

When I ran a config on the latest mtd from cvs I hit a problem. It seems that 
the old 2.4.18 config script chokes on elif

I fixed the poblem in drivers/mtd/chips as follows.

-- CHarles


--- Config.in.old	Mon Dec  8 07:15:16 2003
+++ Config.in	Mon Dec  8 07:16:40 2003
@@ -58,12 +58,14 @@
 	-o "$CONFIG_MTD_CFI_AMDSTD" = "y" \
 	-o "$CONFIG_MTD_CFI_STAA" = "y" ]; then
    define_bool CONFIG_MTD_CFI_UTIL y
-elif [ "$CONFIG_MTD_CFI_INTELEXT" = "m" \
+else
+   if [ "$CONFIG_MTD_CFI_INTELEXT" = "m" \
 	-o "$CONFIG_MTD_CFI_AMDSTD" = "m" \
 	-o "$CONFIG_MTD_CFI_STAA" = "m" ]; then
-   define_bool CONFIG_MTD_CFI_UTIL m
-else
-   define_bool CONFIG_MTD_CFI_UTIL n
+      define_bool CONFIG_MTD_CFI_UTIL m
+   else
+      define_bool CONFIG_MTD_CFI_UTIL n
+   fi
 fi
 
 dep_tristate '  Support for RAM chips in bus mapping' CONFIG_MTD_RAM 
$CONFIG_MTD
