Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1856CD54AF
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Sep 2023 11:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JH4yXdpZ23g6LzxPHXHbePwzSxk/GtXvySuWKEfCpNE=; b=IFFH7OeVdLD19EsczjQ/qqAqKe
	Nbo7RQ0bXXnj62f9J8tDQtUgVjS4sSmXuGgk0VzA2ArFWXbJePtz7V9qpuHGJ4JzCxxinqqdTwE8a
	DYf2Tadfz1+gTZwoXS1gRtjA1OZG+jDExWzZ1CaxcF0uIGoqszsMZ8T09j0K+ZP07da1rRNao/ph0
	tdGYPF7328iPHmXpboAcUHJC9eCrG5ZF7+f8fL25prN/Ov/pK9TTjh/5MExmX5FqSdbPl+oDY5ox7
	MDUF9yrkfWnrIBXcZV80X5n92q4FK+kI6annab5UCJnFD/ZEwB8QDWXjQWJOqo7B5jluax3InBGft
	fLeNwh7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiZ0d-000IqJ-2T;
	Tue, 19 Sep 2023 11:35:15 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiZ0a-000Ipm-2x
	for linux-mtd@lists.infradead.org;
	Tue, 19 Sep 2023 11:35:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3662F615BF;
	Tue, 19 Sep 2023 11:35:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD3FDC433C8;
	Tue, 19 Sep 2023 11:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695123311;
	bh=0pBI6sCAihdhsv5bY7X6wkSaJqwGGZtkQFy4U3+xUmA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=d491L4obeamS0W93OSoeKFnBCfZRNzreahdHnE54X8Lr3w59o2daKP85/Ahtkp58o
	 999HWfKsfrIAP5hyYvIkEiYbanrTYdbfnZdYuCL3GNtVF2ZFzqTi1HWTLCFIpqc/fK
	 pg6GxNRPPpFj/YZzLgIw8c1WaC6tZpozW6BlDLh93IpieVhJa3Xdsv6R1xK1l+hXvH
	 xC4B7wDTMGSLV5+/Txw8XbKUc659V25O4pyyZoIurrlIUcASje50mnoOqYfUiVBsaY
	 md46I2QFY1j0po8dQCd6mcGrGpR6CDZ2B0eGRUIrfjt46vyISt7zWRHGxTT53nJlVg
	 YhziABWBUy+NQ==
MIME-Version: 1.0
Date: Tue, 19 Sep 2023 13:35:07 +0200
From: Michael Walle <mwalle@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Pratyush Yadav <pratyush@kernel.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH v3 00/41] mtd: spi-nor: clean the flash_info database up
In-Reply-To: <11380d64-09dd-352a-a6bf-3b8be332ec1c@linaro.org>
References: <20230807-mtd-flash-info-db-rework-v3-0-e60548861b10@kernel.org>
 <11380d64-09dd-352a-a6bf-3b8be332ec1c@linaro.org>
Message-ID: <996b67b91708b7858f76c35fb953e448@kernel.org>
X-Sender: mwalle@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_043512_998902_C073BB5A 
X-CRM114-Status: UNSURE (   8.35  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Am 2023-09-19 11:39, schrieb Tudor Ambarus:
> On 08.09.2023 13:16, Michael Walle wrote:
>>  - w25q32dw/layerscape spi
>>  - w25q32dw (with empty size and empty no_sfdp_flags)/layerscape spi
>>  - w25q16dw/mediatek spi
> 
> all looks good, Michael, thanks for specifying the tests done.
> I'll queue the patches with or without the small comments addressed,
> just waiting for a couple of hours to get a response from you.

Thanks, there is one small piece missing, see my reply in patch 10.
It would be great if you can amend that.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
