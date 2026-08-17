Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8235C5B572
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Aug 2026 05:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tY89LxPP6hj4Pbv0Kjfn4VWKMIvWIqcJX4mngMCJODw=; b=cTvZZ3gwkErkKX
	Se5N8wdBie95ygRZnKwtQTz0t8rJn1RVbWDRb773Koah1nOiKb3Gd97oBaBOE1xfH3kEZGcMmGnBe
	RWJHCZTO1E7mQpWzAO954xjqK+BnDMkD8+dpvbrS2CybkuTRYRdHftoOuy/6DkDE+S9qFx8ULPEFj
	vyF2fRTx2YFeh4Pos6XVKZ+a33LCzWGk+bfM6gUCjj8wZ+QvfZ67pIC2VMeesTWmct/KlaqgDLEeh
	BquQrfsgQ5gQb5RmBuk0qH3NpPbWFEjS6a32tsUzX+Jns6p78pgKwkLvaRVAUe4eF0tqryiSZqk+9
	YpMRII/YZlCaxutqUGFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvpuo-00000005RLw-34wQ;
	Mon, 17 Aug 2026 05:29:42 +0000
Received: from gw2.atmark-techno.com ([35.74.137.57])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvpuk-00000005RLb-3myL
	for linux-mtd@lists.infradead.org;
	Mon, 17 Aug 2026 05:29:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=atmark-techno.com;
	s=gw2_bookworm; t=1786944576;
	bh=3iZDM4mLcwv/ne+GXl+BDDVwwmNFM0uoOVEJ2+ndLXc=;
	h=From:Date:Subject:To:Cc:From;
	b=NVD91MRq8XdhUmbcEnSAhkIbv43LV6OV3bh8qGtb5FMV9QR/68Su8h5O4xXicF6gP
	 Xl7MkIweuNbFGaHbsD739JA1DpIFvco6RIAwYezZlhHjxaqM10B9pkq4Ae8cgYfxA6
	 R7K3ptGVkOo3SirS4h3oP6IGUY+d6o9u/Cjca4OgcOuLH3aXTdMuliwPp26kzTbEQB
	 Rf8JgAWKMg6uQSsqYiSeIiKarBUjkzYqhlcnD9qjEJ2VJijrrlrXEYZPTucSqAoj3A
	 6kY71wXBR5JJKvGkYkhyauvBTls/hq45KXHf3Il+qY7CVjjwCvaF2EpCZkaIjo+z9x
	 DI6mtNiOMhImQ==
Received: from gw2.atmark-techno.com (localhost [127.0.0.1])
	by gw2.atmark-techno.com (Postfix) with ESMTP id 96F7983E
	for <linux-mtd@lists.infradead.org>; Mon, 17 Aug 2026 14:29:36 +0900 (JST)
Authentication-Results: gw2.atmark-techno.com;
	dkim=pass (2048-bit key; unprotected) header.d=atmark-techno.com header.i=@atmark-techno.com header.a=rsa-sha256 header.s=google header.b=GiF8QoVh;
	dkim-atps=neutral
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by gw2.atmark-techno.com (Postfix) with ESMTPS id 16E5736C
	for <linux-mtd@lists.infradead.org>; Mon, 17 Aug 2026 14:29:35 +0900 (JST)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ce7dff6253so39872425ad.1
        for <linux-mtd@lists.infradead.org>; Sun, 16 Aug 2026 22:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atmark-techno.com; s=google; t=1786944574; x=1787549374; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=O7TkbdcGLdkHt6eRSvx1fZah2d03gqU1YBM0bKNnL54=;
        b=GiF8QoVhUlsNHkHJ5Lzgh8Lprnb6c6W+SHpOFZUN3bsyCLLaakdznrU9qIHYySgreb
         XXBiP72RZQQibwrhMdvkwDZUmDolLYMdNuQSO3nOvVVKh+OyqCNezQhxXYI6Q1mR7ZF6
         6sianBEintf1jR96LYYv1pLsdAd2RHx6e+eomyapEmgRIghu+YT4UwiKAVjK3FToTf1w
         lXDd1NLDpGnmQo/gy74VwrATiAcYq/kBPmrr3a6gFXQSM3auhWfjLk7QLJolepG0sbcJ
         chHVOzB9NqRr9KMqsNVdxtBGbabfKNgvYfPGeFCyAMoCK6GP9OwgaURvMWGRpIMob71p
         CleA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786944574; x=1787549374;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=O7TkbdcGLdkHt6eRSvx1fZah2d03gqU1YBM0bKNnL54=;
        b=r0hswvMFQyWMzCCRZ1RqNQwqKfd76En/gvKjzG9/+wryUgCZi1WRpxt2sZq7HFpYYN
         UlAA2eKvvXOfgqB72LN8Z/aIJngMg0iL54ArCu+z4T0X8yKVL6Y88rRprfGXhlszIzAR
         eDowzZ/ZoYJsfx6LbJDD5xKMMyz8w70JhnBpHNWH0R6hvQn9HG4FIk2JuXbYYX7Lv3gb
         Q4Z4Egt9Y0CdfqfmM0OKYsdatIlZzcOAiLeiXJGtIwz0y4i53zVliHsyUd0jR5g8JKtV
         MX7BDmQtv0iUjIbT4d4CaGrcEoQ1mDS6qIZkp1wSgp37Km0zp6HYYMZH141TfyGyaJCK
         uiQQ==
