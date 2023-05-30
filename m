Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD0FDC77B7A
	for <linux-mtd@archiver.kernel.org>; Tue, 30 May 2023 09:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kibbSIsSgPObItdlpy8jqXmZtVVFwm7rw1BTDuSRFVI=; b=OyunZiTci1J4Qv
	jo795Rkl7hm5i5NlxreT3o+PUjxKkOMzeeXCsvucs//EsPUfaVj0W7+2cnzZ+4siLaAHQiSVL+IDS
	5k1CSMc5jcwLZH5x9LMtQjeEliWVxv0Sz25eq7ThBleDDE+sTVyfxIv1sAxKrA4NXteKglIatWGUt
	hcVYzxsiWdkfUyYyFQWBBA/t51vhWQq+EzSJW2x1PhkknplmJxR5LXTRNoT+l7SAa+/WzbiaERvwm
	iY0cccD8Q/wRgm7bscwpRK2smvxTNG84qc+qKn8DPijzFao9CJMxjnobQiKLWftBIADZ4zcHGeqts
	3xf20PGpip8I49FB5caA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3vVW-00D7c4-0r;
	Tue, 30 May 2023 09:19:10 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3vVS-00D7b0-27
	for linux-mtd@lists.infradead.org;
	Tue, 30 May 2023 09:19:08 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-96f5685f902so631656366b.2
        for <linux-mtd@lists.infradead.org>; Tue, 30 May 2023 02:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google; t=1685438344; x=1688030344;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MqSNiwa/UAtmNvnHHz2pJKBZRyVaTikg4qj3JO/V5O0=;
        b=XWrglSxBhRGfic3BVOq0X7bn81wnzHTK+oreBKZwQXkJLvBCrkbPpH2RW1V/1IBAlP
         qvdOJwWTIOpUvkeC9f8aEUAesami+RPDKpThLqN0u7xCahUgtmXrQZH1ja9s4FkvGnxr
         tQbdMMaDudak7Tdd2AkyrjToy7Qe6t0jvzqKktzWobDItv5ez9yiqHfnvGdf8HVyrxO4
         wDCmlmifGoCljxf4C3dDjUUSQDsjx4kao51wkRnzdvkqNgnQhU1mFkrYNNBgTNQZrara
         HqcfJUbeECn4MdlYyHZCaVu0Z/JqU7P4CjoqG5cBGkN2qRBKnxpcVKpMsKGieFB6p+an
         oKBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685438344; x=1688030344;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MqSNiwa/UAtmNvnHHz2pJKBZRyVaTikg4qj3JO/V5O0=;
        b=CrwD1FhTWcH8ju4LkDfbHA36+z6S5lNzJ1pfXpgEID1dDL+82Y5OcVAJ0RgLsRrRy7
         sSX7shP9mS74NcFwLODtq70kk9Q/EyJmGPulMx3lj5y7j5rWSna8Z75rfbnmUisrV5HC
         5eNcPJt3uHXFtXc7hskcXzwOMcaLq7kg4XkeQKlpJKN6EpYIWt4OJ2xrNoCaJL96fYgx
         01jTnFdGU9Z9uKruRuUDYZtWGoAteUqA0aR8KWWO7uU04hEkeBgf5CGRnT6IGtrz/b+m
         P88E6HmzY7XPjbqqqrs9JLgiQUYFOPIzlgZFn62OI8+SsUw/4waGiL4Dgh0q660WGYaj
         Xxhg==
X-Gm-Message-State: AC+VfDyU6mNwatUG8FrCOFDNxZGH8fUd/cDRiRp8CIfDd4Dim5EcTy6W
	+xgOrmnuYG5lkmOEdySmlcDckRGh01kSAtBx+Os=
X-Google-Smtp-Source: ACHHUZ7cWmZ+P4coCTSte/dyr43s16T2XmFofZ0Sz8b7+VlMzCJpcwBzGIUlJ6FAQzuL4nkE4sTckA==
X-Received: by 2002:a17:907:7e85:b0:951:756d:653c with SMTP id qb5-20020a1709077e8500b00951756d653cmr2205167ejc.39.1685438344499;
        Tue, 30 May 2023 02:19:04 -0700 (PDT)
Received: from [10.115.255.165] ([82.150.214.1])
        by smtp.gmail.com with ESMTPSA id qo14-20020a170907212e00b0096f937b0d3esm7046126ejb.3.2023.05.30.02.19.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 May 2023 02:19:04 -0700 (PDT)
Message-ID: <1c438f6d-fffb-83be-c0d7-1434aa2b9ed9@sigma-star.at>
Date: Tue, 30 May 2023 11:19:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v1] mkfs.ubifs: Fix mkfs.ubifs failure with option selinux
To: Zhihao Cheng <chengzhihao1@huawei.com>, Zijun Hu
 <quic_zijuhu@quicinc.com>, bastiangermann@fishpost.de
Cc: linux-mtd@lists.infradead.org
References: <1685090853-25855-1-git-send-email-quic_zijuhu@quicinc.com>
 <d2e46286-bcd0-35fc-8fe0-cc1fec2e4b40@huawei.com>
Content-Language: en-US
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
In-Reply-To: <d2e46286-bcd0-35fc-8fe0-cc1fec2e4b40@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_021907_007830_708B9BDD 
X-CRM114-Status: UNSURE (   5.73  )
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
