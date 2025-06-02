Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B9A5C54FB3
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Jun 2025 05:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kibbSIsSgPObItdlpy8jqXmZtVVFwm7rw1BTDuSRFVI=; b=A5mvWlWQWepe80
	7zHPpO1n4keBQ66F3FpyJNj1GF0BUd7cJ9p+ydmgNuyDDCDY7bNY9CAq8wgkCZ9XNGYQnYsLW6F5X
	2tNqjr+waAqgawmHiwX/bnvtSkt3lMww4MeMZNERmgTnDfGaskMVuKBH1s3CsTRTDY+6BUP0r8dR7
	2cPTTLS4oZVNeUMiOeEvMwTNr2MDT3wlDU3F1rNXb8OlrZoaqnSvWG2Z0DqOp0Vq5U+nL4VP6RI2c
	h340FYgbsHsl3kKayMERVIlGcrDr4VsDsNA+Hgk7rrP9SaPbUi63KPAXgZ0y3D+eU6xvc4sSeieqM
	0Evlh59lkvX78KWz1+6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLxpV-00000006kxM-44jc;
	Mon, 02 Jun 2025 05:35:25 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLxpT-00000006kwl-3PF0
	for linux-mtd@lists.infradead.org;
	Mon, 02 Jun 2025 05:35:24 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3a374f727dbso3398924f8f.0
        for <linux-mtd@lists.infradead.org>; Sun, 01 Jun 2025 22:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google; t=1748842522; x=1749447322; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MqSNiwa/UAtmNvnHHz2pJKBZRyVaTikg4qj3JO/V5O0=;
        b=FzZ5etx5JER7KSDNfA0pH+k8a7HEr8UVd6I4vqjygCcmTKergK9EnMRGpI9PGELhZU
         EoaXQ7TSO2dAVhd2KDFjmquDubDQcYeLoEPC0opeCBKSA4b/BigJmcPuXEOIvaNnSRkb
         O4crbK3thAJV9wddeOZydgqFIFX0nUahZHCISt1uV03G8KdiCqp+SyKRPdPokPBj+n6T
         le0cbUsnh/J1ilFBfZWXOT3AO0B1a1kFdaU5DBPtfxA68erAYzf7uXX6gJ/xkO0/or/w
         B7ZPsedUcrNYggV9fI7xORN7wDkoNZmXgAke4a0XAQ45LUmoG0gvI7aWMdi7PqDTEqp9
         AntQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748842522; x=1749447322;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MqSNiwa/UAtmNvnHHz2pJKBZRyVaTikg4qj3JO/V5O0=;
        b=QEF4ENjGgl88vxneO6dRFLOq2+/kZqbucEHUASwkIj3uSt4iReBkkoVDvOKPx+aQ7X
         rTO/HVrZg8VK4427HZu1SntUnjIgCKqKlRArzRiXJJ9xt0xZE7a95U9sFCfJ3GsUmBtj
         xoAh5gsbnx9XNXQh6qLnAd6pnI9/Udb50RWKqkMKd8cAqqua0IG4ZdjpAigQmCZmgTKm
         CKn1g+Uf4jzgnKmA4UQJyGHWHUHkDA4dgxfWWqq+YNwfTIuRCq/izO6vvl3dOKGckWUo
         nAD6/D9ZYVo2xm6P4txHRrO0N1b7aXxNCcd99s34CmPyKHfKUpfpbSx8DSxqt8DQuM1u
         4Sqw==
X-Forwarded-Encrypted: i=1; AJvYcCXm599BuzDZWTmBUo4z/SkRLdU0PRhG13JsH4krw8gCZ1eH/BYv5wxe9huNgLfNeLzn7ucF0IahLcY=@lists.infradead.org
X-Gm-Message-State: AOJu0YzmuPsNK79jbOnzcgbj7oE0O6SCymo0dsqWXQVGq0VuWqmoveC+
	CGYmO1Kpq1RET/Ut20biUVIU+Z5P++HSAsPLbN411LyMfsaYK4VWk0m4iqpYHaxr89c=
X-Gm-Gg: ASbGnctzKKxfMuemliKKWcecshE1smlTf7XYRGstw5a+wKSChmMEdO2Tqu+gfbn5pUu
	FwNaFMf8d0GuGAbQrsbu8G8bf7i5gP45Kd7KFUWWzuj5r+ux1/fM/hZO+ZxXNiwqYTxgNyOUSne
	iU1w2QWN5mvwaXOVsbXAbvuFOI9LZEIy3AfRGYubY7ssEvCULQ8TIJhuWhlUt7C4Mcb29TNXbkY
	gRCHeTI1/0anLJwQnLLD9c64SqrKK9q0Ohj8VjoQ6hGZ0ADH94/cqjqLDSIM5Y1w7jgb5KOlYfD
	4CKti8UmuBiqjgcTQ87BBhEhz02VRKhh4iOBlrFUpoECpidsiYW8mxEw009badqEfE6hGDmi9O/
	uUdnO7waS
X-Google-Smtp-Source: AGHT+IGrQIiFUnlXQDaPi6teG3/LlZQK7PtXW+9VSsAPWMfTzkxlKDODBimIm/ATErooBRp+aHyk7Q==
X-Received: by 2002:a05:6000:2dc6:b0:3a4:dc32:6cbb with SMTP id ffacd0b85a97d-3a4f89cd26dmr7838401f8f.31.1748842522025;
        Sun, 01 Jun 2025 22:35:22 -0700 (PDT)
Received: from [10.115.255.165] ([82.150.214.1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4f00a13fasm13677597f8f.98.2025.06.01.22.35.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Jun 2025 22:35:21 -0700 (PDT)
Message-ID: <43255889-3d35-48ba-9013-312d4f61ac5a@sigma-star.at>
Date: Mon, 2 Jun 2025 07:35:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ubifs-utils: common: fix memory leak in devtable.c
To: Anton Moryakov <ant.v.moryakov@gmail.com>, linux-mtd@lists.infradead.org
Cc: Zhihao Cheng <chengzhihao1@huawei.com>
References: <20250515082515.1666-1-ant.v.moryakov@gmail.com>
Content-Language: en-US
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
In-Reply-To: <20250515082515.1666-1-ant.v.moryakov@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250601_223523_844319_34586808 
X-CRM114-Status: UNSURE (   4.15  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Applied to mtd-utils.git master.

Thanks,

David

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
