Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41D5FCA101F
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Sep 2025 09:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Te3h5ixmL51Fui+fr/w6dLdfPjZnJy3HbODSrAsYwvs=; b=3ysXptYkoAK6dz
	oXRP0dD5s8jVHt1VZBPgIDgnf8DYAU9RMs/yZmIH34aJHsSPC6SAuuYcz9QVCuiMgwsalO2f/36nz
	RINmzhP8ubkmGzTBy4nvtqCZj1FL4aaGrkHkoMRlmmB6uwGPNA7t7+/y6cyo820zSWS0sb5U/z0w6
	8ZRY8TtHRISfKSaNgtO3764kIYqIU/YU2FBkbOHdd/zLS2kiz0V13QTFut1aaDNcM8HfN6LDya26g
	F3qw8iZJKfBjoSzcF3TrqrFbrwfdMBlp50A7DhZPQzOu0dJs9b5Hg/vZ15q/EAVrF0HywkQQDSkUI
	Z0xia2wigvr5XOO16hOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwH8g-0000000DDbL-1Kye;
	Wed, 10 Sep 2025 09:29:18 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwH8d-0000000DDau-38QR
	for linux-mtd@lists.infradead.org;
	Wed, 10 Sep 2025 09:29:17 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-32b863ed6b6so5422235a91.2
        for <linux-mtd@lists.infradead.org>; Wed, 10 Sep 2025 02:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757496555; x=1758101355; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3EStkD296c7vzLzgwbJ5Q3SXD0IQ0ZzmhAtjORkOwDY=;
        b=gLXK1nB95aX7aCLzZgrJArGa1SSLleM0PRIES7QxyXR54NXBEFLmIwiX/6dJodyD2L
         edwRpHxnjQClvCoJGRJnoXbzIta6K3X1d4YBpCTJegvR+Ydbz1v7ix0Hls/l/tiJg4w4
         IBzXOa0fX6EkpFzyRYb1CvFaOMoGrpO/1ecPXSLTqHs79DwL0SF23/HyC86tqUqFkxlD
         BmnQ3qLgV6CWpoCq4IW5GrhrmfDlne66IF+kKVS8Ew7ypSjD6RdC8PRgigxHxxoxToJG
         sYACGCwl83jAUMlCf12V+bUflEoZEY2h/UlyF054lPSLrpPdXk4S9esn+1E3X9xY+YYz
         F78A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757496555; x=1758101355;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3EStkD296c7vzLzgwbJ5Q3SXD0IQ0ZzmhAtjORkOwDY=;
        b=iGmV2CI9PoM4EU3j4oWhbJCh2KRJjkbPRDYxrnDC6yw9c0E1ztuKDYxZJ7aQ6j1xET
         qT/Wnzqqu0abFl/jTbMMwS1Tvv9fgOAyvz0j4IFcmzkoOzJgdbDwRq1VKT2ZUyQGwq2a
         KJywxGpjA/ZW0g0OVa8QH+20gByemjyz+XDciAxcHZg1tS854uIgbVRKhN/OJj6TCpb4
         hgoaGYTP+dIwoxIz11WEhr3o2w3SmbDHGNYGUzZZAqmAqmtIhtA60PwgccWauu4+tb8t
         nqevPWFY0NOqY6fqb5V6u265FvAokLY7/OuBOF1CP4Yt/3YRHxOkn2zscHRVXqSx/uWw
         XShw==
X-Forwarded-Encrypted: i=1; AJvYcCUxfkcChPkDVDl5pxXX1IfvMOMwOMtA7Ejup40gW8ZO0aarqvn8hRuABCt7DfzMxWmGY8MLDVTtXKk=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5tmWm/Rz3s6hb868Gu18hpZ3lXxw1IO3BC00PPyulzEn5LIaG
	N1WX3DwFcQcb3TphrcvAYzb9NHeMLN54JvTeDmvxlN9lP9jcOMZGkok/HrH1a4CtCkYfUGpAe68
	L6QVtJr9FhAcHX9BYFmtSqtfN/jTtTnc=
X-Gm-Gg: ASbGncuyMIqPUhk7xDY6TDT2BLnOnYADzZPxrBlgyPin2fWLfX298lyPGETzKKCE8+3
	1xRD+KukDrVTFtIhdeCtf59JddWcGAvoCg6vByV6p/2/oM4EWfXBtTEhgF/i4Kb3MABhKz2hY6S
	b29YGSnlp1PXKnegJC1QaYOzHwMb7I2LAVKFWj0+QNizE8Rsjo9SUI8uUGDw8vL57bA6mugekV2
	ysqPWsQDQwhe4+ym+q/H2Jga+IO8GWJ3rLOBaOt3aUiLDXHZ86vS1zOcMbBW8ik8BIAa1dsXO5H
	aqiL1XPeuD1yZGTa
X-Google-Smtp-Source: AGHT+IGEB857JKG31YkO+wgmi8nzIk7GnqXqtsczCzBdx0PaCn3Hyc42K+1wQCNnGRXZTYwvjj0A/Ujz6xcIxnfIqeg=
X-Received: by 2002:a17:90b:3f4c:b0:32c:38b0:593e with SMTP id
 98e67ed59e1d1-32d43f04f10mr17652701a91.5.1757496554818; Wed, 10 Sep 2025
 02:29:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250910030301.1368372-1-linchengming884@gmail.com>
 <20250910030301.1368372-4-linchengming884@gmail.com> <87qzwed62q.fsf@bootlin.com>