X-Gm-Message-State: AOJu0YxadX32wjknWHNKNJdrVkEyCUdQWz+rsn/bfOhlde+cY5fsWcXa
	oyzNuCxcTkaoPx/PLUXm+PLCiGzm3avdAkqgqTYH4XzxvKZYRNiLNpF+8IcyRiWrdVZottr+sTp
	k2oNCkWBt4tQ+wCd429xwX3KiRNo0TCoRQmXzVUJCuaIyMYjtdyKdh/PPXSmbrOgjMtWF
X-Gm-Gg: AR+sD10qKivrQBus39TNKTV1AcKkiZzmsMkW21eljfUk9SarqLCxxTRc0BWNXqaLy5L
	apVvh6MUSpZAlIO8nXhl3DgP9MJkOqr3NwAe1WPnpNBzGe5Pqkm1pRAOpqCfOeacN9WBkV250EJ
	fUpnMBobTGm4X+QbJafu5g/8vY65dVN+IaefdwdMu7WfbDZDg3QE48HHcMVbJRzFgL0hAu0/FBB
	KQ8/0/dmUe1f3kGZOqNB7EtDD0KFx9a/sxfqRLXTMlfRG0CtwVSapJv3pV6kxYP8d4j4g5usS2u
	6J7X5243rlTUzems1iUgloIH7HPfU+zFxTnHyk7/UaIWiVgrzqeqb0Vixp1HAFP0NWyIcubQORs
	D4YuBXZurceFGTzgLrt6a5tYReAViMfD+mCe0vD5B5G27L5Ot
X-Received: by 2002:a17:903:28f:b0:2cc:db7a:251 with SMTP id d9443c01a7336-2d37f5cdcebmr300787315ad.2.1786944574446;
        Sun, 16 Aug 2026 22:29:34 -0700 (PDT)
X-Received: by 2002:a17:903:28f:b0:2cc:db7a:251 with SMTP id d9443c01a7336-2d37f5cdcebmr300786845ad.2.1786944573952;
        Sun, 16 Aug 2026 22:29:33 -0700 (PDT)
Received: from localhost (sodcd-04p2-40.ppp11.odn.ad.jp. [203.139.65.40])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2d3aeb88bddsm29121725ad.63.2026.08.16.22.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 22:29:33 -0700 (PDT)
From: Dominique Martinet <dominique.martinet@atmark-techno.com>
Date: Mon, 17 Aug 2026 05:29:17 +0000
Subject: [PATCH v4] mtd: spinand: winbond: add support for W25N04LW
MIME-Version: 1.0
Message-Id: <20260817-w25n04lw-v4-1-1b19c2a629e5@atmark-techno.com>
X-B4-Tracking: v=1; b=H4sIACycgmoC/23OsU7DMBAG4FepvIIr52yclqkDE0hIDAwIMVztC
 zHENthJSlXl3XHCQCVYTvql/767E8uUHGV2vTqxRKPLLoYS1OWKmRbDK3FnS2YgQItNBfwAV0G
 o7sAlbSul7UYq0bBS/0jUuK+Fen75yXnYv5Hp5/250brcx3Rcbo3V3GMY8tNjvL+7Pd48XOgGd
 u3AvcUOPd93af05YGei9+sy2IyOsKz9/WYEXnFLRNtaC2iM2mHvMb3znkwb4i8gzwF1BsgCGI2
 1AommtuI/YJqmb3iBfqQyAQAA
