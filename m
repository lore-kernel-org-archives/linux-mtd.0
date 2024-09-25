Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30AB5CF9C6C
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Sep 2024 06:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kibbSIsSgPObItdlpy8jqXmZtVVFwm7rw1BTDuSRFVI=; b=EGnexyXCSF6C3C
	z6PRQAk3GbHMBT3+CzGUiFq6utGm+6n6rM8cctkryyFCDqO3eyKDdDH5eDTIEkiU8QTWdLCiBOcgN
	jCusu2SkDpN2uCvIpxV0/afEOqnJsOXWoS4hEWCyXhi1XNW3PSvhL9bliHko9BsxRzqvEp+b4Q/Gk
	vjm0xCykzvIZ3VjSrLxTVaGrnOMStgxadnsYOAS4hVUrOJ2Fi5x0pdmfMcArvgWE0mOZ7HLRV+TNY
	1AuQPKFt9q9qzDVg5/3PRJrt7CM06e0NJnpOznFN9/QVDtS7upCxFvG6ujXzgcPKjkAAY+l2ZT550
	hlY79cKXjDHESMqAJilQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stL7Q-000000048Dd-3eyI;
	Wed, 25 Sep 2024 06:03:20 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stL7O-000000048D9-1Apk
	for linux-mtd@lists.infradead.org;
	Wed, 25 Sep 2024 06:03:19 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-42cc43454d5so51487135e9.3
        for <linux-mtd@lists.infradead.org>; Tue, 24 Sep 2024 23:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google; t=1727244196; x=1727848996; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MqSNiwa/UAtmNvnHHz2pJKBZRyVaTikg4qj3JO/V5O0=;
        b=NwDFzCiI5guoyNQ2/TpEYs6ZpEL7vBr5BJrdseuV4CFlAyNrmFZpIydtTeX5aQ2ndO
         5Y/y1fdAL6O5BHpiczLUyIT4Zc4PGOZ4oHhqZ4ERVZ7/hW8+Pl/MZ9YuS2+1VDhhatj1
         jrmOI9zkIX0mzw7W+avXGEc3Wc+tOmSrUS597t+40lUrxxAKbGI93+7ffTGtZBP51LZN
         R/rjpLhheCAVaFQMgXC5ivwhxQ3MxWFDbCFU99KwLtabejGaUsR7EdVV+JE0aMTxrtq6
         H1B35xWyFVuh0EyHyIUMC/B/YhPjBelnl7lqjbV/lQAZ68gLzwA/2ILwDerG+J3bRmDJ
         TFFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727244196; x=1727848996;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MqSNiwa/UAtmNvnHHz2pJKBZRyVaTikg4qj3JO/V5O0=;
        b=kau3seUoaw0nvyUmVHhsGCG2MDctMnQQxn6r+nmTVU3b29S4MHguk2h7vlVEfgqJWF
         feXBhSXRgaYLH9aE9h6SD5KUR07N7QzNwpH6OIxNpFcKS09uc6iMJZx9Gq5EfClTqIW9
         5X8hVQsJY+mnQ7xvZwCQOgZURHrruDUfrYRvOZkTt5+99XKzgoFCnm9a9QOlDoMw7nbl
         UnVEqS3X+Z9zoMLvAuTT2rnaeIGtAsoVzrjS8s+q7UcJUSllNX27CinjHbzRobHv3XWL
         8EbK0UwYXFZXZs+En3fbMrZPh4/88vaSDwLnMLNxYIPI/vQERgRPlNGrLSvdDyj/eXI1
         PyjQ==
X-Forwarded-Encrypted: i=1; AJvYcCW47QOBLEfGybvfyizrF3wxcHGujov466ECwtoDM9rPqm9tjJfEC4bG6gGnaZRU5oruI3SohdzRLIs=@lists.infradead.org
X-Gm-Message-State: AOJu0YxRs3iuMEPmgNKokeWwjW+3HHAfNQA2PZkCRqAPveesldetNmqs
	fb8QFBuZWWpJ1mVWaW+5Y19fUtSWzD92+8zAurPj9cbjU03kVDCg0AinLhvOHSE=
X-Google-Smtp-Source: AGHT+IGxOvF5u5yuLTq73scjPkypS0nJtH4w9eLTwd5Tk0htFfGJP+rWr9qcc0p4Lnqh8Z618F5s2Q==
X-Received: by 2002:a5d:6da3:0:b0:374:fa0a:773c with SMTP id ffacd0b85a97d-37cc24ab296mr852312f8f.47.1727244196383;
        Tue, 24 Sep 2024 23:03:16 -0700 (PDT)
Received: from [192.168.40.74] (046075014122.atmpu0009.highway.a1.net. [46.75.14.122])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cbc31f534sm3043629f8f.99.2024.09.24.23.03.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Sep 2024 23:03:16 -0700 (PDT)
Message-ID: <a0829848-59a8-47b6-baad-097440d9d23a@sigma-star.at>
Date: Wed, 25 Sep 2024 08:03:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] fs-tests: integck: Refactor: split out common
 remount logic
To: =?UTF-8?B?Q3PDs2vDoXMsIEJlbmNl?= <csokas.bence@prolan.hu>,
 linux-mtd@lists.infradead.org
Cc: Zhihao Cheng <chengzhihao1@huawei.com>
References: <20240826112456.239882-1-csokas.bence@prolan.hu>
 <20240826112456.239882-2-csokas.bence@prolan.hu>
Content-Language: en-US
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
In-Reply-To: <20240826112456.239882-2-csokas.bence@prolan.hu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240924_230318_324963_7B7329B7 
X-CRM114-Status: UNSURE (   5.57  )
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
