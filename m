Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BAA5C433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Dec 2021 14:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aybzs5tvkqptt1AXv3/zUQa8a+uIW9t/2nul7HdHPag=; b=juvc5wVEePEeYf
	EmPPJD+pRiqCty51/FjwwIkelsk+8LruxuM/Hmn8f40EPzAHJ/O/EECeJHqbR0FlFU0txAUcN+deV
	IoNC6lxR7JHrjVUA5va+/kYPBY8kGxlRIlcj43pI6YAejRh/keAsYA1ZtXnnKZRUQxcUQAn4xGDep
	qUfM2InflmYIkjpZ4NmkWZVssOCVVbplr0E57732EQNUf/Q7xgQmLT3TbINF75fWdhHv4v+Lf2xpp
	iTG0cCI3ADgvBUIBJY9V755xahzocJ1XM8XYEwxLLBw8cYAzr+c8VNRQ6n4OE+mvRRq2J22MVTEmU
	bi8ECKIuwkj/9i6JD2+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n2a1h-002xht-QV; Wed, 29 Dec 2021 14:34:01 +0000
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n2a1V-002xgc-Eq; Wed, 29 Dec 2021 14:33:51 +0000
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.west.internal (Postfix) with ESMTP id DAA342B0009C;
 Wed, 29 Dec 2021 09:33:40 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Wed, 29 Dec 2021 09:33:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm3; bh=EHjpGtshIGgIZ7uZEVdFJh9MDO
 ucPBHcIEoU2Ex0JjI=; b=u1uYJPYLLbM0vrsBqQ0P1MpsVLDFreUpgrFFa6pGuD
 3na44+jcWJJnA1EjEcLFB8AqwY4pYZthRcbmdGXXoxlgn2OSNDfua/2CHFbe6AiR
 VNWJgPUFyEgl38nb9bbKU9r7N/2eaet+o+xA3iwd1hVgGJU/eSCSrEpq55XdC67j
 BZ9gKc6atHp9+i1VzVVaT1N0LSiZ4Yw3/kR/aqSoMeFJ1ACNeb7Py4e+6mbckE7t
 VOfIelvutzgvwxL74arTQTrN+vy3NO4uQemR2op8XhvEoyxBkKYtq+b8ir8gS10m
 2AFMUjZY1UzCq8eTvqDgq+xoZkjCL2xR9gqMSgtJKbJw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=EHjpGtshIGgIZ7uZE
 VdFJh9MDOucPBHcIEoU2Ex0JjI=; b=H8vf7lCrVtO1ZAkyK8EjURMYAFQpLx2Wg
 YY2tk6owmyenJRatyZNykOHFUeGVl/38fZk533jSWBnZeMtqN/3XY0aqkFh+EhXI
 G/aAPgXJul7rzrrx7XggG8FmBQoZ6TJQ8KH61C8vhf6gego5dA7hOt6b8nae47lU
 iVMZeMV1jv2gVVhvxJJKZFjhPtwLB7Fu4SOxV74/IKENGLB9+2mEBvzKS2sTCOqL
 6WU24xU3cNkAt75vGgo23hvZcOWqHV6Tf/XjXvjal+F/G1NpVCkmPqk+Ltfo0wuG
 e1PJ3NlXOVWQTLry3F3fP77pNrYoWF1LVgKf9zpSlkt3R7TzXWuDA==
X-ME-Sender: <xms:w3HMYa9TzpFFU_t7blDTwhbvIGrcwbFYm_12VPHfXl1elFo601nu-Q>
 <xme:w3HMYav3UqPVp6MmeWDi52uAzz6gGHOB76gIFt9Z6GMCTUnnkJhGt03NfSlqFXErQ
 fFpuqXxi72436dTf44>
X-ME-Received: <xmr:w3HMYQBu26dnGil1Z0YwSXGp3XHkoAi440OA-J0uMpWZYLKfc9PSeAiEI-T0hVrQ97Ddb30x7w24LMQrPw00GM8EZ5BklLyL9iQ3AQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddruddvuddgieejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdljedtmdenucfjughrpefhvffufffkofgggfestdekredtredttden
 ucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhesshhtfi
 gtgidrgiihiieqnecuggftrfgrthhtvghrnheptdeludegheejteelheduudegkeehleet
 feekiedtfefgleeifeelhefgveejhfffnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
 hrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:w3HMYSdCJUpjxy3XzmEa16coIpp63dscgZTcBXj4H2DiAHkj9hrKug>
 <xmx:w3HMYfP4gxXspuQ4DMrBuHf-_bY3nS7oJpGIe61Bsye9_6JplhcwmQ>
 <xmx:w3HMYcntxXV9wMlAlLg8Z1wbnm1BxhQ3kMwo7Yt0JSkHEOL1beLlVQ>
 <xmx:xHHMYTkjIFOxyexfq-LnrNz_ups8-ct2K6Xc81bOGUmYmGa_FdnqL0JIX00>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 29 Dec 2021 09:33:38 -0500 (EST)
