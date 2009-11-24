Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1ND2dS-0003eC-Su
	for linux-mtd@lists.infradead.org; Tue, 24 Nov 2009 21:09:21 +0000
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 13/38] don't use __exit_p to wrap mxcnd_remove
Date: Tue, 24 Nov 2009 22:07:08 +0100
Message-Id: <1259096853-18909-13-git-send-email-u.kleine-koenig@pengutronix.de>
In-Reply-To: <1259096853-18909-12-git-send-email-u.kleine-koenig@pengutronix.de>
References: <1259096853-18909-1-git-send-email-u.kleine-koenig@pengutronix.de>
	<1259096853-18909-2-git-send-email-u.kleine-koenig@pengutronix.de>
	<1259096853-18909-3-git-send-email-u.kleine-koenig@pengutronix.de>
	<1259096853-18909-4-git-send-email-u.kleine-koenig@pengutronix.de>
	<1259096853-18909-5-git-send-email-u.kleine-koenig@pengutronix.de>
	<1259096853-18909-6-git-send-email-u.kleine-koenig@pengutronix.de>
	<1259096853-18909-7-git-send-email-u.kleine-koenig@pengutronix.de>
	<1259096853-18909-8-git-send-email-u.kleine-koenig@pengutronix.de>
	<1259096853-18909-9-git-send-email-u.kleine-koenig@pengutronix.de>
	<1259096853-18909-10-git-send-email-u.kleine-koenig@pengutronix.de>
	<1259096853-18909-11-git-send-email-u.kleine-koenig@pengutronix.de>
	<1259096853-18909-12-git-send-email-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	David Woodhouse <David.Woodhouse@intel.com>,
	Vladimir Barinov <vbarinov@embeddedalley.com>,
	Sascha Hauer <s.hauer@pengutronix.de>, Eric Benard <ebenard@eukrea.com>,
	Vladimir Barinov <vova.barinov@gmail.com>,
	linux-mtd@lists.infradead.org, akpm@linux-foundation.org,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The function mxcnd_remove is defined using __devexit, so don't use
__exit_p but __devexit_p to wrap it.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: David Woodhouse <David.Woodhouse@intel.com>
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Vladimir Barinov <vova.barinov@gmail.com>
Cc: Vladimir Barinov <vbarinov@embeddedalley.com>
Cc: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: Eric Benard <ebenard@eukrea.com>
---
 drivers/mtd/nand/mxc_nand.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
index 65b26d5..661d46a 100644
--- a/drivers/mtd/nand/mxc_nand.c
+++ b/drivers/mtd/nand/mxc_nand.c
@@ -1113,7 +1113,7 @@ static struct platform_driver mxcnd_driver = {
 	.driver = {
 		   .name = DRIVER_NAME,
 		   },
-	.remove = __exit_p(mxcnd_remove),
+	.remove = __devexit_p(mxcnd_remove),
 	.suspend = mxcnd_suspend,
 	.resume = mxcnd_resume,
 };
-- 
1.6.5.2
