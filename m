Received: from [69.28.251.93] (helo=b32.net)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QJ8Lg-0005mb-Ei
	for linux-mtd@lists.infradead.org; Sun, 08 May 2011 18:04:57 +0000
From: Kevin Cernekee <cernekee@gmail.com>
To: <dedekind@infradead.org>, <dwmw2@infradead.org>
Subject: [PATCH 4/4] mtd: m25p80: Add Spansion S25FL512S, S70FL01GS
Date: Sun, 08 May 2011 10:48:02 -0700
Message-Id: <809206b52b14975afeb5b59b5ec10a9f@localhost>
In-Reply-To: <657440bd74a74686279e691d39337f21@localhost>
References: <657440bd74a74686279e691d39337f21@localhost>
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

S25FL512S = 64MiB single die, same family as S25FL256S
S70FL01GS = 2x S25FL512S dies in one package (separate chip selects)

These devices are not sampling yet, but they are expected to be very
similar to S25FL256S, which has been tested.

Signed-off-by: Kevin Cernekee <cernekee@gmail.com>
---
 drivers/mtd/devices/m25p80.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index fad7448..bc116a3 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -699,6 +699,8 @@ static const struct spi_device_id m25p_ids[] = {
 	{ "s25sl064a",  INFO(0x010216,      0,  64 * 1024, 128, 0) },
 	{ "s25fl256s0", INFO(0x010219, 0x4d00, 256 * 1024, 128, 0) },
 	{ "s25fl256s1", INFO(0x010219, 0x4d01,  64 * 1024, 512, 0) },
+	{ "s25fl512s",  INFO(0x010220, 0x4d00, 256 * 1024, 256, 0) },
+	{ "s70fl01gs",  INFO(0x010221, 0x4d00, 256 * 1024, 256, 0) },
 	{ "s25sl12800", INFO(0x012018, 0x0300, 256 * 1024,  64, 0) },
 	{ "s25sl12801", INFO(0x012018, 0x0301,  64 * 1024, 256, 0) },
 	{ "s25fl129p0", INFO(0x012018, 0x4d00, 256 * 1024,  64, 0) },
-- 
1.7.5