X-Change-ID: 20260812-w25n04lw-3e9146d8340f
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, 
 Md Sadre Alam <md.alam@oss.qualcomm.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Daisuke Mizobuchi <mizo@atmark-techno.com>, 
 Dominique Martinet <dominique.martinet@atmark-techno.com>
X-Mailer: b4 0.16-dev-a9e92
X-Developer-Signature: v=1; a=openpgp-sha256; l=4750;
 i=dominique.martinet@atmark-techno.com; h=from:subject:message-id;
 bh=3iZDM4mLcwv/ne+GXl+BDDVwwmNFM0uoOVEJ2+ndLXc=;
 b=owEBbQKS/ZANAwAKAfKKYH/WjHEHAcsmYgBqgpw1lNIPCRPj3G1fATGm1+gklsHgvmGw8OLfv
 hxfeA4e+eGJAjMEAAEKAB0WIQQoFSiLMD+txr0veJbyimB/1oxxBwUCaoKcNQAKCRDyimB/1oxx
 BxQAEACdMB8mHB2Fhg7RluYwVQyzD6ze15C4PykgWX0Mf3QqszOgNuidiUIrBl2qfgvwaqx4Xkl
 BNdTQsi2m/xHjDuUtx11HD/Vno17fYlK0IqVuNN1xze66KA/5MyQbcWGhmBuLYhWlBPap2znxl5
 90aPunWL56Z7pCfr1IiyElvO2KMy87i9F58HDT16DPaqW2l2wBz878b3tAjn+oRApgOQLXptvCX
 /6BZq9TtB2RWEN7dWnPXUHundBZ90NPYq4OSSNXJ3MMp+ObUcA+zgmC904rBPbiy3Bqyz/HkG3x
 gxDhgoA8tNiaLA0PtBt5BWa72TKfOa1xE57jA0A4vp5R7ngYftsEgTfbE+XruCeJRwqlXGqZzuy
 T5d9aqyJERqfIa9phFEdnM8andmTiNCwbOxo7/d3UFZYH42Jc32rrwM7krM8Io36QFVdlGbRq25
 0RaQ4OFG91khFPX9dKX0DF6sG34EVNeakHdjU+jHRQX8/Ls2l7Uvk9+JnIaebcn9hCHPGimGo1w
 KHgaG3jZTw8UvEsLi73knW8dqPfG93FFqpQpnK2tLPjMgdPYXqmG72JVPCcAXLhynFxI+4O/frw
 MtmXELQ49/gpAmTeZnYWONjNJtltPyPfCUkYmJjxmlrkgNdzPfreXV/Wz/emoFuOjMtPx9umgQJ
 Yb8T1PqBFnyFtKw==
X-Developer-Key: i=dominique.martinet@atmark-techno.com; a=openpgp;
 fpr=2815288B303FADC6BD2F7896F28A607FD68C7107
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260816_222939_192015_9BE16339 
X-CRM114-Status: GOOD (  18.47  )
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

