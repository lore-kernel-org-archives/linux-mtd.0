Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 506B6D10C10
	for <linux-mtd@archiver.kernel.org>; Sun, 24 Nov 2024 16:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3caucCYECKOsGkIWSokyLNvDSx04X+ly5RWmsscM4CY=; b=iOiAy1iuB5Oc1y
	hfxtYDZYChb6p1TA9QmKkCZjR6XJ1IuSS5ZbH8+bcpiLO2xb5fEi/btAOk6BLwucFBHJKO89Ltxm6
	fM8CrhHPxwZCqIg68/CswGigkx1ZWKDH4P+dpnSZLMd6/v48F/KyIrYK1LapOMNzvGRW680qhtCOE
	uva661WU4y2RjH1dT6vY1FHhKKtN8So+pI7177p6EnGPXsx3zUsnSsBK5l+JzXRmYlb6Ygjtj+mEV
	0qXqppMgJH+U5wKlTUGRaXwCFVQ/T9p5KiALj5+w2P9V8rE7ZQmyREqAb5vaVCbOX93eJwfwsKGHn
	puuFU5nNWyJct4qIkqmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFFXa-00000006Lde-3l1o;
	Sun, 24 Nov 2024 16:32:54 +0000
Received: from 8.mo560.mail-out.ovh.net ([188.165.52.147])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFFXW-00000006Lci-30Oc
	for linux-mtd@lists.infradead.org;
	Sun, 24 Nov 2024 16:32:52 +0000
Received: from director10.ghost.mail-out.ovh.net (unknown [10.109.140.34])
	by mo560.mail-out.ovh.net (Postfix) with ESMTP id 4XxDs92dsBz1ZPZ
	for <linux-mtd@lists.infradead.org>; Sun, 24 Nov 2024 16:32:45 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-cht2b (unknown [10.110.101.126])
	by director10.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 7BB311FD18;
	Sun, 24 Nov 2024 16:32:43 +0000 (UTC)
Received: from m-works.net ([37.59.142.101])
	by ghost-submission-5b5ff79f4f-cht2b with ESMTPSA
	id 8GsGFStVQ2d2oA4AnuQdBQ
	(envelope-from <maciej.andrzejewski@m-works.net>); Sun, 24 Nov 2024 16:32:43 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-101G004e94d0192-5974-4304-8854-6da1a4da1094,
                    C3ECB3D69BE23CE701DAF36A9768F3E3FFC1B624) smtp.auth=maciej.andrzejewski@m-works.net
X-OVh-ClientIp: 213.134.183.231
Date: Sun, 24 Nov 2024 17:32:40 +0100
From: Maciej Andrzejewski <maciej.andrzejewski@m-works.net>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Michal Simek <michal.simek@amd.com>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Punnaiah Choudary Kalluri <punnaia@xilinx.com>,
	Naga Sureshkumar Relli <nagasure@xilinx.com>,
	linux-mtd@lists.infradead.org
Subject: [PATCH v2] mtd: rawnand: arasan: Fix double assertion of chip-select
Message-ID: <Z0NVKDHUItOHZitv@UBUNTU-PF54DSY0>
MIME-Version: 1.0
Content-Disposition: inline
X-Ovh-Tracer-Id: 6137561871157140333
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefuddrgeefgdekkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkgggtugesthdtredttddtvdenucfhrhhomhepofgrtghivghjucetnhgurhiivghjvgifshhkihcuoehmrggtihgvjhdrrghnughriigvjhgvfihskhhisehmqdifohhrkhhsrdhnvghtqeenucggtffrrghtthgvrhhnpeegkefhudeikedtgeeuveetjefhueekgedvvdetheejlefgffdufeehjedtudeuteenucfkphepuddvjedrtddrtddruddpvddufedrudefgedrudekfedrvdefuddpfeejrdehledrudegvddruddtudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepmhgrtghivghjrdgrnhgurhiivghjvgifshhkihesmhdqfihorhhkshdrnhgvthdpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdhmthgusehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdfovfetjfhoshhtpehmohehiedtmgdpmhhouggvpehsmhhtphhouhht
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241124_083251_050949_57CA80F2 
X-CRM114-Status: GOOD (  14.92  )
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

When two chip-selects are configured in the device tree, and the second is
a non-native GPIO, both the GPIO-based chip-select and the first native
chip-select may be asserted simultaneously. This double assertion causes
incorrect read and write operations.

The issue occurs because when nfc->ncs <= 2, nfc->spare_cs is always
initialized to 0 due to static initialization. Consequently, when the
second chip-select (GPIO-based) is selected in anfc_assert_cs(), it is
detected by anfc_is_gpio_cs(), and nfc->native_cs is assigned the value 0.
This results in both the GPIO-based chip-select being asserted and the
NAND controller register receiving 0, erroneously selecting the native
chip-select.

This patch resolves the issue, as confirmed by oscilloscope testing with
configurations involving two or more chip-selects in the device tree.

Fixes: acbd3d0945f9 ("mtd: rawnand: arasan: Leverage additional GPIO CS")

Cc: stable@vger.kernel.org

Signed-off-by: Maciej Andrzejewski <maciej.andrzejewski@m-works.net>
---
 drivers/mtd/nand/raw/arasan-nand-controller.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/arasan-nand-controller.c b/drivers/mtd/nand/raw/arasan-nand-controller.c
index 5436ec4a8fde..7c97f421e382 100644
--- a/drivers/mtd/nand/raw/arasan-nand-controller.c
+++ b/drivers/mtd/nand/raw/arasan-nand-controller.c
@@ -1409,8 +1409,8 @@ static int anfc_parse_cs(struct arasan_nfc *nfc)
 	 * case, the "not" chosen CS is assigned to nfc->spare_cs and selected
 	 * whenever a GPIO CS must be asserted.
 	 */
-	if (nfc->cs_array && nfc->ncs > 2) {
-		if (!nfc->cs_array[0] && !nfc->cs_array[1]) {
+	if (nfc->cs_array) {
+		if (nfc->ncs > 2 && !nfc->cs_array[0] && !nfc->cs_array[1]) {
 			dev_err(nfc->dev,
 				"Assign a single native CS when using GPIOs\n");
 			return -EINVAL;


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
