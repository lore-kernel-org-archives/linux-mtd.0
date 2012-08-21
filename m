Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T3mHi-0006jG-RP
 for linux-mtd@lists.infradead.org; Tue, 21 Aug 2012 11:06:13 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD Maling List <linux-mtd@lists.infradead.org>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: [PATCH 0/3] UBIFS: fixes for 3.6-rcX
Date: Tue, 21 Aug 2012 14:05:57 +0300
Message-Id: <1345547160-31958-1-git-send-email-dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I am going to send these fixes to 3.6-rcX. They fix UBIFS regression
reported by Uwe, and an error-path bug which I hit while testing a fix
for Uwe using 'integck' + power cut emulation.

Uwe, would you please provide your Tested-by and probably Reviewed-by?

Artem.
