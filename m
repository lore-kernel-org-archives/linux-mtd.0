Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD66FC0015E
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Jul 2023 22:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mzQLg9Wc7VaiaeqV0373EvXm71+MYnF5Qr0JO4ZDnRM=; b=pbGicn3eraQEz5
	HQ12tRNiI1iETTwg9PX6NLt8ZAaXMNfxqrJslFRoSmHsZeB4sQom+FAyI3krZ1Zhv95TybdqaixzJ
	3YHKNGGdVFeXuhED1FxAix/IVpvwypYtx1xMPrecdmj6kemK+P3HupkfiuYL3Dxh7qbSk9Kggdb1r
	LwiUzfPK0PwkWXl5PwMCUKdNJzBqqXue4pWEXW1a+fmQGKdMZgc+ItNL1MlJKncU52tH4dS88PS8T
	Qe6DEaXASWkANctjF0ZC6wKOLDOJ9hxe7/b4s3f6mm/jBSEy3BCLTOvZCRAVo1J6c4pCRz8u9/vIW
	A3+ipS5PFXPezqY2bcmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMFGU-0092sp-12;
	Wed, 19 Jul 2023 22:03:22 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMFGR-0092rR-2U
	for linux-mtd@lists.infradead.org;
	Wed, 19 Jul 2023 22:03:20 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1qMFG1-0008Ji-2q;
	Wed, 19 Jul 2023 22:02:53 +0000
Date: Wed, 19 Jul 2023 23:02:45 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Jens Axboe <axboe@kernel.dk>, Ulf Hansson <ulf.hansson@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Dave Chinner <dchinner@redhat.com>,
	Matthew Wilcox <willy@infradead.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Jan Kara <jack@suse.cz>, Daniel Golle <daniel@makrotopia.org>,
	Damien Le Moal <dlemoal@kernel.org>, Ming Lei <ming.lei@redhat.com>,
	Min Li <min15.li@samsung.com>,
	Christian Loehle <CLoehle@hyperstone.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Hannes Reinecke <hare@suse.de>, Jack Wang <jinpu.wang@ionos.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Yeqi Fu <asuk4.q@gmail.com>, Avri Altman <avri.altman@wdc.com>,
	Hans de Goede <hdegoede@redhat.com>, Ye Bin <yebin10@huawei.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: [RFC PATCH 2/6] mmc: block: set fwnode of disk devices
Message-ID: <1ce5f56df546cec25ef741f381286f1d7c33d000.1689802933.git.daniel@makrotopia.org>
References: <cover.1689802933.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1689802933.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_150319_859697_28FD4FA5 
X-CRM114-Status: GOOD (  11.66  )
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

Set fwnode of disk devices to 'block', 'boot0' and 'boot1' subnodes of
the mmc-card. This is done in preparation for having the eMMC act as
NVMEM provider.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/mmc/core/block.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/mmc/core/block.c b/drivers/mmc/core/block.c
index f701efb1fa785..fc1a9f31bd253 100644
--- a/drivers/mmc/core/block.c
+++ b/drivers/mmc/core/block.c
@@ -2413,6 +2413,8 @@ static struct mmc_blk_data *mmc_blk_alloc_req(struct mmc_card *card,
 					      int area_type,
 					      unsigned int part_type)
 {
+	struct fwnode_handle *fwnode;
+	struct device *ddev;
 	struct mmc_blk_data *md;
 	int devidx, ret;
 	char cap_str[10];
@@ -2509,6 +2511,12 @@ static struct mmc_blk_data *mmc_blk_alloc_req(struct mmc_card *card,
 
 	blk_queue_write_cache(md->queue.queue, cache_enabled, fua_enabled);
 
+	ddev = disk_to_dev(md->disk);
+	fwnode = device_get_named_child_node(subname ? md->parent->parent :
+						       md->parent,
+					     subname ? subname : "block");
+	ddev->fwnode = fwnode;
+
 	string_get_size((u64)size, 512, STRING_UNITS_2,
 			cap_str, sizeof(cap_str));
 	pr_info("%s: %s %s %s%s\n",
-- 
2.41.0

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
