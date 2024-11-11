Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2679D2E9EB
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2024 13:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lkLrx3AzK+TfAgNnPD6G7v4E6jrkHx/OeRycSuSchqg=; b=HV+xfiBV6/JCT0
	DwGstEL/Ois8eWSmCe64Do/Y3H0QHvaG89ta8XdlytBtkRckx7ZmaBGuvlC1LZPbvj8ScVCKDCJ3U
	ba1ifXbtpHJnSHKEQxLApQEP+5tDpQN1L3u5BrvaTQ6Hy6AGqdXjUZ+Gp/OffXdzxpXn2DrdS/u1s
	C3M1wuDa/rzPrg7fOp0Osnm+WV5lco5ughIHt4ER9FgbJBrrlUxV1EBLc/fVfAE3RPaonwkhGPlnS
	19GR5w0yFYT+H5iUtOqZTiTJHYatkzNYV472VEJMzQyj9cLl24H82BprDyRlTt0sMmtCxtf8seFhm
	SHGd1TIEnWcvMUtTmAxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAUJY-00000000AF4-3lMI;
	Mon, 11 Nov 2024 13:18:44 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAUJU-00000000AEZ-3C4t
	for linux-mtd@lists.infradead.org;
	Mon, 11 Nov 2024 13:18:42 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-431688d5127so34845885e9.0
        for <linux-mtd@lists.infradead.org>; Mon, 11 Nov 2024 05:18:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731331119; x=1731935919; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OBYsUQyuGnUCxPYNsjjy6hHWkk9kZSJSWORjW+FER9U=;
        b=ABjnkBsQdMJfrpPHtGGZhxhU5H22gfcwU5IaorRQRCFfgBilvrvPsWABuT9Cy+v3iV
         7RSdwN5g4LrXEzkUCq7X8Nl5u9Kf1QLT4py2bAEKj/+jaKdUiKB/ihu+i14rAWIFbTOe
         TpOHKOdRPnAiBN/h7907b8Ct4Ne9dLvUMSJqCOWtiaNk+ZjVnpTL82ZXqyzjGNLgGPvN
         a/qwd5WzXzJeeamFbeSklHEoWw/I/wfDvlSiEZTX5xu72IdQLnU316l6s8PQikY6oPgg
         KE97Z4dnM9vUeyr/nt+aR06/9bKZInr32OP+Bh0bvLEndHR/LxG8V+RnxrUNQt+F29E2
         I7TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731331119; x=1731935919;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OBYsUQyuGnUCxPYNsjjy6hHWkk9kZSJSWORjW+FER9U=;
        b=M4YNiF1zTL7B5IxA/Z6NnyzBaJ++lwjxa3AKjhiKQh484ursH73WI/svaCyr7ZUYQd
         /ujOkDvTcGZfxslQS+s2y+bGEJ9EpmbkGb4nH9+Y9M+bpdah2bsgSMjMXnZyvyz3XFSu
         s+vLFhdg7PO3ER2JAHA0gxuKWAZ62IGq9TnPN5DUWUDBhrBlmXjIbKKUJmCBVDalwVz3
         1jiwW1ExVBuhnn1IXCTQFnXUV6siFXR8iu1dBJXrNxh82UtFPstssF+U+C/cnllcv1IN
         DedTxj9OyoNKP/Fik6T6PaDivmfgUP4UouxxEuNuGyTdvDC3gdS/op/PcHbtiZRM0OiR
         +lpQ==
X-Forwarded-Encrypted: i=1; AJvYcCUeJBXeF6WGoPDTeQah1fRrp9GsAMTzFB0ypGpZXL5ew5PdPazPbLDK8dUuy2GTFa5KEOBAT+bGeC4=@lists.infradead.org
X-Gm-Message-State: AOJu0YyrHBJM16Pgem+y2MCYsUI7t0s1bjlYxy1ATx3Rv/bFFMnIu1Hk
	3yo+woQIA2Os7MJBNaqlrxP5QDONgVSKN7lGje6ANNzlYuuux7x5DW15smsf48w=
X-Google-Smtp-Source: AGHT+IHSKsyvNkcwhxPa212FM3ImPi89yRwKdA08hu4iTpCOmYpdNo98cNklwU6XYrZmAtlwh2MDGQ==
X-Received: by 2002:a05:600c:4507:b0:431:5c1c:71b6 with SMTP id 5b1f17b1804b1-432b750a433mr117114625e9.17.1731331118929;
        Mon, 11 Nov 2024 05:18:38 -0800 (PST)
Received: from [192.168.0.157] ([79.115.63.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432b0562860sm175494425e9.22.2024.11.11.05.18.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Nov 2024 05:18:38 -0800 (PST)
Message-ID: <59d350f3-73f7-411a-9ab2-0b2eee5247b0@linaro.org>
Date: Mon, 11 Nov 2024 13:18:36 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/24] spi: spi-mem: Add a new controller capability
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org
Cc: Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org,
 Steam Lin <stlin2@winbond.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Sanjay R Mehta <sanju.mehta@amd.com>, Han Xu <han.xu@nxp.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Haibo Chen <haibo.chen@nxp.com>, Yogesh Gaur <yogeshgaur.83@gmail.com>,
 Heiko Stuebner <heiko@sntech.de>, Michal Simek <michal.simek@amd.com>
References: <20241025161501.485684-1-miquel.raynal@bootlin.com>
 <20241025161501.485684-3-miquel.raynal@bootlin.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20241025161501.485684-3-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_051840_843526_602D044F 
X-CRM114-Status: GOOD (  11.59  )
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



On 10/25/24 5:14 PM, Miquel Raynal wrote:

cut

> 
> Among all the spi-memory controllers, I believe all are capable of

nit: SPI memory? or spi memory? but no "-" I think
> changing the spi frequency on the fly. Some of the drivers do not make
> any frequency setup though. And some others will derive a per-chip

nit: s/per-chip/per chip?

> pre-scaler value which will be used forever.

nit: s/pre-scaler/prescaler?

cut

> index 8963f236911b..379c048b2eb4 100644
> --- a/include/linux/spi/spi-mem.h
> +++ b/include/linux/spi/spi-mem.h
> @@ -306,10 +306,12 @@ struct spi_controller_mem_ops {
>   * struct spi_controller_mem_caps - SPI memory controller capabilities
>   * @dtr: Supports DTR operations
>   * @ecc: Supports operations with error correction
> + * @per_op_freq: Supports per-operation frequency switching

nit: s/per-operation/per operation?

If you fix the bug that you identified you can add my R-b tag,
regardless if you address these nits or not:

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
