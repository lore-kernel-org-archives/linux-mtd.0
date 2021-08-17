Return-Path: <SRS0=LBUh=NI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 688F5C4338F
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Aug 2021 16:50:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2EE7A60F5E
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Aug 2021 16:50:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2EE7A60F5E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=daFl6OXqEuBB7q7Vgr1UDA4eMX314ej02E0UvAaK2b8=; b=0PlCB2S9JTa500
	EsU+aFqUPtav9K5x2hIQhPWMkFpeGL9hyvZAl8QxprKsyTFy45cYNAI4wAsD4Q87emAs5BFi23blF
	M6PlzoOE8+L7ilqNmJNspvMXMLh+Lokt/+j/SrHzatfxXijZEhoP0jgsI83YlIMryXdSNV2rXvuPm
	yyj80hRwfSMRkZ7hu/6kqbTK9siyl+msyk1sOZOWnHPmNav1+I9cwzBVFmOul3D1+NhLrXeCWyEoa
	IvYUX5Gq/REbl3QkkxGMJ/qR+ZraFXBY0uaDAWOV/UC3/Z2SzjlowzUnZu5BF+LcRIada4G9XgO7B
	o2a9aK05NVMqzWmlnXHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mG2Hf-0031bA-3V; Tue, 17 Aug 2021 16:49:51 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mG2HC-0031SS-0q
 for linux-mtd@lists.infradead.org; Tue, 17 Aug 2021 16:49:23 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 9E9B824000B;
 Tue, 17 Aug 2021 16:49:19 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Zhihao Cheng <chengzhihao1@huawei.com>, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, bbrezillon@kernel.org
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 yukuai3@huawei.com
Subject: Re: [PATCH v2 1/2] mtd: mtdconcat: Judge callback existence based on
 the master
Date: Tue, 17 Aug 2021 18:49:18 +0200
Message-Id: <20210817164918.108904-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210817114857.2784825-2-chengzhihao1@huawei.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'f9e109a209a8e01e16f37e1252304f1eb3908be4'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210817_094922_258427_56B2E1A2 
X-CRM114-Status: GOOD (  10.92  )
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

On Tue, 2021-08-17 at 11:48:56 UTC, Zhihao Cheng wrote:
> Since commit 46b5889cc2c5("mtd: implement proper partition handling")
> applied, mtd partition device won't hold some callback functions, such
> as _block_isbad, _block_markbad, etc. Besides, function mtd_block_isbad()
> will get mtd device's master mtd device, then invokes master mtd device's
> callback function. So, following process may result mtd_block_isbad()
> always return 0, even though mtd device has bad blocks:
> 
> 1. Split a mtd device into 3 partitions: PA, PB, PC
> [ Each mtd partition device won't has callback function _block_isbad(). ]
> 2. Concatenate PA and PB as a new mtd device PN
> [ mtd_concat_create() finds out each subdev has no callback function
> _block_isbad(), so PN won't be assigned callback function
> concat_block_isbad(). ]
> Then, mtd_block_isbad() checks "!master->_block_isbad" is true, will
> always return 0.
> 
> Reproducer:
> // reproduce.c
> static int __init init_diy_module(void)
> {
> 	struct mtd_info *mtd[2];
> 	struct mtd_info *mtd_combine = NULL;
> 
> 	mtd[0] = get_mtd_device_nm("NAND simulator partition 0");
> 	if (!mtd[0]) {
> 		pr_err("cannot find mtd1\n");
> 		return -EINVAL;
> 	}
> 	mtd[1] = get_mtd_device_nm("NAND simulator partition 1");
> 	if (!mtd[1]) {
> 		pr_err("cannot find mtd2\n");
> 		return -EINVAL;
> 	}
> 
> 	put_mtd_device(mtd[0]);
> 	put_mtd_device(mtd[1]);
> 
> 	mtd_combine = mtd_concat_create(mtd, 2, "Combine mtd");
> 	if (mtd_combine == NULL) {
> 		pr_err("combine failed\n");
> 		return -EINVAL;
> 	}
> 
> 	mtd_device_register(mtd_combine, NULL, 0);
> 	pr_info("Combine success\n");
> 
> 	return 0;
> }
> 
> 1. ID="0x20,0xac,0x00,0x15"
> 2. modprobe nandsim id_bytes=$ID parts=50,100 badblocks=100
> 3. insmod reproduce.ko
> 4. flash_erase /dev/mtd3 0 0
>   libmtd: error!: MEMERASE64 ioctl failed for eraseblock 100 (mtd3)
>   error 5 (Input/output error)
>   // Should be "flash_erase: Skipping bad block at 00c80000"
> 
> Fixes: 46b5889cc2c54bac ("mtd: implement proper partition handling")
> Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
