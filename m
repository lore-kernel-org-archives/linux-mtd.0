Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19C34C02192
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Feb 2025 08:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sVlE/9PGv+Gpubv+2zdblaJnSGcWyr26hfbCZD/zOcA=; b=K5dYMGw75DKFaK
	uH5x5wmIXHxdRiVZR5PCOgp06W9EqN4eh5ZlOONKqFODcknNRYU4OV3C4rAox0pLoUhKmwaGgrRpL
	OpG53BvmrY3CgpgrXcW4YBcKYf99Q6jh9wnwOXKBgX8ee9sLskUL/CbTz+IatZ1T3vzKv2KrTTnje
	BX7JAVoWhCJ0zJFSYkgrGDPwSLiWOWNmL9SLP+RJWej6P2TOef7F10eRN8/DEec2r53G4AWBhWswy
	RzYXZgJqj9HlEn5ymfdpZjwxWWB/WQCD9HoWfBfQJnL+cb3bgP0/Q2zhKJikZogxbyhmAUfSssj9b
	yOCspFudao8cQ/ZiuQYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgJxr-00000008rgK-00gR;
	Fri, 07 Feb 2025 08:43:55 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgJrO-00000008qLv-2b3l
	for linux-mtd@lists.infradead.org;
	Fri, 07 Feb 2025 08:37:15 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-38dc1dfd9f2so856481f8f.3
        for <linux-mtd@lists.infradead.org>; Fri, 07 Feb 2025 00:37:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738917433; x=1739522233; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R0PMLhji9fjSmPvfPMOxgYvbpmy3XQd+J6yLU+3bdoQ=;
        b=gQEHH5JtzxTUQSmPavwYFgW3DL7uigyDbHMfS3o47isK86gRqTM0d7kFm64IGCCRls
         rJ87tEPAuldaIQWp2/TvWIsHDAlyCfU3G7xFTHIXLQiriKQaMi8K+72jTUFpR+jUd7f6
         FtUkn04R2rXWsA3iEVVkPAL8CbFvuxEQcjMEJB2MnQE6TWhSF/QVOf6iLoYLUtmzOFYB
         quHervOjY4nrBsili5Q8OBF+rOMCmGMrGPTr9wWFsqbTBAuhe0uYqC9Bqkuufd/oUqUD
         +OkHr9ytFHuYELzGLQxMnxpdcrtxVDWDExZMVCXoOWZnZxposeht2a0R9d/rztnB28xX
         eLrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738917433; x=1739522233;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R0PMLhji9fjSmPvfPMOxgYvbpmy3XQd+J6yLU+3bdoQ=;
        b=lzCubkWJs/DTZ3xWvHn7xEQobAj3er9UyJWNkhCSOrgyQFC4WouC3XX4JunBdhq+D+
         6UDx/7GXoPzJ4pRB4J1Rsj3XbRtLk+SMS4NzjXkbxJ2MlV5KeYOzefOJNjXjDqaNjAY0
         wWMkVnyFIbW57Rh1cuGtJ6uvyRr9V2iRWk0yKZfw/d52vTFtHSYZH6lCykUX6Y2NFNxL
         1DgPaLC70XRMQVOY0OIWHY/Z7DaCEypQa1j7wyuNaTSPpt8O6YZf3EzKleKcUGPmeFF/
         JBAtoherw6TW9RnqiSAmAiAl/L7aOGoNhC4SKm/EVaRyKnk7LG12HXwkwg1Kno5xDBH6
         7RYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnPeeHnopVqDIMaygUuO7FZaZA0lgg1eddWwI7SX/rImgvTI0bhHG4T9GQEQe1h/nwoikhpraRebU=@lists.infradead.org
X-Gm-Message-State: AOJu0YwuW08cmucYhiZ9fG7r+nY73UyixtXi51nDINQUN9M9BthkBSf7
	qNYNuRnidI57orjkvbJXNe+ruSdIkiEUcUKEyehUckqzNGINQ4QP8JjD5ZayBTXpnB74F8vbSP9
	p
X-Gm-Gg: ASbGncsoqEnL/1xBoCt6H/UjI6ffXoIGSMaBGvP6vCd/1JmmCtv3nrxsvqBGF6Py7bl
	pLhnz7eZ+Oc5TAXyFXLn5VOjnqM9um2Hohpyf4HIp03l2EG2UyqspvP3bGe3N9veM6a1VxxJCDh
	AO/e6a4uia00iZUTRH4qLkcYkIeXJEyvrGmqE+g9HVKoqKZI4n3ZdgGdj+Yx20vcrZblsyurXsy
	uSWj5vOttZhPwGWLWJGmR3dl+tO7tQK6gRA8PCPAZD163mQhIoKOfNVLcvRXmVmiiLe/GpGuk3E
	YJ7PsywGBcKt7dKblGYPTgXG
X-Google-Smtp-Source: AGHT+IEk2mxWIfMDHVJOzZSEe/KJXR5/OMo7AWCGcI2mKjnjA/PXTh7IPzwqWMFGzSCaAXZ6+mptZg==
X-Received: by 2002:a5d:648e:0:b0:38d:cf33:31cc with SMTP id ffacd0b85a97d-38dcf333729mr117058f8f.34.1738917432919;
        Fri, 07 Feb 2025 00:37:12 -0800 (PST)
Received: from [192.168.0.14] ([79.115.63.251])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dbde0fd23sm3807124f8f.71.2025.02.07.00.37.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Feb 2025 00:37:12 -0800 (PST)
Message-ID: <1c1da131-a7b1-4c2e-9866-d7833a134033@linaro.org>
Date: Fri, 7 Feb 2025 08:37:10 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] mtd: spi-nor: macronix: Add post_sfdp fixups for Quad
 Input Page Program
To: Cheng Ming Lin <linchengming884@gmail.com>, pratyush@kernel.org,
 mwalle@kernel.org, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: alvinzhou@mxic.com.tw, leoyu@mxic.com.tw,
 Cheng Ming Lin <chengminglin@mxic.com.tw>
References: <20250207081846.362919-1-linchengming884@gmail.com>
 <20250207081846.362919-2-linchengming884@gmail.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20250207081846.362919-2-linchengming884@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_003714_678357_DFD9F3B2 
X-CRM114-Status: UNSURE (   9.65  )
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

Hi, Cheng,

On 2/7/25 8:18 AM, Cheng Ming Lin wrote:
> Although certain Macronix NOR flash support the Quad Input Page Program
> feature, the corresponding information in the 4-byte Address Instruction
> Table of these flash is not properly filled. As a result, this feature
> cannot be enabled as expected.

You need to prove that all the flashes that you touch need this fixup,
i.e. dump their SFDP and show where's the wrong bit in the SFDP table.

Identifying wrong bit in the SFDP tables would be easy to spot if we had
a SFDP decoder. Something that we all agree that'd be a good thing to
have, but nobody can allocate time to do it. Pratyush I remember has
started a draft. Are you interested in introducing a SFDP decoder in
mtd-utils?

Also, if you touch all these flashes, will you please update them and
get rid of the stray flash info fields? I'm thinking of name, size, and
no_sfdp_flags.

Cheers,
ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
