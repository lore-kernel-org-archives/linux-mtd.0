Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22D59C4332F
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Oct 2023 15:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KdLVn5t2vfBb1HLoQkyt7GyE7rLc5TnIhHYPmVFq5Gs=; b=LtgTk1N8UP1oDZ
	7wUPwDaOHGFwLhOnHQfARIZmLB1RNUSk1cpVYad3pMO7JfcnS1Mp6fmnVKyYNXlitY/Apz/RlG6EL
	g5fLo/MhgAabAsyBpSCnuy7ErgWh9Jjk1H3V01vBbixw/0evygAFCsGWCgFxF2Gs7UHhu/WD2IHLr
	rpE6hk3vHhaXJCdTmT0XunYq7HhZgePHHMc6eem+VkoDtdq0FfrbM/g00zlE21nAMZb704/vPnKO9
	AnW60c4fG0h3P8Z9YnwK912SvCzHCOJXMGwYtwb1lVOAgI27o7MK92dI4aVo5gud0YmOdrG9ac1r+
	7eysATu+YGWNYa2i7tRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxUCs-003YlH-1L;
	Mon, 30 Oct 2023 15:29:34 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxUCp-003Ykm-23
	for linux-mtd@lists.infradead.org;
	Mon, 30 Oct 2023 15:29:33 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-9c603e2354fso945041766b.1
        for <linux-mtd@lists.infradead.org>; Mon, 30 Oct 2023 08:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698679769; x=1699284569; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uIwnsuAjjeSgT1CYf5MtHbwBYYlO4q7NyKO8BpdFqOY=;
        b=NFISQslUNhDKPjX5wLAYCiKFTgyRun4iC9XQghRY08b7jCPxm3pCue7GsTe6FsZQnE
         QbIEMVNNo+wZCVBt7OtMcezf3zR5T4hmZFqs4mNdRIWo/WdfFCbCDQVk4JdiwT1ljLuR
         oyuy4wRr1x2OgJYx7sxcVhn178peoOohsLCOsuwhbKxYttJcMGUA8u/OUeknAsqX/3j7
         e/uJ+S9mQb1DBk2EM7GBdMA38GftmxLezTe1k9J/7RSPxucN1XOxV1tlxLZHIUxkXjwM
         9wND8P55VKWUKeBh/cQ7oJBBYpoYJqOTPdYSP73hc5NZKcNdxfZ211XKQVBmhQ/VhtGO
         Gwpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698679769; x=1699284569;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uIwnsuAjjeSgT1CYf5MtHbwBYYlO4q7NyKO8BpdFqOY=;
        b=Ll0d195o0NgZmgXPZWvwpfWdHYzliVwKJnulJ6ai0uVrPsV7knh8M2V7jywHG48vJo
         xZoj/1WUSKi+sRhtI2DbGHkbBz0Gj3rSkxzVqO2D9pwWalJNgt9MIln7qqRDMIxhkWTk
         tMU6GIgCD7BEwOKQWZUyYpsPGWS4UCRnROAxnKSSriHs77sZ24UJSwUiMSjjhalI0l3q
         GeKa5m8I9Ik84wBt+TBoYsG2zpbrRP8sOeqBtWffWUYCGSxmmZAzALE0ud18gHQb+S2M
         1d5MQ4wGSs9gahM87DlmYqtULCY1Zub7TXtV4U1+KQ4E79ZfAq9K6X56g8Yd3RmZ+czE
         jWbg==
X-Gm-Message-State: AOJu0YzzzE4MPRTtC2jPCnoeaaKxQkmP06e2PQ9U70hIvq2p28IWwntA
	VmEq1/mO6yRlZCndXJAtRtBslA==
X-Google-Smtp-Source: AGHT+IHiZhWLZgm4GRtTh20JKj3hjBYakIPP9T61llSfnsZw2LBqPo8QXH2A/wBis22+nK0oCQ00JA==
X-Received: by 2002:a17:907:7d8d:b0:9ae:577b:3832 with SMTP id oz13-20020a1709077d8d00b009ae577b3832mr11887037ejc.24.1698679769622;
        Mon, 30 Oct 2023 08:29:29 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.76])
        by smtp.gmail.com with ESMTPSA id x15-20020a1709065acf00b0099bcf9c2ec6sm6140865ejs.75.2023.10.30.08.29.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Oct 2023 08:29:29 -0700 (PDT)
