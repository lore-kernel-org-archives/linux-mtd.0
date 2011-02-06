Received: from smtp.nokia.com ([147.243.1.48] helo=mgw-sa02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Pm8Xb-0001xR-Oq
	for linux-mtd@lists.infradead.org; Sun, 06 Feb 2011 17:36:53 +0000
Received: from eru.research.nokia.com (esdhcp034110.research.nokia.com
	[172.21.34.110])
	by mgw-sa02.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p16Han8D014624
	for <linux-mtd@lists.infradead.org>; Sun, 6 Feb 2011 19:36:50 +0200
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: [PATCH 5/5] UBI: always re-read in case of read failures
Date: Sun,  6 Feb 2011 19:39:13 +0200
Message-Id: <1297013953-28886-6-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1297013953-28886-1-git-send-email-dedekind1@gmail.com>
References: <1297013953-28886-1-git-send-email-dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

When the read operation fails, UBI tries to re-read several times in
a hope that one of the subsequent reads may succeed. However, currently
UBI re-reads only if MTD failed to read all data, but does not re-reads
if all the data were read, but with an integrity error (-EBADMSB). This
patch makes UBI to always re-try reading.

This should be useful for reading NAND pages with unstable bits -
re-reading may help to get correct data.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 drivers/mtd/ubi/io.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/ubi/io.c b/drivers/mtd/ubi/io.c
index 6f90a65..889e25c 100644
--- a/drivers/mtd/ubi/io.c
+++ b/drivers/mtd/ubi/io.c
@@ -188,7 +188,7 @@ retry:
 			return UBI_IO_BITFLIPS;
 		}
 
-		if (read != len && retries++ < UBI_IO_RETRIES) {
+		if (retries++ < UBI_IO_RETRIES) {
 			dbg_io("error %d%s while reading %d bytes from PEB %d:%d,"
 			       " read only %zd bytes, retry",
 			       err, errstr, len, pnum, offset, read);
-- 
1.7.2.3
