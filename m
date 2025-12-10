Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 928D0D2CE17
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Dec 2025 08:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b5dqEPHy2C031YQ8S62cN3NFx2j5qpz0XSkb36IerfA=; b=jk1VtGsVRWonB7
	9U1IpHtKIANJf6WJDejlvI0OG79BDcDhmnJJY/RQEMCAsmWv2ut3KvJMGM+mC2HD78K/xXU89vxZP
	JmoljmKHi8423QnUR65kLmr9ooc7SUCCVbA6ru5f3+AZRKfaP5UHo0B/AK/0SJNJx+i3N0VDnP74I
	KQ/JQLLGnKu/9+aq3Hud1YHgFdCqTx+obKDhX1JhFlynWzlwH2Z6vli8rxHWjAZfVdORRy+yxU+/2
	gpzAcK2kEKA732k8JJRN8gWWk/JCoFrrULbToGyf88KUKDrZ3CRmofdNisWhXG481XrqysTHxY44z
	mKfNrqBPg6lCyU6uen6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTFC1-0000000FE6M-2Eeq;
	Wed, 10 Dec 2025 08:05:01 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTFBz-0000000FE5O-1Jk6
	for linux-mtd@lists.infradead.org;
	Wed, 10 Dec 2025 08:05:00 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-47775fb6cb4so54912035e9.0
        for <linux-mtd@lists.infradead.org>; Wed, 10 Dec 2025 00:04:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1765353897; x=1765958697; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YFHDKd0HM/iJsOq9TaASKiK6U24DRcKk9Xsvn3+D8sY=;
        b=eCzftfz7CP7Bxa/VVWz32Ay/GHdtTdrLwahzZC6zvmg2MQz05BPV+It476MVlEV8DK
         NrIaelsFGyfbZtGX3GwsJTRO7j1L+1fNJVjo4a5VyOMeWMCeL015MavV7RK3zoMyHaRh
         6AuNBayq2zY2RStbe025GG/+4oLrypCHWh5AUhBBj/KA6zsLq2mJvw5KCto4C02OStsN
         dXSbuZOoefev1zuAbOYbpq3ufaqwEt2Otu6SntlB5iR0cUYwQ7JvO8kmGVURbUKspUGr
         VFfRbbxNI6ysXHjvuwTl5vxlQ2DgGm1ZUtefksouxnPqKRe3+R4Vir4voy5H0ZEezuWZ
         02pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765353897; x=1765958697;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YFHDKd0HM/iJsOq9TaASKiK6U24DRcKk9Xsvn3+D8sY=;
        b=iu7xLZ0wiL8yy1Da5oOXxQ+DiF4SPeuRJ2XpKFwNVb3wQX7ysZBlU97+avk9Gs9f0M
         pks5U+FbL3aseyAVrZS90T9wzb9yMjZt7Dhj9LZ0V23GAKjvpJkLK0njpsvNTAk2oCry
         c+O+d/s7F5nrULG348VIr3QkxYsZsdq7YIbiMHPeQ8wSp4HDLN6FoD+bVPI73jyFA66M
         MsUuxqd0TqHl8yltr/2MyQfr9JzDEhw/UloNOmqCVS4OEURZCMIODnY9XdBx2hhO15l9
         rGp4IzT8ekrdkhSMW5Vq6J75JjINyrt5UAEzTobEuvE43KlInoT7q+ZN9slnMD2mVPbO
         YR6g==
X-Forwarded-Encrypted: i=1; AJvYcCUE9lrWPAvVk1UKC2Akevy0wElKSdWtIvxoj7lZKyqI8b9H3zH/T7mXaWes5cRKQUr6aeGYtJ20PjE=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/k3vFZsbiiioNsHhg8UBWGJlx55IfWGytnMpinUfSa0DTZP6e
	ZPW6ypIMrJMKBkEeQvmwko+UOMy5K3AV18S1eQszWnwO6e1zsVIRLYt2nquUb/yYjeM=
