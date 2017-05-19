Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com
 ([52.27.115.49] helo=osg.samsung.com)
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dBWdc-0000PC-Pk
 for linux-mtd@lists.infradead.org; Fri, 19 May 2017 01:23:38 +0000
From: Mauro Carvalho Chehab <mchehab@s-opensource.com>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@s-opensource.com>,
 Mauro Carvalho Chehab <mchehab@infradead.org>,
 linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org
Subject: [PATCH 03/31] btmrvl.txt: standardize document format
Date: Thu, 18 May 2017 22:22:08 -0300
Message-Id: <8fc143de1a95478a32d78e0725ee45242f4b2b76.1495156488.git.mchehab@s-opensource.com>
In-Reply-To: <cover.1495156488.git.mchehab@s-opensource.com>
References: <cover.1495156488.git.mchehab@s-opensource.com>
In-Reply-To: <cover.1495156488.git.mchehab@s-opensource.com>
References: <cover.1495156488.git.mchehab@s-opensource.com>
Sender: Mauro Carvalho Chehab <mchehab@smtp.s-opensource.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Each text file under Documentation follows a different
format. Some doesn't even have titles!

Change its representation to follow the adopted standard,
using ReST markups for it to be parseable by Sphinx:

- Use the right notation for titles;
- Use a list for image names;
- Use literal blocks where needed;
- Whitespace fixes.

Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>
---
 Documentation/btmrvl.txt | 64 +++++++++++++++++++++++++-----------------------
 1 file changed, 34 insertions(+), 30 deletions(-)

diff --git a/Documentation/btmrvl.txt b/Documentation/btmrvl.txt
index 34916a46c099..575512415c2b 100644
--- a/Documentation/btmrvl.txt
+++ b/Documentation/btmrvl.txt
@@ -1,18 +1,15 @@
-=======================================================================
-		README for btmrvl driver
-=======================================================================
-
+btmrvl driver
+=============
 
 All commands are used via debugfs interface.
 
-=====================
-Set/get driver configurations:
+Set/get driver configurations
+=============================
 
 Path:	/debug/btmrvl/config/
 
-gpiogap=[n]
-hscfgcmd
-	These commands are used to configure the host sleep parameters.
+gpiogap=[n], hscfgcmd
+	These commands are used to configure the host sleep parameters::
 	bit 8:0  -- Gap
 	bit 16:8 -- GPIO
 
@@ -23,7 +20,8 @@ hscfgcmd
 	where Gap is the gap in milli seconds between wakeup signal and
 	wakeup event, or 0xff for special host sleep setting.
 
-	Usage:
+	Usage::
+
 		# Use SDIO interface to wake up the host and set GAP to 0x80:
 		echo 0xff80 > /debug/btmrvl/config/gpiogap
 		echo 1 > /debug/btmrvl/config/hscfgcmd
@@ -32,15 +30,16 @@ hscfgcmd
 		echo 0x03ff >  /debug/btmrvl/config/gpiogap
 		echo 1 > /debug/btmrvl/config/hscfgcmd
 
-psmode=[n]
-pscmd
+psmode=[n], pscmd
 	These commands are used to enable/disable auto sleep mode
 
-	where the option is:
+	where the option is::
+
 			1 	-- Enable auto sleep mode
 			0 	-- Disable auto sleep mode
 
-	Usage:
+	Usage::
+
 		# Enable auto sleep mode
 		echo 1 > /debug/btmrvl/config/psmode
 		echo 1 > /debug/btmrvl/config/pscmd
@@ -50,15 +49,16 @@ pscmd
 		echo 1 > /debug/btmrvl/config/pscmd
 
 
-hsmode=[n]
-hscmd
+hsmode=[n], hscmd
 	These commands are used to enable host sleep or wake up firmware
 
-	where the option is:
+	where the option is::
+
 			1	-- Enable host sleep
 			0	-- Wake up firmware
 
-	Usage:
+	Usage::
+
 		# Enable host sleep
 		echo 1 > /debug/btmrvl/config/hsmode
 		echo 1 > /debug/btmrvl/config/hscmd
@@ -68,12 +68,13 @@ hscmd
 		echo 1 > /debug/btmrvl/config/hscmd
 
 
-======================
-Get driver status:
+Get driver status
+=================
 
 Path:	/debug/btmrvl/status/
 
-Usage:
+Usage::
+
 	cat /debug/btmrvl/status/<args>
 
 where the args are:
@@ -90,14 +91,17 @@ hsstate
 txdnldrdy
 	This command displays the value of Tx download ready flag.
 
-
-=====================
+Issuing a raw hci command
+=========================
 
 Use hcitool to issue raw hci command, refer to hcitool manual
 
-	Usage: Hcitool cmd <ogf> <ocf> [Parameters]
+Usage::
+
+	Hcitool cmd <ogf> <ocf> [Parameters]
+
+Interface Control Command::
 
-	Interface Control Command
 	hcitool cmd 0x3f 0x5b 0xf5 0x01 0x00    --Enable All interface
 	hcitool cmd 0x3f 0x5b 0xf5 0x01 0x01    --Enable Wlan interface
 	hcitool cmd 0x3f 0x5b 0xf5 0x01 0x02    --Enable BT interface
@@ -105,13 +109,13 @@ Use hcitool to issue raw hci command, refer to hcitool manual
 	hcitool cmd 0x3f 0x5b 0xf5 0x00 0x01    --Disable Wlan interface
 	hcitool cmd 0x3f 0x5b 0xf5 0x00 0x02    --Disable BT interface
 
-=======================================================================
+SD8688 firmware
+===============
 
+Images:
 
-SD8688 firmware:
-
-/lib/firmware/sd8688_helper.bin
-/lib/firmware/sd8688.bin
+- /lib/firmware/sd8688_helper.bin
+- /lib/firmware/sd8688.bin
 
 
 The images can be downloaded from:
-- 
2.9.4
