Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A5CBCD5BB0
	for <linux-mtd@archiver.kernel.org>; Fri, 22 May 2026 09:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tj2/S578iKhx8msVvkEw1zn5RQ8MiVKSUdIJ6kq0e+A=; b=tG7QVknqt6BU4/
	oMgLp7dHOsnwdgR/qfKAplpYcdlAVK1oZfoeax7TrU8KJSVPilib2AM74hdu5Lz9Yzr23UeSDI7dK
	rCV5mm8YSQ21izYVbeYxmUdp7tfNcewHxLtjfWYRQCvK+pvIWnHIHjAJfXK3I+e8S00mzWTPwO8eS
	TBSB3SqAH6Ep+sllzU94Yvd6tJM3+JgB3jfyYSi0YJhBrhd+ZbD1At30+XgqR3h2bvAB2JUs5D/ii
	rXSVLibwb8ISDRtLjLJ1BDjy2u1pewF5CiORHpSFZtR4gzEol6t41cc5eteKUgatXrdRV8JaP8E8f
	RonNluTRH6L0YPE9MS7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQMJu-0000000ALrP-1hLx;
	Fri, 22 May 2026 09:37:30 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQMJr-0000000ALqG-3iuA
	for linux-mtd@lists.infradead.org;
	Fri, 22 May 2026 09:37:29 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-49039a8851fso16740775e9.2
        for <linux-mtd@lists.infradead.org>; Fri, 22 May 2026 02:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779442646; x=1780047446; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Yyfk8X7hQAsUD9G+4fe4CzUE4boCyIRsCV8/4Z21Gnc=;
        b=K6NppoW9w0YmwE802NLXl0QnWn1n4j0iwnxx8lL/8nfWQymUFes8NUfRYOcefg8qMt
         PQ/qsFJgNPj6FNnT5ETMvwk0sVfHrIrCf04QaEs1CvTJJ6t83hI14p9U/UMW+sMPc3P9
         B5tXCB2MxRHEU8qG+E74Lmn8gKS+/F2TOJlbQlLOhcmt7LDQdon3HhhEiCrTcKKMheyh
         92qySEW3ZXTK3dMCAi8XFFEfCyYkKAiK1Z1L5zlS7Hp8NDnJ0drKf7IJJGwijikIGOgG
         gpHy22ZqA8ovx6+yCjJqhLJlzgsRBc9vn2ctdAEiqCuIVUFilr4pjg/vXYqcmhx/eqHh
         f2cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779442646; x=1780047446;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yyfk8X7hQAsUD9G+4fe4CzUE4boCyIRsCV8/4Z21Gnc=;
        b=MWa9dMAHvwGKO7+gdkE4+Lefi6ZM8MNl0+5Ertr0Ep1/aQLz6bb7rxsmDkN6WkcSf8
         AeWTsY2j2xSKktxvm+Su4fKM2QHDZlQASeXg6lPHP2XuPO5LmEvY+KHSnWJVcJnQyAUU
         BJy0KLxQW5REU97XmcQpKkjMth7zttWpNRC11QL4Vpbinbf7jrBjONjwAtZEdaqEEruC
         JHnE3Ij9KhUlm27GgKWNliG6Mgoe4XIaFmAn1LG1qZHScQ+shpVDMUWFB8A5HZElKUDf
         4263yqF8P5lqFbDri1Q8kbkUxtUL+QQ+DqusqH4hNluZW2z3Uh8JNoe2YigaU6NbjVre
         EYew==
X-Forwarded-Encrypted: i=1; AFNElJ8mS2TdhIbiiiDtnclRF6xboXi/0+B4vbv+nlYv40IW8CoeoLsdptaIW6MnufNzEWWPBOkZjZLPqyA=@lists.infradead.org
X-Gm-Message-State: AOJu0YxMCec8VpzVO1yADZQ0iHqj40K/YnmQWGxtkpkky3RbxbA5Ku4/
	xr8+JON0E50HOpEOwWmqR+Ko8CyzDKx/dwnPzUsMSAWOACtfC9FauuKRNauvwKvvqFk=
X-Gm-Gg: Acq92OHxh1bgpxvRS2vC4Bz7POrwo4QJW3SzwPly10Uxuo6UDFjw2SRe5EIGkGdVYnL
	ta+GmJhXlbbOsRik1cFtwbWevQis+6Ac/w6jBfVXpscwJG4wdLKUZXcxa/Lwh62cAMAzIKMHNPV
	EXtMVfk6LBkXkE1CZwDWf8YeVniD7/+DvLAfbLcbrji/hosQsm7oWmE1YuSe9P2kDvnRRVWFZjU
	ImhbBBQr5R9XvgdwhGRQ3h6PXadEMNoK2kEU38TdUii2SRh+VxVJUXXlLY1a4fjVOa1iEb4Ki8A
	H+0CRcAw/FFZweUTcXAa48DpoJm1Og7kfZdSz2jSEbFNp6azupadNY127Daz94sMqqFHns+0beQ
	3do2aRlAuaf/ak5ckwfzL4ERvPhmUl6yovuKx0jnj8T/arbQVrnDdpxMgS8sna2JD9pjXM0gatb
	9oyzhFV9gdOCgL54JxkPFTwNxohE7P4i3t87aKb6ORUQ==
X-Received: by 2002:a05:600c:6383:b0:490:4717:970f with SMTP id 5b1f17b1804b1-4904717984dmr22094235e9.14.1779442645761;
        Fri, 22 May 2026 02:37:25 -0700 (PDT)
Received: from [10.11.12.110] ([82.76.215.73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454ac6a6sm30570835e9.12.2026.05.22.02.37.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 02:37:25 -0700 (PDT)
Message-ID: <0ec636a1-5e12-46b8-a172-1b3537968fe6@linaro.org>
Date: Fri, 22 May 2026 12:37:16 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 12/28] mtd: spi-nor: swp: Rename a mask
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>,
 Takahiro Kuwano <takahiro.kuwano@infineon.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: Sean Anderson <sean.anderson@linux.dev>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <20260507-winbond-v6-18-rc1-spi-nor-swp-v5-0-93453e1a9597@bootlin.com>
 <20260507-winbond-v6-18-rc1-spi-nor-swp-v5-12-93453e1a9597@bootlin.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20260507-winbond-v6-18-rc1-spi-nor-swp-v5-12-93453e1a9597@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_023727_929702_9C57AE1C 
X-CRM114-Status: UNSURE (   3.32  )
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


Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
