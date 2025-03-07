Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35F87C19F32
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Mar 2025 15:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7uRpkV6pCMwvJ7a4Q758dYiT8s3d3t83qN7A/K2Gcvw=; b=bVD0pWfXtHe5fx
	XJ+EywgJpEEUXLPqj7/8pGMvlXnuN97LeBnm8vpKMZd8HkHbRmWwThiIXemEB+c3XHiYfIO2OMEqI
	u11U5NcBsjWAhSsXQ/Z40DJUgCasT3n8HNWMR/LhGWccbGvDGfKVcqeVkWK9ril37VegYtRiVs9Qs
	EYrZkjCJ03MfQ+2+rxd052hTTl0BeQ1xUlYxld8WY1NP99TKnMNr5G2XiCew3nXREFAthsC1YlTcL
	jvNzdhydezxT12Af2npVPenUgszAqxRx41mC9+xqGJfGKp26YF+fmy/yag3BdbwhUzfFPvse1XI8N
	ZAML1h6MRXrtcebDs6Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqZuD-0000000EkZp-1OTR;
	Fri, 07 Mar 2025 15:46:33 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqZnf-0000000Eicp-1WDh
	for linux-mtd@lists.infradead.org;
	Fri, 07 Mar 2025 15:39:48 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-aaec111762bso371570666b.2
        for <linux-mtd@lists.infradead.org>; Fri, 07 Mar 2025 07:39:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741361985; x=1741966785; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eJnVPeYafZvgHsrO+i6TK6Bs+zps5W9oOYtXQuffALk=;
        b=MsZCJB9IfxvzLTxdPsRCrSU6UjDfv0DA6GBpIxcltQ5nwk8YDFgIIPaemuTEal3yeB
         vHz1BRreheEJY2kPIXJdbwUPzdW+fDpbjGTaQ+7SDwQRKeWj+zNkc8Knc1IKlT2zqzOm
         wjGFBmXZsaHcgNVMzsb+yLcdxKD/LZu8QMYQGzFAr+ToD8lURImIR76ucybPwhGhY6EU
         yG5nbOIBUlh14s7fAJgubESWjisdhS2jSqLKrX+d2sHx7CrTdIyJHO0vME2juDOI4JTg
         L7pFTxRRyLASaf3v/02KKecSTFYROu3dmqWwdTN2cF0DEqI/tp7TOMwJxgTGhtrwMGq2
         XEIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741361985; x=1741966785;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eJnVPeYafZvgHsrO+i6TK6Bs+zps5W9oOYtXQuffALk=;
        b=CINFQaGEjABDA5KPNpUx2/X8S71lsMb6fMojWi+HViiQHjoW8qC19vzEZ5LAgiCjzU
         M6gGPhi+DpDTuRnJhnxK57JseKaewG04WJKi2YTa855funqkL9MUIv9fH1CleHgNjEox
         Ezs5gmfpx6A7PMwKqD1aZtS/kJQZ3snsYdBFH14RiSLly9axGkmE8MMPSVWAKTtsmlcy
         Qua7fKVhmwiZMtgBhqkqVI9VL1F/fK+iAJp79/hJS8zI/084Yjapjs96DFZxnC0bvzuI
         JVlv5hZrDm8ENm8Izh7F8GVM2G6FKyDWoEpRzzwD6LOyvgKIFndbK+3qkLGvb4Jsuw9I
         XILA==
X-Forwarded-Encrypted: i=1; AJvYcCW4ZFRzhetNTPb2jHsw03JMqr6UteO6IxNGZam8W73nndAbNDcGJ311C1Cd6abxOZgit7aNLjw2bL4=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw682ZlCb7zOysWCncQGknI3MZ9APfiiOQWViymGR8CnpTPgyWQ
	fwAwXi0qvmalV3Wq9WBvHRiD5/5/bqW52PnzpvDSJnyZx8thpFZFrEHzvk92LWE=
X-Gm-Gg: ASbGncsbWSDRFBL0zBXQ3bNj3MyB5uj9qNO8hrZArU3OboTVw/s7J23lxX8OQZ414wk
	ZGbe+XtiRGIZzTbna6ay6dAnCgjTLBz88bO4cKwfDDJK1DuwZIo3YQNpVPpC+UzgZBYa8SUoi8Y
	vEe2Tph7nonjoIqrhh3UXycRlo/APZqdgBn+IjgqZP8cG03QGNMeWQTs5fGYhjw7y6WpiE7iSZS
	UaolGAZDnro2DalfGRBOX+6nqntBW+UYFD+U/j3+ilbSIFMtnCUpA9y9Gpy/xpCpsIZOn2ZEs04
	Xrx9VbjNl41T8zd3e4G4PySVWhrsnlxE8KjNXpXzahKFySf4rmxFUA==
X-Google-Smtp-Source: AGHT+IGuXNtyZP42uxMpXFuXCVaR2WuOwofap6VO1OWEa4yHj33RgMikNGqzDq06MdXQjNJZWtTcvg==
X-Received: by 2002:a17:906:f593:b0:ac1:db49:99a3 with SMTP id a640c23a62f3a-ac252fc6bdemr449710966b.40.1741361985480;
        Fri, 07 Mar 2025 07:39:45 -0800 (PST)
Received: from [192.168.0.14] ([79.115.63.206])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac239488be1sm293181466b.74.2025.03.07.07.39.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Mar 2025 07:39:45 -0800 (PST)
Message-ID: <80da4df1-cd35-469b-a636-8f405358ef00@linaro.org>
Date: Fri, 7 Mar 2025 15:39:43 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/21] mtd: spinand: Use more specific naming for the
 write enable/disable op
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Santhosh Kumar K <s-k6@ti.com>
Cc: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Steam Lin <stlin2@winbond.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250307-winbond-6-14-rc1-octal-v1-0-45c1e074ad74@bootlin.com>
 <20250307-winbond-6-14-rc1-octal-v1-2-45c1e074ad74@bootlin.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20250307-winbond-6-14-rc1-octal-v1-2-45c1e074ad74@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_073947_405534_1F06ADAA 
X-CRM114-Status: UNSURE (   5.34  )
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



On 3/7/25 3:08 PM, Miquel Raynal wrote:
> -#define SPINAND_WR_EN_DIS_OP(enable)					\
> +#define SPINAND_WR_EN_DIS_1S_0_0_OP(enable)				\
>  	SPI_MEM_OP(SPI_MEM_OP_CMD((enable) ? 0x06 : 0x04, 1),		\
>  		   SPI_MEM_OP_NO_ADDR,					\
>  		   SPI_MEM_OP_NO_DUMMY,					\

here too, I lean towards keeping the name as it was, but maybe others
can jump in.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
