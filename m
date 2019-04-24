Return-Path: <SRS0=0gGT=S2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FE28C10F11
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Apr 2019 07:30:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4EB122089F
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Apr 2019 07:30:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Rahj56nU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4EB122089F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0Wj9Er36zrPHKEWpAQ+mxOmFkS8DFyhNTwrBzg1qknM=; b=Rahj56nUCU6xJY
	EAZQ3nnDL8XFexpbXascrbtE+eHS+cyurg5rqt3Y++5B9t+bmyZcZelrNbNJ7OONdza9/9/anfF5w
	PWvPa1p3aOvUgUpULAC7+Al01JvNK3nu+bku8fONyEKE/J9yf9e24c06aiEq3Ach0de6QG8F6niuu
	7lGGwoLtBMTkqRcy2xQzBFUCpEV/r+9ECxqdGGQrFzgxe/i2yNw/mRIi3MW3yhDuGfSC5qb0Ofjbp
	6qlh+FYKg7eOQT0ri3hIPqOPfILS2UWW5e9k6xqDmiydkN73Cl2Al9dHyN/Wc9ZZ5bGZ5qzf40zGW
	ZqzgTFSLA4opUleKDKlw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hJCM2-0003Vf-NS; Wed, 24 Apr 2019 07:30:06 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hJCLw-00031i-QT; Wed, 24 Apr 2019 07:30:03 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id EF452608A3B6;
 Wed, 24 Apr 2019 09:29:49 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id NHQeMQ_lkmif; Wed, 24 Apr 2019 09:29:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id A4FA9608A3B5;
 Wed, 24 Apr 2019 09:29:49 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id EniEiPrNxBZB; Wed, 24 Apr 2019 09:29:49 +0200 (CEST)
Received: from blindfold.localnet (unknown [82.150.214.1])
 by lithops.sigma-star.at (Postfix) with ESMTPSA id 2E34C6088978;
 Wed, 24 Apr 2019 09:29:49 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Xiaolei Li <xiaolei.li@mediatek.com>
Subject: Re: [RFC PATCH 1/1] mtd: rawnand: mtk: Re-license MTK NAND driver as
 Dual MIT/GPL
Date: Wed, 24 Apr 2019 09:29:48 +0200
Message-ID: <1868653.V2KA8McHNA@blindfold>
In-Reply-To: <20190424064522.33501-2-xiaolei.li@mediatek.com>
References: <20190424064522.33501-1-xiaolei.li@mediatek.com>
 <20190424064522.33501-2-xiaolei.li@mediatek.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190424_003000_998904_7F5409E2 
X-CRM114-Status: UNSURE (   5.99  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: daniel.thompson@linaro.org, srv_heupstream@mediatek.com,
 miquel.raynal@bootlin.com, jorge.ramirez-ortiz@linaro.org,
 boris.brezillon@bootlin.com, linux-mediatek@lists.infradead.org,
 yingjoe.chen@mediatek.com, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Am Mittwoch, 24. April 2019, 08:45:22 CEST schrieb Xiaolei Li:
> It is allowed to use MTK NAND driver with GPL-2.0 or MIT license.
> But now it is only licensed as GPL-2.0.
> So re-license it as dual MIT/GPL.

I fear this needs ACKs from all authors and major contributors of the driver
before we can apply such a change.

Thanks,
//richard



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
