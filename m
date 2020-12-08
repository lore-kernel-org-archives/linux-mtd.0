Return-Path: <SRS0=eGw4=FM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 204A7C433FE
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Dec 2020 16:12:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CFBCD23AFC
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Dec 2020 16:12:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CFBCD23AFC
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OdFaqefF19EW0eSNR1xrG33JGM6C1yP4FvDEl+kpiVI=; b=VGVEKG8nYWNTfT9PbeURW7kEW2
	+Ktixof/bSJ1imZavG6M5uxZf3qLT8UrCo7Mkv28ftZSLZOAnasiV8S0VKRRhR4ewiea0yxvlBraJ
	aQWuT2U9FORQJGVIy6AyyEnRH0ZMst5qNY9Wc4hyVXvCW1Nu+q+dREl6i6fiHeSfL2dDFrO6hGlZR
	YZ74BOz6UPo4GhWWA3qbtQaWbz51wwkrAZ9+BFjr6dON2x8p/rY454/uKHtN5FjGG8wghq9Cl3ol+
	kb6XML2Ld7y+/36xlNPPtBmLQHOt/6fJ1pO+nrXHYY3cJ30BUrtuIKPPenkzRloh7DN6tBSwq8ubQ
	X11v+tww==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmfaf-0005Kd-Ts; Tue, 08 Dec 2020 16:11:50 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmfaL-0005EC-KJ
 for linux-mtd@lists.infradead.org; Tue, 08 Dec 2020 16:11:31 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0B8GBPVY016701;
 Tue, 8 Dec 2020 10:11:25 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1607443885;
 bh=RJdgsj5A5pt3bCnNMA5AT7RiqVyaXbqszWsx9anQLAU=;
 h=Subject:To:References:From:Date:In-Reply-To;
 b=aX1/ObrHy6iCXQ9tJCne3QBtCo7BX+3S43hHqKjnDKOIdqJUzx/UkS/nT3tQkxw6u
 eD1PY07qaH4qIrg30LTZs0ZJbLelJt4+fVTfggwlFFClmtmJke2Y1bn5adQYTAzs9d
 SWub9zaoMMOcKimyN58aUMkJrQVwXINQAID2HbyE=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0B8GBOPJ040236
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 8 Dec 2020 10:11:24 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 8 Dec
 2020 10:11:24 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 8 Dec 2020 10:11:24 -0600
Received: from [10.250.233.179] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0B8GBL1r040523;
 Tue, 8 Dec 2020 10:11:22 -0600
Subject: Re: [PATCH v3 2/3] mtd: spi-nor: core: Allow flashes to specify MTD
 writesize
To: Pratyush Yadav <p.yadav@ti.com>, Tudor Ambarus
 <tudor.ambarus@microchip.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
References: <20201201102711.8727-1-p.yadav@ti.com>
 <20201201102711.8727-3-p.yadav@ti.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <336aece6-33a0-e528-1d54-17d0d3c38624@ti.com>
Date: Tue, 8 Dec 2020 21:41:21 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201201102711.8727-3-p.yadav@ti.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201208_111129_909045_F832C0F2 
X-CRM114-Status: GOOD (  16.14  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
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

Hi Pratyush,

On 12/1/20 3:57 PM, Pratyush Yadav wrote:
> Some flashes like the Cypress S28 family use ECC. Under this ECC scheme,
> multi-pass writes to an ECC block is not allowed. In other words, once
> data is programmed to an ECC block, it can't be programmed again without
> erasing it first.
> 
> Upper layers like file systems need to be given this information so they
> do not cause error conditions on the flash by attempting multi-pass
> programming. This can be done by setting 'writesize' in 'struct
> mtd_info'.
> 
> Set the default to 1 but allow flashes to modify it in fixup hooks. If
> more flashes show up with this constraint in the future it might be
> worth it to add it to 'struct flash_info', but for now increasing its
> size is not worth it.
> 
> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
> 

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git
spi-nor/next, thanks!
[2/3] mtd: spi-nor: core: Allow flashes to specify MTD writesize
      https://git.kernel.org/mtd/c/afd473e858

Regards
Vignesh


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
