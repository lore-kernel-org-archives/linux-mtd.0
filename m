Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 290E4C61DE1
	for <linux-mtd@archiver.kernel.org>; Sat, 21 Feb 2026 09:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XE3jaZYZuOLoQWBCk3x5eNWWfDDhez2fWTtmdxSxdW4=; b=FUxyhTfHErjMsF
	m01m5GWRUhmEdVK2e/t0+w9vezDCgNnomcim8FuzhZQRgS95bWm6m1DulkEbKJkYUww0TQ0wPz3wf
	bd87CHYQUCk6WtsWJrsKZFdUhaoBqdr9qD6CxTnVMI2h28JYd6X3HGb8izWwbkm3B5Hdw7pKbOVNI
	/GpipeKsymaDR2RkkG5P00/YMdXbJnJB/iPP4gjBGXoTJxcph30blFVVVQn8CaZDRjsh+PV8RIVg4
	2EXGjIVY+Z4xycQ3PU9leHRRpXnSl6xiD7ep9cgx5TgSzp0ESZZ8y5GR/AtJBwE3aCAXuppwPg8Pp
	kydcWeTXvtsJY+uPBRnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtjT8-0000000Fwe6-12nA;
	Sat, 21 Feb 2026 09:40:10 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtjT4-0000000Fwci-0BiW
	for linux-mtd@lists.infradead.org;
	Sat, 21 Feb 2026 09:40:07 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-483abed83b6so1191155e9.0
        for <linux-mtd@lists.infradead.org>; Sat, 21 Feb 2026 01:40:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771666804; x=1772271604; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g6/9TKO3LWYFd625WXu9vJ/ajbVGHAvhA19sJ/yb0fs=;
        b=huPQk7GywpoxTTTgyzsRrWWGiXLcqb8Lm6+6kVgVLSF3/FCIRjMvoZVDSReexuAoQZ
         zOXRtguIiZxOD72VB7Nal24A7fOwQ6Pt5bXramF6UrcDIXT/NY3eaDq6RrUhKTRQeTz1
         uDLrymF3nNvNvtGkxZUqRSpNDIeULhq7Itl4BaDGs3aiu2gghCrig8XtSxxN+nnZagVq
         T1qCg7/9eRpJ9D7Gg6sT/Dz61hM9V6VLyVdS7Bmt2wBNLuxFSlFMymTdtiICMCeSutUD
         5V+cl+TTV3FEk+Rfh0tHSlKjJ8cfpOUua3aUvG9tfg0HvEhiQct8tEJGgx3dV3vr0Hre
         nOiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771666804; x=1772271604;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g6/9TKO3LWYFd625WXu9vJ/ajbVGHAvhA19sJ/yb0fs=;
        b=isPJ9pGdlchEWjcPEHj78Q56NfDHqvpL1XhJ0YZc7Ct3cFLMgmCQfdhaO07nnsHVKq
         4RFO3J5tgU5OdewaN7LOwN0d1sot4xRqLX5uY+WqUwHgmKoipMSJDf4Yu/l+j8DCSDiu
         RmfCYjugDov5qTCmgXHwzJQjuOlbuIILOsTy3mYID4Uvrl0M3H5FSqtlL241lOhuMtKL
         2bJALgz8fx+9XYl1C2tQON8X9OHnpOKIWujFGuGiL+9ElNObXwsKB5kII+FD9kAXApmX
         86UhKDzssgjAp8M4souvP2ovpWTqg/JI3/Hij+n54GAj849nTPRtWQB/3zGs1KM+72HH
         /jdA==
X-Forwarded-Encrypted: i=1; AJvYcCXQOgPTg7G2mlQw4WPLXeuCmRpu2L3dy4IT7KE9iypnRy0ZqTROfcZkK2Fg5sEJ6R4xtTZLgjKRbrw=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3AWXhtwme+92ZUi//iEOPMRha4/uRF1bdo/lhLECX7Ob6Wmjq
	9zWbcS4CAJl6aWmL9oPSs8kOkmXEOMn4vtZ30QH5DOS5fSEK29lbueYr