From: Patrick Williams <patrick@stwcx.xyz>
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Michael Walle <michael@walle.cc>, Pratyush Yadav <p.yadav@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
Cc: Potin Lai <potin.lai@quantatw.com>, Patrick Williams <patrick@stwcx.xyz>,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: aspeed-smc: improve probe resilience
Date: Wed, 29 Dec 2021 08:33:33 -0600
Message-Id: <20211229143334.297305-1-patrick@stwcx.xyz>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211229_063349_550538_CDD0765F 
X-CRM114-Status: GOOD (  18.96  )
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

The aspeed-smc can have multiple SPI devices attached to it in the
device tree.  If one of the devices is missing or failing the entire
probe will fail and all MTD devices under the controller will be
removed.  On OpenBMC this results in a kernel panic due to missing
rootfs:

[    0.538774] aspeed-smc 1e620000.spi: Using 50 MHz SPI frequency
[    0.540471] aspeed-smc 1e620000.spi: w25q01jv-iq (131072 Kbytes)
[    0.540750] aspeed-smc 1e620000.spi: CE0 window [ 0x20000000 - 0x28000000 ] 128MB
[    0.540943] aspeed-smc 1e620000.spi: CE1 window [ 0x28000000 - 0x2c000000 ] 64MB
[    0.541143] aspeed-smc 1e620000.spi: read control register: 203b0041
[    0.581442] 5 fixed-partitions partitions found on MTD device bmc
[    0.581625] Creating 5 MTD partitions on "bmc":
[    0.581854] 0x000000000000-0x0000000e0000 : "u-boot"
[    0.584472] 0x0000000e0000-0x000000100000 : "u-boot-env"
[    0.586468] 0x000000100000-0x000000a00000 : "kernel"
[    0.588465] 0x000000a00000-0x000006000000 : "rofs"
[    0.590552] 0x000006000000-0x000008000000 : "rwfs"
[    0.592605] aspeed-smc 1e620000.spi: Using 50 MHz SPI frequency
[    0.592801] aspeed-smc 1e620000.spi: unrecognized JEDEC id bytes: 00 00 00 00 00 00
[    0.593039] Deleting MTD partitions on "bmc":
[    0.593175] Deleting u-boot MTD partition
[    0.637929] Deleting u-boot-env MTD partition
[    0.829527] Deleting kernel MTD partition
[    0.856902] Freeing initrd memory: 1032K
[    0.866428] Deleting rofs MTD partition
[    0.906264] Deleting rwfs MTD partition
[    0.986628] aspeed-smc 1e620000.spi: Aspeed SMC probe failed -2
[    0.986929] aspeed-smc: probe of 1e620000.spi failed with error -2
...
[    2.936719] /dev/mtdblock: Can't open blockdev
mount: mounting /dev/mtdblock on run/initramfs/ro failed: No such file or directory
[    2.963030] MTD: Couldn't look up '/dev/mtdblock': -2
mount: mounting /dev/mtdblock on run/initramfs/rw failed: No such file or directory

Mounting read-write /dev/mtdblock filesystem failed.  Please fix and run
	mount /dev/mtdblock run/initramfs/rw -t jffs2 -o rw
or perform a factory reset with the clean-rwfs-filesystem option.
Fatal error, triggering kernel panic!
[    3.013047] Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000100

Many BMC designs have two flash chips so that they can handle a hardware
failure of one of them.  If one chip failed, it doesn't do any good to
have redundancy if they all get removed anyhow.

Improve the resilience of the probe function to handle one of the
children being missing or failed.  Only in the case where all children
fail to probe should the controller be failed out.

Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
---
 drivers/mtd/spi-nor/controllers/aspeed-smc.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/controllers/aspeed-smc.c b/drivers/mtd/spi-nor/controllers/aspeed-smc.c
index 7225870e8b18..acfe010f9dd7 100644
--- a/drivers/mtd/spi-nor/controllers/aspeed-smc.c
+++ b/drivers/mtd/spi-nor/controllers/aspeed-smc.c
@@ -769,6 +769,7 @@ static int aspeed_smc_setup_flash(struct aspeed_smc_controller *controller,
 	struct device_node *child;
 	unsigned int cs;
 	int ret = -ENODEV;
+	bool found_one = false;
 
 	for_each_available_child_of_node(np, child) {
 		struct aspeed_smc_chip *chip;
@@ -827,8 +828,17 @@ static int aspeed_smc_setup_flash(struct aspeed_smc_controller *controller,
 		 * by of property.
 		 */
 		ret = spi_nor_scan(nor, NULL, &hwcaps);
-		if (ret)
-			break;
+		/*
+		 * If we fail to scan the device it might not be present or
+		 * broken.  Don't fail the whole controller if others work.
+		 */
+		if (ret) {
+			if (found_one)
+				ret = 0;
+
+			devm_kfree(controller->dev, chip);
+			continue;
+		}
 
 		ret = aspeed_smc_chip_setup_finish(chip);
 		if (ret)
@@ -839,6 +849,7 @@ static int aspeed_smc_setup_flash(struct aspeed_smc_controller *controller,
 			break;
 
 		controller->chips[cs] = chip;
+		found_one = true;
 	}
 
 	if (ret) {
-- 
2.32.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
