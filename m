Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2750EBFD03
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Apr 2026 06:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kibbSIsSgPObItdlpy8jqXmZtVVFwm7rw1BTDuSRFVI=; b=h4JxX02ygXN0eZZlyNZbbD/nNK
	266QrXnQH7PVvhothb5VSWgsHX1FeNDv9Uuc8s1ihb6L2GjC5k8Qw9z8AF97n0ODdJcVPhXLwporo
	Qb3ePQYjnuunloB0Nl31F7tRvzX2jNYFKWsMQDnkrQGqG0IXatXlGZcpkimwlB2hyp2LiYOSsY+Mc
	sB3UFEnsGO9MR8WCOLhp48aoELNK18sxXhP/l6BpR5KSKGdjxXNtJ8HPvtd6fs4WfvBPvKn17HrlU
	VeV9QEL6YwxUEOTDRd8NJrzSuh2siSj9cK5dcg9tJr8BgxOIXse8e6Y99ntpp/MZ2wdL4hbi7qKdR
	waiuY0kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCB2b-0000000F5g8-3Tvi;
	Mon, 13 Apr 2026 06:45:01 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCB2X-0000000F5em-444e
	for linux-mtd@lists.infradead.org;
	Mon, 13 Apr 2026 06:45:00 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso36385755e9.3
        for <linux-mtd@lists.infradead.org>; Sun, 12 Apr 2026 23:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google; t=1776062696; x=1776667496; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MqSNiwa/UAtmNvnHHz2pJKBZRyVaTikg4qj3JO/V5O0=;
        b=Bw/6GKNhu40c/9SH3LVz5+iMN8E1Qysx0LFNRcDvHDdxe4kzcsxjmPVhHZhKkf7hEI
         mu7ALUXBttTyRqU4HxWyDw3gqYY5Z3ifIp+3pCtDob0z4/grpNzOfvNroSU73892ExSt
         jVTypdxvElgmHL1WDzDbEJotzeHdZnSBh5z/0/Q+AuEwIWhtWKdXcTR5DrT84RhjJw5w
         UFdf18PmuHSmgr6FPBmYk2CnoQ9EeaBMq4BlANHTG2Y4IqrxBf50YtL3FULsIiWTf5pT
         pmMRcJCgn5W7CF2eKUP5Lsnf+fzZmIxz+OPPMsw1Wa/DsI7xAxwyh1V/uJfTTB0fGnjf
         LVbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776062696; x=1776667496;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MqSNiwa/UAtmNvnHHz2pJKBZRyVaTikg4qj3JO/V5O0=;
        b=pynLWz0byraPHGrc+Nzu3C1jVSsICPVXD9gJ+zQrgl70b8lakVmhxv/4hAuU+DnHJi
         uBcIlFZPEeNz0DAD2cJZEW0mvi9a7u9fISUOMArBHicOzx5ooKglJbtypqNsjAEEcjFe
         TXIhe/v4nGJA0MVO8EXOI7j086XhroCG7WV7df14J7SckWpWUvRHbh6A2oAwhwx4uRmi
         f0LMView8QIquZZuGmokGdedroUdqw0c1MtTup3IvCAFb1KDOxjk7Z++ap58m6v1MxqT
         107FoMpYfN/IarXAtjJsXrCVwDI4ya6WkFxlSPxbpjRb12u2nxjWO0VPbEfTBMjTleqA
         Cxyg==
X-Forwarded-Encrypted: i=1; AFNElJ8DpJCp0js+RCZOaYqiVrx52IYc0U10JK5dak1Ui0a0G94xnpQ7fku+phip+VaijDfoJjuw6gVdBbM=@lists.infradead.org
X-Gm-Message-State: AOJu0YwiNAfqFNmNxP00CsDz4cRFOc92nolQUNRfwvehL/YVzPZj0rYP
	f10q+w/LmO+M2z6oQA/jVoT3qFaMJ6yoOuSthR5NMQWh4FJuXhgEoFgO4gwma6j0+JhdKF6XOOx
	cX/xo
X-Gm-Gg: AeBDiet6+QVXXsIV7xSkuzBJ0MKkJKVpXeJZHuZDsi1g82OADChjK1H6YGg+wtVs9ZP
	HzBWfrI6+evdsQNUg1ZGL4lAXtDWp8z2Wiu/WbXoJt9TQD/UgjUfR5dI4kWMDpKO1Rp411U3vC0
	IfOiKVwzVTY/mWVkjMW9X97KIyz4guG7xN4qcyD/kXm9apxIlDUsUkrMCQ0bf5mf6Vp7BahrW8X
	+jBz8MdYhxrkjyVHaXfEdtI93WlGddGLTzJ+99boF8x730c7YpY6vVwPvfIs6kf22dLxav8cpXW
	+YQvVKA/8vugyBIJoah7B2SdNYM49V4ELVhTZZIhrovjEz2jPCBUR+YfJSxN8T/dEWGZnMua1eG
	WBFiutpszpezpjpEJTKbGv2sQid0ZcASDuo4zicA4td/YI5Cfs6BOMJD45hD6L0U7cHiMsIg7Ss
	H1SeS/9zFA91MALWLwj7eA7kRva+t/X1uYc9R4t5q9/tPImw==
X-Received: by 2002:a05:600c:17d8:b0:488:9ed3:148f with SMTP id 5b1f17b1804b1-488dd442b15mr63608415e9.21.1776062695880;
        Sun, 12 Apr 2026 23:44:55 -0700 (PDT)
Received: from [10.115.255.165] ([82.150.214.1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d686803esm87666825e9.29.2026.04.12.23.44.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Apr 2026 23:44:55 -0700 (PDT)
Message-ID: <62b7792d-eb80-4ed8-9563-170f83cb176f@sigma-star.at>
Date: Mon, 13 Apr 2026 08:44:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] misc-utils: docfdisk.c: validate partition size to
 prevent arithmetic overflow
To: Anton Moryakov <ant.v.moryakov@gmail.com>, linux-mtd@lists.infradead.org
References: <20251028104810.65250-1-ant.v.moryakov@gmail.com>
Content-Language: en-US
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
In-Reply-To: <20251028104810.65250-1-ant.v.moryakov@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260412_234458_016513_3221A73B 
X-CRM114-Status: UNSURE (   3.28  )
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
