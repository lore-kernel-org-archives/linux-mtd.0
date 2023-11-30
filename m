Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31379C10DC1
	for <linux-mtd@archiver.kernel.org>; Thu, 30 Nov 2023 09:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bvlLJugis7rmiaFwgy/pLeOgtpH7C5ZW+xRMYdmCsw8=; b=S+7eZ+I6+Z6d96
	ZSifnkckIVzkoBwAmknyicONp6Vwg884klySwYoEvOVL56mzSWsalAIY15AQmV2ZG8ikax4K+Ejq5
	4EEEDMC0hJrkwK9JOPayFhh/6pHBiN3bhW5mrbhNcDMyFE1ltwXmV90RxRRK4d5hMKHPOPcpaw2ZV
	qC5qFIjfSwzVYyyzUKbY3WJ6clNEO0g1L20oXa/ymBiW7VjYfvxpAX5X3OeXJTM0tyjyxsewIFSUf
	2j+kTkblO/+GrBoNqs0ke3SobqI3CAGLKtoey3/muDTE0b7L7RvEfn898OWOKY78OT1ow3ew5jZlt
	uRUjqkHm+Kws3KTHKQew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8dDV-00AJNQ-1C;
	Thu, 30 Nov 2023 09:20:17 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8dDT-00AJMs-1a
	for linux-mtd@lists.infradead.org;
	Thu, 30 Nov 2023 09:20:16 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2c9c5d30b32so8913841fa.2
        for <linux-mtd@lists.infradead.org>; Thu, 30 Nov 2023 01:20:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701336012; x=1701940812; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t6b6KMY0n/M+YsXFiDbvehOF3zPBGbEVpkXj4Ck+RiQ=;
        b=ThKKyh9VO6mWTyjfYGuQLtsj5C70Faa+SBbTVBGvJEp8OnI8w9pnKPpwb+1Dq9bH+K
         46EJCCweqvVynlYuQLZcTjzaGGYxME5LF35mFQoAk3S/33p8w9Q+J3kUL3Sxag5Aot2l
         PHvQZsbpmUWXaYUb7xgFg5M0ZWvqA1n3z2i+Y4Vwx2zWy6B5Q0vx3j8Fy4xnwTyvebFw
         /GVv2LoK2M+KmrUk25+5qocn3Mn3/r5nvKd988vH8DlZkbwdzgDO6fhW+YY9QHDy9Dr4
         PRbiLZxgQJ7k1tKjV9Rv228HYIKKuvh7Jbe+wMT8GH3eEY+NssRE7QPhZimyIUexylm+
         Gkbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701336012; x=1701940812;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t6b6KMY0n/M+YsXFiDbvehOF3zPBGbEVpkXj4Ck+RiQ=;
        b=FNMTbf2vxQE77q/TuitfhewgG6nr/dQGHrldYoexe1XQh4lhg/JiRMoINbmZ941u1n
         /vDUXRV+ArRjQtDSeZfkGziLezXDNcPeMjEwVn/E5rjt23KeUDAQkGQ3sW1fDIicCFoC
         HHeYHHuTQ2hYa8U3sQaT+FUL/qkOztZf4btKstCvrhBPJC3tbCJ/gBzfX4IXXkUc8795
         DXRz+1+4xo73otFD1r+MNoMXfvZOh/ItzJ2D0qvlWUcmfhMRSxM0EPOXLdcJYDmEaYbP
         p4oGgq98xP4l6XOEkwtmbVrDFVVYBgydRuq/IQMNwmDjsuxYjVdKyzKArzB09oXtlLVb
         U92w==
X-Gm-Message-State: AOJu0YykLk4Fk6eLLKZNxifda6eCe1/cTk5iruYHL1sz66dl3ZOCd/d/
	VNwkaYnpqU8NnaaLO+vRIaEnIQ==
X-Google-Smtp-Source: AGHT+IEaYhPPx9yJTn+Tt40iUWKql5jCkfrMLBxyzujYNVF6glNzpgT0IKlw+OZMcX2IHP9baN/WqA==
X-Received: by 2002:a2e:8ed2:0:b0:2c9:c0dc:b074 with SMTP id e18-20020a2e8ed2000000b002c9c0dcb074mr3036689ljl.3.1701336012029;
        Thu, 30 Nov 2023 01:20:12 -0800 (PST)
Received: from [192.168.2.107] ([79.115.63.75])
        by smtp.gmail.com with ESMTPSA id z12-20020a5d44cc000000b00332c6a52040sm955607wrr.100.2023.11.30.01.20.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Nov 2023 01:20:11 -0800 (PST)
Message-ID: <ce0800c9-513c-41f8-bb02-43b2f1d60092@linaro.org>
Date: Thu, 30 Nov 2023 09:20:04 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/2] mtd: spi-nor: Stop reporting warning message when
 soft reset is not suported
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
Cc: AceLan Kao <acelan.kao@canonical.com>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Dhruva Gole <d-gole@ti.com>, linux-mtd@lists.infradead.org,
 Kamal Dasu <kamal.dasu@broadcom.com>,
 =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Mario Kicherer <dev@kicherer.org>, Chuanhong Guo <gch981213@gmail.com>,
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231129064311.272422-1-acelan.kao@canonical.com>
 <20231129064311.272422-2-acelan.kao@canonical.com>
 <9c97e28e-fbb8-4a7f-8205-821fcbd579f6@linaro.org>
 <2e88fbd7-64ac-41a1-8368-edd430e86e6c@sirena.org.uk>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <2e88fbd7-64ac-41a1-8368-edd430e86e6c@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231130_012015_538974_2850434A 
X-CRM114-Status: GOOD (  10.28  )
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



On 11/29/23 21:19, Mark Brown wrote:
> On Wed, Nov 29, 2023 at 07:46:02AM +0000, Tudor Ambarus wrote:
> 
>> You haven't specified who shall take these patches. Is it fine for you
>> if I take just the SPI NOR bits? If you want Mark to queue both:
> 
> I can certainly take both.  I guess there's no build time dependency so
> we could each take the subsystem specific patch, though there'd be some
> bisection drift if that happens?

Right, please take both then. Thanks!

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
