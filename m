Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC359C001DC
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Jul 2023 06:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2fa1vhIRL/NsriT6t2aLAu9vIL2fNXLQdRtIZY17w64=; b=WbCqIQGRKwRTMc
	/ARBpdkpAPOIKbXP4TGBOFXCJYwkraP9R2QJAKOGQ4OataLzEOGnjDIclcQjordIBSLC7TBf/hnqB
	YF+HKdxxd2WkO46UPpaqS/x55Y+p/afiXdJtiIZ+t/AFqRpCY3yZtQrn0ahGuwtRLNaipIdEA92BG
	9oCKOK/c/VUGmeAnRC1J/O0dHf91c2rCzqN6VfrXi7HLdmIyo2w1gHUVSR4r0CmA+Bn2L/tKDQ/GJ
	HWa2ArqLYk97MDTky/NmpelZJCqAojq9ZrIu0g0eNfHWXMWLuXiWr1c2G2pOb/RK1nM0fHQLKMC7n
	PTqx2VRXlQJxmm00mHuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0w1-005sSh-34;
	Wed, 19 Jul 2023 06:45:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0w0-005sQz-1g
	for linux-mtd@bombadil.infradead.org;
	Wed, 19 Jul 2023 06:45:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=72FhdPS3Ipgc+61xo1bTQmq7CNwY+k/csxqHf0W+Kgc=; b=dfS9oKinohlukknz5YIN51VY/p
	TBRLDSvdnLhUOYs6dFcZRhUlaLd9aPiHXNLzD0s0KTYS+JEnu2VMRZ62dzQw4mBSX+zZOKgl17g13
	b3xrAmoE1gtE00D00z8bx00HQgcQ2dFKgdG3qvVTx+qoCESBdn1AfZwfYo3aPioBae5q7h92Mze/b
	liHumn2Uba4SGPJcUB5hYzXnZdhTAP3HY7a1RhMl8gtKHGVjfiY1DGTjeV2C00vJZxCMH7GAwfMtr
	DHIWQZjlMYCGGBrDAgLTH1R4qsF86K0QT4d8wXmCtcuHZDhI08J/Fyb4AY1MwnntKFC1tD63F21SL
	vvoD9Z+g==;
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLfUZ-00BGjT-1s
	for linux-mtd@lists.infradead.org;
	Tue, 18 Jul 2023 07:51:33 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-3fc0aecf107so48500865e9.2
        for <linux-mtd@lists.infradead.org>; Tue, 18 Jul 2023 00:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689666620; x=1692258620;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=72FhdPS3Ipgc+61xo1bTQmq7CNwY+k/csxqHf0W+Kgc=;
        b=eIGrinQLYAnNV+SLaGJPr3GVN2lItD7H1d9sM+vyxsFnJBpMxHOKV7DsBXhFKakXHe
         P8qNDpnSF/6sbzvyNymiywjIK/x/i+njaGplUUqzoi7RLs8hcsAd5tZknLmVoY7oqkZe
         ukm5aQnXn13LcI6A8a0nHEFOHe6kXbYIywBTa5dVj6SM4nO7rfj11duI6uFDeQK5Oey6
         2N+V4MT35geqyok3qOIRTY+pKYUd3XsAiyGp6NGVHu8nKi2aTBq4T4Tf5UVGXrLW+yVr
         1ntpionamnSULrahwiipdSQ2rhMixSw/4HMISUx7EBDQEMjo4jVqbyq6wAp96w1lzN1s
         838Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689666620; x=1692258620;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=72FhdPS3Ipgc+61xo1bTQmq7CNwY+k/csxqHf0W+Kgc=;
        b=IpZDSxjQxiPOy5vVBclqpVIsMkJojY4W5YG4IafudSQvdGWuxzIiQU7h+0rx+yumTC
         DgT3qha6iVLs9oBjIl4ERLI59JbAKUJ5CSDkphk1ziaoybjgf/5P+JYTnu1vpsDD6nHM
         HMf7wDxoWKzqMEtnDJ1otmG5akRPv8vFbZNw0QpEAFaIR+bCwfISN2736XjZYR3VcaRM
         vzxt2C9kzZJ/YhyuVOf6Z6G/LydtZL5KnRy9vPLozEkXmrNfpaoSt/QWvdYfpFsKHFA+
         pufZUxbcacgxUhtS2iPrx8H8A/txMJfxCQr7TSU9qWsmVtlndsKewZFAz6VysLDXoYKd
         2djQ==
X-Gm-Message-State: ABy/qLY9RUu1ue/jn46EUeroGGx8D85ELoFGg4/feLx1Hu8c+sGiHzw2
	CiqzM4+hOJZjuvLdc65vFruKEw==
X-Google-Smtp-Source: APBJJlG8EPUE1XziNnCoSl2rQUWh4TKDhDkTXeNhO9azyswkPzzAsEcqa9Z9/FJpb8REI/NZmb45Ew==
X-Received: by 2002:adf:e787:0:b0:315:8f4f:81b1 with SMTP id n7-20020adfe787000000b003158f4f81b1mr11999178wrm.50.1689666619960;
        Tue, 18 Jul 2023 00:50:19 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.146])
        by smtp.gmail.com with ESMTPSA id j20-20020a5d4534000000b003159d2dabbasm1544415wra.94.2023.07.18.00.50.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jul 2023 00:50:19 -0700 (PDT)
Message-ID: <adea1b76-f40b-9d42-9b42-ae20a8976698@linaro.org>
Date: Tue, 18 Jul 2023 08:50:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2] mtd: spi-nor: Correct flags for Winbond w25q128
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: Michael Walle <michael@walle.cc>
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
In-Reply-To: <2d71326c-023e-69af-9337-62672f50fed9@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_085132_228092_4E6EDA4B 
X-CRM114-Status: UNSURE (   9.66  )
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



On 7/18/23 08:44, Tudor Ambarus wrote:
>> If you decide to break older flashes, then I'd prefer to also drop
>> the n_sectors and sector_size, i.e. INFO(0xef...., 0, 0, 0).
>>
> Isn't v4 already doing this? I'll amend it if not. Waiting for ack from
> both you and Linus.

It needs another round of testing if we set n_sectors and sector_size
to 0, thus Linus has to spend a little more time on it, sorry.

Let's agree on the final version and close the topic.
Cheers,
ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