Message-ID: <ccd472d7-52d4-496b-9fb4-ce2769c2350d@linaro.org>
Date: Mon, 30 Oct 2023 15:29:27 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] mtd: spi-nor: micron-st: Add support for mt25qu01g
To: Fabio Estevam <festevam@gmail.com>
Cc: michael@walle.cc, pratyush@kernel.org, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, linux-mtd@lists.infradead.org,
 tkuw584924@gmail.com, Fabio Estevam <festevam@denx.de>
References: <20231026112312.3217502-1-festevam@gmail.com>
 <20231026112312.3217502-2-festevam@gmail.com>
 <82fb8908-f24f-4918-810f-1c83b06ebe08@linaro.org>
 <CAOMZO5AxBwG_LFNNFVMXVwv2YLd2f_BJD5e+dOUGyOtMWTMvOw@mail.gmail.com>
 <eecb8ddf-eb12-4f86-a2d3-db19718f5705@linaro.org>
 <CAOMZO5BFO4cgNRv507HpqhSDR+JKL7BcEUTWMeVRpMroqhmCjA@mail.gmail.com>
 <CAOMZO5AhzwLewBG2OqRT6H+BKqTPbfr+ZQ5W02Mgyu3uoTfhmA@mail.gmail.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <CAOMZO5AhzwLewBG2OqRT6H+BKqTPbfr+ZQ5W02Mgyu3uoTfhmA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231030_082931_708148_F873E78E 
X-CRM114-Status: GOOD (  12.04  )
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

CgpPbiAxMC8zMC8yMyAxNToxMywgRmFiaW8gRXN0ZXZhbSB3cm90ZToKPiBIaSBUdWRvciwKPiAK
CkhpLAoKPiBPbiBGcmksIE9jdCAyNywgMjAyMyBhdCAxMDo1MuKAr0FNIEZhYmlvIEVzdGV2YW0g
PGZlc3RldmFtQGdtYWlsLmNvbT4gd3JvdGU6Cj4gCj4+IEhlcmUgYXJlIHRoZSBjcm9zcy1kaWUg
cmVzdWx0czoKPiAKPiBEbyB5b3Ugc3RpbGwgaGF2ZSBjb25jZXJucyBhYm91dCB2Mj8KPiAKCkkg
c2F3IHlvdXIgcHJldmlvdXMgZW1haWwsIGRpZG4ndCBnZXQgdGhlIGNoYW5jZSB0byByZWFkIHRo
ZSBkYXRhc2hlZXQuCgo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LW10ZC8yMDIzMTAy
NDEzNTgyNi4yNzI5MDg4LTEtZmVzdGV2YW1AZ21haWwuY29tLwo+IAo+IFBsZWFzZSBub3RlIHRo
YXQgbjI1cTAwLCBtdDI1cWwwMmcsIG4yNXEwMGEsIGFuZCBtdDI1cXUwMmcgYXJlCj4gY3VycmVu
dGx5IHN1cHBvcnRlZCBhbmQgYXJlIGFsc28gbXVsdGktZGllIGNoaXBzLgo+IAo+IEkganVzdCBk
b24ndCB1bmRlcnN0YW5kIHdoeSBtdDI1cXUwMWcgY2Fubm90IGpvaW4gdGhlIHBhcnR5Lgo+IApJ
J20gbm90IGFnYWluc3QgdGhlIHBhdGNoIHBlciBzZSwgYnV0IHRoZSBkYXRhc2hlZXQgY29uZnVz
ZWQgbWUgd2hlbiBJCnNraW1tZWQgb3ZlciBpdC4gV2lsbCB0cnkgdG8gcmUtcmVhZCBpdC4gRllJ
LCB0aGUgbWVyZ2Ugd2luZG93IGhhc24ndApjbG9zZWQsIEknbGwgc3RhcnQgcXVldWluZyBwYXRj
aGVzIG9uY2UgLXJjMSBpcyBvdXQuIEknbGwgZ2V0IGJhY2sgdG8geW91LgoKdGEKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==
