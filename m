Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D69BC282D1
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Mar 2025 01:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mSpLSVtASrAUSYhsuxic8Td9rmUbr4v9WbT4zLrIqRs=; b=M7kC2yA2lxGxxG
	i2R/10lei/yfGEiElGLsE011qHycbkPLHdBA+nhQ9TvluH9XP8wi+UaWCM81baCq0p5BO6ixsna3A
	/rj3i+nYOdswlflq2LqwadVibE46vXVWqfDPR93zJUusr2GFzJPtAhL9aqXVh2LCwl2zPBT7YsDaS
	yO/Fn4/5mydHL6OWOGFDAjeXNqnZU9xgMagLXpKxTnDi/e0u05UxLxMesk+OZLN6wPv30Ka0lDfHr
	FxeZDEWXU740oZ9gcprWV7LYyyICTCuEvZ/9wZ2k1Sp3kp3UqBSPOZcSm1NbwAMAwbXx9SJ3aZFXb
	gMaRAQOtenhHC8hsaqWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqMvt-0000000CrEr-3bzP;
	Fri, 07 Mar 2025 01:55:25 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqMe3-0000000Coax-1PdP
	for linux-mtd@lists.infradead.org;
	Fri, 07 Mar 2025 01:37:00 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-2fecba90cc3so2884117a91.2
        for <linux-mtd@lists.infradead.org>; Thu, 06 Mar 2025 17:36:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741311418; x=1741916218; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wTriowciTheXks21K11k33c3PkgL7Rz/DhFB55dadmc=;
        b=Bvkz8NZTEO3t2aPp4IcJB7xQKg+6rSlZweBc3c4f7aOUaWjt2G6md91D6THFfUzSKf
         dK9c9LJyjb+STRTRR7ekSviaIZebojWo7XRd2wOwb8T44NPO2JrZvdFADxi4pmZnC3xw
         wCmwzXhZFTUzRX8n1rIXEXHmHeu4B9UEsO3MvuPZDTHkyDvorjRFShFdZpofWrTtojqK
         qyQ6PCpikwkOFouKIyry0QrHDIMcO4QH2ibFhpNtd4DsAr3RPNnn368yLdK5zZ60w0RB
         EEYnX8snTdB5ThinVgqmIt3B8HFsGEoCZVw5CZdKMUItz2+seoD2zMd/+6hlRFrFhEAG
         J3Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741311418; x=1741916218;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wTriowciTheXks21K11k33c3PkgL7Rz/DhFB55dadmc=;
        b=tbcaJIpjw/xTRlCHAeVjkqxmReAWktIRXraZFiNNx8VI/m5en0ieYdpwSbePbyuWb7
         Jnt/nEOnpfwPZspQhuOFCW0xk0sPCmA0Nv12n3WMZsP1jDeGfcsIfcO6p3vsNv+UjWEX
         sORp4TtmCMBAocYTnUvjlpmNasZdjMlLadnas+JArc7tiMYnUU3T5JW826cxjLuf9mpH
         8kaupjQOytMWqNP8Q/xXdX6yvwRLXtmZFBTJwUPvfPpePZcmIR1FiHL7X6w9Tl/8YAYc
         wzYg1U+JLZda0Zu86t9ImOnZJzI+R3W3oWW5AETCX+26GCFiAGTTo3oMJ5qsr8XSoi2m
         HGJw==
X-Forwarded-Encrypted: i=1; AJvYcCWtmsCwkQEM/Z8F9bwqqoGdEGusSsWxi/53c+e4HPrK6Ml8p5d8X33ujdEckI/ZcHTyo4nEN+QUfC0=@lists.infradead.org
X-Gm-Message-State: AOJu0YyqrcGMwaEyY+CarucOKFLyxGtFJeN7tgOxVzI+UKG9rZI1Zudc
	kDPpLouxx6pk0HErsipVuhGFLEcFfocMg65j2Flnbc+PxNlaB4Gnrt5/u7jSwL5CpFjw1rlWHZe
	cbheuLcovwpTTEeTi6/eavdscj+o=
X-Gm-Gg: ASbGncs6efiwFaYeDKa5wkWW72C4aKC0hCmMlYFsVsmD213Ywvi0yEUUJRdIurODEIk
	lFtuoVYKnwvWQ4gw+jIHtCQjrUGBhPlfdXuKrH+I2/c4lWmoF+ojLx1p6u1MH/eJcZ1CbRq+yzX
	vEfZcIqpkhGSDkrRB0WT47Mr1Rlw==
X-Google-Smtp-Source: AGHT+IFDfqoK0c45wa683mLaBwbf1LPe7kKFeArIjt249Z6gX5cNqXAvG0FCrWjvLJ9XhVoyZ28PVRZzl088uXIRi14=
X-Received: by 2002:a17:90b:4c:b0:2ff:6a5f:9b39 with SMTP id
 98e67ed59e1d1-2ff7ce844b6mr2717613a91.18.1741311418271; Thu, 06 Mar 2025
 17:36:58 -0800 (PST)
