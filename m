Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB205C3601B
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Apr 2025 10:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x6jRuVhqKOaZZHEpU8XZKjlRJq2uvFBQVqggXULDiao=; b=akKxwV790Wa8mA
	3KFq6w7CTz3Rp272bxXMmUNGKtDBsq4P8iDeDg/Lmodj9mJMdvavZ2wBdeyggxl085MG2hB2mxpvT
	6CWpiq3x4kxitebtaadZB0Ln0ENz3bYWCpznOFXVfjuMxXFXiRzWxJXmM+Bv3zsBEo5zl34Dh56IS
	DcbbTcAabQEyPtzTBK/XfrQO5DDboHynso+TI/0zrA380DkAnzQCdJRE0TJkpI5cfL/mIUO3r7PsY
	KlghXyrPvQ06saj/Q/96Xt5pcOicRXRL8CmqThl2WjHZt7PTivHTYfvWegBdF0Ksa5gYVPR4th/XG
	7cr9d3fLMuoHD+UvEKDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Hqn-00000008ZpJ-0nbV;
	Thu, 03 Apr 2025 10:31:09 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0HZu-00000008WTW-2KMb
	for linux-mtd@lists.infradead.org;
	Thu, 03 Apr 2025 10:13:43 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3995ff6b066so383155f8f.3
        for <linux-mtd@lists.infradead.org>; Thu, 03 Apr 2025 03:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743675221; x=1744280021; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MUuASJ5hScoSUmLABElHv3yXRMZ9c2GHR1Zzdm5d/R4=;
        b=Se1/GGDSxII4s2U7kqzvBIdPsF+RsN594Z1p3eZwc/CPiFCGg+HUhYcb42TAlDHFhb
         Mwd1BFq6ebHhape3oLHTQFC829oo5KVx6VMB/gj4sui6RvQAeslIhazEwFQPVorJ7XVc
         CuSxw1vlNQa0cUzZVVpVcza9lEWcw18/UFWZR3i2ud/l/5uQpHbiuMtoD7izWHH5s36j
         dwK3/m6BhXhExhg37hNym2KZ59lDs3YI42hKNfCIWLwVPhBQ9rndVUiwGMu66lDes3rx
         VuFgTBsb9tPWicvS8KKldB5a1NxyBHO417S3VbyBWKKrsuo2kCMqrvKYt6KSCGH/ZqIX
         1Z9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743675221; x=1744280021;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MUuASJ5hScoSUmLABElHv3yXRMZ9c2GHR1Zzdm5d/R4=;
        b=LttqjhZMvo7XdUN9+hm79q/Bx6rd/CebVFLBbNH5SgAgDrG+rnAbU2F4OmHnOqhDKM
         otwzPeUJrjHqnHUcVyLTbOiy4+zjhzemtvUEWlJ3U5iUfMgSW2L0LNKkH0ja4sxcv279
         h178RFABq10pyRpWrtfJwXCYVwxqFCWVf63WqktpBIa6Nq0SAR01zKfGLs1a/NBwGL31
         sOJQv15Fjsk7AdHMhZDtfcDGLl2KiNq2iR/uWoioatraU0R0gS389oPCSqSdU7MObucr
         wwe91SnirF8kG3QgHE1ITN56J8T5rEdEbUkmPkvLvMvyNkC8i7nq/66EgmNFvqqD9vao
         +Ydw==
X-Forwarded-Encrypted: i=1; AJvYcCVOdmcCripUAxPEFMkzb1QDRVF+V1WMyQvTPlIB0Ihi8O56PCXy9p1FSVTmsFrd0K52szPm/Xh0uTA=@lists.infradead.org
X-Gm-Message-State: AOJu0YyYSf6IMstRkT9MB19udO+fEOt16x2dnjUwUhWnvt0VoK0N1+Sp
	o88MAjS5BNJ5pVe6pj/HvtAC7RAt/c3aWhXveIMNkzoo8VZ3m0ThNFn2xK7Xu5U=
X-Gm-Gg: ASbGncv/NkwZpglMAEwi8muKEDSX2inTQ4HDuEhWJdofyI59SH4kpATCv2nriMYKemC
	GKYksNR6TmWDJwL2+SgSUyhrRTZ/sD4USdIpygGEf90mTJP9Z+iHe5C64AKia4PwZbVv4Fr5j8s
	DjsLmv5s5Zym5UQtVbgizkgWxa/HNlt+TNe1Cv+8sT3grh83Zo4UK8J3iruahSsQ+8rBcHg2M/p
	yWkwwfWojWggVl6yCpfJiVinkJahl0DdyP1ieupLLnhwJvGdK5bm34CLhPkjPnUY9TQk3KpKyYr
	/M/9OA575+4q/GzkeRiTcY5TR7Wxk4IiFYOGnQd4f1N7DtZqOq/hxQ==
X-Google-Smtp-Source: AGHT+IG0GXKdP7mN6ZM/48dDYRe92ebXdTmaY+mvl8i2Uj/cu3M+nWimnnDDLEpFfJIJ4V2pGTnsuQ==
X-Received: by 2002:a5d:598d:0:b0:39c:30d8:f104 with SMTP id ffacd0b85a97d-39c30d8f30dmr1230973f8f.6.1743675220783;
        Thu, 03 Apr 2025 03:13:40 -0700 (PDT)
Received: from [192.168.0.14] ([79.115.63.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec342babfsm14099235e9.1.2025.04.03.03.13.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Apr 2025 03:13:40 -0700 (PDT)
Message-ID: <05c0fc18-f50f-4f62-bc64-a297cbf927fd@linaro.org>
Date: Thu, 3 Apr 2025 11:13:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 19/19] mtd: spinand: winbond: Add support for W35N02JW
 and W35N04JW chips
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Santhosh Kumar K <s-k6@ti.com>
Cc: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Steam Lin <stlin2@winbond.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250403-winbond-6-14-rc1-octal-v2-0-7846bd88fe83@bootlin.com>
 <20250403-winbond-6-14-rc1-octal-v2-19-7846bd88fe83@bootlin.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20250403-winbond-6-14-rc1-octal-v2-19-7846bd88fe83@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_031342_633844_B66CF23E 
X-CRM114-Status: GOOD (  10.44  )
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

Hi, Miquel,

On 4/3/25 10:19 AM, Miquel Raynal wrote:
> These chips support single SPI, octal SPI and octal DDR SPI.
> 
> For now, only the SDR protocols are supported.
> 
> Tested with the W35N02JW variant, but the 04 one just has twice more
> dies and is described in the same datasheet, so we can reasonably expect
> that it will behave identically.
> 
> Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Checked patches 15-19 now, I'm ok with them. When applying, please
substitute my Reviewed-by tag with Acked-by for patches from 7 to 21.
I explained why in the reply of v2 14/19. Thanks.

Cheers,
ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
