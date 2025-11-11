Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B03EECCF9E3
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Nov 2025 08:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=afGNYJxZjrseC/rlUT7vVVZ+bKcGtm2HL2WHxDw2hSs=; b=UBYLavkoCZ2pHP
	cKkF0hwidK1139+zwF3QDvBbVfb4FZZnak2Poa454CvH1wZIF/oTu/V9kfe587+6z+l38OfA98LZT
	trueNpET507mY6v4XiqMcdlka9lyeQfjOqZTSM7/bj2r70c0CbTR6bWV2MAN44HS9noXlK58CCdn2
	kIlZ0lPH4vyj7i1Sq3/xYGiO4DK78d134N2hAOyr/Ibrtxt/d3E8OVzk8m8fpahx3fX9Mh8yk9YaQ
	Qk/zg+AJ4V+6bjHM9E/Z+FYmEmogGe/U0PlJGH7CRp1T+EblbVf7Aq8kXSugVczUMKKszvwoa+9rc
	iHC5oXJnFsDflbqdTXHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIjfH-00000006mQ6-2czb;
	Tue, 11 Nov 2025 08:23:47 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIjfG-00000006mPA-0NWG
	for linux-mtd@lists.infradead.org;
	Tue, 11 Nov 2025 08:23:47 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-42b3720e58eso1947928f8f.3
        for <linux-mtd@lists.infradead.org>; Tue, 11 Nov 2025 00:23:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762849424; x=1763454224; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1A/s7LNYfJ23Wps55qnqVv15lrsujszwGxWt6oo6eiM=;
        b=sHp55C6Z+HnN0iPjJ6VW4uxK2CwM29Wc/rQdYzrvZF9e11TyezmuKnMVtLAbjx7J45
         0a14qOdZQ+b066tqKkFoQEPMX0ydeX87ut2GD+NOsWW2G3yNHa1Kcla+LD0suBCZjQ66
         yAlhSjlqwZXWG8mzWtR9ydif2UCdDxyGfZaMOaH0Iqy9CihgyXtlr/WCw/Ps8pnPRJDm
         aT5LRVZGqeNR+9YmCETa7EqHnDvIG97Lct5+4iZbzCHTS7Q65e1WXBR0t9DNPycb5DOj
         m7Q1mTEYrn8dD+Gf4rHgBhZsHhKmB9JOVuS7nduJomJCjieK9Z82aGBfUjQ5i5LVbxIc
         hKGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762849424; x=1763454224;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1A/s7LNYfJ23Wps55qnqVv15lrsujszwGxWt6oo6eiM=;
        b=OMiQ/G9eDY4NQpTd646ukwRkKzVSf94W1d3VVjQbP0B6/EXenlZ6w6sQ8eE4b6d50a
         JiWBuBG4hctv47FiZ50S4dG/hpcPAO2q1GfOrvoRD3+kjdq8dnBC62yDRJeYTzHznpin
         62jw0QwkYVLNRFmzdzE4cOc1krrSe+wUXvsUnNWTW+modh8iNIPEWfKJwY3QPJSM4v0h
         Oah+gDIuGAD/DHDFwbYPQJyxS24vYUEY0bbfdxGMThoVJ3prlZOOAe8vAopkB1g7fekb
         GXxPQAJjzm7TqhDdFTfXi/TUj9YTS2FRcXE+LeswjOG/+8kMtSydcSyEXie9HqAce2C2
         fIog==
X-Gm-Message-State: AOJu0Yzy9G24+s8IYvB37e/8itJ2mi/R8EgefjjNuySYUFVkIrHqQVmP
	9ruR9vZMVhYE3x4LAU2FxUx/SUyt545S4p3tNVz2YpFpvjPYarIaznErkNjCGShxpeQ=
X-Gm-Gg: ASbGncsCHM58JQUOII4VE7EwstOocATbOHz+47I+rk4UIH5Jx6fE6ANbKSpOtXcpnS7
	xNep7PfmeiXxrvuYUK5fog+jnrw/Vh4kvVboTGi49HLIngRAKHfaB9RrwtRjizDeOBPm4h3idDn
	3gqOFCV2IKTU6jCdasdwDtzyYYJ1HAPQSCK+2TrP0htJKblpnylzRoAYQdU2gRUo6JAl6UWqiJX
	QuPW3yTrZfdMz6c9zQoxMctWs4od9C56+RTujFw68v24hUiEdBV5zmaqaV+lnPw5CSNh+iImXmo
	3e1iJ2cFEchg9iwXi8Y7sYDg2qfNDq6/3KM+ehSOJl3RZRunrNffzr4N/O8YkN40N64GIspEuAL
	X+HigSVEkOGzisdcI4QfDDEqyS102jNzaPd2XYiBckZT/iVbca1OwH0k7e+DEOvCgjlJT0lvckK
	jiifn9Cw==
X-Google-Smtp-Source: AGHT+IGcFfxooTzh9xp8g3qMI+6yiTxMXMVuORbnPO/aK2mPEX+2okAsm7MZP8Iv/tFdfF65sQ80Tw==
X-Received: by 2002:a05:6000:4107:b0:42b:2a41:f3d with SMTP id ffacd0b85a97d-42b2dc2d0cbmr8067270f8f.19.1762849423687;
        Tue, 11 Nov 2025 00:23:43 -0800 (PST)
Received: from [10.11.12.107] ([5.12.85.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b314dae4bsm17131179f8f.34.2025.11.11.00.23.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Nov 2025 00:23:43 -0800 (PST)
Message-ID: <afe767f4-6534-40d7-b4c2-f4bf16cb74e3@linaro.org>
Date: Tue, 11 Nov 2025 10:23:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] mtd: spi-nor: micron-st: add mt35xu01gbba support
To: Bough Chen <haibo.chen@nxp.com>, Pratyush Yadav <pratyush@kernel.org>,
 Michael Walle <mwalle@kernel.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>
References: <20251110-nor-v1-0-cde50c81db05@nxp.com>
 <20251110-nor-v1-3-cde50c81db05@nxp.com>
 <b046d19f-6e55-47db-b7a8-6c8766da2e7f@linaro.org>
 <DU0PR04MB949675657F9A4C52A0C5E19B90CFA@DU0PR04MB9496.eurprd04.prod.outlook.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <DU0PR04MB949675657F9A4C52A0C5E19B90CFA@DU0PR04MB9496.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_002346_188581_4DEF22C5 
X-CRM114-Status: GOOD (  10.98  )
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

did you use html format when replying? Use plaintext, please.

On 11/11/25 9:54 AM, Bough Chen wrote:
>>> +		.size = SZ_128M,
> I did consider to remove the size and other flags since SFDP can handle that, but if remove the .size here.
> Micron spi-nor do not have a chance to execute
> 
> params->set_octal_dtr = micron_st_nor_set_octal_dtr;
> 
> because in micron-st, params->set_octal_dtr is defined in flash_info->fixups-> default_init.
> And flash_info->fixups-> default_init can only be called in spi_nor_init_params_deprecated-> spi_nor_manufacturer_init_params
> If no .size define in flash_info, spi_nor_needs_sfdp() will return true, no chance to call spi_nor_init_params_deprecated.
> 
> If need to remove the .size here, seems to move the params->set_octal_dtr to spi_nor_manufacturer-> fixups-> late_init or flash_info->fixups->late_init.
> 
> I notice macronix already did like that, I will add this change in the next version.

Yes, move that to late_int(). We'd like to remove default_init()
if possible.

Cheers,
ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
