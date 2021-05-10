Return-Path: <SRS0=B2Jc=KF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C303C433B4
	for <linux-mtd@archiver.kernel.org>; Mon, 10 May 2021 09:26:57 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A628561363
	for <linux-mtd@archiver.kernel.org>; Mon, 10 May 2021 09:26:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A628561363
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ogGUIsI/iGbd9ikmZwRsuE6l+UQOXjoEiwmgQFh/Vkc=; b=dgiHfrBD+Ers03PQ+T3ZY1m+P
	WVsF/fTqzZ3fYuViO2PmuUxui33DM3uvGoq5BNLC1LI0n1FaXpPj4D8UT1S9MgfUNVNcVPE9ossT6
	Wa1HDcXTE1b4Tqr3qI26tk1GOUvWkvmh+vJP8ktY5B8L9Z/tzPRiF2DghjAdsYAn3o/4MjGKbRsY4
	Jeaa+9brmIb5B1d4dTPn730/lWe6NKYP9VwKhHtuMwH0Ff7X7pBiYK4Pk+wriVgx96UdLKnnevtIE
	2YEVHGOS16247iesJ2x3j6nzXNKZIcM6fpMQqmof0i+aLH/QBUYhAES/YlMah+WNriI14MxG1mbI7
	umMHDBdTQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lg2Ag-00DlAo-6i; Mon, 10 May 2021 09:25:50 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg1vf-00DiTI-6c; Mon, 10 May 2021 09:10:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=v4p+hdy62DIOvpzGIG8tjZVpe0WL0fzCM6YjdzCbeyU=; b=iAwSjAwV2gYxtx/Ctu1GSsf1O/
 /lXYTX8fmqQpa22bpiC7HmOjuMOO17tN7xmG8ric4aCIRtQPoMw0aLRvyaRYVpFgjnb7DGKDD65zd
 36yjfCmJOqBBi78XENlEN2PKXEIKuHRVR3+rp3mS6c5P/mZmt0Fi2WfbP1nhLgQiVRYqkv8W02yLl
 D75dXbm3o/xZ43JyL7WziUOz3ve2xmgfn2VdZeml53tc56f6JlSgTS1/1TttXlIe3wY0+fNwmPaJ1
 W3+0cMM1eeoD2FhEZ9F5FRSf8eJ4mq3/dwwkfK2EReTz43MjhhtX9YBUoIDx/OvIftyAD8r45YtTy
 PDCp8Rzw==;
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg1vc-008Ran-Gl; Mon, 10 May 2021 09:10:18 +0000
X-Originating-IP: 90.89.138.59
Received: from xps13.home (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr
 [90.89.138.59]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id F1321240010;
 Mon, 10 May 2021 09:10:12 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Yu Kuai <yukuai3@huawei.com>, joern@lazybastard.org,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 matthias.bgg@gmail.com
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 yi.zhang@huawei.com
Subject: Re: [PATCH 1/3] mtd: rawnand: mtk: remove redundant dev_err call in
 mtk_ecc_probe()
Date: Mon, 10 May 2021 11:10:12 +0200
Message-Id: <20210510091012.4165-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210408111514.1011020-2-yukuai3@huawei.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'e101bd30456111d46bf4c54df122314ce96e4180'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210510_021016_708214_30E42EB8 
X-CRM114-Status: UNSURE (   5.47  )
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

On Thu, 2021-04-08 at 11:15:12 UTC, Yu Kuai wrote:
> There is a error message within devm_ioremap_resource
> already, so remove the dev_err call to avoid redundant
> error message.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Yu Kuai <yukuai3@huawei.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