X-Gm-Gg: AZuq6aJW7TWczdFMc1GmpXa2UZs8k50V5+Ffj3/RKILtmXbVskmrQFQn1264BZJZ3E8
	PuXB6ZaIkdJScGKnAjHA7zAhCbm+Dldrd/o/M1AlYZJGqk2DVsLEL54ucZ681UJKRTuEO7UpFOF
	N1mm5KZCf8ZiHjGnkn4cZCLXJ25o8lgveY5lHl83gGKDnXNuzP9qKfYCsv0ahSlwvSsl9wgkEXu
	nhsYzyLHkZa3Ss9r/PZQmGtAGeYH7AJDM83NHFLJPd0wMyqa56FybMZmPokH3mJBGOdmTMLUBqk
	2hHZQzzNiE4CFPMI+uV9ItzFnmAea9bs7EQpmEQiaDQEWdlOEDh64bugutaiaFdVuj7Jn1/b8HO
	0RnVnU9+LxWXUGIXByCksfuHIy3lirzTTaK7Ld61QuGNLKX7BqktQOyg76Qj+n6wcmCTzmdTVr0
	k2ACJLWFE/VGSaJ9w6HwX3kJgHNdLBKfRNyPaVtRcorcYzpYrC8/wpZkPzN0B+kfc5Bi0NGjngr
	J1SBfip
X-Received: by 2002:a05:600c:46c9:b0:483:a21:774c with SMTP id 5b1f17b1804b1-483a95eab7cmr39989255e9.25.1771666803563;
        Sat, 21 Feb 2026 01:40:03 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-126-118.dynamic.telemach.net. [86.58.126.118])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a316eb08sm143975255e9.0.2026.02.21.01.40.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Feb 2026 01:40:03 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Richard Genoud <richard.genoud@bootlin.com>
Cc: Wentao Liang <vulab@iscas.ac.cn>, Maxime Ripard <mripard@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 Richard Genoud <richard.genoud@bootlin.com>
Subject: Re: [PATCH 5/6] mtd: rawnand: sunxi: make the code mode self-explanatory
Date: Sat, 21 Feb 2026 10:33:01 +0100
Message-ID: <3396446.aeNJFYEL58@jernej-laptop>
In-Reply-To: <20260220161011.999642-6-richard.genoud@bootlin.com>
References: <20260220161011.999642-1-richard.genoud@bootlin.com>
 <20260220161011.999642-6-richard.genoud@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260221_014006_081953_6D566990 
X-CRM114-Status: UNSURE (   8.26  )
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

RG5lIHBldGVrLCAyMC4gZmVicnVhciAyMDI2IG9iIDE3OjEwOjEwIFNyZWRuamVldnJvcHNraSBz
dGFuZGFyZG5pIMSNYXMgamUgUmljaGFyZCBHZW5vdWQgbmFwaXNhbChhKToKPiBJbiBzdW54aV9u
ZmNfaHdfZWNjX3tyZWFkLHdyaXRlfV9jaHVuaygpLCB0aGUgRUNDIHN0ZXAgd2FzIGZvcmNlIHRv
IDAsCj4gdGhlIHJlYXNvbiBpcyBub3QgdHJpdmlhbCB0byBnZXQgd2hlbiByZWFkaW5nIHRoZSBj
b2RlLgo+IAo+IFRoZSBleHBsYW5hdGlvbiBpcyB0aGF0LCBmcm9tIHRoZSBOQU5EIGZsYXNoIGNv
bnRyb2xsZXIgcGVyc3BlY3RpdmUsIHdlCj4gYXJlIGluZGVlZCBhdCBzdGVwIDAgZm9yIHVzZXIg
ZGF0YSBsZW5ndGggYW5kIEVDQyBlcnJvcnMuCj4gCj4gSnVzdCBhZGQgYSBjb25zdCB2YWx1ZSB3
aXRoIGFuIGV4cGxhbmF0aW9uIHRvIGNsYXJpZnkgdGhpbmdzLgo+IAo+IFNpZ25lZC1vZmYtYnk6
IFJpY2hhcmQgR2Vub3VkIDxyaWNoYXJkLmdlbm91ZEBib290bGluLmNvbT4KCkFja2VkLWJ5OiBK
ZXJuZWogU2tyYWJlYyA8amVybmVqLnNrcmFiZWNAZ21haWwuY29tPgoKQmVzdCByZWdhcmRzLApK
ZXJuZWoKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
