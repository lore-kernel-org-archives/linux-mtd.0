Received: from eu1sys200aog107.obsmtp.com ([207.126.144.123])
 by merlin.infradead.org with smtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SlZfm-00068v-Cq
 for linux-mtd@lists.infradead.org; Mon, 02 Jul 2012 05:59:52 +0000
From: Shiraz Hashim <shiraz.hashim@st.com>
To: <dwmw2@infradead.org>, <viresh.linux@gmail.com>
Subject: [PATCH 2/3] mtd/spear_smi: clear status register on init
Date: Mon, 2 Jul 2012 11:28:46 +0530
Message-ID: <1341208727-22476-2-git-send-email-shiraz.hashim@st.com>
In-Reply-To: <1341208727-22476-1-git-send-email-shiraz.hashim@st.com>
References: <1341208727-22476-1-git-send-email-shiraz.hashim@st.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Cc: Shiraz Hashim <shiraz.hashim@st.com>,
 spear--sw-devel@lists.codex.cro.st.com, sr@denx.de,
 linux-mtd@lists.infradead.org, spear-devel@list.st.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

It was observed that sometimes smi returned errors while resume from
suspend.

For safety reasons clear status register for any errors during init. In
absence of it smi can return failures during command transmissions.

Signed-off-by: Shiraz Hashim <shiraz.hashim@st.com>
---
 drivers/mtd/devices/spear_smi.c |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/devices/spear_smi.c b/drivers/mtd/devices/spear_smi.c
index cffd36a..aec941e 100644
--- a/drivers/mtd/devices/spear_smi.c
+++ b/drivers/mtd/devices/spear_smi.c
@@ -336,6 +336,9 @@ static void spear_smi_hw_init(struct spear_smi *dev)
 	val = HOLD1 | BANK_EN | DSEL_TIME | (prescale << 8);
 
 	mutex_lock(&dev->lock);
+	/* clear all interrupt conditions */
+	writel(0, dev->io_base + SMI_SR);
+
 	writel(val, dev->io_base + SMI_CR1);
 	mutex_unlock(&dev->lock);
 }
-- 
1.7.10
