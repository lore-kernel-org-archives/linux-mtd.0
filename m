Return-Path: <SRS0=Fb5G=KV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68300C2B9F7
	for <linux-mtd@archiver.kernel.org>; Wed, 26 May 2021 08:32:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 23244613AB
	for <linux-mtd@archiver.kernel.org>; Wed, 26 May 2021 08:32:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 23244613AB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JW9eQCVLDAXT3ugJC0s5eGM9mhdUJAE4F9wdALNOWlw=; b=xgVgva0dTpJcJb
	YezQq2HXxzBGfXoGhad6LGGAXbfd+wU56EakzXaNSZNmU0GyFqXVBPuhkPj+fNqrRcILPfTd3D3KM
	RgN2qtSe9PILNKRdE+L+wVpmfnSwy4xvV6XgFgOd5Ayx9RNTWdMFI/8wgLvSJ9YMZIeqp1+Kgv+Y9
	Y7kxlN57vnU9uXj0CAD7gJzD7Fcmjz92sMbyMAubsbTABcYdTHj4G5zy1ZFnEnos/5JzQxZESsUkG
	QIWGBUFV0wrprN3dClDHwvs1YCD026PZ98PdLjWGjhagJD+IKb0Qmw1AuauwL3JpbKLo2/3mca14P
	UWyTrRRUJvwhsVlsBgkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lloxa-00CSn6-NM; Wed, 26 May 2021 08:32:14 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lloxF-00CSfN-Im; Wed, 26 May 2021 08:31:55 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 0DB5710000C;
 Wed, 26 May 2021 08:31:47 +0000 (UTC)
Date: Wed, 26 May 2021 10:31:46 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: <patrice.chotard@foss.st.com>
Cc: Mark Brown <broonie@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 <linux-mtd@lists.infradead.org>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, <linux-spi@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <christophe.kerello@foss.st.com>
Subject: Re: [PATCH v5 2/3] mtd: spinand: use the spi-mem poll status APIs
Message-ID: <20210526103146.5fcd8247@xps13>
In-Reply-To: <20210518162754.15940-3-patrice.chotard@foss.st.com>
References: <20210518162754.15940-1-patrice.chotard@foss.st.com>
 <20210518162754.15940-3-patrice.chotard@foss.st.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210526_013153_801566_733E5490 
X-CRM114-Status: UNSURE (   7.95  )
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


<patrice.chotard@foss.st.com> wrote on Tue, 18 May 2021 18:27:53 +0200:

> From: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> Make use of spi-mem poll status APIs to let advanced controllers
> optimize wait operations.
> This should also fix the high CPU usage for system that don't have
> a dedicated STATUS poll block logic.
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
