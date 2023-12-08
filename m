Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D855DC10DC1
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Dec 2023 12:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oWpGadHvK1/98D/zXpphGSArFa4JcyRk4JOTzxwtSIw=; b=hgf4neq+FNChhR
	H3sMy3S3W1hofYSTk+WIIE2Ku4rFDynLeTKQ0/L4dPzK2/L426QUjUC8TpitGXsW5WmKQBCe9Qkia
	L1/NtiArtdxtdTtg3QKcXJWy0Ged8crCrriC0btwYiUJ8qt6LO3NFdtvI5uhA6UtI+A2FHGshAvRk
	z0wcm1oVQ2zA0Cg46EdwRmeMyIu5V4kwvZ0BEi98+MQXfOoBa96jzmLmOkyzIzNOZ57NRajPjCgzu
	feLkeXanHQ4xb//5l1fxn+GJ5spT4JQFeheelIuNrskBfNX1MiMk0/MKV7YXbjpaNqhg/VaQIwURt
	d3FGM+c5BqvhU2HUCy4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBaBr-00FcV0-07;
	Fri, 08 Dec 2023 12:42:47 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBaBn-00FcU1-0c
	for linux-mtd@lists.infradead.org;
	Fri, 08 Dec 2023 12:42:44 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-a1ca24776c3so646052866b.0
        for <linux-mtd@lists.infradead.org>; Fri, 08 Dec 2023 04:42:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702039360; x=1702644160; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yjQchJHu8QRtple6f9Gf5U88XWgKGzUKlPM+WKnbsyU=;
        b=nyN6mUHWho8AisKRtsy3z8SEjkUyMBcPQHw/2hDbY7zcLMHYJUZvG5SVB04tGgWi0j
         dLfjKzFuVO5deA5CJOeIdHzNN9701K+GVLD3rmTZkEusMkSZyGu2qzloS6Yp8D/SCI1p
         fOkpJK2lNbHlWBUoV1rIORyrmxKiwptXGcoXzovMpiVuvbiipdjqW3vlm8eEwTBNetzr
         sfRYM7k2z7c20sOJzrUfgJw8Q6h5oFnsABUWMu9ONjarY4h3oYECyY9WSHJzvQs+RZx8
         uLWqgPQL4W0KGEvfqIC6jlKxHEhWjaNvq1cTTsKxtugQTV4jw1B3j9Bya4MdBaE0kMqE
         zmNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702039360; x=1702644160;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yjQchJHu8QRtple6f9Gf5U88XWgKGzUKlPM+WKnbsyU=;
        b=hgrga654xtcGRBmEYz3ElKpMH+rjXl7ef8XOzmHaWipIvwZWWDyX4QoaLIS9+YrngT
         qlHVX948GMJCvuH5i5sWteouSxdVZ2y682pDEXc9g9obvxHwaRosThG4XprDcgW1ltnN
         kjsLQ2BwDjIDzsDWwTKB2ne//OkyBFPK3bR6uj5S7rFXEy44AiysXqhzQtmwOwlsATZw
         N4nJlQJj2v/EH0X/SABt3Xyy/eWIyprZi8wSHAit1dONTEym63TvRE9WIyCKYJ29ROwE
         8djiJD8iFPc+jEEamPZq4EDRtZI8IwuyTnlbpYdyi+WkrlvenByXps1ADy/XJriL9oDW
         r9RQ==
X-Gm-Message-State: AOJu0YzBTMi7yDw8Cbuu+EjS/SBrZB+BS3P3Tzcw1h+gkDd9lJ54Mg8n
	hxJkheY/Nf4zTRHvvRSeYEzwMS3uydkUnmq0F74=
X-Google-Smtp-Source: AGHT+IENq6lcfmEo51Vs9NEBU7dKkjOtZb4+QUEbikhYlWV5ZFvBGl8+MMnTtuC6g9xVMPdtKK+xHg==
X-Received: by 2002:a17:907:98c:b0:a1f:5526:ead1 with SMTP id bf12-20020a170907098c00b00a1f5526ead1mr75007ejc.58.1702039360607;
        Fri, 08 Dec 2023 04:42:40 -0800 (PST)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id sf22-20020a1709078a9600b00982a92a849asm968908ejc.91.2023.12.08.04.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 04:42:40 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 =?utf-8?q?Ar=C4=B1n=C3=A7_=C3=9CNAL?= <arinc.unal@arinc9.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Scott Branden <scott.branden@broadcom.com>
In-Reply-To: <20231102062848.23965-1-zajec5@gmail.com>
References: <20231102062848.23965-1-zajec5@gmail.com>
Subject: Re: [PATCH V3] nvmem: brcm_nvram: store a copy of NVRAM content
Message-Id: <170203935960.22033.10753187984539476656.b4-ty@linaro.org>
Date: Fri, 08 Dec 2023 12:42:39 +0000
MIME-Version: 1.0
X-Mailer: b4 0.12.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231208_044243_229257_36876561 
X-CRM114-Status: UNSURE (   7.02  )
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

Ck9uIFRodSwgMDIgTm92IDIwMjMgMDc6Mjg6NDggKzAxMDAsIFJhZmHFgiBNacWCZWNraSB3cm90
ZToKPiBUaGlzIGRyaXZlciB1c2VzIE1NSU8gYWNjZXNzIGZvciByZWFkaW5nIE5WUkFNIGZyb20g
YSBmbGFzaCBkZXZpY2UuCj4gVW5kZXJuZWF0aCB0aGVyZSBpcyBhIGZsYXNoIGNvbnRyb2xsZXIg
dGhhdCByZWFkcyBkYXRhIGFuZCBwcm92aWRlcwo+IG1hcHBpbmcgd2luZG93Lgo+IAo+IFVzaW5n
IE1NSU8gaW50ZXJmYWNlIGFmZmVjdHMgY29udHJvbGxlciBjb25maWd1cmF0aW9uIGFuZCBtYXkg
YnJlYWsgcmVhbAo+IGNvbnRyb2xsZXIgZHJpdmVyLiBJdCB3YXMgcmVwb3J0ZWQgYnkgbXVsdGlw
bGUgdXNlcnMgb2YgZGV2aWNlcyB3aXRoCj4gTlZSQU0gc3RvcmVkIG9uIE5BTkQuCj4gCj4gWy4u
Ll0KCkFwcGxpZWQsIHRoYW5rcyEKClsxLzFdIG52bWVtOiBicmNtX252cmFtOiBzdG9yZSBhIGNv
cHkgb2YgTlZSQU0gY29udGVudAogICAgICBjb21taXQ6IGYwMTlhMGU5YzE5YWFhNTMyY2I0NjE0
MmUxZjMzM2M5ZGFmZjkyZmYKCkJlc3QgcmVnYXJkcywKLS0gClNyaW5pdmFzIEthbmRhZ2F0bGEg
PHNyaW5pdmFzLmthbmRhZ2F0bGFAbGluYXJvLm9yZz4KCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
