Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCFC4D2E9F0
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2024 14:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JoEo4ybOfLU0JaN7FyMOKEnJ9J+XHdrwF/pOoBdZAA0=; b=mVw8tQSMjskfkv
	rwUQLs06mu0xACUUhFG/58+vPk8U6Vja7l4eyomZREIXk7tbxDl+6i/FgX8sGcCabRqwkMVrkXHut
	qvnMGBIhyFLeTCF3GsVWFOlLuz+qiC4YfHxCUFmNQbmBMFQKhmXWWSDuFVv7aTmPvrOTSlwpVzJs1
	QYmvEPSBjo0dHuVpZ2oI9L2o56L+XamXxWyfxfe7Rmy7KEuWaUv7Ld+VZ9upWS1fSDr8dmASZ3qeu
	E9XAfuarQcd64ZJYjCy39r9aVEvC3eKfu5Y3Cgi7N1fc+czDXulp2UpcMpmSjWoN0+sfafGzVWB14
	3xNW08sHHFHfw/9f9Ybg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAVVG-00000000L64-34XJ;
	Mon, 11 Nov 2024 14:34:54 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAVSy-00000000Km1-2Xhb
	for linux-mtd@lists.infradead.org;
	Mon, 11 Nov 2024 14:32:34 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2fb4af0b6beso59893111fa.3
        for <linux-mtd@lists.infradead.org>; Mon, 11 Nov 2024 06:32:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731335550; x=1731940350; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vHLJ9CKALbizTaLEIHvPwHj1Z1X+PY0wBl98yEJ8MvQ=;
        b=ZApJnZoBF3wRLwRxzL+tZh3EPioPpLq5/7T1HRrxoj5s+4FVk8j4HnWMRbpmmTkBd1
         pBi3F8eff4ugglyu0I2xeW+OjUb6gxSwHhoO+bfH7z2sEi3amv1AA1umCGQMKdDfBM9z
         AepmIxsXGwu5vFyZQ/2AkNsmSzvF0a9K63etU9koLVeSfI0h8OVuW5vXTvz4hI10ibkY
         gHSrraqbZ0VS0zgS97w4XxxMkgeb17E9KTQqX9vq47FBGszBOrsxcVNUwcw2ChI28Iry
         mejnceixNVyhBPW7iVCGADVIQmVrfnFarZvTnxEIp31wPTFSIEgGQYKOpkwafL2mGD/r
         VfUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731335550; x=1731940350;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vHLJ9CKALbizTaLEIHvPwHj1Z1X+PY0wBl98yEJ8MvQ=;
        b=Hep6C3zYHwPktxxWyKAMZvBeL3vzp+sXg6T39yNx3WGQlWBnsmw7glgF0VhJIG7J6r
         GVbjCY0AebEZAJ5wkbJeyMh2wlLh4iu24JdXxob/hzld6Z6XhVtCrghEAAHSYjrmB8MF
         IIwKm9Xj76VbbXpXox3L1NoKzwzQZ9ua5jEci1bkm6SCMBy8AKY+pbnjDjwlSRrHlKIR
         NfK/ExOr0btDjQsPiUjZsR6FijJLLoDHEV6V2Fi3SmP1X1LU7g/SrBllRBBSF/cg8muu
         27Y59ZVWzvEwmO8bOmsl9557ZoYN90axRXvPUa/MJTgU/+dvfmFZ/iETRPyWpX/x7GdT
         gYzA==
X-Forwarded-Encrypted: i=1; AJvYcCV33LqiFUPvjDA1LPs4iCWjNoDk/40+negioG5T1GoQn6m9u34ifv6tUAZsD9wEXJSrQU5cPbnCKao=@lists.infradead.org
X-Gm-Message-State: AOJu0YzRCNEvtce4l/+dSayXsqwnlY8B6A4W0aUqIisouh9AVjH+OPpP
	ZMxylw8ASeZK/rNgDrWMWOLuZ+dl+r/ukAywuqmc0Ywhgjb/wvIDmrxA1vMBUUA=
X-Google-Smtp-Source: AGHT+IEHPK9fFLM4E1mAc55fQigYsoEvrjbPkKaygj5mVOLf4TYnql5Q4+OILHodj38uuQMxRGvOsA==
X-Received: by 2002:a2e:a802:0:b0:2fa:d604:e522 with SMTP id 38308e7fff4ca-2ff20080d77mr90396991fa.0.1731335550281;
        Mon, 11 Nov 2024 06:32:30 -0800 (PST)
Received: from [192.168.0.157] ([79.115.63.225])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0df0745sm600892966b.172.2024.11.11.06.32.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Nov 2024 06:32:29 -0800 (PST)
Message-ID: <7871b283-7623-4a21-ab75-42359a7c29ae@linaro.org>
Date: Mon, 11 Nov 2024 14:32:27 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 20/24] spi: spi-mem: Reorder SPI_MEM_OP_CMD internals
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
 <20241025161501.485684-21-miquel.raynal@bootlin.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20241025161501.485684-21-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_063232_704251_55372B54 
X-CRM114-Status: GOOD (  15.80  )
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
> Follow the order used by all the other similar macros:
> - nbytes
> - value/buffer
> - buswidth
> - other fields
> 
> There is no functional change.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  include/linux/spi/spi-mem.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/spi/spi-mem.h b/include/linux/spi/spi-mem.h
> index 379c048b2eb4..318ea7b193cc 100644
> --- a/include/linux/spi/spi-mem.h
> +++ b/include/linux/spi/spi-mem.h
> @@ -15,9 +15,9 @@
>  
>  #define SPI_MEM_OP_CMD(__opcode, __buswidth)			\
>  	{							\
> -		.buswidth = __buswidth,				\
> -		.opcode = __opcode,				\
>  		.nbytes = 1,					\
> +		.opcode = __opcode,				\
> +		.buswidth = __buswidth,				\
>  	}
>  

I don't mind, but shouldn't we follow the order used at struct declaration?

struct spi_mem_op {
	struct {
		u8 nbytes;
		u8 buswidth;
		u8 dtr : 1;
		u8 __pad : 7;
		u16 opcode;
	} cmd;


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
