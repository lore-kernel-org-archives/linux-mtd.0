Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C996EC25B7E
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Jun 2024 07:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i+zPADKKjyi44lhrKQYtg02zraYwNngHVuDCls/F+Aw=; b=Dl2l9AxlqNpIoy
	obFh7V/Z4NHxbq8IWmVw8z6a6JSVi7o+emhADy8huSSnNFDwj96hoaeAVTFpMaKLMtDjGRRqYtV4Y
	bYCdCuHLG1p13nTVX1cq231H1xhQ5YzBXxuEwDfVCIvOE+EHB+wAKvnfFla7nbEJXqdiTZBrfe2Wt
	KPqt9iSFh070+hUHBsBC8x6/jS304eA4imqZwlydv/7fktESdYXYCfvR/OlG2UtuCGjUbJ0AlJbow
	S9TdzUKDw3mBdrtMfaXN0dGnghcSeOgV4Rdp5OPOcH8l0dNRGEu0JTzlFPlk7uspoznoa1NkD92G7
	x/WsAT1l1xuJu+mUisvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEOru-00000001YvJ-47aa;
	Tue, 04 Jun 2024 07:46:06 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEOrs-00000001Yur-15QX
	for linux-mtd@lists.infradead.org;
	Tue, 04 Jun 2024 07:46:05 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-a63359aaaa6so670708466b.2
        for <linux-mtd@lists.infradead.org>; Tue, 04 Jun 2024 00:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717487161; x=1718091961; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=15pEe5GNPxLteORBQfGrvAQ4jQMZUEhpWDnsiYVvo5o=;
        b=o6YbocefVWfwHsJwMcI13P1OTNP7mt7I7/dIPz1P3Vkm8gcWn0qs3j9fX6PTq3jMNk
         FGK4hfgQOQuxXDs8357dd0FoN1mtFTYtYujoOacWrkqTVb7SFQLSHKZrhiMyd3p+ZFFg
         FsK0skO7F4MOhvNlsOpYCzasqWR9G/ZPDUUOae958sOw+ZDNO/BkS/XntqTsca33+nWD
         j2vbq+ligzJzsMqeB5b/pLvDdBe/ULdpZZKTpu7j2d+THHi5HMg+iRSaoUaJBa9BqBD0
         kbRMt8/a//60fQLdr7wJL2AnBnGYL+9o5eFy/CCpO2Hw1VZBMuH6vzLubIJFV0kDxscg
         1VJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717487161; x=1718091961;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=15pEe5GNPxLteORBQfGrvAQ4jQMZUEhpWDnsiYVvo5o=;
        b=VEWzqPX+c6dqSyx5p0CrEnDxAV4n6POSVazTvW98/UhRPyHPtax4UmgnwcoSNtrmaH
         aeBaeQPIzGU6uB1SLu57HB5+qRpnAqho6Lk6UL5393/Afoco73SpODIZjsHxgRvdWpON
         Wt+kjjUWM+bqPaChavXKvfE7hYxKRdVqfyU45ZUrzXauNxU9XuAf8qXkHAxy9cXTQT6V
         zZIlNOsuKVvoFTtMPx9tUYArbyVpjy50zw9L0v/xEOu2a12gbvbtSCbJmXKS1rdLYIno
         Ml/rgqWF5nyK7PM5rN+2yjqIr8eVZ7SIxCUSwJyTY8xCD9zr9MkrBPjm9Pu4tr0Xe/r/
         XG9g==
X-Gm-Message-State: AOJu0YzMIOXwlFKPvxCOtSylNcccjsobWV1GHIXHztmdAf87wBITjfAh
	dkj8W+17a1jK8umqXRzzfaYoKdf7HxJPUw7cb7f8MESa2BvQmmBrcWIWImfsh10=
X-Google-Smtp-Source: AGHT+IHvUcA/6Oaq3UarCZk0mfTN19uu+Ne4PDIdlEpwTxN7BJtF7D3Gf5q3AHla316Pq+3QWSworw==
X-Received: by 2002:a17:906:eb46:b0:a68:bfe9:a111 with SMTP id a640c23a62f3a-a68bfe9a651mr545404266b.55.1717487161129;
        Tue, 04 Jun 2024 00:46:01 -0700 (PDT)
Received: from [192.168.0.107] ([79.115.63.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a68a552c902sm475478766b.191.2024.06.04.00.45.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jun 2024 00:46:00 -0700 (PDT)
Message-ID: <9e5a3c7a-54ce-4219-a37d-c08ae2af9c10@linaro.org>
Date: Tue, 4 Jun 2024 08:45:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: mtd: spi-nor: deprecate Everspin MRAM
 devices
To: Michael Walle <mwalle@kernel.org>, Pratyush Yadav <pratyush@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Thorsten Scherer <t.scherer@eckelmann.de>, Marek Vasut <marex@denx.de>,
 Imre Kaloz <kaloz@openwrt.org>, Andrew Lunn <andrew@lunn.ch>,
 Flavio Suligoi <f.suligoi@asem.it>
References: <20240604074231.1874972-1-mwalle@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20240604074231.1874972-1-mwalle@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240604_004604_357726_15CD9F24 
X-CRM114-Status: UNSURE (   5.37  )
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


Acked-by: Tudor Ambarus <tudor.ambarus@linaro.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