MIME-Version: 1.0
References: <20250211063028.382169-1-linchengming884@gmail.com>
 <20250211063028.382169-2-linchengming884@gmail.com> <e5458a0e-528f-44ec-a0f0-543472ad3b85@linaro.org>
 <bb9f8a80-4662-4ab1-b9ad-6899977c3827@linaro.org> <CAAyq3SamyhtCkd47939dKWCZN3ejaDvM6EJzwizWVqhNW=27bA@mail.gmail.com>
 <d674f1bc-b596-46d5-b56d-1e2fb509c684@linaro.org>
In-Reply-To: <d674f1bc-b596-46d5-b56d-1e2fb509c684@linaro.org>
From: Cheng Ming Lin <linchengming884@gmail.com>
Date: Fri, 7 Mar 2025 09:32:10 +0800
X-Gm-Features: AQ5f1Jrxq-TXvrmL_cFEaNENEQcXUM3LYse8-YyMWE0akxocxyXKUPEQwjwkMIQ
Message-ID: <CAAyq3Sb3Qt-uhb+zvUpFWhv6gqq+umAYe3nhpiCDH=7=g8u78g@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] mtd: spi-nor: macronix: Add post_sfdp fixups for
 Quad Input Page Program
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: pratyush@kernel.org, mwalle@kernel.org, miquel.raynal@bootlin.com, 
	richard@nod.at, vigneshr@ti.com, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, alvinzhou@mxic.com.tw, leoyu@mxic.com.tw, 
	Cheng Ming Lin <chengminglin@mxic.com.tw>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_173659_372359_758C0757 
X-CRM114-Status: GOOD (  13.67  )
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

SGkgVHVkb3IsCgpUdWRvciBBbWJhcnVzIDx0dWRvci5hbWJhcnVzQGxpbmFyby5vcmc+IOaWvCAy
MDI15bm0M+aciDbml6Ug6YCx5ZubIOS4i+WNiDEwOjQy5a+r6YGT77yaCj4KPgo+Cj4gT24gMy82
LzI1IDExOjM5IEFNLCBDaGVuZyBNaW5nIExpbiB3cm90ZToKPiA+IEhpIFR1ZG9yLAo+ID4KPiA+
IFR1ZG9yIEFtYmFydXMgPHR1ZG9yLmFtYmFydXNAbGluYXJvLm9yZz4g5pa8IDIwMjXlubQz5pyI
NuaXpSDpgLHlm5sg5LiL5Y2INzowMeWvq+mBk++8mgo+ID4+Cj4gPj4KPiA+Pgo+ID4+IE9uIDIv
MTEvMjUgNzoyMCBBTSwgVHVkb3IgQW1iYXJ1cyB3cm90ZToKPiA+Pj4gT24gMi8xMS8yNSA2OjMw
IEFNLCBDaGVuZyBNaW5nIExpbiB3cm90ZToKPiA+Pj4+ICAgICAgICAgICAgICAuZml4dXBfZmxh
Z3MgPSBTUElfTk9SXzRCX09QQ09ERVMsCj4gPj4+PiArICAgICAgICAgICAgLmZpeHVwcyA9ICZt
YWNyb25peF9xcHA0Yl9maXh1cHMsCj4gPj4+IEZvciB5b3VyIG5leHQgcGF0Y2ggdGhhdCdsbCBk
cm9wIHRoZSByZWR1bmRhbnQgZmxhc2ggaW5mbyBmaWVsZHMsIHlvdQo+ID4+PiBjYW4gZHJvcCBT
UElfTk9SXzRCX09QQ09ERVMgYXMgd2VsbCBpZiB0aGVzZSBmbGFzaGVzIGRlZmluZSB0aGUgNGJh
aXQKPiA+Pj4gc2ZkcCB0YWJsZS4KPiA+Pgo+ID4+IEFueSBwbGFuIGluIGRvaW5nIHRoaXMsIHBs
ZWFzZT8KPiA+Cj4gPiBTb3JyeSBmb3IgdGhlIGxhdGUgcmVwbHkuCj4gPgo+ID4gVGhpcyBtYXR0
ZXIgaXMgY3VycmVudGx5IGluIHByb2dyZXNzLiBTaW5jZSBjb2xsZWN0aW5nIGFsbCB0aGUgY2hp
cHMKPiA+IHdpbGwgdGFrZSBzb21lIG1vcmUgdGltZSwgdGhlIHByb2plY3QgaGFzIGJlZW4gZGVs
YXllZC4gT25jZSBJCj4gPiBoYXZlIGFsbCB0aGUgY2hpcHMsIEkgd2lsbCBzdGFydCB0aGUgdmVy
aWZpY2F0aW9uIHByb2Nlc3MgaW1tZWRpYXRlbHkuCj4gPiBUaGFua3MgZm9yIHRoZSByZW1pbmRl
ci4KPiA+Cj4KPiBUaGFua3MsIENoZW5nLiBTd2l0Y2hpbmcgdGhlbSBvbmUgYnkgb25lIGlzIGZp
bmUgdG9vLgoKR290IGl0LCBubyBwcm9ibGVtLiBJIHdpbGwgc3RhcnQgdGhlIHZlcmlmaWNhdGlv
biB3aXRoIHRoZQpjaGlwcyBJIGhhdmUgb24gaGFuZC4KClRoYW5rcywKQ2hlbmcgTWluZyBMaW4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
