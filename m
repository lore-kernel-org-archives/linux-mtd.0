Received: from [69.28.251.93] (helo=b32.net)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PCPTO-0008N5-63
	for linux-mtd@lists.infradead.org; Sun, 31 Oct 2010 04:24:50 +0000
From: Kevin Cernekee <cernekee@gmail.com>
Subject: [PATCH 3/3] mtd: m25p80: Add support for Macronix MX25L25655E
To: David Woodhouse <dwmw2@infradead.org>
Date: Sat, 30 Oct 2010 21:11:04 -0700
Message-Id: <9a14705b0b0416694a40a2eef55aac5b@localhost>
In-Reply-To: <fbcf2b0a4d8ebff3378b9522ce81ad82@localhost>
References: <fbcf2b0a4d8ebff3378b9522ce81ad82@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Untested, but expected to be compatible with MX25L25635E which I did
test.

Signed-off-by: Kevin Cernekee <cernekee@gmail.com>
---
 drivers/mtd/devices/m25p80.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 96ae54e..eabe5fb 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -668,6 +668,7 @@ static const struct spi_device_id m25p_ids[] = {
 	{ "mx25l12805d", INFO(0xc22018, 0, 64 * 1024, 256, 0) },
 	{ "mx25l12855e", INFO(0xc22618, 0, 64 * 1024, 256, 0) },
 	{ "mx25l25635e", INFO(0xc22019, 0, 64 * 1024, 512, 0) },
+	{ "mx25l25655e", INFO(0xc22619, 0, 64 * 1024, 512, 0) },
 
 	/* Spansion -- single (large) sector size only, at least
 	 * for the chips listed here (without boot sectors).
-- 
1.7.0.4
