Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4142AC4706C
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Jan 2024 12:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ca/3xp2DFu1DfGuMAqrDlmRQ8LY9sDwi+hL/M/k2HcQ=; b=ddhRxFzuL4PMzDoRcTrYF2s6XD
	LozQhayQ/T9GOIkrHiaJ4foYOyC9wJSBa2+oPqwvLMFPYwrb1pjpMbuaKe9eP7V4bCOrPhvf3Yo7H
	D6HdhHHSyRHdhSajI4uxZVc9d2ELzw47I0NOUQ9cWrANBbY0aJQxy/SSnKz/tJ97NBTuUmgOoWb9A
	O3L0K/vd6zjU62FyezZ2xXaU+X41PkrF6Y0NfrWnZHv9nGO4LCRbcjbsgYPdpQEukp87QocwiqaJI
	16WUcW8vQmC8CpWQv5SdcCMPoj/lTYzxPZBzLwoOtntva78E2LZyyzN90O+ZBYzpuRVX3+jWmYXAo
	8Imx1K+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rOGDz-002lCI-2c;
	Fri, 12 Jan 2024 12:01:23 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rOGDw-002l1X-1V
	for linux-mtd@lists.infradead.org;
	Fri, 12 Jan 2024 12:01:22 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 071A2FAE;
	Fri, 12 Jan 2024 13:01:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1705060867;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c88ibkBXQ296gyAj7Wrn3U1+/aGTW8TbhKaEOT53Uh0=;
	b=Vu61PVWedz4jcPDAtC9DkPc+RK8gjns4LgBawC7KeqQv1GO0CggN7SUh7fNRiPn35aPW9V
	BU7zIZLj3lGm/viMl+ak4ct+QQIhkd+VkxUtpOgfSMY0ZH2hackkX1kXclWeGvguANP0dq
	F3RU5I/rjdhBhVZSibVyheIdtLvPTTeqzVTmgviXlMnKR2XsHKuJ6rXu/f4i+QeXNPpCWT
	WbyqWDvNm2qsq0EFbetZb4IvXNgeUmJDv/TKHLd8n/BVjWLpZIkUaU1l7mZVCcjsM3bXxm
	3eWzWo0TX5I6+Tcd++l0OldyWyjaoZli7yk6QIICvQExCITtuyqxPgrs1Vw/yw==
MIME-Version: 1.0
Date: Fri, 12 Jan 2024 13:01:06 +0100
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: tkuw584924@gmail.com, linux-mtd@lists.infradead.org,
 pratyush@kernel.org, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, Bacem.Daassi@infineon.com, Takahiro Kuwano
 <Takahiro.Kuwano@infineon.com>
Subject: Re: [PATCH] mtd: spi-nor: core: Set mtd->eraseregions for non-uniform
 erase map
In-Reply-To: <bb98a601-5c76-4273-820e-2b1c9b449820@linaro.org>
References: <20231225080349.17222-1-Takahiro.Kuwano@infineon.com>
 <bb98a601-5c76-4273-820e-2b1c9b449820@linaro.org>
Message-ID: <2e781c2efd663fea6d4a75fac36f144a@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240112_040120_820738_C42D7BEF 
X-CRM114-Status: GOOD (  12.51  )
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

>> +	struct mtd_erase_region_info *mtd_region;
>> +	u32 erase_size;
>> +	u8 erase_mask;
> 
> put the u8 last to avoid stack padding

I don't think that is a thing. Even if it were, it might clash
with the RCT.

I couldn't find anything about how automatic variables are placed
in memory. I'd say its not specified in the standard and the compiler
is free to do optimizations here or just keep the contents in
registers (?!).

Any stytle recommendations for spi-nor? I prefer RCT, but if we want
to say declaration order doesn't matter, I'm fine with that too.

>> +
>> +	for (i = 0; !spi_nor_region_is_last(&region[i]); i++)
>> +		;
>> +
>> +	n_regions = i + 1;
> 
> all this just to get the number of regions? how about saving the number
> of regions somewhere and use it everywhere?

This whole region thing should be rewritten to not store these magic
bits in the offset.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
