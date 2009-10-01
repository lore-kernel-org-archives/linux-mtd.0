Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MtH3E-00059M-Rx
	for linux-mtd@lists.infradead.org; Thu, 01 Oct 2009 08:30:13 +0000
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 17/34] move mxcnd_remove to .exit.text
Date: Thu,  1 Oct 2009 10:28:21 +0200
Message-Id: <1254385718-14254-17-git-send-email-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20091001082607.GA2181@pengutronix.de>
References: <20091001082607.GA2181@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	David Woodhouse <David.Woodhouse@intel.com>,
	Vladimir Barinov <vbarinov@embeddedalley.com>,
	Sam Ravnborg <sam@ravnborg.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Vladimir Barinov <vova.barinov@gmail.com>, linux-mtd@lists.infradead.org,
	Andrew Morton <akpm@linux-foundation.org>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The function mxcnd_remove is used only wrapped by __exit_p so define it
using __exit.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: David Woodhouse <David.Woodhouse@intel.com>
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Vladimir Barinov <vova.barinov@gmail.com>
Cc: Vladimir Barinov <vbarinov@embeddedalley.com>
Cc: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/mtd/nand/mxc_nand.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
index 65b26d5..ef3e199 100644
--- a/drivers/mtd/nand/mxc_nand.c
+++ b/drivers/mtd/nand/mxc_nand.c
@@ -1052,7 +1052,7 @@ eclk:
 	return err;
 }
 
-static int __devexit mxcnd_remove(struct platform_device *pdev)
+static int __exit mxcnd_remove(struct platform_device *pdev)
 {
 	struct mxc_nand_host *host = platform_get_drvdata(pdev);
 
-- 
1.6.4.3
