Received: from 83-216-141-215.markhi700.adsl.metronet.co.uk ([83.216.141.215]
	helo=mx.hindley.org.uk)
	by pentafluge.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JgKI5-0005oF-Hn
	for linux-mtd@lists.infradead.org; Mon, 31 Mar 2008 13:43:14 +0000
Date: Mon, 31 Mar 2008 14:25:03 +0100
From: Mark Hindley <mark@hindley.org.uk>
To: dwmw2@infradead.org, linux-mtd@lists.infradead.org
Subject: [PATCH] Correct phram module param description
Message-ID: <20080331132503.GA26273@hindley.uklinux.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I have just started using phram to make uncachable RAM over 64M on a
430TX available as swap. Works a treat! :)

However, I noticed that the module parameter description example is incorrect.

Patch to fix is below.

Mark

commit a93c6576f8c91aa067e3afb4083b685d8e2f1126
Author: Mark Hindley <mark@hindley.org.uk>
Date:   Mon Mar 31 14:14:30 2008 +0100

    Correct module parameter description example
    
    Signed-off-by: Mark Hindley <mark@hindley.org.uk>

diff --git a/drivers/mtd/devices/phram.c b/drivers/mtd/devices/phram.c
index 56cc1ca..13ad32f 100644
--- a/drivers/mtd/devices/phram.c
+++ b/drivers/mtd/devices/phram.c
@@ -282,7 +282,7 @@ static int phram_setup(const char *val, struct kernel_param *kp)
 }
 
 module_param_call(phram, phram_setup, NULL, NULL, 000);
-MODULE_PARM_DESC(phram,"Memory region to map. \"map=<name>,<start>,<length>\"");
+MODULE_PARM_DESC(phram, "Memory region to map. \"phram=<name>,<start>,<length>\"");
 
 
 static int __init init_phram(void)
