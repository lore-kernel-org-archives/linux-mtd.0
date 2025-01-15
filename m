Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACFF4C02185
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Jan 2025 10:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=88p1V9iEOeJndKYiuC59/CtihSx5ZTmpvhi42e/Xix4=; b=UNkQbD/8E649vl
	Oy5BmOwcCaDg1ec9CYUGdM4X3gy7rttVn2L7kCH0k30tNRtUu4ooXAzFqIWQMYOj4pW264G8HBNum
	lfV+hqHYO02VA5D0v6QieTVdlM4DgJOCnFKkoVaEwRD6hH5A54L0Jjw/1G7IFxG1FzKpYL9I7Np4J
	H6InCvIHsd4o1fWmTmXBoaNx0M+AS1MYkm+9K5tYcjRVkuI6Y/NEXhzAemubGnRUKWdLC0mBXs1fr
	SSUeNWhFt5UdcymL9YXB1sJgDxt5Qnuw9v+2inHbUBdefhA6IkXPUdexKSS8SmCEA226ZnZ9ZyLjq
	57N6y3DffpqYGVGS5zjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY0eS-0000000BUaa-0gZk;
	Wed, 15 Jan 2025 10:29:32 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY0eP-0000000BUZY-3cRq
	for linux-mtd@lists.infradead.org;
	Wed, 15 Jan 2025 10:29:31 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-436ce2ab251so46514975e9.1
        for <linux-mtd@lists.infradead.org>; Wed, 15 Jan 2025 02:29:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736936968; x=1737541768; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8rS+H2/za+FOVeRQ6Rz949kNFZx5Z22FhhMvelNCIdo=;
        b=U23qZ3rqiKK92YGcvWCW5ts8daf/y7suHuEkk/GCYos9HHgHeHeE3idyEKeANFyix8
         cAq+80NLfUBFe1+luwZB6sckSvSUY8D0H3IXDHWMeNvYNDLrxAYK71IKgqqkgIyd3Sum
         GhU1c3majHn1fiDStXHjd6uoHVfoFF8QbEklYTLyZfeN8UOFk0jDhb6w7HxKz2qRIs+b
         Lq6akxgpT2AET5CShB+6OYav8ksfF0ma1kDNXihWeZqqApZs4rq0IS+ooKe4Tsu0pjX7
         To2wuNcqSUPdPZm88WcNqM2sAznhHppa/rF92UiaQqrgCPyjxZvtkar6LHyt6EcmkSdV
         9LkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736936968; x=1737541768;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8rS+H2/za+FOVeRQ6Rz949kNFZx5Z22FhhMvelNCIdo=;
        b=RWA3KdpprfcPrtH1jBzDJXjlZVuXXYOhbu/1Go/cnsvdEHG52ZhCJMdbsdF1KRClYv
         4B2lY/p4lgDpzo2VSgAz1WyFM0CcjTrJNq9+5KAHcHT2GH9+V2xJtSTpSVJPqWXZa0TV
         Y8P1m+P3Urb3lSSFj3P7L+qZKmGMdxXkSkHEOWFTtJYZLgnjqC6mhLNRFSonz6icWzi9
         cFIkAE6KZ9dcZ/F2QOoizjuCzpTAgzA/y4EJwVgvvZAql/ljfUyz3BBL0205+kkC3POe
         3BYtE1iMJrrfOoTM74e+sfL+x9UYptYOPrVkStmyGtzIeTyQZqHGU5T4TVMBxodRnLZJ
         EARg==
X-Forwarded-Encrypted: i=1; AJvYcCVCVIEoLQHUyORDrH55wRTj4vU4TJkkkM7Q6cN36NsdMJEr+SDZ5RjOdadMnPfNbWfHGFYj4QxsrFA=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2alIYfNc9a+M7SDGrF7S0gdaTKnqhS+I6IYKMqn398/LOMT/a
	5Cfy0Hw5s0HwA527P1pJIeCB6ve1zMSLdgockRHbBunqUWV7R6AKRvbvJZg57SA=
