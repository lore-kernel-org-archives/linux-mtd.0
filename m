Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 708BECF9C71
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Sep 2024 05:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kibbSIsSgPObItdlpy8jqXmZtVVFwm7rw1BTDuSRFVI=; b=SyGwgCB5TSWczl
	JwmVt4QH3fPe3RaOYcHsQLvJnvE9kJ023ZqdQ88kvXhUW5QgS3IdXQvBUsRl08l5l2ukTOPwnJWro
	c+cdWDLvOjXn+eQlaMTKYK/wsQ39seQeV5fIdxZ0GJdSOd74mzn2lA6TiEjDX2Nan3ICFzmtj6zWp
	aHqA2jnKmTNAiM13njyVPrAVL3e/e19Ik9S9AwML2k4LIUnuBqHUUiPxoIVfCgE+OgRm/IqJOimSY
	ZZNdg1ec43GAZ1SfYh/p6tKPdQ9zEhQzynCuCwu+We3ECd87HpbNIS8ufxrgzOfOKV8pbsrcFHc2N
	iRac3Bxl8fbL/izYxDGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stKqF-0000000466n-3r9E;
	Wed, 25 Sep 2024 05:45:35 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stKqC-0000000465C-2YxW
	for linux-mtd@lists.infradead.org;
	Wed, 25 Sep 2024 05:45:34 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-42cc8782869so60234195e9.2
        for <linux-mtd@lists.infradead.org>; Tue, 24 Sep 2024 22:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google; t=1727243130; x=1727847930; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MqSNiwa/UAtmNvnHHz2pJKBZRyVaTikg4qj3JO/V5O0=;
        b=kavuDN4PffUr5iSghOHp31hmbkGc9HBApRR/Oofn4DrZaIJHry0E4KVIg/IS9plHJ1
         dIpAcMsgQgn8ft4W4LeHxdwgLkU8V1XsNRqlgAZfyM7zyVYmWOPyrFEWqOHmmfxfrhIU
         efihPcHD23GIKu7Em9udHlA0K23YYyoaYicls0e60w4RH8vm4VPv+VnjVjaY6jpQsby1
         7/GiH/S1OnTLRGIFgSGir8YE1u4F1CyjDtIT93RXypba4WFgLl8j/Goe4A4u690CNbXM
         xa2mb4Op+xflupypcqHxMXhxk7RQ4Nh4W0d77KVUwPFUz0MvwW1/aMp0JqglP4tVh8s1
         dnEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727243130; x=1727847930;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MqSNiwa/UAtmNvnHHz2pJKBZRyVaTikg4qj3JO/V5O0=;
        b=N/jVlOFG+GjLqMEoFQY6adFuDVa/Ok2eHbF8vChNZeE3XYdEjbkE4CkfeacSt39BLo
         yG+qN/XnA6PaK5FyNg9klnh/lWOwuL2AHjnLYJSxHwojVKR9MG9eQ9VHP1g4QIavxUTt
         7YkJJZMSv9cXhh71nmTDzfaVaVMce8RZtp/4Bfk290lsbq00nwFNL5863fOR9iwjVE31
         rAsXBD4Zr0izUfJmajkV08KmVmCYEhYq9VZCAN63P/Ej4GKXYTDOR+xQk4A16dHmjWk2
         kN/6RnR0YaiIwEicUmYWkg9mvS0nMMzlyCyUK3TdMs1p/1K2JqdOhTb+cEsOfCVVl7cd
         O6sg==
X-Forwarded-Encrypted: i=1; AJvYcCUYem7sDzppmPrWXlyd1qBmlnKb+wWl+zLQhGarsDck6TVNvuW/1EzjKhnb052RD47zz0nBsFel2BI=@lists.infradead.org
X-Gm-Message-State: AOJu0YzrIqncoRVsKoDl7W7pw0VLO1NLTdudA/9+oroPCuTIoImVD7sb
	50+HisVAxeewSEAYbKDayMVQlpr2Q9Ij44zLpX80FV91p5EzFnZDwgQh3TD6CtYBYfvtrs0+mc9
	F
X-Google-Smtp-Source: AGHT+IGuJBIsqj/g5Coj0VCbs2WlPlGbg7nBKicDGdYVmkNy14gOzDKPFsQDu5WET/KZbKAviN+Scw==
X-Received: by 2002:a05:600c:4706:b0:42c:bb41:a077 with SMTP id 5b1f17b1804b1-42e961363b1mr9182125e9.23.1727243129527;
        Tue, 24 Sep 2024 22:45:29 -0700 (PDT)
Received: from [192.168.40.74] (046075014122.atmpu0009.highway.a1.net. [46.75.14.122])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e96a52308sm7246185e9.43.2024.09.24.22.45.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Sep 2024 22:45:28 -0700 (PDT)
Message-ID: <5ed78b5e-2edd-4b50-a1e1-bf79663289bd@sigma-star.at>
Date: Wed, 25 Sep 2024 07:45:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] libubi: ubi_update_start: slightly improve documentation
To: Zhihao Cheng <chengzhihao1@huawei.com>, Christian Eggers
 <ceggers@arri.de>, linux-mtd@lists.infradead.org
Cc: stefano.babic@swupdate.org
References: <20240710112904.15172-1-ceggers@arri.de>
 <b8d42355-5662-4a68-16e9-d8c7a27c750e@huawei.com>
Content-Language: en-US
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
In-Reply-To: <b8d42355-5662-4a68-16e9-d8c7a27c750e@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240924_224533_001868_34264600 
X-CRM114-Status: UNSURE (   4.37  )
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
