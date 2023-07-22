Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA5F8EB64DA
	for <linux-mtd@archiver.kernel.org>; Sat, 22 Jul 2023 05:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jthYdNL8czBcr3qOx85n4Zc6CR3iSi40bxBftqlB9fc=; b=tVaRn96QKhK+4Z
	lFbHeCntL5gahH2dMfVf6lfOFSiss2r09l8qLVrygDBwL0RmlDSMkNfzHnSrv35u8bTuUZY2a2o/D
	7Hghh0b59nM331TfkYyQiACmcFQ8RwA/vnCD2jZCexa7ZwAB3bze9dB/OaIOzIOsylR9Nao93PKiW
	1p5pZRtSJ4KuEDwvLIWoMU64qgc3iN0vwog6cWx6vI9IC/+JndWy/UYIONHbWlQI57dSQbku+Mwrc
	ASU0T1m2f0qbqH/B9at/m2vUMMbNKerPa9rUoSDnRKo5hCjJAZWmLEe5gTqWNCLq18Nt6XM7A/Bwe
	vnrbDYyxL8V4htVwFwBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qN57a-00FrnT-2c;
	Sat, 22 Jul 2023 05:25:38 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qN57Y-00FrmN-0Y
	for linux-mtd@lists.infradead.org;
	Sat, 22 Jul 2023 05:25:37 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-51de9c2bc77so3538067a12.3
        for <linux-mtd@lists.infradead.org>; Fri, 21 Jul 2023 22:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690003524; x=1690608324;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fy9IZuZAHRcZ6IPO7rIQ+0apTp1te2RFUlhAWZRzo9s=;
        b=N8eGBbbxB4JfcvxgoCQvvk7gEGBCEWTQnzacFXWUH7DyX34rl+QQCPp6Pk4O9x5Bql
         8od0VT7OrCePje3m/vUgmElvPhM44FfUEMLY4EDhEoDiyqw082/kLPCjz31hPu4UP0AA
         l41DC/nVaU+iPTU9b3IUp/DsSYA2k3OK8DgJ7Y003s7XfQataPGtKTycCpNB9wKldCJA
         2QzC/+AAbrE4h4nFXBe/LJXaDdZB7BOwdVdkMg6WUqNxnTdrucaiohJE7Wq7ZIRT1JUo
         SClGav9MFkWELsSH5q0vLruJJ+CVORpgTvBBU8O/mwuOsM0mYVvccxmjMc3rkyEB2YDH
         kfrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690003524; x=1690608324;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fy9IZuZAHRcZ6IPO7rIQ+0apTp1te2RFUlhAWZRzo9s=;
        b=ix3QSMkaz9fGdO3RqVNc5x59usxAgIiyn3XwdmxItlBa2fpUk2mX97k1HDK0moP+bd
         FEqBLES8G+8hskYSLdPsQii4Krcz7zYUksz47r36nZanJzz326UHXqMBXt96K1PIYE9h
         N0ASCaWSTlEc6TNR+amN+UX+VG0bxgRjlX1Y74j8EiXPOzx8CSO4cpQBBDvDHhija6ik
         sJvJsNfPaLpqw6Pne1Ds8924FrliPI83Sm/oWd3wvFZVPThtzjbaIM7noFCjG4OlnOE+
         fR4Mhz4mEHkpdBRr9b05Okg8oQyt9f14oYn4Mvph1a5xVfp6H+9kXNbo04ijujTC28Rt
         i1eQ==
X-Gm-Message-State: ABy/qLaP0eUapFRXLV01X7WgesByuKffEp1hgBpxHWLQMnifVBfltyjz
	HPjRmBcyzPBPj+ka79Rd6OSrMQ==
X-Google-Smtp-Source: APBJJlGGQwnKuu7IGs31tZeYM5HZEhFb+xI+y22fN+hS1TEF5nziqm/xd2fwi2oxAPvKgq7XqTIDgQ==
X-Received: by 2002:a17:906:9bd2:b0:98d:9655:3fac with SMTP id de18-20020a1709069bd200b0098d96553facmr3326347ejc.71.1690003524530;
        Fri, 21 Jul 2023 22:25:24 -0700 (PDT)
Received: from [192.168.2.173] ([79.115.63.16])
        by smtp.gmail.com with ESMTPSA id w8-20020a170906130800b00992b510089asm3050138ejb.84.2023.07.21.22.25.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Jul 2023 22:25:23 -0700 (PDT)
Message-ID: <7628bec5-d956-4b66-2d34-3367f4a6bc43@linaro.org>
Date: Sat, 22 Jul 2023 08:25:22 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 4/8] mtd: spi-nor: spansion: switch set_octal_dtr
 method to use vreg_offset
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: tkuw584924@gmail.com, linux-mtd@lists.infradead.org
Cc: pratyush@kernel.org, michael@walle.cc, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, d-gole@ti.com, Bacem.Daassi@infineon.com,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
References: <cover.1689836065.git.Takahiro.Kuwano@infineon.com>
 <5c2fbc72d94c4f88bb4599c00c45fbaaf714b909.1689836066.git.Takahiro.Kuwano@infineon.com>
 <3bfbc316-2348-fb58-4026-4f38e8845264@linaro.org>
 <df6159a0-0ae0-f6f9-9159-196a1a3b3694@linaro.org>
In-Reply-To: <df6159a0-0ae0-f6f9-9159-196a1a3b3694@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_222536_218269_B203F112 
X-CRM114-Status: UNSURE (   9.08  )
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



On 21.07.2023 19:49, Tudor Ambarus wrote:
> 
>>>  static int cypress_nor_set_octal_dtr(struct spi_nor *nor, bool enable)
>>>  {
>> const struct spi_nor_flash_parameter *params = nor->params;
>>
>>> +	if (!nor->params->vreg_offset) {
>>
>> wouldn't hurt to check for params->n_dice as well, even though one
>> implies the other. In the next patch you have a loop with n-dice being
>> the max number of elements. If n-dice becomes zero sometime, the loop is
>> skipped. Thus:
>>
>> 	if (params->n_dice && !nor->params->vreg_offset)
>>
> 	if (!params->n_dice || !params->vreg_offset)

and this sanity check should be moved to s28hx_t_late_init(), this way
we do it once, as it's needed when setting
cypress_nor_sr_ready_and_clear() too.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
