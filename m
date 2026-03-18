Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F19DA103E173
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Mar 2026 13:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ql4H67yI+1dk00Gdsq0jfBhP1njKhIDRO8vjbP4MGdw=; b=YXNBxyy3zVEWS5
	NdnfLAv5AuugUZ9gIvlIuPYJn6VCkaAp/db6NIn2xB+zv5Tx7gTjDGIzOfMJLWpGsD8wr/o46Kpu1
	xSrl+O98ZzsikgjUuAHq9ZZ02jEzxtktwGG7l7mby4/Q7UDMPXJb4Wf12H2fPMjQj+zZDZKTJua6B
	Pgkc3+ZBKv1mnjNu7fcWvMGj8BhvT2PKgXVAVhWNsSKLROiMOVV3OoS8+mJbNoi8mUmw0Kgs3QHJ5
	DS3onhmreeRSEvTM9wumpO2nVAnoKDarKJZHw5LPLFPikwnxNeAiq7RcJgDjWW15VkWgB/oE1YabW
	VAODKjlmyfYS5FFQT3bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2quy-00000008TmQ-1ifd;
	Wed, 18 Mar 2026 13:26:36 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2quv-00000008Tm7-0TUJ
	for linux-mtd@lists.infradead.org;
	Wed, 18 Mar 2026 13:26:34 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-43b40003d13so553188f8f.2
        for <linux-mtd@lists.infradead.org>; Wed, 18 Mar 2026 06:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773840390; x=1774445190; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YYMJCrHiiJkl/Y6rZNT3cZzV0QIlL0rPBRFG5WAuokw=;
        b=p6VTBbEoqPOR0ctV5FVGK6AcSUVtpNz9bGLgmfjgYPNM1H3pp8fXtubsP/kfwGxiiQ
         4AEUQixxYPawaNAmbxDk9YSKQRBpg7BJG3ACFYUe2hbhCe3r5yiHwWTlLIdGY8STtkDo
         Ros5zmn9DYtiUqbUrSaa59d8DlPcc/2z5IiGfj18geiqbUf3IJp+FBGMD2DGqQrPcAfY
         foMMTtN6yB9ILBGJG9W6GPgFSBtTicRJqABafJbHovgKKwVFEacYvusO9fh9jWAS5uaS
         6wuXePIJzigzVNVRPBvQ1Jqf3dUVXxnpDI3GaFW1QFb9EwX52Kf26LkWBxRwSv03ju+x
         /k3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773840390; x=1774445190;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YYMJCrHiiJkl/Y6rZNT3cZzV0QIlL0rPBRFG5WAuokw=;
        b=IrxMMUqFvVjYqllijK+zbf0r5QYkvqhGvmhAE6C/RQN58A+KqkTnLD3IM39KHYpirl
         VtH7fyJOtwh1kJcuumijsuUSEA9zNYzPyovIMHxWc9BfF8tfAFzztaDyekocBRELkIME
         bGF5Bikyo7MXXpvwvgfcbXfsOGqQjXJdSS2w+kLLELujMEKaNpbZ4OQ8qHdMcGvbyeP6
         bWksf7tbg7YWH2bvepGKWFeLp46E6mJYBQsM34xe2sWgf/87jKtKK94VrBBJIvWjh7nG
         Xe0zfs5r9Se2P117CExVNhTEm8Kidj3t8aWSf1kcj0tr/UTMqMpptM2VNV1BftKks6vU
         g6oA==
X-Gm-Message-State: AOJu0Yxfeih5hgpw7AFffMl4nc5q5bdgHtkUWB2Ua9DzR7x2E60Uu/up
	RKGOhlXEadE1guUxUX3kzULN+iLUa1fpk+85hhAjbG9TZxOr/gdM8AVhQXtir78DDfI=
X-Gm-Gg: ATEYQzxf8plL9PUSOoBp/p6I1t4adZNZRlRo4JSKf1OdjAQuEsaarfTZ3GPvavbrwL7
	qnfdEDSnAMhsal3tSqJnOHXFOeCwS/VG6FQgtOJVUAQdpXlFCFQJtMV6YUpRl/7Gk0aB80CkPxO
	mYjiA1K0I0lNB9yQXyJ5ik3c7a1313/Sj65GXEv7AyF5k4zbGg/q51FE0DtFoLo72k77tIowslc
	dUu9pU69+ASB/WiuTypOg89YZpQ6Xv0pRUkrpRLlVH+91DJJU66NFBOPHVxxDtYOnz0C/QV+7Ts
	KULQOXAJtLKUSR21JYxU+/wg2S8G1y/MnFpGeL0I60ntSO4hXt3Z39N74Fdh8KAJSIJg5rbhrpD
	ETIwuAuqgbl8WCp7XxqbDp7yLcCv8SUdcYP5s2mpseJQ5lg5Xfesa64pFqRLgKzSnRto8/V8vu7
	ruS1HDHCXIp4BABWyfDSygV5nyH0ZHtvg=
X-Received: by 2002:a05:6000:24c6:b0:439:b203:7711 with SMTP id ffacd0b85a97d-43b5279e3bcmr5743279f8f.3.1773840390171;
        Wed, 18 Mar 2026 06:26:30 -0700 (PDT)
Received: from [10.11.12.108] ([79.115.63.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b5184962bsm7939972f8f.7.2026.03.18.06.26.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 06:26:29 -0700 (PDT)
Message-ID: <639bd964-b499-4e9f-9035-0010fecfb17c@linaro.org>
Date: Wed, 18 Mar 2026 15:26:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: spi-nor: micron-st: fix FSR read fallback for
 controllers returning -ENOTSUPP
To: Bean Huo <beanhuo@iokpp.de>, pratyush@kernel.org, mwalle@kernel.org
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 zaizhang@cisco.com, Bean Huo <beanhuo@micron.com>
References: <20260318131857.2685004-1-beanhuo@iokpp.de>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20260318131857.2685004-1-beanhuo@iokpp.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_062633_617448_340E9F28 
X-CRM114-Status: UNSURE (   8.05  )
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

Hi, Bean!

On 3/18/26 3:18 PM, Bean Huo wrote:
> From: Bean Huo <beanhuo@micron.com>
> 
> micron_st_nor_ready() falls back to SR-only polling when the SPI
> controller does not support low-level FSR reads, but only checks for
> -EOPNOTSUPP (95).  Some SPI master drivers return the kernel-internal
> -ENOTSUPP (524) for the same condition.  The two codes carry identical

Isn't it a better fix to update the spi controllers to use EOPNOTSUPP?

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
