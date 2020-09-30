Return-Path: <SRS0=o/Ze=DH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55D61C4727E
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Sep 2020 09:37:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C4D382074A
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Sep 2020 09:37:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DYInxTqM";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="KQ+ZYMwV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C4D382074A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=aozqFh+MaayP/fuTF73GI8pG2LsK3tARkJ/RtiClta4=; b=DYInxTqM4WCHRXBLILeOhL3/p
	k07PCqfxrHKyEALE4fi4JCUXr5uERHqUmK8qhDL/y4nvq46zcaUgvBPBno6Cz0/FaX4YD6JycYBbe
	5czt+jL0S9eFXFxd3vU8Xq1ZVNib/d287bjZGHZ/OFXtYFy4D3nLxeiU3fuYLGDlIiNz8ac9PPtD/
	cxyCni8J1ZM7dbELDKIu9a6Op4qsoBb+/wGzOjW3YQajuh8Eu4hCNZyiZbF6FVb3KPDtmVG3N5Ysi
	A3rMaxi2FiWUAN+0zpfSytqfVCSVmEWTx7QyVBAeOy6z7btWS4Tc702w+W6Chf3CNfdXLGkxALzLP
	ydWrXi0Hw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNYXg-00073S-C3; Wed, 30 Sep 2020 09:36:56 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNYXd-00072b-O1
 for linux-mtd@lists.infradead.org; Wed, 30 Sep 2020 09:36:54 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08U9aoRt042843;
 Wed, 30 Sep 2020 04:36:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1601458610;
 bh=sFPkPqeYpg9a/lBkzRRN9aDvogNT35tbuNNhoeQ3PUU=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=KQ+ZYMwV6+HJ1lCuvzMY5WXUE/oXOqZquFSNDODvW5SOpcJgRScxuCiuOoKEhsnv+
 Q8q/1DK/36wA+mbjnYkLzytOld13HuRcCPvlGQW3GpdvNJ/xQN5u5SIkj5s8lDUOU+
 TSi3fPvxS9WvihLdmihwR/SrmsXFnlMyvu4jbih4=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08U9aoHg026202;
 Wed, 30 Sep 2020 04:36:50 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 30
 Sep 2020 04:36:49 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 30 Sep 2020 04:36:49 -0500
Received: from [10.250.235.166] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08U9akFP083973;
 Wed, 30 Sep 2020 04:36:47 -0500
Subject: Re: [RESEND PATCH 1/2] mtd: spi-nor: do not touch TB bit without
 SPI_NOR_HAS_TB
To: Ivan Mikhaylov <i.mikhaylov@yadro.com>, Tudor Ambarus
 <tudor.ambarus@microchip.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>
References: <20200921112450.4824-1-i.mikhaylov@yadro.com>
 <20200921112450.4824-2-i.mikhaylov@yadro.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <9bfb10df-64d8-4a5e-b0ad-a8b5f4efc56f@ti.com>
Date: Wed, 30 Sep 2020 15:06:46 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200921112450.4824-2-i.mikhaylov@yadro.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200930_053653_881331_A05D2BBE 
X-CRM114-Status: GOOD (  19.30  )
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
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 9/21/20 4:54 PM, Ivan Mikhaylov wrote:
> Some chips like macronix don't have TB(Top/Bottom protection)
> bit in the status register. Do not write tb_mask inside status
> register, unless SPI_NOR_HAS_TB is present for the chip.
> 

Not entirely accurate.. Macronix chips have TB bit in config register
and is OTP and hence should not be touched ideally...

You still need to "read" that bit to determine actual scheme (Top vs
Bottom). This is needs to be done before 2/2 enables SPI_NOR_HAS_LOCK
flag for macronix flashes.

> Signed-off-by: Ivan Mikhaylov <i.mikhaylov@yadro.com>
> ---
>  drivers/mtd/spi-nor/core.c | 22 ++++++++++++++++------
>  1 file changed, 16 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 0369d98b2d12..f9853dd566dc 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -1735,13 +1735,18 @@ static int spi_nor_sr_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
>  			return -EINVAL;
>  	}
>  
> -	status_new = (status_old & ~mask & ~tb_mask) | val;
> +	if (nor->flags & SNOR_F_HAS_SR_TB)
> +		status_new = (status_old & ~mask & ~tb_mask) | val;
> +	else
> +		status_new = (status_old & ~mask) | val;
>  
>  	/* Disallow further writes if WP pin is asserted */
>  	status_new |= SR_SRWD;
>  

I guess macronix does not support SR_SRWD right? This needs special
treatment as well.

So either, macronix.c should implements its own locking ops or convert
this function in to more generic library so that its suitable to be
called from macronix.c file while hiding vendor specific stuff in that
driver,

Regards
Vignesh


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
