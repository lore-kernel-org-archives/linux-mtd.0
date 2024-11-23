Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D287BD75E5D
	for <linux-mtd@archiver.kernel.org>; Sat, 23 Nov 2024 19:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ekOdC1gJg6Q9iSuElFJzTPN6NSDP51rPPqrIJ/USe8I=; b=D4CyAFj71xVIBG
	/3DOCMwUuKJIXQkd9CNzlo4lVTyMJw3Il0I3hdY7D1XP3gy7I+o0mzUVOOt4EmwL5smnfyjovzTy5
	f0fWTGYif8se2EZ+vc/HUeZ9xEkTW39X8lp0A288umWXSFFCfzMqzvMLTefDbMiap7KCq1+NZVrjS
	wlRoc4J/HbjKXXurVEHI/OMUwTnxXEe7DFbQBieepcfEHKj9oqxrSg9KK/NEKWc6vA4J/OAlPL5LE
	futZQaizrJLARP5fk1etz3ZpwTtqn2HA4xZCsyz2iAf5rONqb2Hi1maCDQA4OgNTqWflQWCbA+ath
	3OTxBp8EX6tAGI3EKDQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEvgX-00000004lkl-0v1J;
	Sat, 23 Nov 2024 19:20:49 +0000
Received: from 12.mo583.mail-out.ovh.net ([46.105.39.65])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEvgR-00000004lk0-31Hv
	for linux-mtd@lists.infradead.org;
	Sat, 23 Nov 2024 19:20:45 +0000
Received: from director2.ghost.mail-out.ovh.net (unknown [10.109.140.100])
	by mo583.mail-out.ovh.net (Postfix) with ESMTP id 4Xwhd86GpTz1QVP
	for <linux-mtd@lists.infradead.org>; Sat, 23 Nov 2024 19:20:28 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-j8lkq (unknown [10.108.42.70])
	by director2.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 53EC31FE2C;
	Sat, 23 Nov 2024 19:20:23 +0000 (UTC)
Received: from m-works.net ([37.59.142.105])
	by ghost-submission-5b5ff79f4f-j8lkq with ESMTPSA
	id z/usAfcqQmeeODcABgfSDw
	(envelope-from <maciej.andrzejewski@m-works.net>); Sat, 23 Nov 2024 19:20:23 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-105G006ed8e0a1e-0520-4031-bb7b-8a826f93ac2d,
                    A2CC732B28D87AD227CB10E8B904B16C30503A07) smtp.auth=maciej.andrzejewski@m-works.net
X-OVh-ClientIp: 213.134.183.231
Date: Sat, 23 Nov 2024 20:20:21 +0100
From: Maciej Andrzejewski <maciej.andrzejewski@m-works.net>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Michal Simek <michal.simek@amd.com>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Punnaiah Choudary Kalluri <punnaia@xilinx.com>,
	Naga Sureshkumar Relli <nagasure@xilinx.com>,
	linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: rawnand: arasan: Fix double assertion of chip-select
Message-ID: <Z0Iq9ex25MkwC_Cm@UBUNTU-PF54DSY0>
MIME-Version: 1.0
Content-Disposition: inline
X-Ovh-Tracer-Id: 3097350645036850029
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefuddrgedugdduvdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfggtggusehttdertddttddvnecuhfhrohhmpeforggtihgvjhcutehnughriigvjhgvfihskhhiuceomhgrtghivghjrdgrnhgurhiivghjvgifshhkihesmhdqfihorhhkshdrnhgvtheqnecuggftrfgrthhtvghrnhepgeekhfduieektdegueevteejhfeukeegvddvteehjeelgfffudefheejtdduueetnecukfhppeduvdejrddtrddtrddupddvudefrddufeegrddukeefrddvfedupdefjedrheelrddugedvrddutdehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpehmrggtihgvjhdrrghnughriigvjhgvfihskhhisehmqdifohhrkhhsrdhnvghtpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdpoffvtefjohhsthepmhhoheekfegmpdhmohguvgepshhmthhpohhuth
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241123_112044_061313_0FF1719A 
X-CRM114-Status: GOOD (  14.40  )
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
