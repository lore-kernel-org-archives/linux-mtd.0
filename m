Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C23CC07E9D
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Sep 2022 06:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kibbSIsSgPObItdlpy8jqXmZtVVFwm7rw1BTDuSRFVI=; b=gx/fmHCYmlSQ4O
	sGG7VHVmnHGVfZl+vFyA94u6SrHP7kIwwVC9hl1Ih5XELMw9K2eLxkav9NMwDAQu2hnWzl0h4xEbp
	1K1zohLb8nhDTvqeYX3/eQ0Ck8e8yGPY0ruUkoOmELpoiNfjKglbhKtbj3tfLd9wC947FYmNICLIy
	bfn65zbFJ2CXbgECSTeQ6sY18nSlzfovW5Q2TUMmSvCsuKToS0/rwsOpIra2ksnPSjmh+R5JAJZM4
	OuEuHwyStvm0LVXj/cXHBPUpTeihDTb9CQ9pYK8ldfw9MsyABvBTvZbmniMx6aLCkxaOP+20N2agQ
	Q6noaG49Ez9Ezr1OR3dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1od4Jf-008d4q-8f; Tue, 27 Sep 2022 06:43:39 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1od4Jc-008d3X-6S
	for linux-mtd@lists.infradead.org; Tue, 27 Sep 2022 06:43:37 +0000
Received: by mail-wr1-x42c.google.com with SMTP id h7so1040736wru.10
        for <linux-mtd@lists.infradead.org>; Mon, 26 Sep 2022 23:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=MqSNiwa/UAtmNvnHHz2pJKBZRyVaTikg4qj3JO/V5O0=;
        b=opUS1oIzG4NLdc8ToB2Sb8ybS0naR6KYOFrWE7GnOGzWpfMDheUNw5oH0fUyPTHlIt
         4ir9stvAJsx2GsHmmf8x2jTrm95t3zIbucdGq8gU3VAAUO1PJv41pllYMKbbAn5oc1ye
         GMMVnhvIetOe1zi9QZtHAieDjq1e78lmv+2XkD635yrzH2pPsI5Inc3kLMY7jPXA33GE
         IOLdOjXX8Rt5XmWSFgKHsexHq79xvx6E0i3915TbAb4pQuzH4U9618NP7/i85l19pfps
         KBdfLEVOASANy//PG23yhuILJZv7nYtYVaoKja/n3SeKii3Hc2u+3huX/FaqSRojLdRc
         cIuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=MqSNiwa/UAtmNvnHHz2pJKBZRyVaTikg4qj3JO/V5O0=;
        b=wsvRTI8UEcIX/4QnMPzUqsSRQJRaFgC3APcqZDCEgdv2CRnxFvfQs9xnZ4+QTjh0bE
         nrhNbNWoDm7cbAF5X9FP8oPstoKv0+agIELc55AjNhbdzoC1E1lGQBL674BYhVcGVlSS
         4plB1vYZI5GLHKT636XoG8H8oPUvCTXEbldyu5mwrssBbZfIQPlntVPJsORb69yFBeGx
         v+Gnzg3vIWQtnsN87ST+YXveCE6qDtSBxMSDkcnlfx/0HgVj8/Dzm5cQ6qXh2HMHV0ig
         4FNbmjfF0ZTI40VJl+qkLDHGVYKIdDbBrKRiYRYyMIHLyGuF0kSPKeS3qUKNPNm+MD57
         ELOA==
X-Gm-Message-State: ACrzQf10Ez5xyc6BJH/7hW0twkU0f9lAX4Nb6Te1kMb26K5rPpJxMjzg
	48EYUZYtTZdtVEGq+K40W8Rf0g==
X-Google-Smtp-Source: AMsMyM6+xQTXmhRO3z1SZiu99fvTzaxnEFCzVf1jA0Zi9/JnKqR0D/22k5W0bqWBfwdxb8hNaFRGHQ==
X-Received: by 2002:a5d:5089:0:b0:229:3151:2865 with SMTP id a9-20020a5d5089000000b0022931512865mr15222094wrt.81.1664261014035;
        Mon, 26 Sep 2022 23:43:34 -0700 (PDT)
Received: from [192.168.178.86] (clnet-p04-043.ikbnet.co.at. [83.175.81.43])
        by smtp.gmail.com with ESMTPSA id l8-20020adff488000000b0022ac61ebb14sm907570wro.22.2022.09.26.23.43.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Sep 2022 23:43:33 -0700 (PDT)
Message-ID: <048a8b0c-7c66-0ab1-a4e7-2fdf23085087@sigma-star.at>
Date: Tue, 27 Sep 2022 08:43:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH] mtd-utils: flash_otp_dump make offset optional
Content-Language: en-US
To: Sergei Antonov <saproj@gmail.com>, Michael Walle <michael@walle.cc>
Cc: linux-mtd@lists.infradead.org
References: <20220818093548.1932952-1-michael@walle.cc>
 <CABikg9y3YP=XU4h09PsoWpTSvMnrOrKO7j0DUKH+3Zdg+jz=-g@mail.gmail.com>
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
In-Reply-To: <CABikg9y3YP=XU4h09PsoWpTSvMnrOrKO7j0DUKH+3Zdg+jz=-g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220926_234336_245777_599BB760 
X-CRM114-Status: UNSURE (   5.44  )
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
