Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7347EC7EE2F
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Jun 2023 15:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gHZBL6rR6HEZIdsNRxA9313M3QgBMMcr4uAo803/sOI=; b=WeYUPmxixE2old
	dlUgdyHTJZV8Yw3qZuXWwZOBJN7LeUhi1bHu9g+N0Uqwblkrek58EkC+wqWVa8RWY/mmnhqSm8B6r
	y7XHNGzLMOi0UiX9BEO7yWrXciUV2xiLKI2QCiWRKFs08vdVfwnn0cWxEJyP02VJfQLbM9AFmjHBX
	pKRSvAwr83wUiuBTDpWBgk1yemT4LY9mUvypXJ48RnoOE32v/d7DH8s2jxSg6PQDlyZTQq0kW6KsD
	5NcxEL54usrBgVSaMhdnwp0Ci8ULktfXZawCdoJmGSIVor3GY9gx2gNJoetCOtCBcmyhe0HRr6JvO
	PojE0KaqOnzPkfuZKurw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q8j5L-004PBS-1u;
	Mon, 12 Jun 2023 15:03:59 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q8j5J-004P8S-15;
	Mon, 12 Jun 2023 15:03:58 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-9788faaca2dso746879666b.0;
        Mon, 12 Jun 2023 08:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686582233; x=1689174233;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=b5dvgiuwu58z2RBXdkqKsBTMg+eHX490cp2iBeNipXs=;
        b=oyw5FcG95RMH8gBZPimMuo8K1RUozZQd0fP+vIEKp9XdRHQjIeXucA7M7HcnfFBWeR
         obL1xrP/WSVuSzcn8sqgEd/DYrTjrYR0xUXJyzZCGoXkekxkkcigqaGYAnGm1+eei7dd
         4JVdqYbq56KJ+fxGRK3R00jKH2ShpQRs6CBKpNYFl0pNczf09s1keyYDi9zhuQTRP4kB
         Yw1W6qDIIu6mABprgil2J7o4dBaxMg+t6YSyDjT+YVwK+mtwSQAse2FajC6VZRWZHKOO
         Cyldiel5U3c6g3BfT47+swlDyPA7NlC3P5WyZP3wZg8zLkxXtbTQZvOvMiVeHLRdKjCO
         pZUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686582233; x=1689174233;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b5dvgiuwu58z2RBXdkqKsBTMg+eHX490cp2iBeNipXs=;
        b=kQHmLol7+jowhhEGlO+m4/IzmBd/p70d+9apXHTGVqnRC/svJPlod8LxzGzXe3A4rN
         ACcOHQnRicv8bu8tcRo4xI4OESCUamH2v3+MFV41o7QWVQvbDrjogD68gCY0WlSxMw55
         UFO6nydJflT3THa94jD9Nhyjf84Oxf/6ADGgwWTnBHe8RSPmxpHbe9HA/bddp42DvIkL
         QKwP71bLCmNTdUvX8nstNhRMqMQvT19fCNW2At6NAxBI1BrLmCInWpUg49BmlJxfZHU1
         4wr+iTJ9IiPHJzcjY7F0J3J5CkU9gTkS2u/DteKcS3RacxEElE7vp/U9DGGGy3f1P/yI
         IUeg==
X-Gm-Message-State: AC+VfDzTvZc5Wy4Pxr4ivne8NyXD40qmw7GUxbCzb03FHwa64XColmll
	CEpdjNZ5A2v65Jgtzz9dlRA=
X-Google-Smtp-Source: ACHHUZ6Y8U1kRtrGOzG5Ib4y5z1rRbsqGlhyiWIqgbv1DlOcUMV+/wrK4Syva0l88PDG+OBz0PHfPQ==
X-Received: by 2002:a17:907:320e:b0:978:acec:36c0 with SMTP id xg14-20020a170907320e00b00978acec36c0mr9473330ejb.9.1686582233549;
        Mon, 12 Jun 2023 08:03:53 -0700 (PDT)