In-Reply-To: <87qzwed62q.fsf@bootlin.com>
From: Cheng Ming Lin <linchengming884@gmail.com>
Date: Wed, 10 Sep 2025 17:26:13 +0800
X-Gm-Features: Ac12FXyc3DERP3v19zMEjcuEfAYaCC68gYRcLvz6_-F0QwwNUbBhHRCfjh1WPe8
Message-ID: <CAAyq3SamY9vjQubd0BjpLb7J_W6JfKyyd987y+UioMV7UQ=94Q@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] mtd: spi-nand: macronix: Add randomizer support
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: richard@nod.at, vigneshr@ti.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, tudor.ambarus@linaro.org, mmkurbanov@salutedevices.com, 
	Takahiro.Kuwano@infineon.com, pratyush@kernel.org, 
	linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, alvinzhou@mxic.com.tw, 
	Cheng Ming Lin <chengminglin@mxic.com.tw>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_022915_787545_7E2DC826 
X-CRM114-Status: GOOD (  11.39  )
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

SGkgTWlxdWVsLAoKTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4g5pa8
IDIwMjXlubQ55pyIMTDml6Ug6YCx5LiJIOS4i+WNiDU6MTLlr6vpgZPvvJoKPgo+Cj4gPiArc3Rh
dGljIGludCBtYWNyb25peF9zZXRfcmFuZG9taXplcihzdHJ1Y3Qgc3BpbmFuZF9kZXZpY2UgKnNw
aW5hbmQpCj4gPiArewo+ID4gKyAgICAgc3RydWN0IHNwaV9tZW1fb3AgZXhlY19vcCA9IFNQSU5B
TkRfUFJPR19FWEVDXzFTXzFTXzBfT1AoMCk7Cj4gPiArICAgICBzdHJ1Y3QgbmFuZF9kZXZpY2Ug
Km5hbmQgPSBzcGluYW5kX3RvX25hbmQoc3BpbmFuZCk7Cj4gPiArICAgICBzdHJ1Y3QgZGV2aWNl
X25vZGUgKmRuID0gbmFuZGRldl9nZXRfb2Zfbm9kZShuYW5kKTsKPiA+ICsgICAgIGludCByYW5k
b3B0LCByZXQ7Cj4gPiArICAgICB1OCBjZmcsIHN0YXR1czsKPiA+ICsKPiA+ICsgICAgIHJldCA9
IHNwaW5hbmRfcmVhZF9yZWdfb3Aoc3BpbmFuZCwgTUFDUk9OSVhfRkVBVFVSRV9BRERSX1JBTkRP
TUlaRVIsICZjZmcpOwo+ID4gKyAgICAgaWYgKHJldCkKPiA+ICsgICAgICAgICAgICAgcmV0dXJu
IHJldDsKPiA+ICsgICAgIGlmIChjZmcpCj4gPiArICAgICAgICAgICAgIHJldHVybiAwOwo+ID4g
Kwo+ID4gKyAgICAgY2ZnID0gTUFDUk9OSVhfQ0ZHX0VOUEdNIHwgTUFDUk9OSVhfQ0ZHX1JBTkRF
TjsKPiA+ICsgICAgIHJhbmRvcHQgPSBvZl9wcm9wZXJ0eV9yZWFkX2Jvb2woZG4sICJteGljLHJh
bmRvcHQiKTsKPgo+IElzbid0IHRoYXQgYSBsZWZ0b3Zlcj8KClRoZSBwcm9wZXJ0eSAibXhpYyxy
YW5kb3B0IiBjb3JyZXNwb25kcyB0byBiaXQyIG9mIHRoZSBjb25maWd1cmF0aW9uCnJlZ2lzdGVy
IDB4MTAuIEl0cyBwdXJwb3NlIGlzIHRvIGNvbnRyb2wgd2hldGhlciB0aGUgcmFuZG9taXplciBh
bHNvCmNvdmVycyB0aGUgaW5pdGlhbCBwb3J0aW9uIG9mIHRoZSBzcGFyZSBhcmVhLgoKU2luY2Ug
dGhlIHJhbmRvbWl6ZXIgZmVhdHVyZSBpcyBvbmx5IGRvY3VtZW50ZWQgaW4gTWFjcm9uaXggZGF0
YXNoZWV0cywKaXQgaXMgbm90IGNsZWFyIHdoZXRoZXIgdGhlICJyYW5kb3B0IiBiaXQgaXMgdXNl
ZCBieSBhbGwgdmVuZG9ycy4gRm9yCnRoaXMgcmVhc29uLCB0aGUgaGFuZGxpbmcgaXMgcGxhY2Vk
IGluc2lkZSBtYWNyb25peC5jLgoKRm9yIHJlZmVyZW5jZSwgcGxlYXNlIHNlZSBwYWdlIDI4IG9m
IHRoZSBmb2xsb3dpbmcgZG9jdW1lbnQ6Ckxpbms6IGh0dHBzOi8vd3d3Lm14aWMuY29tLnR3L0xp
c3RzL0RhdGFzaGVldC9BdHRhY2htZW50cy85MDM2L01YMzVMRjRHMjRBRCwlMjAzViwlMjA0R2Is
JTIwdjEuNC5wZGYKCj4KPiBUaGFua3MsCj4gTWlxdcOobAoKVGhhbmtzLApDaGVuZyBNaW5nIExp
bgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
