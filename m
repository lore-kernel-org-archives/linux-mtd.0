Received: from mail.linuxfoundation.org ([140.211.169.12])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X0wml-0006Bk-GR
 for linux-mtd@lists.infradead.org; Sat, 28 Jun 2014 17:51:35 +0000
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 3.15 012/139] staging/mt29f_spinand: Terminate of match table
Date: Sat, 28 Jun 2014 10:46:13 -0700
Message-Id: <20140628174605.931829574@linuxfoundation.org>
In-Reply-To: <20140628174605.352098823@linuxfoundation.org>
References: <20140628174605.352098823@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: Kamlakant Patel <kamlakant.patel@broadcom.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Stephen Boyd <sboyd@codeaurora.org>, stable@vger.kernel.org,
 linux-mtd@lists.infradead.org, Mona Anonuevo <manonuevo@micron.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

3.15-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Stephen Boyd <sboyd@codeaurora.org>

commit ffd07de65ef5315053ea16356cd533b7f47c17e9 upstream.

Failure to terminate this match table can lead to boot failures
depending on where the compiler places the match table.

Cc: Kamlakant Patel <kamlakant.patel@broadcom.com>
Cc: Mona Anonuevo <manonuevo@micron.com>
Cc: linux-mtd@lists.infradead.org
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

---
 drivers/staging/mt29f_spinand/mt29f_spinand.c |    1 +
 1 file changed, 1 insertion(+)

--- a/drivers/staging/mt29f_spinand/mt29f_spinand.c
+++ b/drivers/staging/mt29f_spinand/mt29f_spinand.c
@@ -924,6 +924,7 @@ static int spinand_remove(struct spi_dev
 
 static const struct of_device_id spinand_dt[] = {
 	{ .compatible = "spinand,mt29f", },
+	{}
 };
 
 /*
