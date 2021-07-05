Return-Path: <SRS0=N0H7=L5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41C6EC07E99
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Jul 2021 14:49:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 015B26193E
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Jul 2021 14:49:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 015B26193E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HPj9T2O2YOM7ERGh9aefcCv2gjy3uFW7oIgBtvnVyMA=; b=vVjs60/+EeEGWyhtymfumf26ta
	JQ3mFVrcjf/g8KdZMfh6KOL6l57HGJXbhJ9nIA0lXJUzVRE1YDSDhj0G3XT5R60YDJK4XPLAY3vLy
	ffaEvq7fWvRnfDhX3T3Ml8/kS1p/ohErpzHpRamzH6tZLrN59WBX9ETRDKkZW8TvxADR1jkol58cr
	t5rYLoxjPzGNDU7OI+xXiYchpdOIJ570sb9tyP1RQiTm4Xjox2ahtqmKkHWAxtBtuI8SZYawMlHwJ
	5CitFncDCfWD5VrdKGnW+VeDQThp9WfLVpqNY+ZxCQu30BkHX1gyry6K1M4FGMlNnxovmcA4/0wO7
	cYaOARBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0Pte-0099RG-UE; Mon, 05 Jul 2021 14:48:30 +0000
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0Ptc-0099Qj-1J
 for linux-mtd@lists.infradead.org; Mon, 05 Jul 2021 14:48:29 +0000
Received: by mail-qt1-x836.google.com with SMTP id n9so12394822qtk.7
 for <linux-mtd@lists.infradead.org>; Mon, 05 Jul 2021 07:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=2zmbjDFIaZtiyBVWKZoOJHJ00DjMnvggIa2QROg9R98=;
 b=KkTD4Dx7MKl6LNSDU0piJ68YMk+h9b9/3OGdqn+ig6m6S5bHtmUoIO/Q9E3zTXnP7r
 eUdW5hzpVFjDr2Ry+VyfXjwjL9oyAsb5Uc6brPZRR3Gw2rZ5Jx4fvnlKnYY/8xuY0lHn
 KhU96ebnlUuh1NqkyzaVLhXg5De4yJQUsRLVWZ4+WpPzeit8OjHSkZLDfLiArFE0Ot1D
 7lniL1GqD18yMPnQYSd8cXNQIaqMXkJheqTYRQLKv/w6LwsSj1wf6ca2nAWe07eqlwdo
 zfT+RuedS90VxOrZfkAGku8hxehgfeOwpmOCRtJMsJwZzNoM68rzEIoa5TBcJmBrNl+W
 tl/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2zmbjDFIaZtiyBVWKZoOJHJ00DjMnvggIa2QROg9R98=;
 b=GjGUU9mbE5UZuUVnpy9RKV1DduUR3d34idkmRG2qr1cD6YfwQF3jeWdWKBeqm5fLqC
 ZmRyZB9XvoTZdLCPShSnZGQLdRncMg47bAXd5RSeyVVwKxb8nRFiycn7eHqC5RTiCkYG
 wHS7vKJcPP2ANzyZ3RIS6rhwLPWCgSyR6q5Ad/L1Lt6MzSJ10D8ZWoqpKu59pBJhsGVx
 CL8XQKMw6/ZrlEN/tjUAhn0O3PpYWrS90+7RqX3FXszefVdABPZ2IhKI/n0knGVubvtP
 iqNw7w6ZdTlwlWnCWFQLfuKGF1MnwJ8GZl/DtsAwEJClBu4z7q/xru+L1rOq2ViBvDxj
 xZGg==
X-Gm-Message-State: AOAM533Yz8WJSUTBt4xTXUfc33r/DwpBwtKNFrbZqg1Im+OBmCA/R/0Z
 I7RTsxw5QU+krg642DCkEbdUYHODVTXy7w==
X-Google-Smtp-Source: ABdhPJwTf0hicO7g+xx48R4psSASkNcG40bxjp266rE0H0pv0I9zV6b5hNu2WBDj1br05e9bwQb4lw==
X-Received: by 2002:ac8:451a:: with SMTP id q26mr13163488qtn.68.1625496505267; 
 Mon, 05 Jul 2021 07:48:25 -0700 (PDT)
Received: from localhost (rfs.netwinder.org. [206.248.184.2])
 by smtp.gmail.com with ESMTPSA id j3sm4579383qth.63.2021.07.05.07.48.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jul 2021 07:48:24 -0700 (PDT)
Date: Mon, 5 Jul 2021 10:48:23 -0400
From: Ralph Siemsen <ralph.siemsen@linaro.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-mtd <linux-mtd@lists.infradead.org>, Marek Vasut <marex@denx.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] mtd: rawnand: denali: add more delays before latching
 incoming data
Message-ID: <20210705144823.GA1459782@maple.netwinder.org>
References: <20200317071821.9916-1-yamada.masahiro@socionext.com>
 <20210630184741.GA1037365@maple.netwinder.org>
 <CAK7LNASvYVyEQ4M_zEUdw9K9AB-RVErKoqFMQZ5OSKJF0AoBww@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK7LNASvYVyEQ4M_zEUdw9K9AB-RVErKoqFMQZ5OSKJF0AoBww@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210705_074828_128546_9A646CDD 
X-CRM114-Status: GOOD (  11.34  )
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

On Mon, Jul 05, 2021 at 01:00:43AM +0900, Masahiro Yamada wrote:
>
>I no longer have any hardware to test this driver.
>
>If you increase data_setup_on_host (the current value is 10000),
>will it solve your issue?

Yes, it does seem to work with this value increased to 10001.

Looking more closely, I compared timing parameters in struct 
denali_chip_sel, for the kernel 5.4 (which works), for 5.10 (which 
fails), and also for 5.10 with data_setup_host=10001 (which works).

                 5.4     5.10    5.10+10001
acc_clks        2       3       4
rdwr_en_lo_cnt  3       2       3
cs_setup_cnt    1       0       0

So it seems that on my hardware, rdwr_en_lo_cnt must be >= 3.

Regards,
Ralph

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
