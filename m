Received: from mail-pw0-f49.google.com ([209.85.160.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QSJZt-0005n9-5J
	for linux-mtd@lists.infradead.org; Fri, 03 Jun 2011 01:53:33 +0000
Received: by pwi8 with SMTP id 8so1073170pwi.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 02 Jun 2011 18:53:30 -0700 (PDT)
Subject: [PATCH 2/2] mtd: nomadik_nand: add missing nand_release in
	nomadik_nand_remove
From: Axel Lin <axel.lin@gmail.com>
To: linux-kernel@vger.kernel.org
In-Reply-To: <1307065913.10001.2.camel@phoenix>
References: <1307065913.10001.2.camel@phoenix>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 03 Jun 2011 09:53:26 +0800
Message-ID: <1307066006.10001.4.camel@phoenix>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
	Sachin Verma <sachin.verma@st.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Axel Lin <axel.lin@gmail.com>
---
 drivers/mtd/nand/nomadik_nand.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/nand/nomadik_nand.c b/drivers/mtd/nand/nomadik_nand.c
index b6a5c86..b463ecf 100644
--- a/drivers/mtd/nand/nomadik_nand.c
+++ b/drivers/mtd/nand/nomadik_nand.c
@@ -187,6 +187,7 @@ static int nomadik_nand_remove(struct platform_device *pdev)
 		pdata->exit();
 
 	if (host) {
+		nand_release(&host->mtd);
 		iounmap(host->cmd_va);
 		iounmap(host->data_va);
 		iounmap(host->addr_va);
-- 
1.7.4.1
