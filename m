Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C01C0E69E81
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Dec 2024 18:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bhjntR4U8ofO+GRtU0rlehoVcCFrSsdQC/q0Nb1s6y8=; b=2ntSkFVkpgzBR+
	Xt2yVep4mG05y7Fjf9A42uJPntsQ1c4++YutOLK5zAsjjLQvlFhwosHyOtBfBB2Ds+filavOyYMn1
	KHnT64yEWiCsoU9fy9xqbYUjLiKp+JI251iDjjLMuT19P3Z/XFa/6fD6j7GWfJd/mDw2ANlnkYg83
	tjXdcnS/xFbptOHOBtmGKHn/X8OEj3bXb75Nz3Ddf/8ReO6zklc/rkU8qCGa3FPUk0QIqCvshihm8
	KjkQmxZIAXmO9AiRo0aEktFpN34vr+0nrUxNvENovj7QO0PtL4W5A6XOBIpVTaBxoDrfqBgugLoGf
	cbJQciznyXrM5IKkDb2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIBdO-00000007DoO-12gp;
	Mon, 02 Dec 2024 18:59:02 +0000
Received: from 6.mo581.mail-out.ovh.net ([188.165.39.218])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIBdK-00000007DlQ-1qYo
	for linux-mtd@lists.infradead.org;
	Mon, 02 Dec 2024 18:59:01 +0000
Received: from director1.ghost.mail-out.ovh.net (unknown [10.109.140.140])
	by mo581.mail-out.ovh.net (Postfix) with ESMTP id 4Y2Ck503PFz161n
	for <linux-mtd@lists.infradead.org>; Mon,  2 Dec 2024 18:58:52 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-ln8kv (unknown [10.110.118.225])
	by director1.ghost.mail-out.ovh.net (Postfix) with ESMTPS id EEB901FE81;
	Mon,  2 Dec 2024 18:58:45 +0000 (UTC)
Received: from m-works.net ([37.59.142.96])
	by ghost-submission-5b5ff79f4f-ln8kv with ESMTPSA
	id mdOGGGQDTmdm+gQAV4R+eg
	(envelope-from <maciej.andrzejewski@m-works.net>); Mon, 02 Dec 2024 18:58:45 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-96R001ebaaddfa-eb1b-4ccb-8d56-a0458c20088b,
                    DE6D832DDBDA3FA72CB6D216D7E0250F806B8FD2) smtp.auth=maciej.andrzejewski@m-works.net
X-OVh-ClientIp: 213.134.183.231
Date: Mon, 2 Dec 2024 19:58:36 +0100
From: Maciej Andrzejewski <maciej.andrzejewski@m-works.net>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Michal Simek <michal.simek@amd.com>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Punnaiah Choudary Kalluri <punnaia@xilinx.com>,
	linux-mtd@lists.infradead.org
Subject: [PATCH v2] mtd: rawnand: arasan: Fix missing de-registration of NAND
Message-ID: <Z04DXNytjhFWuGFv@UBUNTU-PF54DSY0>
MIME-Version: 1.0
Content-Disposition: inline
X-Ovh-Tracer-Id: 246572080552450925
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefuddrheelgdduudejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfggtggusehttdertddttddvnecuhfhrohhmpeforggtihgvjhcutehnughriigvjhgvfihskhhiuceomhgrtghivghjrdgrnhgurhiivghjvgifshhkihesmhdqfihorhhkshdrnhgvtheqnecuggftrfgrthhtvghrnhepgeekhfduieektdegueevteejhfeukeegvddvteehjeelgfffudefheejtdduueetnecukfhppeduvdejrddtrddtrddupddvudefrddufeegrddukeefrddvfedupdefjedrheelrddugedvrdelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepmhgrtghivghjrdgrnhgurhiivghjvgifshhkihesmhdqfihorhhkshdrnhgvthdpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdhmthgusehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdfovfetjfhoshhtpehmohehkedumgdpmhhouggvpehsmhhtphhouhht
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_105858_625606_173FDDE5 
X-CRM114-Status: GOOD (  12.36  )
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

The NAND chip-selects are registered for the Arasan driver during
initialization but are not de-registered when the driver is unloaded. As a
result, if the driver is loaded again, the chip-selects remain registered
and busy, making them unavailable for use.

Fixes: 197b88fecc50 ("mtd: rawnand: arasan: Add new Arasan NAND controller")
Cc: stable@vger.kernel.org
Signed-off-by: Maciej Andrzejewski ICEYE <maciej.andrzejewski@m-works.net>
---
 drivers/mtd/nand/raw/arasan-nand-controller.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/mtd/nand/raw/arasan-nand-controller.c b/drivers/mtd/nand/raw/arasan-nand-controller.c
index 5436ec4a8fde..36c23fa186f2 100644
--- a/drivers/mtd/nand/raw/arasan-nand-controller.c
+++ b/drivers/mtd/nand/raw/arasan-nand-controller.c
@@ -1478,8 +1478,15 @@ static int anfc_probe(struct platform_device *pdev)
 
 static void anfc_remove(struct platform_device *pdev)
 {
+	int i;
 	struct arasan_nfc *nfc = platform_get_drvdata(pdev);
 
+	for (i = 0; i < nfc->ncs; i++) {
+		if (nfc->cs_array[i]) {
+			gpiod_put(nfc->cs_array[i]);
+		}
+	}
+
 	anfc_chips_cleanup(nfc);
 }

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
