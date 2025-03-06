Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59D61C282D1
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Mar 2025 09:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=upTyScOLLT9WairslH+0K/7AiyauqFWe8MCu63dOwwU=; b=f+ZqRxIkkvwzwr
	sNitxKMKDzR5Vw3AGwFY1R8dwxQ9C+YO0QVDeu9lHki7HndirGPeXyhdbYKx6Ytb0omCXMpiiQJlp
	HfibeBaBgp8m/cFBOafB6waBHzhk9Eo/dsD+MOJQHOaWNrqdrOpeV8w8hkyx+ve2r5aLbWEj8wskF
	LvufmzZ+HFenG8OmpNuO+JQRYNpTdMmzd2AaMYabAJqGun8vEIwM6FK0/gKXx1wsdu+RVYGJ1N7LK
	jxZ2O3CvPawn14dH5D5NthfbWgJUMWg3/M1MNcy52AZn3908/MKKouZ9WjbL2hHoJ2B9nQawZj6QV
	LHiLRoa++hkTXZ7SH4RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq7Mp-0000000ASja-13di;
	Thu, 06 Mar 2025 09:18:11 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq7Al-0000000AQsg-2YyQ
	for linux-mtd@lists.infradead.org;
	Thu, 06 Mar 2025 09:05:44 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-43bd03ed604so3241495e9.2
        for <linux-mtd@lists.infradead.org>; Thu, 06 Mar 2025 01:05:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741251942; x=1741856742; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=adQB8+6Zw/sSgz1UwZBYDa6M1wKK+PoZRlb7G1nfMus=;
        b=t7T4xh/ib+fPqVL07f3iY1ynZv85Pfzzbe7kF+HnHLTnZ+KtrSVcyHFETwGqXmRmJ9
         +RtQWUPpaILoW1+Ew9CYqeZy2ALx9z4mUgffH0VhTZ43xofNGIQgtCAVG4PhyGjj8/Qm
         OkyezDxNRVPVWw6yNBzGIl1KqYpDKJKCWhJZRTE1AEML4glbiapoJPNYj5ly9d+gMXJA
         9wAEzh4HLV/9jCqGi1jx3BsenmujEL5I8DywxmO4IShKrtzQaW+peDqSzCTNtO7nGXe2
         JUnTCftOSfd4reOonh87eikB2FASl+7wuZvKubDgLs4iYaFYTpHOD87ibbsc8AvrYxLU
         8jqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741251942; x=1741856742;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=adQB8+6Zw/sSgz1UwZBYDa6M1wKK+PoZRlb7G1nfMus=;
        b=f/sVGIEObKmltkfllNGAWB+O9SzQwzFjQcmtn0PwkRuln/vzFabin/kdwdFTBc3tfI
         7WISaS5PjAQyN/xBOfovExXU+cpuvy02Y3KbhH8ifEOMdd7cKAoUoDLDooSj04v/GMbG
         79SoYTVtT/VqRSOHcErUN235xm6tD7DrRKEwtmij25qSciWIuq6PxwZh2LEvyw5KOIBj
         nxbl7vYOKcH8fUm4zm1IyO14mNDOgcpBmkOCXjIrKWEdpkSgA3n3liVCPEXcFzUEm2t9
         OVqqxaI6bqXo2zAIBASoeVfjKBvA3bPIuN6K00dNNuA/5/ggD5agawPftyRSddFo1BGl
         gwBA==
X-Forwarded-Encrypted: i=1; AJvYcCWNoEQ2W5cvH/g7zt/HJPCkUtrz3IAmtcN+zBccrO9Pv6hmBJbV9yX6kvqfI9TN14t9r+b7Svh2ES0=@lists.infradead.org
X-Gm-Message-State: AOJu0YwRZlXtEIgZoDy2WVG6Wz03cUWLVYOWQkXm9It40OhVCLEOaVc7
	Le4W4fuLOazn26dnRsUsulRdQ7QWvnu2ZnPvXtl0Bk4C1ythV3d/PjQ31WbADic6rvhYBbvAwUq
	I
X-Gm-Gg: ASbGncsjdxsn1gvKwUjH4b57Gs3H4cFnDAvQSKG7WU1fiFlBoxbJn8nKsUtCHCPhAwm
	gJ1FdLGDp3LXSavjb520gICdZIkisFXVbDvbSk1ocrGKeJjc6QXYWU/wsaFGAcTHUmlKl4HDF2T
	XWD1zqgdFFDLMlY6rf0c5T/PEKdDCKHLoPt3rt+Q+QuFsRySraqjekdgrIBlcTM3PNqHSh9s85p
	4yi2hztlPXQIhQ6ZLnhth2CFSjpih3PbkiAsbrHMLJsfqt9YL1tViHce1jTZ7M8r5enEpT8H5lC
	GCP7m/74fKKnq4p0EYD2PlndQpZTQ79rla792OAi/Rg1udkjAeYZXg==
X-Google-Smtp-Source: AGHT+IG2WR6pm+lQbLvv11v29B3gp/STcFJfO0QYU/AqGm6a2aoZ3odgYlQN5EIQzEwh2KMIlvABhg==
X-Received: by 2002:a05:6000:2c5:b0:390:f9d0:5ed with SMTP id ffacd0b85a97d-3911f714ad5mr4725263f8f.1.1741251941841;
        Thu, 06 Mar 2025 01:05:41 -0800 (PST)
Received: from [192.168.0.14] ([79.115.63.206])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912c0e2f10sm1366109f8f.65.2025.03.06.01.05.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Mar 2025 01:05:40 -0800 (PST)
Message-ID: <a073191e-afab-484e-9659-66b957301db1@linaro.org>
Date: Thu, 6 Mar 2025 09:05:39 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] spi: spi-mem: Introduce a default ->exec_op() debug log
To: Miquel Raynal <miquel.raynal@bootlin.com>, Mark Brown
 <broonie@kernel.org>, linux-spi@vger.kernel.org
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Pratyush Yadav <pratyush@kernel.org>,
 Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250305201140.2513431-1-miquel.raynal@bootlin.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20250305201140.2513431-1-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_010543_677854_23A4C627 
X-CRM114-Status: UNSURE (   7.74  )
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



On 3/5/25 8:11 PM, Miquel Raynal wrote:
> --- a/drivers/spi/spi-mem.c
> +++ b/drivers/spi/spi-mem.c
> @@ -377,6 +377,17 @@ int spi_mem_exec_op(struct spi_mem *mem, const struct spi_mem_op *op)
>  	/* Make sure the operation frequency is correct before going futher */
>  	spi_mem_adjust_op_freq(mem, (struct spi_mem_op *)op);
>  
> +	dev_dbg(&mem->spi->dev, "[cmd: 0x%02x][%dB addr: %#8llx][%dB dummy][%4dB data %s] %d%c-%d%c-%d%c-%d%c @ %uHz\n",

Isn't this too "chatty", especially on page program ops? I wouldn't be
surprised if the prints introduce timings that change controller's
behavior. How about using dev_vdbg?

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
