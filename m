Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6ED7D116EA
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Nov 2025 20:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sh6caWvNprth5JLzkrvBoaWxhb4/QG7ZPeoJ6vIPd7Y=; b=LW5rVjEkjGZPyfg/17hBLGQTp/
	hw9W+TPwp5dKqFPJqUimstNLldk5fXJFJwHqyb/HDxsK5x47Rcw4l6oxTqgbXEM1dyEKRl7OBMriQ
	2cKf3oRxIiXT2tPwnp1rF0HNLTX3Z5zHO7w6nHnHioBL0ub061GN/1NdKErzO1xByYqqOONwKgWpq
	pcAgM+17Tq4dbXnYzFg1dcf+jHSutB/dExybRJz9xVwKn/FV0SuTcXAix6tVqrRi1m1l6/UXv84Cd
	miTV2idYojXDj6Xagw0tTJSgOhpUiILT+WUbXsXc9FkRBgTFLH0vbvc8KOjFu8TUhCusHnD2sn94r
	A5D+SVFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP5Jr-00000000uRK-2Nf0;
	Fri, 28 Nov 2025 20:43:55 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP5Jo-00000000uQt-43Ez
	for linux-mtd@lists.infradead.org;
	Fri, 28 Nov 2025 20:43:54 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-b735ce67d1dso375655966b.3
        for <linux-mtd@lists.infradead.org>; Fri, 28 Nov 2025 12:43:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google; t=1764362631; x=1764967431; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wFnU3upBkyRzpZYUaNxC3atm5bD90OV1eufiWuTfqP4=;
        b=skUWq2oSUgfVgsrGTUBlcsmsur16W+rFlwpI2Ezqeb/NjLeAsGpIfuaJ5QEcqX5pvn
         CTnqx2hOmeSrpKDr28o2xGL8aEGleRVmXvpBnjQmTzPcCSP8ylJTtdPr7wn/xrqde2H6
         m1cKHxZh3TsirOMZS5owAxu2954PcGQwPZQqhsHdH/Btt1Yf0p0KSkQ+CajJtbQ95EL1
         Fb29/rYTdIYvLU0PwiYR9HEMuMa4NGswB7jllDeTb5685cYKS/nkJ0WdrRtDa+vwByCB
         RF5lU+dB3cskK3exZ8CrDEEx9u11DS5rnM28XujrbFjrS7RWWBFFnQ/GKfqUlV+Y/O//
         gJbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764362631; x=1764967431;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wFnU3upBkyRzpZYUaNxC3atm5bD90OV1eufiWuTfqP4=;
        b=L+7H/44gEmKjQVl3E4tzTDVyTWO4/ZTSbRbzswoDDAMxqnarHG83EwXwkj4emU2zXs
         32VAFzDMChhFW5J1LvqPjRDyXMvMVogZfOTvn7sgRVt0g70Ev4bqUVlAargLFB35DAc3
         JWiWfV4Y7TJR35ch6JDXcSZhkSDp/tZEQdaj6hv0MWxxk7vUm0UEweClnHr3YHkoz8yK
         pLt/HpDYw6gXt9w7LOBnfzfJGqmoVrgp6pe/eEzlklC9JXGfJ25EdrqP42tMW5+A5nEm
         8YozVnDPsCOuljkKAp3GYJCLzfujSr7LCK6L66C1KERd/w2TbwJpqc1OGxLnxuN2Ushm
         PyGg==
X-Forwarded-Encrypted: i=1; AJvYcCWFQRHxTcP7d/K+aF6jiLJWOQ18xnukYf6Bh/x7YOvpXeyipD1AIbx/gZgRtbtCMTbxg/APmAeaAKg=@lists.infradead.org
X-Gm-Message-State: AOJu0YwxU6wT2osahulTESjcm2De3wv9vZD/sEzQCMTTN+HXkaMXCpJO
	WGi+KaylfDeCNOz1Hub4RKU4kEA0Qbvd3lMcBz8QUEkgNo3D8hbYQ7dKJtbFd4jXi1M=
X-Gm-Gg: ASbGncvdsdbH5ogXyGuFiglLuhvflerztZ7EVAQUAPFAc4H+/93693ZmMsD5MQIIcBL
	7DqZABHbjNDM/6KQ87Vo8t3zJKVyluAy59UC99qag4CTxEEAVkbBzR4YV99HUIYvYDQFWzyx/1E
	jOySGFUMa5mNl9KNo7UHVrDIA7ftSy2zlmyXt7u0/K0Q9Cpoa4NGFXXYxSbhja0Hdsax+jA18VR
	3LVBV1cJQH+ZAMptdJQTDzqYFxtjJRlVvMd+nQSZ4YbFkeCEwIrZFtsLEGBoroCWmdUtFQwdjXq
	9LWJ2t9kxxaKXP/Il/SrD+Z45w8n8QTCkOHu9cSaIRLk3zabKhsCFOFNe7zFoUpoaH0vx3zS9wS
	g5wahFpnr1pmnhIukZZMRsAAO4uyvubcpuWiCB7VEMNHxQK79TdrjUZIR9ITYaJZZOVmmN7X3Vw
	Yw5uPpXG39p0Qp9bEdTQ3uPXISgwfBZ3vIzmwwNYOoADzBki9FWddv1NteWQPuxfl0UIQRlrMaN
	g==
X-Google-Smtp-Source: AGHT+IFVSbellmrilOT+32KZIOzol05K8HTf7sY2bft3sFVEwspb5HTmfKlo1eZm0uYLEd/zCcvDNA==
X-Received: by 2002:a17:907:7ba1:b0:b73:870f:fa37 with SMTP id a640c23a62f3a-b76c53c0113mr1869044066b.17.1764362630322;
        Fri, 28 Nov 2025 12:43:50 -0800 (PST)
Received: from ?IPV6:2a0d:f302:e054:54:ffff:d714:229c:6eed? ([2a0d:f302:e054:54:ffff:d714:229c:6eed])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f5162d55sm531899966b.11.2025.11.28.12.43.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Nov 2025 12:43:50 -0800 (PST)
Message-ID: <58d2e5b6-f809-4059-a331-d92ccd75d47d@sigma-star.at>
Date: Fri, 28 Nov 2025 21:43:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] mtd-utils: add GNU_SOURCE define to c files
To: Rosen Penev <rosenp@gmail.com>, linux-mtd@lists.infradead.org
References: <20251026200049.25152-1-rosenp@gmail.com>
 <20251026200049.25152-5-rosenp@gmail.com>
Content-Language: en-US
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
In-Reply-To: <20251026200049.25152-5-rosenp@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251128_124353_338144_044C0D4E 
X-CRM114-Status: UNSURE (   8.82  )
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

Hi,

your _GNU_SOURCE commit breaks the build (you removed limits.h
from libmtd_legacy.c). Besides that, I'm reluctant to remove
the global _GNU_SOURCE define, we might have a number of implicit
users across the source and the extensions we use are generally
useful.

While I think it's a valuable goal to be compatible with non-GNU
libc implementations like Musl, or klibc. Libraries like Musl
implement a good chunk anyway and for stuff that's really missing,
we have a libmissing.a.

Regarding the Linux header inclusions across the code, those
parts (e.g. rb-tree) have probably been lifted directly from
the Linux kernel tree. I don't think we should try to intentionally
try to diverge from the upstream version.

Also, what would we gain from portability here? Portability to
non-Linux based, non-GNU, Unix-like systems? What use would those
have for mtd-utils?


Anyway, I cherry-picked and applied the _POSIX_C_SOURCE patch to
mtd-utils.git master.

Thanks,

David


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
