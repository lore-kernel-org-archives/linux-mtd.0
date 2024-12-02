Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7118ED7831B
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Dec 2024 13:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uZ7agdHZtArfxPRyOkja33yidZ4WY3DCelurpr7bvtY=; b=lAFCIrj+1dUj8o
	E1vIofUumCKgX3FYxn/PC2yJrJihbmDntj/CgD+WhcE+itsMJh/a9UCJ5M/ur+DC49JvEJdw+h861
	dLK7R2NY/jb5FiyB78PmxJrdNiKZ7ZFEuNqXi+CsYU+TeiM2HzIRhC/b8XWfmEQzraPc36wM1OkQR
	0Fk2nOeo3h5twwudG70+cl6toDeT5kUwi8oZbEarZ8o1Y21qGj80W29judDJUQQRMNhAc/YazOxUt
	go2qviSU6vQxBnPVkE1Q6HttPObLDXRbAX6kYZw2Q1RurJo15X8qfMB8tYzWffWDavEhtSlK+ZJhQ
	G3Sji50wIaD3UycqWWVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI6RO-00000006EhC-4AXt;
	Mon, 02 Dec 2024 13:26:18 +0000
Received: from 8.mo581.mail-out.ovh.net ([46.105.77.114])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI6RL-00000006EgF-3KPL
	for linux-mtd@lists.infradead.org;
	Mon, 02 Dec 2024 13:26:17 +0000
Received: from director2.ghost.mail-out.ovh.net (unknown [10.108.25.209])
	by mo581.mail-out.ovh.net (Postfix) with ESMTP id 4Y24LB4Rh3z1Lv0
	for <linux-mtd@lists.infradead.org>; Mon,  2 Dec 2024 13:26:10 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-5vn4n (unknown [10.110.178.72])
	by director2.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 0894A1FD2C;
	Mon,  2 Dec 2024 13:26:07 +0000 (UTC)
Received: from m-works.net ([37.59.142.105])
	by ghost-submission-5b5ff79f4f-5vn4n with ESMTPSA
	id filTNG+1TWcDLAAAhXEWfw
	(envelope-from <maciej.andrzejewski@m-works.net>); Mon, 02 Dec 2024 13:26:07 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-105G00629d06cfe-a6f9-4889-a962-520b03c9895d,
                    DE6D832DDBDA3FA72CB6D216D7E0250F806B8FD2) smtp.auth=maciej.andrzejewski@m-works.net
X-OVh-ClientIp: 213.134.174.59
Date: Mon, 2 Dec 2024 14:25:59 +0100
From: Maciej Andrzejewski <maciej.andrzejewski@m-works.net>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Michal Simek <michal.simek@amd.com>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Punnaiah Choudary Kalluri <punnaia@xilinx.com>,
	linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: rawnand: arasan: Fix missing de-registration of NAND
 chip-selects
Message-ID: <Z021Z-cFOJ-Vw3ud@UBUNTU-PF54DSY0>
MIME-Version: 1.0
Content-Disposition: inline
X-Ovh-Tracer-Id: 13074512670576122733
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefuddrheelgdehtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkgggtugesthdtredttddtvdenucfhrhhomhepofgrtghivghjucetnhgurhiivghjvgifshhkihcuoehmrggtihgvjhdrrghnughriigvjhgvfihskhhisehmqdifohhrkhhsrdhnvghtqeenucggtffrrghtthgvrhhnpeegkefhudeikedtgeeuveetjefhueekgedvvdetheejlefgffdufeehjedtudeuteenucfkphepuddvjedrtddrtddruddpvddufedrudefgedrudejgedrheelpdefjedrheelrddugedvrddutdehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpehmrggtihgvjhdrrghnughriigvjhgvfihskhhisehmqdifohhrkhhsrdhnvghtpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdpoffvtefjohhsthepmhhoheekudgmpdhmohguvgepshhmthhpohhuth
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_052615_980881_EEABA2BA 
X-CRM114-Status: GOOD (  12.03  )
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

Fixes: 197b88fecc50ee3c7a22415db81eae0b9126f20e ("mtd: rawnand: arasan: Add new Arasan NAND controller")
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