Received: from [192.168.2.2] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id o20-20020a170906601400b00977d3fb2a7dsm5298309ejj.76.2023.06.12.08.03.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jun 2023 08:03:53 -0700 (PDT)
Message-ID: <8b5303a0-fb1b-ee05-c2e6-bbd2d9c06cb9@gmail.com>
Date: Mon, 12 Jun 2023 17:03:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH v2 5/5] mtd: nand: add support for the Sandisk SDTNQGAMA chip
To: miquel.raynal@bootlin.com
Cc: richard@nod.at, vigneshr@ti.com, heiko@sntech.de,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 yifeng.zhao@rock-chips.com
References: <11e16c3b-6f7b-a6a9-b0ed-b7ac0cd703e3@gmail.com>
Content-Language: en-US
In-Reply-To: <11e16c3b-6f7b-a6a9-b0ed-b7ac0cd703e3@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230612_080357_384845_F0023859 
X-CRM114-Status: UNSURE (   9.08  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

U2FuZGlzayBTRFROUUdBTUEgaXMgYSA4R0Igc2l6ZSwgMy4zViA4IGJpdCBjaGlwIHdpdGggMTZL
QiBwYWdlIHNpemUsCjFLQiB3cml0ZSBzaXplIGFuZCA0MCBiaXQgZWNjIHN1cHBvcnQKCkNvLWRl
dmVsb3BlZC1ieTogUGF3ZcWCIEphcm9zeiA8cGF3ZWxqYXJvc3ozNjkxQGdtYWlsLmNvbT4KU2ln
bmVkLW9mZi1ieTogUGF3ZcWCIEphcm9zeiA8cGF3ZWxqYXJvc3ozNjkxQGdtYWlsLmNvbT4KU2ln
bmVkLW9mZi1ieTogSm9oYW4gSm9ua2VyIDxqYng2MjQ0QGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJz
L210ZC9uYW5kL3Jhdy9uYW5kX2lkcy5jIHwgMyArKysKIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2Vy
dGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX2lkcy5jIGIv
ZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9pZHMuYwppbmRleCAxYTg5ZWQ3OTYuLjY1MDM1MWM2
MiAxMDA2NDQKLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9pZHMuYworKysgYi9kcml2
ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX2lkcy5jCkBAIC00NCw2ICs0NCw5IEBAIHN0cnVjdCBuYW5k
X2ZsYXNoX2RldiBuYW5kX2ZsYXNoX2lkc1tdID0gewogCXsiVEM1OE5WRzZEMiA2NEcgMy4zViA4
LWJpdCIsCiAJCXsgLmlkID0gezB4OTgsIDB4ZGUsIDB4OTQsIDB4ODIsIDB4NzYsIDB4NTYsIDB4
MDQsIDB4MjB9IH0sCiAJCSAgU1pfOEssIFNaXzhLLCBTWl8yTSwgMCwgOCwgNjQwLCBOQU5EX0VD
Q19JTkZPKDQwLCBTWl8xSykgfSwKKwl7IlNEVE5RR0FNQSA2NEcgMy4zViA4LWJpdCIsCisJCXsg
LmlkID0gezB4NDUsIDB4ZGUsIDB4OTQsIDB4OTMsIDB4NzYsIDB4NTd9IH0sCisJCSAgU1pfMTZL
LCBTWl84SywgU1pfNE0sIDAsIDYsIDEyODAsIE5BTkRfRUNDX0lORk8oNDAsIFNaXzFLKSB9LAog
CXsiU0RUTlJHQU1BIDY0RyAzLjNWIDgtYml0IiwKIAkJeyAuaWQgPSB7MHg0NSwgMHhkZSwgMHg5
NCwgMHg5MywgMHg3NiwgMHg1MH0gfSwKIAkJICBTWl8xNkssIFNaXzhLLCBTWl80TSwgMCwgNiwg
MTI4MCwgTkFORF9FQ0NfSU5GTyg0MCwgU1pfMUspIH0sCi0tCjIuMzAuMgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
