Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FF4DEB64DC
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Jul 2023 16:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+NOJK6lhsfL8QkhuQHCsDs87whxhSX6JtiOjzCdbwmE=; b=lXhk5l8AH2mcTJ
	CjcR0YX7TRFj91Xa/biIxBjMqA8bvlJgnIa831+Ou+0ShnpxXxHy0Oxek8eSPimR2yX6Jf+q0qRGL
	lfjCubHerfGARnE/jI8dCADPup+4m8nn5TbdnWJCQXc99qTHhLnilRmw4AJUs+J6lYiyGNPCeqc9r
	N1zvR7Rbs/I/C7UMDJisnmUJeLGIpvlb7eYNiXgQHor1z4hsaDoSA60M9w7tuiDHKZSYSQNjQH8W4
	JyW0UHyJk5i165pIMpGjiaQf9niwlnKek1QadwqeBSCEaOrZXc4G5KQYFbSU+1Ern2nKbOu7WZo0/
	D7xjV9wzoEQOzKBbl6xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMtJh-00Eds7-2r;
	Fri, 21 Jul 2023 16:49:21 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMtJf-00EdrI-0J
	for linux-mtd@lists.infradead.org;
	Fri, 21 Jul 2023 16:49:20 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-992ace062f3so338587066b.2
        for <linux-mtd@lists.infradead.org>; Fri, 21 Jul 2023 09:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689958157; x=1690562957;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=htGfeFskadvzuCcRbflUv4vHcg2QL+whM4s2B5qFKc4=;
        b=SN+fF0iY/C+AeEPiEz09XPBNJvdTftLM78DXDeil9+rU5SE1BDNpaf5IiX7DTvpQ2E
         vZnSPXGyGWGQY29m7gS8r9bqMzECaC2uPTERBPHer0qPoebHLjdcZ1zxIiztK2HRQgDY
         yXaMU/cDeDhKsbQXgqxpneQ5noWMruuedz+xXFFwDfV3udl/Uc+VbSpmb16S5LTuPNWg
         bXQ88QXpDVZNODelxqoKfhNrJwtV/5MD8FfsuxYcFe0eGyCyzR+KKWLV54Rv577ZjWmT
         1cVsYGEEbBsw7YoYhKWcZBFvBrF8Cx1aMYFIKsT/1hVmMIJ0MdyC5WTwaMm/yTpvxXGg
         6oyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689958157; x=1690562957;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=htGfeFskadvzuCcRbflUv4vHcg2QL+whM4s2B5qFKc4=;
        b=ApOOZIF5FrGU15prBY6G3JDxhpcEbUiiY+DkmoL6HAc5u9N8Ms6MkLssFgjDpxp5qm
         THobGgDtEWS9U2X8r0YBwbhhNlXhxPacKIzW4Fc93e0kWoZyk2oGbt3cJ1BfEURJmnsl
         LNbYXBsV/cIGcnKv0Z3bpMMlXN6it+JsAWlPjyJpVaGhILjAwj3XiE9APc+LLcpS6KWo
         c29lMj+x9HJRwPxjW0mZqOEi0vBJATGirQgazGlr4aKlUGUrUUhWtz5/iStcQZRxWWY/
         2B0OUwMU83QXy16q7adRbdo5Ks/8F/zndnDL0OVUA+NWAJPPvP6XjG0dA5C40ZfvBpAi
         bJYg==
X-Gm-Message-State: ABy/qLY7EoFPoLtrKFgq91UF61HiPR9Ii9zR6Q9+0zAaaUELCA4vkTed
	yQbAHJyOOG9p6kgkLaNX6dS9Jw==
X-Google-Smtp-Source: APBJJlHjkNi3qyVP6wC/ZHkonLVw+XAUiL4bGHo8CHqZaO3edVDStcLKw5DDdfVUzG9amatSaliGlQ==
X-Received: by 2002:a17:906:8a54:b0:99a:e756:57bf with SMTP id gx20-20020a1709068a5400b0099ae75657bfmr2180935ejc.7.1689958156788;
        Fri, 21 Jul 2023 09:49:16 -0700 (PDT)
Received: from [192.168.2.173] ([79.115.63.16])
        by smtp.gmail.com with ESMTPSA id a6-20020a1709062b0600b0099297782aa9sm2361689ejg.49.2023.07.21.09.49.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Jul 2023 09:49:16 -0700 (PDT)
Message-ID: <df6159a0-0ae0-f6f9-9159-196a1a3b3694@linaro.org>
Date: Fri, 21 Jul 2023 19:49:14 +0300
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
In-Reply-To: <3bfbc316-2348-fb58-4026-4f38e8845264@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_094919_224589_3DDF8E1D 
X-CRM114-Status: UNSURE (   9.79  )
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


>>  static int cypress_nor_set_octal_dtr(struct spi_nor *nor, bool enable)
>>  {
> const struct spi_nor_flash_parameter *params = nor->params;
> 
>> +	if (!nor->params->vreg_offset) {
> 
> wouldn't hurt to check for params->n_dice as well, even though one
> implies the other. In the next patch you have a loop with n-dice being
> the max number of elements. If n-dice becomes zero sometime, the loop is
> skipped. Thus:
> 
> 	if (params->n_dice && !nor->params->vreg_offset)
> 
	if (!params->n_dice || !params->vreg_offset)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
