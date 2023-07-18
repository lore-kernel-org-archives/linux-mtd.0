Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DFBBEB64DA
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Jul 2023 06:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iooOhW3g8HdkE2v5HM/ENjULXVYcbMlX4uTdrQCGcrk=; b=hX4kBCaiiAbpP+
	t+cZ4AnpzO/dvdL7OimKs54y4TcxB6bREYNOeCWo012LPss77E3YzdQYT+cR+q/kgfdf+xdC/GA1T
	xKfDOLq0CEdgNcd0NuBTb6d+8lr4I0GJ7NG3dYuLNzqxOfffB1OZjEk72wWqgejVHSZr/0PFNkI9K
	2jsYhc/lZwD8Uq06aNK4eR6j7xW2EopdPHSAG0tk4rIMZldB2CQCqfePnCtFxhd8m8JrEr4US5qpj
	jG1Y6HNwapPzAg/KX7Hql3pecZqn1IoubFPV462Zv8UHs+kJGwFtS0R104uZAF1EYA+FD3nXmEHHX
	f1DaBKHr1f4kThVI/2Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0eU-005jQP-1C;
	Wed, 19 Jul 2023 06:27:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0eS-005jOs-1A
	for linux-mtd@bombadil.infradead.org;
	Wed, 19 Jul 2023 06:27:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=qRC+fUJny3+iV5dLqvSo+20fNwTdI9JyfgDcGN7Kwaw=; b=FfJzR9HE85/BZct/ocwwfhn/x1
	Tv963lZ9qUkG9vsVXIIg1ib6JCpZNq/TiAtzgIwx+W7GMBRNjagm8dmqM5TF1P0u471ARi+thr3CQ
	YiUUj0xazs+et1SeKS7h4qPTiEkmsyY8NwFCbh9FjU8Wt6V2KMLXdEN25brhVNhGi5xRDREM2v81H
	PS9QI0W0KohCG5DK8/vSp2mNYuitmCqI6K8lxQQM61mA4bcyMMiF5gZc1kiUttNooVGzFOPLSZrNs
	caVW3hYckjFJi154Gz5EMCTZaAoulWI3TLiZXl2U6TP/u4kSVC1hvgttEKO9YztKztFb0kESGZxKX
	hLblXvKw==;
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLhKQ-00BMx3-30
	for linux-mtd@lists.infradead.org;
	Tue, 18 Jul 2023 09:49:13 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-314417861b9so4939157f8f.0
        for <linux-mtd@lists.infradead.org>; Tue, 18 Jul 2023 02:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689673628; x=1692265628;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qRC+fUJny3+iV5dLqvSo+20fNwTdI9JyfgDcGN7Kwaw=;
        b=Y1bqNunI4Va7gwNxV35SrSoD9AXfST1MED6IG2R4qgtO2DQNyoNwfz4vmjCBzPPzXB
         Z7T6uPnWlSTi6B6ufSbCWDH2b72hPXbCERxd6tYj0+/TqH/j8s6DXyQCYBrMA6vNDtgN
         LeK22N+X//FG/D2ND2oDZyJJU7cbqRJ6pcEdmqFPZne1awuusKJeaowNYdxu2YI4x7MH
         omO4NklAG7+t5HiR6G3j4fA+mW1LIwbY4Hb4+F9dXyYX3KhohhICvSXTcjDE3SfrUs0c
         vzMAfamYS20zlww+o4iS02XJ3K23SI8VXODS7+aZTm7GGotcyu5K5WS+vTFVHhDKX9Z5
         LY4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689673628; x=1692265628;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qRC+fUJny3+iV5dLqvSo+20fNwTdI9JyfgDcGN7Kwaw=;
        b=B4VynuVv0fT6saCN1ospRnhn8k4EIb9Uv/8Ef83/T3AHXeK8QApoPhYdnxvzE+8Rrk
         Mbx3fhHmyYoemtFlkT3NBNns8LZN/xNdCw4dmM4s7/0S/u2yPhJghOH5Wb8okoNsZLYq
         5V9UCTZYfLvN4TMXfJYZ9OYkEFSlShydaGVTPXN7LyuZ0N63LMG2Af/SzIjcQp7WCbqu
         9STAsNEx73qUABJ5isP07AR2jjK3/lrd5CiG4A/9tTj429kPXsMQ6hKzAwhlrjq9nzgq
         KZOQYxz/Lq7YQqSbprxa+0NDIUy8zNgb+5JQAL+bylK/jPhuYwJvf/CKjzODETJ2t2b6
         RykQ==
X-Gm-Message-State: ABy/qLae/YOuXlz3Tu2c6w55xuAUzVgSLNRMocAuvipBLZbBt8eN1ajo
	GfxIMqfgmbfQQPIPknh0U5XGXA==
X-Google-Smtp-Source: APBJJlFy0+0RP3/c/Q29tZcuQks1DZkRQ6tQWvpm+qWkFPE4Rgo0/3QbOY/leUi38v+UhHR8ziL1pQ==
X-Received: by 2002:adf:db42:0:b0:314:53a4:42a5 with SMTP id f2-20020adfdb42000000b0031453a442a5mr1243681wrj.51.1689673628220;
        Tue, 18 Jul 2023 02:47:08 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.146])
        by smtp.gmail.com with ESMTPSA id p1-20020adff201000000b003141f3843e6sm1851838wro.90.2023.07.18.02.47.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jul 2023 02:47:07 -0700 (PDT)
Message-ID: <ef557792-144e-12ef-ce14-f98982b608dc@linaro.org>
Date: Tue, 18 Jul 2023 10:47:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2] mtd: spi-nor: Correct flags for Winbond w25q128
Content-Language: en-US
To: Michael Walle <michael@walle.cc>, Linus Walleij <linus.walleij@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Pratyush Yadav <pratyush@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20230712-spi-nor-winbond-w25q128-v2-1-50c9f1d58d6c@linaro.org>
 <f00fa2ae-6d4a-90cb-3724-2bedb96cb4fb@linaro.org>
 <0525440a652854a2a575256cd07d3559@walle.cc>
 <d99d87e7-47ba-d6fe-735f-16de2a2ec280@linaro.org>
 <e642ff27fd0bc0f1f0e293972145f680@walle.cc>
 <2d71326c-023e-69af-9337-62672f50fed9@linaro.org>
 <62083227d40d7b631c2eeac1e40c6b56@walle.cc>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <62083227d40d7b631c2eeac1e40c6b56@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_104911_351705_D203E24E 
X-CRM114-Status: UNSURE (   9.15  )
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

Hi, Linus,

On 7/18/23 09:32, Michael Walle wrote:
> FWIW, I'm fine with the removed no_sfdp_flags if INFO(, 0, 0, 0).

We'll need a v5 where you test again the flash with mtd_utils,
as we want to get rid of n_sectors and sectors_size and instead
determine them from SFDP. We agreed that the flash entry should
be defined with the following params:

 	{ "w25q128", INFO(0xef4018, 0, 0, 0)
		PARSE_SFDP
		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
	},

Thanks!
ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