QWRkIHN1cHBvcnQgZm9yIFdpbmJvbmQgVzI1TjA0TFcgNEdiaXQgU1BJLU5BTkQ6Cj4gMS44ViA0
Ry1iaXQKPiBSYXcgc2VyaWFsIFNMQyBOQU5EIGZsYXNoIG1lbW9yeQo+IER1YWwvUXVhZCBTUEkg
d2l0aCAxMDRNSHoKPiBidWZmZXIgcmVhZCwgY29udGludW91cyByZWFkICYgc2VxdWVudGlhbCBy
ZWFkCgpIaWdobGlnaHRzIGNvcGllZCBmcm9tIGRhdGFzaGVldDoK4oCTIFBhZ2Ugc2l6ZTogNCwz
NTIgQnl0ZXMgKDQwOTYgKyAyNTYgQnl0ZXMpCuKAkyBCbG9jayBzaXplOiA2NCBwYWdlcyAoMjU2
SyArIDE2SyBCeXRlcykKLSBCdWlsdC1pbiA4LUJpdCBFQ0MgZm9yIG1lbW9yeSBhcnJheQrigJMg
RUNDIHN0YXR1cyBiaXRzIGluZGljYXRlIEVDQyByZXN1bHRzCuKAkyBCYWQgQmxvY2sgTWFuYWdl
bWVudCBhbmQgTFVUIGFjY2VzcwrigJMgU29mdHdhcmUgYW5kIEhhcmR3YXJlIFdyaXRlLVByb3Rl
Y3QK4oCTIFBvd2VyIFN1cHBseSBMb2NrLURvd24gYW5kIE9UUCBwcm90ZWN0aW9uCuKAkyBVbmlx
dWUgSUQgYW5kIFBhcmFtZXRlciBwYWdlCuKAkyBUZW4gNEtCIE9UUCBwYWdlcyBwZXIgZGllCuKA
kyBSZWFkIExldmVsIFNldHRpbmcgZm9yIFJlYWQgUmV0cnkKClRoZSA0MDk2KzI1NiBieXRlIHBh
Z2UgbGF5b3V0IGlzIGFzIGZvbGxvdzoKLSA0MDk2IGJ5dGVzIEVDQyBwcm90ZWN0ZWQgIm1haW4g
bWVtb3J5IGFycmF5Iiwgc3ViZGl2aWRlZCBpbiA4CiAgNTEyIGJ5dGVzIHNlY3RvcnMKLSAxMjgg
Ynl0ZXMgc3BhcmUgYXJyYXksIHN1YmRpdmlkZWQgaW4gOCAxNiBieXRlcyBzZWN0b3JzIGFzIGZv
bGxvdzoKICAtIDIgYnl0ZXMgYmFkIGJsb2NrIG1hcmtlciAobm8gRUNDIHByb3RlY3Rpb24pCiAg
LSAyIGJ5dGVzICJ1c2VyIGRhdGEgSUkiIChubyBFQ0MgcHJvdGVjdGlvbikKICAtIDEyIGJ5dGVz
ICJ1c2VyIGRhdGEgSSIgKEVDQyBwcm90ZWN0ZWQpCi0gMTI4IGJ5dGVzIHBhcml0eSBhcnJheSwg
c3ViZGl2aWRlZCBpbiA4IDE2IGJ5dGVzIHNlY3RvcnM6CiAgLSAxMyBieXRlcyBFQ0MgZm9yIG1h
aW4gZGF0YSBhbmQgdXNlciBkYXRhCiAgLSAzIHVudXNlZCBieXRlcwoKVGhpcyBjb21taXQgZG9l
cyBub3Qgc3VwcG9ydCBtb3N0IGFkdmFuY2VkIGZlYXR1cmVzIHN1Y2ggYXMgY29udGludW91cwpy
ZWFkLCBMVVQgbWFuYWdlbWVudCBhbmQgT1RQIHBhZ2VzLCBhbmQgb25seSBwcm92aWRlcyBiYXNp
YyB1c2FnZS4KCk9PQiBsYXlvdXQgd2FzIGtlcHQgY29tcGF0aWJsZSB3aXRoIHByZXZpb3VzIG1v
ZGVscyAoZXhwb3NpbmcgYm90aCB1c2VyCmRhdGEgSSBhbmQgSUkpLCBkZXBlbmRlbnQgb24gbXRk
LT5vb2JzaXplLgoKQ28tZGV2ZWxvcGVkLWJ5OiBEYWlzdWtlIE1pem9idWNoaSA8bWl6b0BhdG1h
cmstdGVjaG5vLmNvbT4KU2lnbmVkLW9mZi1ieTogRGFpc3VrZSBNaXpvYnVjaGkgPG1pem9AYXRt
YXJrLXRlY2huby5jb20+ClNpZ25lZC1vZmYtYnk6IERvbWluaXF1ZSBNYXJ0aW5ldCA8ZG9taW5p
cXVlLm1hcnRpbmV0QGF0bWFyay10ZWNobm8uY29tPgotLS0KQ2hhbmdlcyBpbiB2NDoKLSBVcGRh
dGVkIG9vYmxheW91dCBmdW5jdGlvbiB0byBpZiBvb2JzaXplID0gMjU2IGluc3RlYWQgb2YgdXNl
IG9vYnNpemUKICBkaXJlY3RseQotIExpbmsgdG8gdjM6IGh0dHBzOi8vcGF0Y2gubXNnaWQubGlu
ay8yMDI2MDgxNC13MjVuMDRsdy12My0xLWM2YTc0MjNhYzdkMEBhdG1hcmstdGVjaG5vLmNvbQoK
Q2hhbmdlcyBpbiB2MzoKLSBGaXhlZCBDby1hdXRob3JlZC1ieSAvIGNvbW1lbnQgc3R5bGUKLSBN
ZXJnZWQgb29ibGF5b3V0IGhlbHBlciB3aXRoIHcyNW4wMmt2X29vYmxheW91dCwgdXNpbmcgbXRk
LT5vb2JzaXplCih3aXRoIGFuIGV4dHJhIGNvbW1lbnQgZGVzY3JpYmluZyBVc2VyIERhdGEgSS9J
SSwgYnV0IGtlZXBpbmcgY3VycmVudApiZWhhdmlvdXIpCi0gTGluayB0byB2MjogaHR0cHM6Ly9w
YXRjaC5tc2dpZC5saW5rLzIwMjYwODEyLXcyNW4wNGx3LXYyLTEtZGVlZTk3NjAyZmM0QGF0bWFy
ay10ZWNobm8uY29tCgpDaGFuZ2VzIGluIHYyOgotIExpbmsgdG8gdjE6IGh0dHBzOi8vcGF0Y2gu
bXNnaWQubGluay9hbnNZVW9OS0p5RFErNmYyQGh1LW1kYWxhbS1ibHIucXVhbGNvbW0uY29tCi0g
Zml4ZWQgb29iIGxheW91dAotIGZpeGVkIE5BTkRfTUVNT1JHIG9vYiBzaXplCi0tLQogZHJpdmVy
cy9tdGQvbmFuZC9zcGkvd2luYm9uZC5jIHwgMzUgKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKystLS0KIDEgZmlsZSBjaGFuZ2VkLCAzMiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvc3BpL3dpbmJvbmQuYyBiL2RyaXZlcnMv
bXRkL25hbmQvc3BpL3dpbmJvbmQuYwppbmRleCA5Yjc4YzFlNmNiYzkuLmExODA3ZmE5YWUwMyAx
MDA2NDQKLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9zcGkvd2luYm9uZC5jCisrKyBiL2RyaXZlcnMv
bXRkL25hbmQvc3BpL3dpbmJvbmQuYwpAQCAtMzE0LDEwICszMTQsMTggQEAgc3RhdGljIGludCB3
MjVuMDFrdl9vb2JsYXlvdXRfZWNjKHN0cnVjdCBtdGRfaW5mbyAqbXRkLCBpbnQgc2VjdGlvbiwK
IHN0YXRpYyBpbnQgdzI1bjAya3Zfb29ibGF5b3V0X2VjYyhzdHJ1Y3QgbXRkX2luZm8gKm10ZCwg
aW50IHNlY3Rpb24sCiAJCQkJICBzdHJ1Y3QgbXRkX29vYl9yZWdpb24gKnJlZ2lvbikKIHsKLQlp
ZiAoc2VjdGlvbiA+IDMpCisJaW50IG51bV9zZWN0aW9ucyA9IDQ7CisJaW50IG9mZnNldCA9IDY0
OworCisJaWYgKG10ZC0+b29ic2l6ZSA9PSAyNTYpIHsKKwkJbnVtX3NlY3Rpb25zID0gODsKKwkJ
b2Zmc2V0ID0gMTI4OworCX0KKworCWlmIChzZWN0aW9uID49IG51bV9zZWN0aW9ucykKIAkJcmV0
dXJuIC1FUkFOR0U7CiAKLQlyZWdpb24tPm9mZnNldCA9IDY0ICsgKDE2ICogc2VjdGlvbik7CisJ
cmVnaW9uLT5vZmZzZXQgPSBvZmZzZXQgKyAoMTYgKiBzZWN0aW9uKTsKIAlyZWdpb24tPmxlbmd0
aCA9IDEzOwogCiAJcmV0dXJuIDA7CkBAIC0zMjYsOSArMzM0LDIxIEBAIHN0YXRpYyBpbnQgdzI1
bjAya3Zfb29ibGF5b3V0X2VjYyhzdHJ1Y3QgbXRkX2luZm8gKm10ZCwgaW50IHNlY3Rpb24sCiBz
dGF0aWMgaW50IHcyNW4wMmt2X29vYmxheW91dF9mcmVlKHN0cnVjdCBtdGRfaW5mbyAqbXRkLCBp
bnQgc2VjdGlvbiwKIAkJCQkgICBzdHJ1Y3QgbXRkX29vYl9yZWdpb24gKnJlZ2lvbikKIHsKLQlp
ZiAoc2VjdGlvbiA+IDMpCisJaW50IG51bV9zZWN0aW9ucyA9IDQ7CisKKwlpZiAobXRkLT5vb2Jz
aXplID09IDI1NikKKwkJbnVtX3NlY3Rpb25zID0gODsKKworCWlmIChzZWN0aW9uID49IG51bV9z
ZWN0aW9ucykKIAkJcmV0dXJuIC1FUkFOR0U7CiAKKwkvKgorCSAqIEZvciBhdCBsZWFzdCBXMjVO
MDRLVyBhbmQgVzI1TjA0TFcsIHRoaXMgcmVnaW9uIGlzIGFjdHVhbGx5CisJICogc3BsaXQgaW4g
dHdvOgorCSAqIEVDQy1wcm90ZWN0ZWQgIlVzZXIgRGF0YSBJIiBhdCArIDQgb2Zmc2V0LCBsZW5n
dGggMTIKKwkgKiB1bnByb3RlY3RlZCAiVXNlciBEYXRhIElJIiBhdCArIDIgb2Zmc2V0LCBsZW5n
dGggMgorCSAqIFRoaXMgcmV0dXJucyB0aGUgZnVsbCByZWdpb24gZm9yIGJhY2t3YXJkcyBjb21w
YXRpYmlsaXR5LgorCSAqLwogCXJlZ2lvbi0+b2Zmc2V0ID0gKDE2ICogc2VjdGlvbikgKyAyOwog
CXJlZ2lvbi0+bGVuZ3RoID0gMTQ7CiAKQEAgLTc2OCw2ICs3ODgsMTUgQEAgc3RhdGljIGNvbnN0
IHN0cnVjdCBzcGluYW5kX2luZm8gd2luYm9uZF9zcGluYW5kX3RhYmxlW10gPSB7CiAJCQkJCSAg
ICAgICZ1cGRhdGVfY2FjaGVfdmFyaWFudHMpLAogCQkgICAgIDAsCiAJCSAgICAgU1BJTkFORF9F
Q0NJTkZPKCZ3MjVuMDJrdl9vb2JsYXlvdXQsIHcyNW4wMmt2X2VjY19nZXRfc3RhdHVzKSksCisJ
U1BJTkFORF9JTkZPKCJXMjVOMDRMVyIsIC8qIDEuOFYgKi8KKwkJICAgICBTUElOQU5EX0lEKFNQ
SU5BTkRfUkVBRElEX01FVEhPRF9PUENPREVfRFVNTVksIDB4YjIsIDB4MjMpLAorCQkgICAgIE5B
TkRfTUVNT1JHKDEsIDQwOTYsIDI1NiwgNjQsIDIwNDgsIDQwLCAxLCAxLCAxKSwKKwkJICAgICBO
QU5EX0VDQ1JFUSg4LCA1MTIpLAorCQkgICAgIFNQSU5BTkRfSU5GT19PUF9WQVJJQU5UUygmcmVh
ZF9jYWNoZV92YXJpYW50cywKKwkJCQkJICAgICAgJndyaXRlX2NhY2hlX3ZhcmlhbnRzLAorCQkJ
CQkgICAgICAmdXBkYXRlX2NhY2hlX3ZhcmlhbnRzKSwKKwkJICAgICAwLAorCQkgICAgIFNQSU5B
TkRfRUNDSU5GTygmdzI1bjAya3Zfb29ibGF5b3V0LCB3MjVuMDJrdl9lY2NfZ2V0X3N0YXR1cykp
LAogCVNQSU5BTkRfSU5GTygiVzM1TjA0SlciLCAvKiAxLjhWICovCiAJCSAgICAgU1BJTkFORF9J
RChTUElOQU5EX1JFQURJRF9NRVRIT0RfT1BDT0RFX0RVTU1ZLCAweGRmLCAweDIzKSwKIAkJICAg
ICBOQU5EX01FTU9SRygxLCA0MDk2LCAxMjgsIDY0LCA1MTIsIDEwLCAxLCA0LCAxKSwKCi0tLQpi
YXNlLWNvbW1pdDogZGIyZGRiODcxNDM1MTllMjBhOTVhYTM2YzYwYjM2MTA3YjczNmE1OApjaGFu
Z2UtaWQ6IDIwMjYwODEyLXcyNW4wNGx3LTNlOTE0NmQ4MzQwZgoKQmVzdCByZWdhcmRzLAotLSAg
CkRvbWluaXF1ZSBNYXJ0aW5ldCA8ZG9taW5pcXVlLm1hcnRpbmV0QGF0bWFyay10ZWNobm8uY29t
PgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
