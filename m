Return-Path: <SRS0=gt70=JF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19E27C433B4
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Apr 2021 11:08:16 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 840426113D
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Apr 2021 11:08:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 840426113D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XC/IwpAXs51Tch8+CQhMzYrA1I4MS4qynDZBW0j7TLY=; b=m3STAHVkzvWcMKu3jq9zW6Wqgy
	ITUbhT0BMBuulNNxMuchjoyjf53/kZaD1UQycQCgGiN4t3lcNdKLVP4JNqz8B+yxf/PkskHJVGo90
	ys4UDZPe1q0L/DJWQ2f6jbLo+yfs/cZ6kwjO6yiXwxazxT+uDHBZk9py/XX/OUVQ/crT/U0xFpETl
	XkTslXL1j67YAbfxrt9ulXp4ruwZ4/heQSfHtnThPyVuyz6LLHUZ0B6/9ajt/879Go/hsHNEPdfa5
	mY6pjGcyU9K0QhhUdVfoSsEtm/qARpEU6Fm9QjRkIWGBAWMl+vhlEd5z1modJWsfk674EHlE2fxjK
	PnDCD8Xw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUSVZ-007kZp-B2; Thu, 08 Apr 2021 11:07:33 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUSVD-007kVV-92; Thu, 08 Apr 2021 11:07:13 +0000
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FGJLv542Jz19KpQ;
 Thu,  8 Apr 2021 19:04:55 +0800 (CST)
Received: from huawei.com (10.175.127.227) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.498.0; Thu, 8 Apr 2021
 19:06:58 +0800
From: Yu Kuai <yukuai3@huawei.com>
To: <joern@lazybastard.org>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <matthias.bgg@gmail.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <yukuai3@huawei.com>, <yi.zhang@huawei.com>
Subject: [PATCH 0/3] code optimization for mtd
Date: Thu, 8 Apr 2021 19:15:11 +0800
Message-ID: <20210408111514.1011020-1-yukuai3@huawei.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210408_120711_649831_2E64B53D 
X-CRM114-Status: UNSURE (   5.21  )
X-CRM114-Notice: Please train this message.
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

Yu Kuai (3):
  mtd: rawnand: mtk: remove redundant dev_err call in mtk_ecc_probe()
  mtd: plat-ram: remove redundant dev_err call in platram_probe()
  mtd: phram: Fix error return code in phram_setup()

 drivers/mtd/devices/phram.c    | 1 +
 drivers/mtd/maps/plat-ram.c    | 1 -
 drivers/mtd/nand/raw/mtk_ecc.c | 4 +---
 3 files changed, 2 insertions(+), 4 deletions(-)

-- 
2.25.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
