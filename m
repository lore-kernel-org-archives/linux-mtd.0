Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E381C48260
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Feb 2024 07:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JpAaxup4uTnbBNYZbG0heKAdTu7+SMYWvL5CW9J3fkI=; b=qBBSKYHAxYSlNK
	cyZq9+NWMvytM2+87SLMzJJPXzXkCZK+p4rDQmDYEjb8btHvsC8jYhGL2mURUS1/f+4/8q2ryACgp
	rtTiu9vvi7b39YBN0e4msPvtG38twscHqhq/YRj2IEctB9CF/W7un3dFkIsnLiy53gGpkW4VALwpg
	D4zYnzjV4V5AQNCR5xmuWJiZ/KVH4TzL0swTwuu25HD0ZZZPBt/ukY/E1Fga40t82jQE/IKzC9hEP
	vqQPfJsw+xtfg9k1RASwQU9eJ2dGLQGg766jbX8GEWjzdyl2+cuDIQiwfvjkHry43hI4OTTPYEdbo
	7y+qwsZCVbOo4jLOgKDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZnJb-00000008GBg-1XF0;
	Tue, 13 Feb 2024 07:34:51 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZnJW-00000008G9g-3uXK
	for linux-mtd@lists.infradead.org;
	Tue, 13 Feb 2024 07:34:48 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-40fd2f7ef55so28265715e9.0
        for <linux-mtd@lists.infradead.org>; Mon, 12 Feb 2024 23:34:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707809685; x=1708414485; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EAS30wnL6Rv1IC3CSnwsh+lVNpsYoIWrZeit9s0/DyM=;
        b=CCDVhtxliz5ZUqKIDkLKdflXQ+GQmz+bi57X4EMG2v7Gxi3uVnjacniAZJLTad+hBd
         aediK9nyfSIIAquBCV4LIeXT6O2NuMOa49sLeSJeNA8xt2i2AD/LD4VEfeAivQ0FC/ER
         wqTU2LbuDYSQ/eOnuGPiMR/2JXk78hNGITBhSgi3OmHvO8Cz6T8Aj9icMnLGKwQ8y8Hv
         76gTvpz02jb/YUKMJ+7eo3oov/pCSn7mz1FsqGHrofljBPvSvrxOdpgjhHx9F9jfE/Tx
         KpkJBCtF3+9gdJenqWT8VDioapns5uGJNOcqZqzS/0zyGjQm4BEVpCPw7dNRFFZTgEP9
         33cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707809685; x=1708414485;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EAS30wnL6Rv1IC3CSnwsh+lVNpsYoIWrZeit9s0/DyM=;
        b=qTBgUZp/+nNn0Q/zo01aC2JY852+O1ikFVskcaZnOzb+10lK6tEH4kF8PJ3hvG0Fx/
         kbv2uQ77LhcUTa952Z6FYtUL2aAcE+jw4diqi5SvhfRSE183+AcmfJrWYTDPyvClgfVS
         hCKsySn/fsBLlbPjkvfSzbrC/T4jyxIk/mF43EGuFrLn2ucXYggW4NIHJdX+kh8AdpZw
         ycRQem0bZuAcb8WVPut9yhHYSY/2UKQ4D+3Xx34hqk+CVRCs9yIy80RlYh6wEPvESW/C
         H0ohRBsJ6jfrCw2gbKpoHyP/B1dvi90cAXldy91R6LoZ5MiQNAdP4XeGcbR9O910b6g0
         U2gQ==
X-Gm-Message-State: AOJu0Yyi9ajXyaCOFAFQgdii+qO41Y6X1d7yJocuxptHFySnvIcZya9y
	hQpL89U2AVXEPZ5VuyVgePk0y5/iJCFvy4SJgU5WXmbCWI1v14SDu1XhIeorex98W7jxpEmLyhl
	A
X-Google-Smtp-Source: AGHT+IF7fxLrfe3YfzY4xqOtOPSFO23TmQZr7/A1GlgGB9VdskAAsmNPequsQTPsRrn5g06Jjq95VA==
X-Received: by 2002:a05:600c:35d2:b0:410:cb93:8a13 with SMTP id r18-20020a05600c35d200b00410cb938a13mr1347784wmq.5.1707809685173;
        Mon, 12 Feb 2024 23:34:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVZF7x/xO4caM3IQLN6ET8cEzWFuO3OlkNz2Isv7Z2uGhUGKYYDcCWuloenWhF/tMNU2ZZ6GX59xBFemfsCf1QFa0o1856vzlqqYNU7CjVLE9ICBCo7kHYXQUNgUJfwRHrTk9zdZfkongpsDGD9xbAPhmNltgz6K0BLXE+A3ODzwZk7BwYXAA2TQQUqULZ9gB3O+MzSjMNcf4vexx/6EzzDTMuKcpFRRhR9RxADCvPEBjqNrkKuBdLdcytW1eEZw/60lXkvdLHNMC7keb8wFWHWuqKPy12Om+6cmjRdjqrJrhw9CtNcfelUOKjz45nNxh5exVT5zhpAUiEdpRh9xYsR9pjcP+JAvGRx75HdV1t8daIR31tvLZrC9AY=
Received: from [192.168.1.20] ([178.197.223.6])
        by smtp.gmail.com with ESMTPSA id jg8-20020a05600ca00800b00410820995dcsm10256721wmb.23.2024.02.12.23.34.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Feb 2024 23:34:44 -0800 (PST)
Message-ID: <fbaad3c7-13b7-41a2-a8f6-7036ec1ca2fe@linaro.org>
Date: Tue, 13 Feb 2024 08:34:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/12] Add MP25 FMC2 support
Content-Language: en-US
To: Christophe Kerello <christophe.kerello@foss.st.com>,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, devicetree@vger.kernel.org
References: <20240212174822.77734-1-christophe.kerello@foss.st.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240212174822.77734-1-christophe.kerello@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240212_233447_101646_0959BF49 
X-CRM114-Status: UNSURE (   6.34  )
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

On 12/02/2024 18:48, Christophe Kerello wrote:
> Add MP25 SOC support in stm32_fmc2 drivers:
>  - Update stm32-fmc2-ebi driver to support FMC2 revision 2 and MP25 SOC.
>  - Update stm32_fmc2_nand driver to support FMC2 revision 2 and MP25 SOC

Why do you combine memory controller driver and NAND in one patchset if
there is no dependency? On any further submissions, please split
independent works.

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
