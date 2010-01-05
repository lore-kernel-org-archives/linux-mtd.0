Received: from [213.165.64.20] (helo=mail.gmx.net)
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NSFG2-0000XL-SR
	for linux-mtd@lists.infradead.org; Tue, 05 Jan 2010 19:40:03 +0000
From: Andreas Fenkart <andreas.fenkart@streamunlimited.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/1] mtd: m25p80: Add erase timer to status polling.
Date: Tue,  5 Jan 2010 20:40:01 +0100
Message-Id: <1262720401-23480-2-git-send-email-andreas.fenkart@streamunlimited.com>
In-Reply-To: <1262720401-23480-1-git-send-email-andreas.fenkart@streamunlimited.com>
References: <1262720401-23480-1-git-send-email-andreas.fenkart@streamunlimited.com>
Cc: andreas.fenkart@streamunlimited.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Signed-off-by: Andreas Fenkart <andreas.fenkart@streamunlimited.com>
---
 drivers/mtd/devices/m25p80.c |   39 +++++++++++++++++++++++++++++++++++++++
 1 files changed, 39 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index f3f4768..42925cc 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -80,6 +80,9 @@ struct m25p {
 	u16			addr_width;
 	u8			erase_opcode;
 	u8			*command;
+	int			erase_running;
+	unsigned long		erase_start;
+	int			erase_delay;
 };
 
 static inline struct m25p *mtd_to_m25p(struct mtd_info *mtd)
@@ -159,6 +162,39 @@ static int wait_till_ready(struct m25p *flash)
 
 	deadline = jiffies + MAX_READY_WAIT_JIFFIES;
 
+	if (flash->erase_running) {
+		unsigned long erase_expires;
+		int idle;
+
+		flash->erase_running = 0;
+
+		if (flash->erase_delay < 0)
+			flash->erase_delay = HZ / 4; /* 250 ms */
+
+		erase_expires = flash->erase_start + flash->erase_delay;
+
+		if (time_before(jiffies, erase_expires)) {
+			set_current_state(TASK_INTERRUPTIBLE);
+			schedule_timeout(erase_expires - jiffies);
+		}
+
+		if (time_before(jiffies, erase_expires + 2)) {
+			sr = read_sr(flash);
+			if (sr < 0)
+				return 1;
+
+			idle = !(sr & SR_WIP);
+			if (idle)
+				/* favor flash latency/throughput over cpu */
+				flash->erase_delay -= HZ / 20; /* 50 ms */
+			else
+				flash->erase_delay += HZ / 100; /* 10 ms */
+
+			if (idle)
+				return 0;
+		}
+	}
+
 	do {
 		if ((sr = read_sr(flash)) < 0)
 			break;
@@ -234,6 +270,8 @@ static int erase_sector(struct m25p *flash, u32 offset)
 	flash->command[0] = flash->erase_opcode;
 	m25p_addr2cmd(flash, offset, flash->command);
 
+	flash->erase_running = 1;
+	flash->erase_start = jiffies;
 	spi_write(flash->spi, flash->command, m25p_cmdsz(flash));
 
 	return 0;
@@ -821,6 +859,7 @@ static int __devinit m25p_probe(struct spi_device *spi)
 	}
 
 	flash->spi = spi;
+	flash->erase_delay = HZ / 4; /* 250 ms */
 	mutex_init(&flash->lock);
 	dev_set_drvdata(&spi->dev, flash);
 
-- 
1.6.5.7