X-Gm-Gg: ASbGnctAKzKHvke57ya7zIa1BV6t+5i0xmlM9YvOkJy9OOWbVBmphILRH2gzUgwYxNj
	LhezJvJKKWvBsW3O3XLVgWDwF+B/rFAG2F4yVOUf0PGr/Mcgc/JfJYjfyRsS39PSoaXTIskakuy
	v5SGvUO8Pl6c7bvXzopHW6BzMF5o+JrSOvc3oSYvfQ4l8aisfNvWbC/dtEHeHYhwsQ3hZ2j+xpv
	rdt323Sa1MWk0bXUtNwFO2qRgg/MhOqI9/nEGFXy5jMjJYzQsyOBBhCvAAzLzHIV9hSQFIaqExY
	6lUkQ8lMdK49zFu5S6BClMjoYwxBAYu+S2GYAvq8ANLmaUVgZtsDraz7xceuL1OwYLFOt0LejQb
	sa4UPY3++c4knAQ4DnYyyUnOZDz0E5rmLpxtLvI3xUX9z2H9pTnEY6Se4nevpnHsRsD8rg7ldqE
	X5/UA998jRb0YibfHD3HI=
X-Google-Smtp-Source: AGHT+IG44FLRAV9hhxbf3e2YxvFnrsD5CGeuIWWtUvknWdmCldfS/CTLbg3wvfoWbwbiqRYz4gOong==
X-Received: by 2002:a05:600c:3113:b0:477:7768:8da4 with SMTP id 5b1f17b1804b1-47a856249c2mr3409615e9.7.1765353897203;
        Wed, 10 Dec 2025 00:04:57 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.134])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a82d26f5asm29873605e9.5.2025.12.10.00.04.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Dec 2025 00:04:56 -0800 (PST)
Message-ID: <985eb494-7bf3-4da6-9a54-aac3ba559cca@tuxon.dev>
Date: Wed, 10 Dec 2025 10:04:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] ARM: at91: Move PM init functions to .init_late
 hook
To: Rob Herring <robh@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Russell King <linux@armlinux.org.uk>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251120-at91-probe-v2-0-8c8592f02e8e@kernel.org>
 <20251120-at91-probe-v2-2-8c8592f02e8e@kernel.org>
 <ece2d53c-3e16-4e5e-9bb9-3ed7bb362b7b@tuxon.dev>
 <CAL_JsqJ2ghfNKQPhs19F1oxJxyTsrQ47hgPwsa3hUmgbGjpi-A@mail.gmail.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <CAL_JsqJ2ghfNKQPhs19F1oxJxyTsrQ47hgPwsa3hUmgbGjpi-A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_000459_530617_1FA26D61 
X-CRM114-Status: UNSURE (   8.39  )
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

SGksIFJvYiwKCk9uIDEyLzEwLzI1IDAwOjM5LCBSb2IgSGVycmluZyB3cm90ZToKPiBPbiBTYXQs
IE5vdiAyMiwgMjAyNSBhdCA5OjM34oCvQU0gQ2xhdWRpdSBCZXpuZWEgPGNsYXVkaXUuYmV6bmVh
QHR1eG9uLmRldj4gd3JvdGU6Cj4+Cj4+IEhpLCBSb2IsCj4+Cj4+IE9uIDExLzIwLzI1IDIzOjM3
LCBSb2IgSGVycmluZyB3cm90ZToKPj4+IE1vdmUgdGhlIEFUOTEgUE0gaW5pdCBmdW5jdGlvbnMg
dG8gLmluaXRfbGF0ZSBob29rIHRvIGVuc3VyZSBkcml2ZXIKPj4+IGRlcGVuZGVuY2llcyBoYXZl
IHByb2JlZC4KPj4+Cj4+PiBDYzogTmljb2xhcyBGZXJyZSA8bmljb2xhcy5mZXJyZUBtaWNyb2No
aXAuY29tPgo+Pj4gQ2M6IEFsZXhhbmRyZSBCZWxsb25pIDxhbGV4YW5kcmUuYmVsbG9uaUBib290
bGluLmNvbT4KPj4+IENjOiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKPj4+
IFNpZ25lZC1vZmYtYnk6IFJvYiBIZXJyaW5nIChBcm0pIDxyb2JoQGtlcm5lbC5vcmc+Cj4+Cj4+
ICdGcm9tOiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPicgIT0gJ1NpZ25lZC1vZmYtYnk6
IFJvYiBIZXJyaW5nIChBcm0pCj4+IDxyb2JoQGtlcm5lbC5vcmc+Cj4gCj4gQmVmb3JlIEkgcmVz
cGluLCBhbnkgZmVlZGJhY2sgb24gd2hldGhlciB0aGlzIHNlcmllcyBhY3R1YWxseSB3b3JrcyBv
ciBub3Q/CgpJJ3ZlIHRlc3RlZCBpdCBvbiBTQU1BN0c1LUVLIGFuZCBTQU05WDYwLUVLIGJvYXJk
cyBhbmQgaXQgd29ya3MuCgpUaGFuayB5b3UsCkNsYXVkaXUKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
