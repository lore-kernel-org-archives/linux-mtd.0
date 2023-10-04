Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83DB3E7B5F5
	for <linux-mtd@archiver.kernel.org>; Wed,  4 Oct 2023 11:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KkgxVy+F7hw4VIFlQ4EiMLaXTHB5MW7KOvfNkTVOFCo=; b=0J2Xu+DunK4zl1
	5LYlgbgbdieb2RMusJlOsPnL0OvlufhzRxwYvR1crTwMWdMXXkPurm+7ydgXsetWjCQIlbhvN5akm
	fhCERIhaUPNblDlXn2SXmU3yM+JDwhgmHUG3+lnAWx3bNGCjNqLh2/udOJaNtM2WvbIOm1ZFpuwL8
	e80DvrA5d7xqmDNp5xlPvi0/wuswWMGb1SyHSvHlmmg2Z1jHIG3lhfpT4LR+tQOJgiY8XBc+OpNrO
	bGoH8NcUYZ6YIEra/yfwKficjl3CvzfgnnYw+enDEw9ljTi9zavFZ+DB8WGiK9KOqePGZHOTPDHTm
	FLMrPabNWw5n+rOMXfHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qo09w-00HUnB-1g;
	Wed, 04 Oct 2023 11:35:20 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qo09r-00HUlt-2i
	for linux-mtd@lists.infradead.org;
	Wed, 04 Oct 2023 11:35:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id AB59BB81D7E;
	Wed,  4 Oct 2023 11:35:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4756C433C8;
	Wed,  4 Oct 2023 11:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696419313;
	bh=EKub7DB0kxiceubZBtND+wquahZHKwwMH5j2bwwGvZo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=E6myhdpplLeJMfThiZcQnD5TncbV3oJuuWCinlPuQn3k62ICZ8+K1qAe7EQ3P+ESt
	 x6o33yAOVmljx52m51Uqj3J5Ef+/6Zjv1Uumgy4uOj+QhZoDzNzLvfbSQuB0Ma7uf2
	 GWh+mHpReWV2wzYF2F2ON1l7PZG9NxLcHKuGCkTHgycbXS8cVWCSH1CH9uV9TWRntm
	 gKrqsO0Wx8WY6IV1emB+TGJeTnLYlhulj+hojFts5ksLDZ3dJc6vcJ24Kh5TPrBpzY
	 Yp2+jP9LJYd3sUDcB4fYX5EkjIFbCYHpVD7jPKnS59GLT78lyezPF2/oKNTNKgZk/x
	 s/fFrsndcc4GQ==
From: Michael Walle <mwalle@kernel.org>
To: miquel.raynal@bootlin.com
Cc: conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	ptyadav@amazon.de,
	rafal@milecki.pl,
	richard@nod.at,
	robh+dt@kernel.org,
	robh@kernel.org,
	sjg@chromium.org,
	trini@konsulko.com,
	u-boot@lists.denx.de,
	vigneshr@ti.com,
	Michael Walle <mwalle@kernel.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: mtd: fixed-partitions: Add binman compatible
Date: Wed,  4 Oct 2023 13:34:58 +0200
Message-Id: <20231004113458.531124-1-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231004093620.2b1d6917@xps-13>
References: <20231004093620.2b1d6917@xps-13>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231004_043516_056622_88100CDB 
X-CRM114-Status: GOOD (  17.28  )
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

Hi,

>> Add a compatible string for binman, so we can extend fixed-partitions
>> in various ways.
> 
> I've been thinking at the proper way to describe the binman partitions.
> I am wondering if we should really extend the fixed-partitions
> schema. This description is really basic and kind of supposed to remain
> like that. Instead, I wonder if we should not just keep the binman
> compatible alone, like many others already. This way it would be very clear
> what is expected and allowed in both cases. I am thinking about
> something like that:
> 
> 	Documentation/devicetree/bindings/mtd/partitions/brcm,bcm4908-partitions.yaml 
> 
> this file is also referenced there (but this patch does the same, which
> is what I'd expect):
> 
> 	Documentation/devicetree/bindings/mtd/partitions/partitions.yaml
> 
> I'll let the binding maintainers judge whether they think it's
> relevant, it's not a strong opposition.

What is the overall goal here? To replace the current binman node which is
usually contained in the -u-boot.dtsi files? If one is using binman to
create an image, is it expected that one needs to adapt the DT in linux?
Or will it still be a seperate -u-boot.dtsi? Because in the latter case
I see that there will be conflicts because you have to overwrite the
flash node. Or will it be a seperate node with all the information
duplicated?

Maybe (a more complete) example would be helpful.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
