Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95C18C001DF
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Jul 2023 12:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mAjS6DL1MBUfQl7MNhMg9pq4W0cr8CLjyXtHZK4azxA=; b=3xcy7y/ayrVyLu
	T/BoJa/s0K6FHoj6KCiKHgWNPAm3sVUUJaLUtkmJ2x0kWVXTY1Oa3flHXBRPwl+yuGZST2SgzjppY
	4v4uiDOdfv5T1WedzNDyE9Zm9Yfaix4HShkwO+p6Yx/Zfjq9ulRJr/2r9+nZiLjAOqtihGvMoU3pT
	SvjRHQJn8joW7dYWmPBUoF4zh/Zvujnge5OT70yisPtkJhMxZGKK0y92ky+8Y3bZf6SNhDgqhUN+Y
	uu+p6TZdUQx3k/6+c9VKC49cofsceckXSxBi/WW1L1dC44IyreU/4ojYIUvwEMgkF5c+hJcU/4txh
	80tLZlX8o1PtaEheSoWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPMgI-003Kmc-1y;
	Fri, 28 Jul 2023 12:34:54 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPMg2-003Kga-0B;
	Fri, 28 Jul 2023 12:34:39 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 312BD1C000B;
	Fri, 28 Jul 2023 12:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1690547675;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hXrHWhtI49qRbtpKrWbKqEC9/x9UsXfcu1zPRQYZL7E=;
	b=U3510J81GLkGBrkTSB8qHQdzPhV5IrX2XBvKGkXnc/CQyPOUqo+VtbNBZCHr6MeCap5HDG
	q8N65DEhqtxYlkyc5LMzAkXNZP4rXYcyGjjOAHNCWK4M/IYtupiL962r+p4VobPlDOwYJP
	8E+KuCXf2yL55obCfIzxA+MALe/Ak1/lwFT/jjPvZhWVawXNtSrwX80W/qg5Q5KNEiJI96
	STofvneUUqPdfY2j3pjm5rB1SywpkqRdb7sdE1xEdVtybUUuPB5NdBEKlGV9bbtv4zlP6P
	M+ndb4J3+dfMeNWHs0Fa9L089vjDZTNNbRfz96JwlUvfVHDTnjbwe7d2/qVkuA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Md Sadre Alam <quic_mdalam@quicinc.com>,
	Sricharan Ramabadhran <quic_srichara@quicinc.com>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 7/8] mtd: rawnand: qcom: Early structure initialization
Date: Fri, 28 Jul 2023 14:34:32 +0200
Message-Id: <20230728123433.640665-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230716144612.32132-8-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'e260efea80e9cab8ad9dea1a03db11225df720f3'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230728_053438_225106_4C15D1D7 
X-CRM114-Status: UNSURE (   7.91  )
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

On Sun, 2023-07-16 at 14:46:11 UTC, Miquel Raynal wrote:
> Instead of allocating a structure on the stack with random data and then
> expect the callee to perform the initialization (which is, in general,
> error prone), prefer zeroing the structure explicitly at allocation and
> provide the already zeroed area, so no explicit memset operation is
> needed. It is probably safer to do so, so we limit the timeframe when
> dirty data could actually be accessed by mistake.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Acked-by: Manivannan Sadhasivam <mani@kernel.org>
> Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
