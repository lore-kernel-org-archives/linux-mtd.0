Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94908C28B20
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Apr 2025 15:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W9DDp6xZvLTu+JEay4DNvX3gdPUgNbdezUUdR4f0DZM=; b=SF0LL419YOEH5l
	gCbIT1MYPgq3ADoV3IdbD3mnGexSXjsdTuQkij4maYDKRDfRlgRLzg+cy0lVdXEjQdw780l/by+fI
	4vetLqYkEvv29+D9QrCl9+zp6y/bqp2ka+wCHMrxZ/Sd0erVncpFKGgxjMRqw8mVixFQ6m8WUq30m
	B3W8HSRHf5zDEmSojkS9qTRrmuQpG0rOUM3Ajug1WTJN4pYwiKRjLBM/MJaULw1mubhOHXQPgA2SG
	PUDOsUzTVQn7qRss3bqSdR/Z1Z6myYuerROc90jYKWnAqiBWztoVVhcFEBpLLc4KLZPyfI6UksD1U
	hPdub2jGDWnRZWBU+vlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzzlJ-00000006TrW-2wOL;
	Wed, 02 Apr 2025 15:12:17 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzzlH-00000006TrD-3GUm
	for linux-mtd@lists.infradead.org;
	Wed, 02 Apr 2025 15:12:17 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so26900245e9.1
        for <linux-mtd@lists.infradead.org>; Wed, 02 Apr 2025 08:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743606734; x=1744211534; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AmsS7TeoR5lfEkPA/4hWMzBs7ZLo8pjbDxlnDnyGR5I=;
        b=CLY7phxdouJ5PNdGqb9MhixWooW07aMcNmzsgTPg8NhRnqUfmMcjqm1xST/z4ZWyRs
         yzI2fx8obdX/mSzUOEwDhP7xx2jMbBdqP9tawhB2rMhb5G+v0FWz4iFYG36ZCETNopbt
         9K9n+144HABSyBpTJXFDcTtBQBiR0H0rusq9j02hPVjLtqxhPhI2yBdSeV54B+Vk4UWY
         NeYwjxxwry68sgC+nk/8Ar6Ksvv5NKCTvj0w/n6Sk/pOL3jVzami16mZYLP6zY1bOHlo
         HmIjeUCInB12/4z6PpORRI17qZen49voXERT+SZ/L9x55RGk0zqs+0+v1KHNyL1/SSFe
         27TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743606734; x=1744211534;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AmsS7TeoR5lfEkPA/4hWMzBs7ZLo8pjbDxlnDnyGR5I=;
        b=L+BQJnLX3sBNc+sZ++cRrVeztX8cvO2SkXWoHbxpa4a++5gYb8DKnxdPZUYfhTUQkn
         ipTSh9qPEruB1fz6ZXy8ctT5Nan9wH5g/Oplz3FPqJhMMRaENyHx9a9eQ9gmBBJH0ioP
         6fzWw67zoyatt9svpU8onLL8f4R/TBpyPcCbcHikZ/kfsjjJyu4KgLkQ0A9wW5uEOuqr
         wII0bOoVOrhmjD6XJGX6k4T+3LHxtHyr1PqoBavXioDQLTjY9V5KUiCs0Q/F4GU6d1R5
         jDGofpRw5JUjovuTlqIbjVX6drryfWVQpxOzvosbmhpiv1Yrs7CYABGucUtgUJvAalqZ
         oKTg==
X-Forwarded-Encrypted: i=1; AJvYcCXe49cXbqHdCQKR4j6bZfsIc8UzzW8AhOYdCr2ge86tzp8kbOaBwEQ7vsApIEEQd6Cpea8AsyfRdm0=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywki+iK/GHQZo9oSdBTJT7H7WA6Ub3TxiNr3fgWKcch9jlRQyV0
	oY8gwfvqzyOiu6eFTE3t+sueviMwvYHrO/xgEq891H9VumWYU9NjiocjNt869mg=
X-Gm-Gg: ASbGncth1X+dF0ePuLsGrKO5FYqyc2v4PUL2rzk3zqEr3CVGI3qMReklb38zQd70Akl
	n7dZgd1hl7R/TEpUXejohMUqH5jm3WEXIJbvB/KnqdRAIh4h1hH8LmzWmwmCVsXELAZyDxFlTsj
	WUsRxqi9/2J3fwFmYT4/IWFUeLvA5YFZ3zEnr2A7EKSS4bE9DH65WflWFNuY7fwvaqFcPbSfnvG
	BMJq62ErkhyfRSGlQkVyeeySZ5PnMK2jIcx1CPO3YbiPxd/CxDY8s5oOsbbo9dulRFkCGRaLXzg
	GZUHkOVcELLt1y1rpPf7ogBrFjY8zno85doClU9B3h9Zqb5NF6lwNA==
X-Google-Smtp-Source: AGHT+IEujW2Y9DeKZ1kwEmbjU1Q/Gf57l4gnJlvnBBZWjVD+/kyGdLGojDZmD6x8y8kOaBXZhA/wVA==
X-Received: by 2002:a05:600c:818c:b0:43b:c0fa:f9cd with SMTP id 5b1f17b1804b1-43eb5c1813emr28858845e9.7.1743606733947;
        Wed, 02 Apr 2025 08:12:13 -0700 (PDT)
Received: from [192.168.0.14] ([79.115.63.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eb5fcf42asm23611135e9.15.2025.04.02.08.12.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Apr 2025 08:12:13 -0700 (PDT)
Message-ID: <d76631bb-68f6-465f-8fe6-5bff8fd2fcc2@linaro.org>
Date: Wed, 2 Apr 2025 16:12:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/21] mtd: spinand: Use more specific naming for the
 program execution op
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Santhosh Kumar K <s-k6@ti.com>
Cc: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Steam Lin <stlin2@winbond.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250307-winbond-6-14-rc1-octal-v1-0-45c1e074ad74@bootlin.com>
 <20250307-winbond-6-14-rc1-octal-v1-12-45c1e074ad74@bootlin.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20250307-winbond-6-14-rc1-octal-v1-12-45c1e074ad74@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_081215_812566_12DB5647 
X-CRM114-Status: UNSURE (   5.04  )
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

Acked-by: Tudor Ambarus <tudor.ambarus@linaro.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
