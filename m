Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3730C02198
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Feb 2025 07:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C1OzJRm/0VQPzWWdwMAbo7VUUDAtHhjd6nODt5+KdrY=; b=4Rsb4VdKWT0hPF
	IdMsXXZv8iD5cmoLe4hiAzQJ1tNq7pNki56tIlUzlbelVT0aH88QDgb4WePi3GdcMk0jm/59TzODj
	E5pN7E0scoQffmx73LV9aETQMjLzIBGUd5Pr8JD/S0CLAH0TDgK00qG67gCrgucWqC793xstU8P5h
	kkyrMNrQf3d3ExQkMQRTV5odW5D25ymSTXeKWRKi+VvqAosbf4vBcm9lUs1hBIgl3BOL89/esLlsr
	iqWRyzl8VcavVjvEOqFQ3nDq7j9C06oXJjtf5IpIIAuRJeLHDZCCs0P52tdqfZiWuOcAcuCe/Xe/G
	qUsMPKwzJ4ri5e3Q/lrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thOXB-0000000GZBK-1i6a;
	Mon, 10 Feb 2025 07:48:49 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thOX8-0000000GZAC-3Ekg
	for linux-mtd@lists.infradead.org;
	Mon, 10 Feb 2025 07:48:47 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-439350f1a0bso7748655e9.0
        for <linux-mtd@lists.infradead.org>; Sun, 09 Feb 2025 23:48:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739173725; x=1739778525; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JXjBA1xpDPpDczZQ3BE9qCN/9LPdj7wvx/8iGWhQr1M=;
        b=UUHuUZLMTpuqduYMAT3zZHyOoX+h4JWpnYXtDasQUZUZAs/l17SqzecE/xQ9sd3XMO
         bWdWuKBxcYGVY7VOQ6Jw43Lr7WtuGi5QfxNGAG1QIX2jj+zI2W9d8uSivfHOZNFDhLq9
         BiiXJpfQaeS+rPPvoWNmN4Gkc9Lgc/CXcrCi6jx/gH2torrzqr80b13ByKWzQXCl8wBC
         Clj11wvGKwCZwqaxXOTeRwlAB0wtdqm/Fhu/kRMZovYYKqqZYhrrkfejur8mwMtgEfKR
         DnuUBRselOg9v43+7pNq1cRhdA+/HaWfYZzNW1hmCD3tANEKOB9Km+t/3K4ovdA9hDbI
         9+pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739173725; x=1739778525;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JXjBA1xpDPpDczZQ3BE9qCN/9LPdj7wvx/8iGWhQr1M=;
        b=HkRrPExQShfoxB/xu/JhwCcSMICuaZ4pTKMfLKvlyLGq94AW162DeXnvOXpPzsvf/9
         pamw9ws6dOCVUxZxzG6aKOXXfnUZDS8n+UMOgbzNUDjKgJImH2YOSIl/E2TcOMtJME85
         56D5cRF2NxCrnJjvF1Ig/3rw5GFsznlKD7MO7a1lUkkOlgFQiCKH4572RmU5FETUK5di
         GymPDYMrKaCZYDwDcq6hm70Pd8GlsnGlgYSGsnTV3pRH8McC/R10wTE9dYjPBhH8IK8r
         bvu0Sf173jN4GJ4gDZ7IhR/g9MK5BN4E1e3CU2SX4BLjqQdsG+McCWU8krz2fe6k5H7O
         2TIg==
X-Forwarded-Encrypted: i=1; AJvYcCVjLhBN6PNONx4/7Ek7gfstSd8Ikga+GcannyPKv/i/zUQBEnz2OPnVwqu6jmyA2/kXbEus5PqLdEk=@lists.infradead.org
X-Gm-Message-State: AOJu0YyRUMXQvaLTzCkht4h2Iw8sm9eF2xkZilK4JL3469ItXWjM4eAP
	se9AhkdxW5jNAFxx/ISs0QEkfzG3qII3ft/21CkDWTYnQ6NIb44RzwT/FYTWLiQ=
X-Gm-Gg: ASbGncv6nx4Zm/idiiH2WkkzgA6LhZ4CEkTEc0Ayf3YaKTJABwvZkRtC7LirLFI/+Op
	H41DAMz2+zMShHLTauoslibJlxmaBBCTcCJKF/qbqrbCDGRAZp64yJ7oNUIQJB7mk795+p394O8
	vTrhyChJzAfMg4fGoNycq/bInbUrW8E3j6aGA5S8ze30TJRwSmLeNpWP1PdJWvWQYqR5eXUGKgB
	jYLzHNHs6P+Ta1+JYTqmZBiXFCP7arNtR7AEVJFDaDd7knpQFvfgk4BQ3bn2QKB0OSWuzDo42qM
	BkTDdtvJ/oWqAx1zbf3TXAgc
X-Google-Smtp-Source: AGHT+IHMwiCNyEXmnA6ZyUF8TtVzh6U1lMSqhTyKSU8emm2NylmNX2Cd24NUT4HkxU2TmNGE5wBubQ==
X-Received: by 2002:a05:600c:4444:b0:435:edb0:5d27 with SMTP id 5b1f17b1804b1-43912d2288cmr130920945e9.9.1739173724861;
        Sun, 09 Feb 2025 23:48:44 -0800 (PST)
Received: from [192.168.0.14] ([79.115.63.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dc88989b5sm9301026f8f.65.2025.02.09.23.48.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Feb 2025 23:48:44 -0800 (PST)
Message-ID: <87210c38-2e6d-4f14-8a4f-ea02288604fa@linaro.org>
Date: Mon, 10 Feb 2025 07:48:42 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] mtd: spi-nor: macronix: Add post_sfdp fixups for Quad
 Input Page Program
To: Cheng Ming Lin <linchengming884@gmail.com>
Cc: pratyush@kernel.org, mwalle@kernel.org, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, alvinzhou@mxic.com.tw, leoyu@mxic.com.tw,
 Cheng Ming Lin <chengminglin@mxic.com.tw>
References: <20250207081846.362919-1-linchengming884@gmail.com>
 <20250207081846.362919-2-linchengming884@gmail.com>
 <1c1da131-a7b1-4c2e-9866-d7833a134033@linaro.org>
 <CAAyq3Sb4WZtjq6-jYqHYympSxLgf=Oifcf2BmV+pVLJGc8=oYg@mail.gmail.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <CAAyq3Sb4WZtjq6-jYqHYympSxLgf=Oifcf2BmV+pVLJGc8=oYg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250209_234846_822846_D67300D1 
X-CRM114-Status: UNSURE (   9.43  )
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



On 2/10/25 3:27 AM, Cheng Ming Lin wrote:
>> Also, if you touch all these flashes, will you please update them and
>> get rid of the stray flash info fields? I'm thinking of name, size, and
>> no_sfdp_flags.
> No problem. Would removing these stray flash info fields from the
> Macronix flash warrant a separate patch series, or should it be included
> with the current changes?

separate patch please, because removing those fields may introduce
regressions if SFDP data is not sane. You'll need to do the usual
mandatory tests when removing these fields too. But it's worth it,
you'll have cleaner code paths. Thanks!

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
