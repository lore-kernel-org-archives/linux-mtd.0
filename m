Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 458CAE7108F
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Sep 2023 15:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lxfJir87X1kcCMKn3tA36cj1ZDhr7wXt8eNj7fE/2ss=; b=EOzRYILVyU44nG
	YqKwNPz3zOWaamiDho3FwvsKzUEcNhG5POrVqnYA1JvdvFMFJDJAIqQkh4lmZz/Waky5xgx1hce52
	vFTuJZySf4fz1A0njPlFxxOqNyi5vqPR7IGHW+MRhq0En041kEmSdGviDPfZKQ5TcrQv9n4tpIx3y
	0+1faGJYeUruRcw1xgWxLtGMbemcGK7SKvUbEX7fENbF8l6McVEw/E+eat58IsRVdBxix93dBlwae
	dqH9eyoXsh2fMhvcShVIzP/cteoVJ1edHebUJDiawJEVtlxPAO+VQldCn0Mc4iGTX1crN2DFxkVwI
	eg84yVdL3oUoHr9tKePw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjLsX-006RMQ-1h;
	Thu, 21 Sep 2023 15:46:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjKme-006Iyw-24
	for linux-mtd@bombadil.infradead.org;
	Thu, 21 Sep 2023 14:36:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=BRjD71BxaHKeKUao5JkBY66AYjHKMR6kgB3U+BDfPis=; b=adjMKA/qqiAf73rBDpk3l5IkRG
	pEKQ+S/Xr3rEU5ZeMN1kp51MIxZtORHveqcf0kqzcNuV8FyN/oRM4NLuq3Iua6z+qHfmYstK0Q4kC
	3xRIX0WHdS7Ndha2TwcTcpq1gs+0sa1hhcCnsVHzhhWAYmdsTFWacATrngpvfoKFKJAhVqGUoWZ07
	q7buKnXJS7rCSISwjacHae0juoE0hPs89uk+t26bX4y4oR2/5q3SdKpdXbH13B9LphGBxptwKPQ9A
	+2shJ/XucOE8v3iEeXphYs5IjrRpj6yI+HoXULUXzcgQCUO9HHYGoyLll6QrQX+owcg6K8vAlOkef
	1Xzv7fug==;
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjKma-00FRu3-0F
	for linux-mtd@lists.infradead.org;
	Thu, 21 Sep 2023 14:35:59 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-99c3d3c3db9so132819766b.3
        for <linux-mtd@lists.infradead.org>; Thu, 21 Sep 2023 07:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695306953; x=1695911753; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BRjD71BxaHKeKUao5JkBY66AYjHKMR6kgB3U+BDfPis=;
        b=qRL2M47zmhQ0l6j+l3rl1HtCda0LS849L0+BETabnyZULRCFMfYxQ3WLNTmd7WktoD
         PlVaIyuINe5ag8GbQwshmJfpVnT5G19LBm6r0GzOH3nprwnXCns94550U0FPWhSzs6vO
         ZR6IWQxiTrMjsdeSFUzRV1kp4OG+3pjdPuOf+qkPEbEP2MNSutJGNBhS6fq01tVTTyUm
         yelUHabD/nZRYef8IBbNjv+j8JKJ36ZqX5T85iclZaEqCJVqhHn+Z3Bz/cN+Be2FFfAV
         r6RB50Ws0cQpTU/SHLq95EXr2E3NBuYuCMAl/ORl6JEjgsKhwPy+HNpsHVZUX05QNRNk
         tSPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695306953; x=1695911753;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BRjD71BxaHKeKUao5JkBY66AYjHKMR6kgB3U+BDfPis=;
        b=GWKPH7U6MwT/5oxLMV65BVyQ3Z1/oXakjcBjNitnUUz/24GM2oWw09IfCPCSs0vrwf
         0ljutvWwAERQhhSuknKl4Dz3BvhMN6fzB8c6BulRQh5kIk0rgRXr2DRnpqonhvFccvrb
         DWIQjkjAGBrDJfFf/XO41Fguzl4YfS+J1Y6mF/oDQ53v/V4zJLhqzN0nXWCe+plLPdoB
         gpKuMEo6VzrvDOWz0lneOTJ+0TW4zS2vcU8uKndouj/KdosWyolOUqVYgGErXfRZhxYp
         ZMqzKKAkZliF05vKhTlqX/doQxtYHnRa+d/yMvfbxCScrepPRi9ABcwGATYk2bblhgx5
         twPQ==
