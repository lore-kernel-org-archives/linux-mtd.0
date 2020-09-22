Return-Path: <SRS0=loyI=C7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1687C2D0E2
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Sep 2020 09:23:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 14E2F2075E
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Sep 2020 09:23:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="b7UcfVn7";
	dkim=temperror (0-bit key) header.d=fastmail.com.au header.i=@fastmail.com.au header.b="VSew1aLs";
	dkim=temperror (0-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="aIR6i0m7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 14E2F2075E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=johnthomson.fastmail.com.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lSSaTcaooRO71e93+tbzl6fBUGR0bv9jAGHN5YIfHAk=; b=b7UcfVn7BTr99md1ToSAGRh6Iy
	GANFXUdd+FNmOTsBUI40hJ5b8vX12Mr6gmPdAVUWhsj/VvtLLj9jKjBzF5TN3YvQnHOnMN8iO4a4K
	ZPQbMGzDKylSanjQ+D4AB5PueadS5EAb0pGgmW1KbYaK5V2RaPm1p5GEV36CUDno+UhHSWacHSI4G
	kKvJPNKzgoOnt/rz9u+wXkRTzULrIrXzsvCcQEClWnkmPwr+Vw91M+LpadgpDWsto+Gjhx4rM6sg/
	gBfSgtynhN69hbOkDIQclx5CiSVKY/bwAZWD4RLpeGiE5iLoEXaQ8JrNk9pu4an7phXEOVQBBXiaO
	qbHIRi0w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKeVN-0007Zf-Oo; Tue, 22 Sep 2020 09:22:33 +0000
Received: from wout2-smtp.messagingengine.com ([64.147.123.25])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKeVL-0007ZG-D9
 for linux-mtd@lists.infradead.org; Tue, 22 Sep 2020 09:22:32 +0000
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 5764EBDC;
 Tue, 22 Sep 2020 05:22:26 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Tue, 22 Sep 2020 05:22:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com.au;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=Dpo8fd7WQF/7KvGkxkvN2Kqn7G
 q/lyc78grZPan3hZ8=; b=VSew1aLsv8vLzXj7gsg8xMiBUn72zudA/nyYk9MDV9
 StGozM1sW586JGGbgpaFb9lHIbRhUqSefG2CIj4HaoHEah+iRJ/6162o3nsEGB86
 DsayiXYUu6NqdzuCivfwUQjPz7+kIDmAkCdGej0dnY7qFfuNCkChtAXOoyLTzPMl
 ocu596yf3uCkSybxLTGQePPFpc1ca5xh8QiLOX6XlmTRv5yafBXnQGUmwmzbSIRk
 m47VGJQUi4wvXYqSzPj+uGf2pEQynsFZ3h4VDv9TE8UDiwKawYDj7K62f3Xog6TZ
 B+bREdJmoeSpLmlzVn47ggpI531zCrJuk6fRCSMV68dw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=Dpo8fd7WQF/7KvGkx
 kvN2Kqn7Gq/lyc78grZPan3hZ8=; b=aIR6i0m7aMacR2sMs0LYK6rWKET8IXbtQ
 MSiUoxiyxo1Vtl77+qx4HbRnGfXrxMcl0tyOFbRPKWRRJ7INpcOx/ria7mKTNNp/
 OzDJLYDnf1+BQlCmCJx991+5oCP62/BDTnwJpRDVQ6jiiINP/uSHy3Qvj7Fcs80M
 m6bb/ehWHG7mV6GvEWpbOcta1m6M4Pp1y9BsbtW28YymD2CMIs8bwd4SqzCawWxA
 fXrHk9sigS1qD4jB+pdHllQDzzMumHRmU0r4M/3LL8NdYlOoUeXAPgBoKDThBCJU
 PZ5nCuPw4vsz+pq/WkE/fMQfbjt0ASmJmXn0imMI2gqd89G3RZVwA==
X-ME-Sender: <xms:UcJpX30ZND0IbT5upikDCAIp_fxAFwCX2Irk7qpXXEOz0ml3hxIrAA>
 <xme:UcJpX2FERwsTo_nb_sEPLv7le406Ovq_cI1FF2PIgxKo33FsmrPrCJenLj-jYiqvn
 kPyvCkcLLcIsSM4iQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudeggdduiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomheplfhohhhnucfvhhho
 mhhsohhnuceoghhithesjhhohhhnthhhohhmshhonhdrfhgrshhtmhgrihhlrdgtohhmrd
 gruheqnecuggftrfgrthhtvghrnhepffefiefhudektdeuudefteeiueduhfehhfekhfet
 gfdtueffkeffleelteevudeinecukfhppeehkedrudeihedrjedvrddujeehnecuvehluh
 hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhithesjhhohhhn
 thhhohhmshhonhdrfhgrshhtmhgrihhlrdgtohhmrdgruh
X-ME-Proxy: <xmx:UcJpX36bk_MSBDI1XLO-eS938Qgj36LVMe8kVZOiThjlkyTCx6c91A>
 <xmx:UcJpX83UlzRFRqHmAoeFkBVkhsYE3ISkPVtomcTIhyR65d9WRfM7bA>
 <xmx:UcJpX6GNFf3ZEjQedBfG9fXglPBdTdPTSgiMLlfWJAMT2eBNcY0FQA>
 <xmx:UcJpX2ByzzOM8ddO0AExcLfwLq8-mUKyjckskMusXJkzGMN0kdZFxw>
Received: from john.thome.spur.red (unknown [58.165.72.175])
 by mail.messagingengine.com (Postfix) with ESMTPA id B31E43280068;
 Tue, 22 Sep 2020 05:22:22 -0400 (EDT)
From: John Thomson <git@johnthomson.fastmail.com.au>
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org
Subject: [PATCH RFC] mtd: spi nor: fix erase_map.regions after memcpy for
 uniform eraseregion
Date: Tue, 22 Sep 2020 19:21:35 +1000
Message-Id: <20200922092135.167951-1-git@johnthomson.fastmail.com.au>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200922_052231_844787_2AB2F22E 
X-CRM114-Status: GOOD (  12.92  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: John Thomson <git@johnthomson.fastmail.com.au>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

For a uniform erase regions device, erase_map.regions points to the
address of erase_map.uniform_region.
There is a memcpy of nor->params, which includes
erase_map.regions, and erase_map.uniform_region.
The memcpy destination erase_map.regions pointer needs to be updated to
the new address of uniform_region.

Without this change, when a uniform erase region spi-nor device used
the multiple erase regions code path,
e.g. spi_nor_has_uniform_erase forced to return false,
erase operations failed in find_erase_region.

This code path is not currently used for uniform eraseregion devices,
but is useful to allow use of minor (4K) erase while otherwise using 64K erase.

Signed-off-by: John Thomson <git@johnthomson.fastmail.com.au>

---

Only build tested on master,
what devices or approach is used to test master MTD SPI NOR?

Found and tested in kernel 5.4 on Openwrt on a MIPS access point,
while testing changes to mtdpart.c to allow writes for partitions
on 4K (minor) erase boundaries.
with:
- CONFIG_MTD_SPI_NOR_USE_4K_SECTORS is not set
- spi_nor_has_uniform_erase forced to return false,
  so that a request for a 4K erase could use the multiple erase sectors
  code path on a uniform erase regions SPI NOR device.
---
 drivers/mtd/spi-nor/core.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 65eff4ce6ab..30f5db65781 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2716,12 +2716,20 @@ static void spi_nor_sfdp_init_params(struct spi_nor *nor)
 	struct spi_nor_flash_parameter sfdp_params;
 
 	memcpy(&sfdp_params, nor->params, sizeof(sfdp_params));
+	if (nor->params->erase_map.regions ==
+	    &nor->params->erase_map.uniform_region)
+		sfdp_params.erase_map.regions = (
+			&sfdp_params.erase_map.uniform_region);
 
 	if (spi_nor_parse_sfdp(nor, &sfdp_params)) {
 		nor->addr_width = 0;
 		nor->flags &= ~SNOR_F_4B_OPCODES;
 	} else {
 		memcpy(nor->params, &sfdp_params, sizeof(*nor->params));
+		if (sfdp_params.erase_map.regions ==
+		    &sfdp_params.erase_map.uniform_region)
+			nor->params->erase_map.regions = (
+				&nor->params->erase_map.uniform_region);
 	}
 }
 
-- 
2.28.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
