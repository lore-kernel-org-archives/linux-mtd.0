Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46099D149C5
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Oct 2024 16:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bqukSPhU+tyw286zeCFErCp23Zwf+L452PtECo2Jw7M=; b=u7bXEq0Lw86DEK
	yqe2WmlHr8NxnhKrre4niCazMojOyIEvz8F7HRXJD9jMrqb6K71tN1gS6ZMUYapo/j49PVzoeZVPE
	F5T+oiMCJVFOJ7NVggYOhfr6Vj6m3UA/b4wgrfNUAs6r3hG/JGQUqYLSSgr5V73h3tAEWDlQkLhAo
	sh8h/c+h/E88/9zmr8n7i5sxOG5R1k/Q2/U9hznAY1v1zm7xHoILgOi6eDLBSuU5IOniLdI4gX+ot
	3fBA3ySwPJevHhw5BYJ1sUP611gP8F+gG2WEk61QF1IM4XA1gby4UCSh1hpBbuHGZeOIHA2RqPOE3
	OABo9SB/hT2Rdx+Kf1/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4N3U-00000004PCx-12ay;
	Fri, 25 Oct 2024 16:20:52 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4My4-00000004NdS-1ZjV
	for linux-mtd@lists.infradead.org;
	Fri, 25 Oct 2024 16:15:18 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id BDF9BE000A;
	Fri, 25 Oct 2024 16:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1729872914;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C/FGEdYvu05llZNXxM7T7Gat6kFm2S1ba/ZknoEvKek=;
	b=ZMZDmxvbAo09mLuKP+Ifnwqn2g7ca6zUmET2x1WI/a+pikpEk1rhJGvjUsClEJz47lXYWR
	0HcsBcd/2ufoi8cD9uQhY3CFOGC6xe059dl3Ir081vlob8jORnHuP2XQsZvahe69E95WAt
	gw86k6BahhWkZ9aX3vVjNjLKca+1gYB6LczQYP7tw+zt3YSgfoV3TKtN0NTVFi36xFGyla
	IeRdO//PjCmxeNDkGVFKYJhcVvwP53vzaafLjA2dfsAL6WgHJDbM/JuLdZPIlGMuPWIhrW
	vxDNRbJFjlY0n2fk1abO8KrISJhPCQsMad5O0sfF+vKf5eLZqlEiHxyWrp17ew==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>
Cc: Mark Brown <broonie@kernel.org>,
	<linux-spi@vger.kernel.org>,
	Steam Lin <stlin2@winbond.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Sanjay R Mehta <sanju.mehta@amd.com>,
	Han Xu <han.xu@nxp.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Haibo Chen <haibo.chen@nxp.com>,
	Yogesh Gaur <yogeshgaur.83@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Michal Simek <michal.simek@amd.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 10/24] spi: mxic: Support per spi-mem operation frequency switches
Date: Fri, 25 Oct 2024 18:14:47 +0200
Message-ID: <20241025161501.485684-11-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241025161501.485684-1-miquel.raynal@bootlin.com>
References: <20241025161501.485684-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_091516_697093_24F5689B 
X-CRM114-Status: GOOD (  12.15  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Every ->exec_op() call correctly configures the spi bus speed to the
maximum allowed frequency for the memory using the constant spi default
parameter. Since we can now have per-operation constraints, let's use
the value that comes from the spi-mem operation structure instead. In
case there is no specific limitation for this operation, the default spi
device value will be given anyway.

The per-operation frequency capability is thus advertised to the spi-mem
core.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/spi/spi-mxic.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-mxic.c b/drivers/spi/spi-mxic.c
index 6156d691630a..49a5833ca744 100644
--- a/drivers/spi/spi-mxic.c
+++ b/drivers/spi/spi-mxic.c
@@ -514,7 +514,7 @@ static int mxic_spi_mem_exec_op(struct spi_mem *mem,
 	int i, ret;
 	u8 addr[8], cmd[2];
 
-	ret = mxic_spi_set_freq(mxic, mem->spi->max_speed_hz);
+	ret = mxic_spi_set_freq(mxic, op->max_freq);
 	if (ret)
 		return ret;
 
@@ -573,6 +573,7 @@ static const struct spi_controller_mem_ops mxic_spi_mem_ops = {
 static const struct spi_controller_mem_caps mxic_spi_mem_caps = {
 	.dtr = true,
 	.ecc = true,
+	.per_op_freq = true,
 };
 
 static void mxic_spi_set_cs(struct spi_device *spi, bool lvl)
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
