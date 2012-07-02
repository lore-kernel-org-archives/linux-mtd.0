Received: from eu1sys200aog110.obsmtp.com ([207.126.144.129])
 by merlin.infradead.org with smtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SlZfw-0006CT-En
 for linux-mtd@lists.infradead.org; Mon, 02 Jul 2012 05:59:57 +0000
From: Shiraz Hashim <shiraz.hashim@st.com>
To: <dwmw2@infradead.org>, <viresh.linux@gmail.com>
Subject: [PATCH 3/3] mtd/spear_smi: handle return value of timeouts properly
Date: Mon, 2 Jul 2012 11:28:47 +0530
Message-ID: <1341208727-22476-3-git-send-email-shiraz.hashim@st.com>
In-Reply-To: <1341208727-22476-1-git-send-email-shiraz.hashim@st.com>
References: <1341208727-22476-1-git-send-email-shiraz.hashim@st.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Cc: Antonio BORNEO <antonio.borneo@st.com>,
 spear--sw-devel@lists.codex.cro.st.com, spear-devel@list.st.com,
 Vipin Kumar <vipin.kumar@st.com>, Shiraz Hashim <shiraz.hashim@st.com>,
 linux-mtd@lists.infradead.org, sr@denx.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Vipin Kumar <vipin.kumar@st.com>

Handle timouts in general and return value of
'wait_event_interruptible_timeout' in particular, to capture all
conditions.

'wait_event_interruptible_timeout' returns either of the following three
values :-
   * 0               - time out occurred.
   * negative
      * -ERESTARTSYS - return because of a signal
      * other        - for a real error
   * positive        - time remaining

Fix particularly 'ERESTARTSYS' condition which is not properly handled
by the smi driver at a couple of places leading to an erroneous
situation.

Signed-off-by: Antonio BORNEO <antonio.borneo@st.com>
Signed-off-by: Shiraz Hashim <shiraz.hashim@st.com>
Signed-off-by: Vipin Kumar <vipin.kumar@st.com>
---
 drivers/mtd/devices/spear_smi.c |   23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/devices/spear_smi.c b/drivers/mtd/devices/spear_smi.c
index aec941e..b85f183 100644
--- a/drivers/mtd/devices/spear_smi.c
+++ b/drivers/mtd/devices/spear_smi.c
@@ -241,8 +241,8 @@ static int spear_smi_read_sr(struct spear_smi *dev, u32 bank)
 	/* copy dev->status (lower 16 bits) in order to release lock */
 	if (ret > 0)
 		ret = dev->status & 0xffff;
-	else
-		ret = -EIO;
+	else if (ret == 0)
+		ret = -ETIMEDOUT;
 
 	/* restore the ctrl regs state */
 	writel(ctrlreg1, dev->io_base + SMI_CR1);
@@ -270,16 +270,19 @@ static int spear_smi_wait_till_ready(struct spear_smi *dev, u32 bank,
 	finish = jiffies + timeout;
 	do {
 		status = spear_smi_read_sr(dev, bank);
-		if (status < 0)
-			continue; /* try till timeout */
-		else if (!(status & SR_WIP))
+		if (status < 0) {
+			if (status == -ETIMEDOUT)
+				continue; /* try till finish */
+			return status;
+		} else if (!(status & SR_WIP)) {
 			return 0;
+		}
 
 		cond_resched();
 	} while (!time_after_eq(jiffies, finish));
 
 	dev_err(&dev->pdev->dev, "smi controller is busy, timeout\n");
-	return status;
+	return -EBUSY;
 }
 
 /**
@@ -395,11 +398,11 @@ static int spear_smi_write_enable(struct spear_smi *dev, u32 bank)
 	writel(ctrlreg1, dev->io_base + SMI_CR1);
 	writel(0, dev->io_base + SMI_CR2);
 
-	if (ret <= 0) {
+	if (ret == 0) {
 		ret = -EIO;
 		dev_err(&dev->pdev->dev,
 			"smi controller failed on write enable\n");
-	} else {
+	} else if (ret > 0) {
 		/* check whether write mode status is set for required bank */
 		if (dev->status & (1 << (bank + WM_SHIFT)))
 			ret = 0;
@@ -466,10 +469,10 @@ static int spear_smi_erase_sector(struct spear_smi *dev,
 	ret = wait_event_interruptible_timeout(dev->cmd_complete,
 			dev->status & TFF, SMI_CMD_TIMEOUT);
 
-	if (ret <= 0) {
+	if (ret == 0) {
 		ret = -EIO;
 		dev_err(&dev->pdev->dev, "sector erase failed\n");
-	} else
+	} else if (ret > 0)
 		ret = 0; /* success */
 
 	/* restore ctrl regs */
-- 
1.7.10
