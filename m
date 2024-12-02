Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B700DD78318
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Dec 2024 12:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XZJ8i69VtvZKKFw4ytGC2FWcK4I+i3/eCjHzVNwAxm4=; b=tTc4TydTj3nLy/
	PdVv7vBJ4aheu/VY6XNfAcPu9D3Y38HPMY9igoVVwr95HVFIESc1DC3rcxaoJnCAXd3r6jmUXqcUm
	WqJOoj2KQ9KOjSeowrmHym/Orc9TmhFNok+A7R/i5nLGLxl3Mdqiys9ucpC3KVDhRi8lElfOk4c54
	ZJ6v3oZFRlPSmdVktigKUFjuw+94Jg+Yrr5EZ1ko3Ead+GYSq7RTit2jJpZ2sjLvR/KEU+Mn30H58
	gWbFiE1PNYHCWkifkigRe7LiHwrjVwQXeFpBXUzOAOMszhrIxSEp5yHQpkvE8C6Fij3ddwjlVCuBE
	JrC85QLf197mrKrAdx0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI5tk-000000068jY-1Uim;
	Mon, 02 Dec 2024 12:51:32 +0000
Received: from 2.mo575.mail-out.ovh.net ([46.105.52.162])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI5tg-000000068h4-2dZG
	for linux-mtd@lists.infradead.org;
	Mon, 02 Dec 2024 12:51:30 +0000
Received: from director9.ghost.mail-out.ovh.net (unknown [10.108.17.174])
	by mo575.mail-out.ovh.net (Postfix) with ESMTP id 4Y23Yv3G8dz1grD
	for <linux-mtd@lists.infradead.org>; Mon,  2 Dec 2024 12:51:15 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-vxvmj (unknown [10.110.113.35])
	by director9.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 82D071FD10;
	Mon,  2 Dec 2024 12:51:09 +0000 (UTC)
Received: from m-works.net ([37.59.142.109])
	by ghost-submission-5b5ff79f4f-vxvmj with ESMTPSA
	id FmzCFT2tTWdsuwAA5246bg
	(envelope-from <maciej.andrzejewski@m-works.net>); Mon, 02 Dec 2024 12:51:09 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-109S0032ce13fda-7214-44a4-952b-21eca2b7c506,
                    DE6D832DDBDA3FA72CB6D216D7E0250F806B8FD2) smtp.auth=maciej.andrzejewski@m-works.net
X-OVh-ClientIp: 213.134.174.59
Date: Mon, 2 Dec 2024 13:51:07 +0100
From: Maciej Andrzejewski <maciej.andrzejewski@m-works.net>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Michal Simek <michal.simek@amd.com>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Punnaiah Choudary Kalluri <punnaia@xilinx.com>,
	linux-mtd@lists.infradead.org
Subject: [PATCH v3] mtd: rawnand: arasan: Fix double assertion of chip-select
Message-ID: <Z02tOwEHfDsH1Sil@UBUNTU-PF54DSY0>
MIME-Version: 1.0
Content-Disposition: inline
X-Ovh-Tracer-Id: 12484822594449021805
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefuddrheelgdeggecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkgggtugesthdtredttddtvdenucfhrhhomhepofgrtghivghjucetnhgurhiivghjvgifshhkihcuoehmrggtihgvjhdrrghnughriigvjhgvfihskhhisehmqdifohhrkhhsrdhnvghtqeenucggtffrrghtthgvrhhnpeegkefhudeikedtgeeuveetjefhueekgedvvdetheejlefgffdufeehjedtudeuteenucfkphepuddvjedrtddrtddruddpvddufedrudefgedrudejgedrheelpdefjedrheelrddugedvrddutdelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpehmrggtihgvjhdrrghnughriigvjhgvfihskhhisehmqdifohhrkhhsrdhnvghtpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdpoffvtefjohhsthepmhhoheejhegmpdhmohguvgepshhmthhpohhuth
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_045128_964558_84000A17 
X-CRM114-Status: GOOD (  15.22  )
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