X-Gm-Gg: ASbGnctLaGoQi2cGD0cTMsoFduciF3Hy10ixjnuNcb0uDq8fErQVCEJsB/VuO+f5GIy
	hu+9HmgWeLrvc6jTxMKzyr0uKz7cCYEA/NB3w8ZoQAt7DTrYWw1ok0wAaTVkzieqzVugGvwt7B7
	DlOMdqP8EIHl6sQ8ZmLLHTToTvjofX6HuOdYtf0sEg+Ktnx2McEmtIAa77cy7VQojQrLMCj9S+r
	u/l1R7kh8S4pP6sg1h1KcqZEPy5LDOjRVN2ekuVQQ/XHpq5dzUbyxirNHn0Hsz3AQ==
X-Google-Smtp-Source: AGHT+IEPkLdf+dQmwl7MNLODWTed7iWs5WSFxMkynpNCoh2uYyinNWX8qgFAA3QGzhF+SGJs6gR26Q==
X-Received: by 2002:a05:600c:a01:b0:434:9c1b:b36a with SMTP id 5b1f17b1804b1-436e269715amr248623345e9.13.1736936968248;
        Wed, 15 Jan 2025 02:29:28 -0800 (PST)
Received: from [192.168.0.14] ([188.26.60.120])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c0f02c07sm32455025e9.0.2025.01.15.02.29.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jan 2025 02:29:27 -0800 (PST)
Message-ID: <878f66c3-83a4-4f83-88d8-ea2917d82d76@linaro.org>
Date: Wed, 15 Jan 2025 10:29:25 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "mtd: spi-nor: core: replace dummy buswidth from
 addr to data"
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Cheng Ming Lin <linchengming884@gmail.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 alvinzhou@mxic.com.tw, leoyu@mxic.com.tw,
 Cheng Ming Lin <chengminglin@mxic.com.tw>
References: <20250115101659.55882-1-pratyush@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20250115101659.55882-1-pratyush@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_022929_908921_C0F30F4F 
X-CRM114-Status: GOOD (  20.64  )
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



On 1/15/25 10:16 AM, Pratyush Yadav wrote:
> This reverts commit 98d1fb94ce75f39febd456d6d3cbbe58b6678795. The commit

"The commit" on a new paragraph please

> uses data nbits instead of addr nbits for dummy phase. This causes a
> regression for all boards where spi-tx-bus-width is smaller than
> spi-rx-bus-width. It is a common pattern for boards to have
> spi-tx-bus-width == 1 and spi-rx-bus-width > 1. The regression causes
> all reads with a dummy phase to become unavailable for such boards,
> leading to a usually slower 0-dummy-cycle read being selected.
> 
> Most controllers' supports_op hooks call spi_mem_default_supports_op().
> In spi_mem_default_supports_op(), spi_mem_check_buswidth() is called to
> check if the buswidths for the op can actually be supported by the
> board's wiring. This wiring information comes from (among other things)
> the spi-{tx,rx}-bus-width DT properties. Based on these properties,
> SPI_TX_* or SPI_RX_* flags are set by of_spi_parse_dt().
> spi_mem_check_buswidth() then uses these flags to make the decision
> whether an op can be supported by the board's wiring (in a way,
> indirectly checking against spi-{rx,tx}-bus-width).
> 
> Now the tricky bit here is that spi_mem_check_buswidth() does:
> 
> 	if (op->dummy.nbytes &&
> 	    spi_check_buswidth_req(mem, op->dummy.buswidth, true))
> 		return false;
> 
> The true argument to spi_check_buswidth_req() means the op is treated as
> a TX op. For a board that has say 1-bit TX and 4-bit RX, a 4-bit dummy
> TX is considered as unsupported, and the op gets rejected.
> 
> The commit being reverted uses the data buswidth for dummy buswidth. So
> for reads, the RX buswidth gets used for the dummy phase, uncovering
> this issue. In reality, a dummy phase is neither RX nor TX. As the name
> suggests, these are just dummy cycles that send or receive no data, and
> thus don't really need to have any buswidth at all.
> 
> Ideally, dummy phases should not be checked against the board's wiring
> capabilities at all, and should only be sanity-checked for having a sane
> buswidth value. Since we are now at rc7 and such a change might
> introduce many unexpected bugs, revert the commit for now. It can be
> sent out later along with the spi_mem_check_buswidth() fix.
> 
> Reported-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Closes: https://lore.kernel.org/linux-mtd/3342163.44csPzL39Z@steina-w/

fixes tag please

with that:
Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