X-Gm-Message-State: AOJu0Yx/70jS1HtyGv+mE3syapVbh+EXO+guI5IyxI0HU8P4JEJ2HsCH
	wwb+rnLRVbLeZcqWmLBzbIlxbOTl5yZ0hqifDVj2Ig==
X-Google-Smtp-Source: AGHT+IG20+78STBi2PpMkzT53VyFCQlg3f49O0y4ik5lHqELKdgTjzje3z/jrKlwq+zFG+cbW++8sA==
X-Received: by 2002:a17:906:10a:b0:9ae:6355:afe9 with SMTP id 10-20020a170906010a00b009ae6355afe9mr2017506eje.52.1695306953057;
        Thu, 21 Sep 2023 07:35:53 -0700 (PDT)
Received: from [172.20.34.61] (static-212-193-78-212.thenetworkfactory.nl. [212.78.193.212])
        by smtp.gmail.com with ESMTPSA id cb8-20020a170906a44800b00988dbbd1f7esm1118264ejb.213.2023.09.21.07.35.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Sep 2023 07:35:52 -0700 (PDT)
Message-ID: <4425afd4-c38c-4f27-96a6-9833fe2401b4@linaro.org>
Date: Thu, 21 Sep 2023 15:35:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mtd: micron-st: enable lock/unlock for mt25qu512a
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: SHUKLA Mamta Ramendra <mamta.shukla@leica-geosystems.com>,
 "pratyush@kernel.org" <pratyush@kernel.org>,
 "michael@walle.cc" <michael@walle.cc>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
 "richard@nod.at" <richard@nod.at>, "vigneshr@ti.com" <vigneshr@ti.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: GEO-CHHER-bsp-development <bsp-development.geo@leica-geosystems.com>
References: <20230705154942.3936658-1-mamta.shukla@leica-geosystems.com>
 <19800e51-a871-be9f-9eb5-5829237e2613@linaro.org>
 <a8271289-0611-4e37-cf37-0be19a85656b@leica-geosystems.com>
 <084ed945-7674-280f-5866-9238473a294d@leica-geosystems.com>
 <17989610-d069-40e2-9b4d-7ca6bdf2497e@linaro.org>
In-Reply-To: <17989610-d069-40e2-9b4d-7ca6bdf2497e@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_153557_711832_2B2B7AFC 
X-CRM114-Status: GOOD (  14.08  )
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



On 9/21/23 15:31, Tudor Ambarus wrote:
cut
> 
> So the first commit will look like:
> diff --git a/drivers/mtd/spi-nor/micron-st.c
> b/drivers/mtd/spi-nor/micron-st.c
> index 4afcfc57c896..a8da1f18e335 100644
> --- a/drivers/mtd/spi-nor/micron-st.c
> +++ b/drivers/mtd/spi-nor/micron-st.c
> @@ -405,9 +405,6 @@ static const struct flash_info st_nor_parts[] = {
>         }, {
>                 .id = SNOR_ID(0x20, 0xbb, 0x20, 0x10, 0x44, 0x00),
>                 .name = "mt25qu512a",
> -               .size = SZ_64M,
> -               .no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ |
> SPI_NOR_QUAD_READ,
> -               .fixup_flags = SPI_NOR_4B_OPCODES,

since we removed the 4b-opcodes flag here,
>                 .mfr_flags = USE_FSR,
>         }, {
>                 .id = SNOR_ID(0x20, 0xbb, 0x20),
> 
> and the second one will add just the BP support, something like:
> diff --git a/drivers/mtd/spi-nor/micron-st.c
> b/drivers/mtd/spi-nor/micron-st.c
> index a8da1f18e335..fdafbfa0f936 100644
> --- a/drivers/mtd/spi-nor/micron-st.c
> +++ b/drivers/mtd/spi-nor/micron-st.c
> @@ -405,6 +405,8 @@ static const struct flash_info st_nor_parts[] = {
>         }, {
>                 .id = SNOR_ID(0x20, 0xbb, 0x20, 0x10, 0x44, 0x00),
>                 .name = "mt25qu512a",
> +               .flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB |
> SPI_NOR_4BIT_BP |
> +                        SPI_NOR_BP3_SR_BIT6,
>                 .mfr_flags = USE_FSR,
>         }, {
>                 .id = SNOR_ID(0x20, 0xbb, 0x20),
> 
> Of course, I expect you to run again the mtd_debug tests and also verify
> the locking. Thanks!

would also be good if you can also verify that 4BAIT SFDP table is
present and you still use the 4B opcodes after the change.

> 
> Cheers,
> ta
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
