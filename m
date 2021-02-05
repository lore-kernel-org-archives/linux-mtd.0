Return-Path: <SRS0=fkbb=HH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10464C433E0
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Feb 2021 13:32:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8AAC064FBC
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Feb 2021 13:32:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8AAC064FBC
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lGTWdCo0x8s2ZZRWJ0wWAjSt+YyKqPaOg20ZtpxY6z8=; b=RGicZPeddDJZBOTOrS6EJXKYL
	hv+TGmgcLDulcR9vqJ5zfCDc1bZtl31IIlp6p5Aj6xK/pEWoqqinCuzQHNkJ0aDuzkruc/AAzrLNl
	xusUBuBDGQga/Z3pPPSvUruQJMO42Neu3PE+xigOqD5XneA6GZ3/so1bHnf5/2AuZFgb4y5eOLBwI
	qtySiy6Za3tks8M/vgHoIrJlRCqwKgHSkkvaeUDGUmhZf0D6G4ws9Zefpwh/AEu2/zybQwOGhBbtm
	+y8a20khfDgMRYNzhT9L5U6OY5jW28dohqcEnLe+Osn7orIde7GZmljMP9OB2tc9I+zIxKxXzU1vH
	i1N/ffMvg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l81D5-0000BN-8x; Fri, 05 Feb 2021 13:31:43 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l81D1-0000AZ-NR
 for linux-mtd@lists.infradead.org; Fri, 05 Feb 2021 13:31:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1612531899; x=1644067899;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7A9+4V9bdnIqbF9mDdj/Y02VVOhDHWG0spOWWiZ1RLY=;
 b=EL/fh0yzupq7i9EJE0etNi1W955PAWtw4/U6dXOo5JbCU9osyJzW1DjE
 aYMcWWuqGdzot0f08uzByxirQzXtszqW9wu6bfpvy7pcXzy3rTZPL3S7V
 FumXc6XzU/GmU6aPe4IATq3c9bCfbaXbIinFSiouwZuesalHwH75QVec2
 Ju0QcdTmQOnbaqbftbPPdRHylWZb1fEIZkd/dyKJLGMCtOC6l2LLG026E
 Mja+5E/b6kGnIMFEHlwCAFqzGVTYXoBUa6mASRQ+viPc3dH6u8RiZW/WH
 nja28ydCc9RXRL/XSz/LZhAnD4m+q+K3WHMx0CJgHnsy0EqoYVfT8KSFH g==;
IronPort-SDR: +QMH+GSDY6/LvnFcE7zQ1CaRp8gASDxv/khYHEB11yDj5TXUbCR3gghSpH8m7rHfxtpHrAQfjU
 qHsAfOXdkCjk+lZltcVuDeGL9b1EDNmbyJBDw9kHv5D3Ff8fZT/I8cUV1WpOi/zLap56EtIH79
 C0aa4jib4UHStQ5qV2wvCnlChTrMu/rzO+n3I7f1d2fAu7TMuh4uX6nnsZAo3t378pwiucoJYq
 Udf5KoMMnBpCHo4NVcd2theQCYvYU3BCM+WU6g+usVUmZ4PBVkWdtHWlZtfNLSMuqJ5ly6iLsr
 Lho=
X-IronPort-AV: E=Sophos;i="5.81,154,1610434800"; d="scan'208";a="113961374"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 05 Feb 2021 06:31:37 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Fri, 5 Feb 2021 06:31:37 -0700
Received: from atudor-ThinkPad-T470p.amer.actel.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Fri, 5 Feb 2021 06:31:35 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: "tkuw584924@gmail.com" <tkuw584924@gmail.com>,
 <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH 0/4] mtd: spi-nor: Fix non-uniform erase map issues
Date: Fri, 5 Feb 2021 15:31:32 +0200
Message-ID: <161253178923.670759.16632185344136979195.b4-ty@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1601612872.git.Takahiro.Kuwano@infineon.com>
References: <cover.1601612872.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210205_083139_987109_D5AAB76B 
X-CRM114-Status: UNSURE (   6.95  )
X-CRM114-Notice: Please train this message.
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
Cc: vigneshr@ti.com, Tudor Ambarus <tudor.ambarus@microchip.com>,
 richard@nod.at, Bacem.Daassi@infineon.com, miquel.raynal@bootlin.com,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, 2 Oct 2020 14:17:58 +0900, tkuw584924@gmail.com wrote:
> This patchset fixes the issues in handling non-uniform erase map.
> 
> Takahiro Kuwano (4):
>   mtd: spi-nor: sfdp: Fix wrong erase type bitmask for overlaid region
>   mtd: spi-nor: sfdp: Fix wrong index of last erase region
>   mtd: spi-nor: core: Fix erase type discovery for overlaid region
>   mtd: spi-nor: core: Fix erase command list setup for
> 
> [...]

Updated commit description in 3/4, and added Fixes tags and
Cc to stable for all.

Applied to spi-nor/next, thanks!

[1/4] mtd: spi-nor: sfdp: Fix wrong erase type bitmask for overlaid region
      https://git.kernel.org/mtd/c/abdf5a5ef965
[2/4] mtd: spi-nor: sfdp: Fix last erase region marking
      https://git.kernel.org/mtd/c/9166f4af32db
[3/4] mtd: spi-nor: core: Fix erase type discovery for overlaid region
      https://git.kernel.org/mtd/c/969b276718de
[4/4] mtd: spi-nor: core: Add erase size check for erase command initialization
      https://git.kernel.org/mtd/c/58fa22f68fca

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@microchip.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
