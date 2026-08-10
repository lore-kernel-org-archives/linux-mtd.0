Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 421C7C5AC82
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Aug 2026 08:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xTbVtosfpzPsJ1Wm2dY7czKD1OymFpK+dHqRZBLKasw=; b=Sfgrq5QD8obXKb
	+mJAO36LUI7YMu4FXfF9Dj/oiGA1Ih+ayLOflXdnjrMn/+RB/q79U9TVbPIJ/Ss+p4W89T0XqIpg0
	xB1nA7NLWFP2PSfkIVCWsyCZiUB46WKR8jSYE4SeTRCg8OwowxtK+x1as1fnO1AD6wHXBIC+UFcpT
	gXJTthY87hqJE1+Dtnbiqox6GF2HUkdSTU0aQL9i9pXqFCqokQ260B2jT5akT17rpd2Hm3kbg51Ow
	47NqT8n1IPnOraCofcp5EpaO6hzjIc/doqySDdPcCGQ0PzQjtkS10blx7Ug6+AvqmSZbMpup+UAtu
	bhJcnp8PhTNKSvfzv36g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtLNM-0000000BI5t-2nCk;
	Mon, 10 Aug 2026 08:28:52 +0000
Received: from gw2.atmark-techno.com ([35.74.137.57])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtLNK-0000000BI4S-0gGW
	for linux-mtd@lists.infradead.org;
	Mon, 10 Aug 2026 08:28:52 +0000
Authentication-Results: gw2.atmark-techno.com;
	dkim=pass (2048-bit key; unprotected) header.d=atmark-techno.com header.i=@atmark-techno.com header.a=rsa-sha256 header.s=google header.b=VbHuYuw0;
	dkim-atps=neutral
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by gw2.atmark-techno.com (Postfix) with ESMTPS id 80592670
	for <linux-mtd@lists.infradead.org>; Mon, 10 Aug 2026 17:28:46 +0900 (JST)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cec4226c70so34607665ad.1
        for <linux-mtd@lists.infradead.org>; Mon, 10 Aug 2026 01:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atmark-techno.com; s=google; t=1786350525; x=1786955325; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=u4MUSaLyqTf+3fB7iyjh29jIrOONjD5n3IKyvNblWb8=;
        b=VbHuYuw0qqwnfj/lKxQUbOWRW2W2Z4xR0oO+WV8AGFry+e58lY66iDbEOrT4Ic7Oud
         Myf1E+gV2C4HUWsl38pyyGq+/vrNSfky76ykTx1ipONP77mNGUH+AueCzZdWIhJ9cn/d
         /V+UXsRzyhnzJfwayhvmCWxndlW40JvTMH6Or00FmHau8qzyNbxmAfeJYkzv01zLWB1a
         3H1DFN+YiIxlCU30RLQxpscKiWQMyFkWDHc7fUahrihFGVCRX+4tQBXkRE3fziGSDuIg
         fsNyTlzC9sxsdOE8HHY7xlNuoB7crhVBUDiDzkVMnTkEXaFmlRn34DV45f/Fh91nNyb7
         9Vsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786350525; x=1786955325;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=u4MUSaLyqTf+3fB7iyjh29jIrOONjD5n3IKyvNblWb8=;
        b=Lp14CIvr2eslU74SybFNSqvtS7yzn0uZpUVaxYxN3t0EvdPhxZx3QzuLYVGnyuE3Fw
         EWKB6z8ylO0bht47iCCh16gPKBrjufmjaONwDvfBGV6oUSor9iMCFoHqg446j3kBTC65
         LbJQR1UWbFvzFfYZVS3ad3GXMue6JTQMOSYOVyuMyWCjereHzqoFxhT+7QXalWThSXHS
         EIfC40H/mgZcAP3SdT2fojSFAuLmOOYwauWI2TmW6ICyR6xFplSbytFu9GsWUxbwyUpm
         Y90Y0uNcIDF32OTKrVX0GPcel/YsJpItjv6REK7ORFLfVO7UZYtysz41ek38tGPRUqRQ
         oBkg==
X-Forwarded-Encrypted: i=1; AHgh+Rr+i9bnoV3BLp31fpfAPyLOK9NWtA0wacVW/rIrcVp6nNbXrQzveoGzlXaXYC+gPiIAB8Eel4uX+3s=@lists.infradead.org
X-Gm-Message-State: AOJu0YxgTGz5kMbsXLY3bjUu9SyIFEX0SZ6znkYuiibyLpyyq8s1Plr4
	zdf0UtTuksE+TbhlzeJ9pGbtSeZZd9HnT1iWStdc3Vw+jwdku0me/JrLEh+DIwomhBMq61V0CZg
	NiE9ZHVMkClwoY5dRo9aQRn9gAW/zWXByzxxGfF2hII1jbGfwbeEvPfQCrpxe7AvIe3/V
X-Gm-Gg: AR+sD118so4Trj68l3V43AR3gf53TFG5vLnwgL6O9BRLZOtfxpXTgCzErPOUSOYOE6n
	yghAQryfORtoPuxfzyFY+GnxIq/erDMb5SfdbOv4Y1Vy97YKLyQofROEewY2oQgXwjz10Hxk5i7
	FpKkgNe8XsljUwfUo8c0LPxkRLJ4IaQkdCKxgb7h6iyYL+KIajhQQdftD2LdyqjJQS8RXxJGSLr
	YBEOVAFitYVKki0MNW29oiJTv7IGfnCbHy1w5dRHxE02RswW113bAW5ZcxIpPCAsmWsL/AmdtXk
	rf+PxetDmd3P6W55R6DXgnamgqxQTdVCjYjnxc2BzURC9Az4IfcDRaJSCIwZTNQnE63xuyGUQYf
	qQ37OwlchdVDm4jDCpQcsogGJBX40Asg+jB6i/lo/hvqlEIDk
X-Received: by 2002:a17:903:1746:b0:2cf:afe8:b722 with SMTP id d9443c01a7336-2d0ca761e0amr465420015ad.11.1786350525119;
        Mon, 10 Aug 2026 01:28:45 -0700 (PDT)
X-Received: by 2002:a17:903:1746:b0:2cf:afe8:b722 with SMTP id d9443c01a7336-2d0ca761e0amr465419535ad.11.1786350524696;
        Mon, 10 Aug 2026 01:28:44 -0700 (PDT)
Received: from localhost (sodcd-04p2-40.ppp11.odn.ad.jp. [203.139.65.40])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2d14dbeaad6sm31374505ad.51.2026.08.10.01.28.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 01:28:44 -0700 (PDT)
Date: Mon, 10 Aug 2026 17:28:32 +0900
From: Dominique MARTINET <dominique.martinet@atmark-techno.com>
To: Md Sadre Alam <md.alam@oss.qualcomm.com>
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	tudor.ambarus@linaro.org, s-k6@ti.com,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	varadarajan.narayanan@oss.qualcomm.com
Subject: Re: [PATCH 1/2] mtd: spinand: winbond: add support for W25N04LW
Message-ID: <anmLsPcXRk0VAQSW@atmark-techno.com>
References: <20260807064339.1632249-1-md.alam@oss.qualcomm.com>
 <20260807064339.1632249-2-md.alam@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260807064339.1632249-2-md.alam@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_012850_479775_C545C1A2 
X-CRM114-Status: GOOD (  20.53  )
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

TWQgU2FkcmUgQWxhbSB3cm90ZSBvbiBGcmksIEF1ZyAwNywgMjAyNiBhdCAxMjoxMzozOFBNICsw
NTMwOgo+IEFkZCBzdXBwb3J0IGZvciBXaW5ib25kIFcyNU4wNExXIDRHYml0IFNQSS1OQU5ELgo+
IEl0IGhhcyA4LWJpdCBvbi1kaWUgRUNDIGFuZCBhIDQwOTYrMjU2IGJ5dGUgcGFnZQo+ICg0MDk2
IGJ5dGUgbWFpbiBhcmVhLCAxMjggYnl0ZSB1c2FibGUgT09CIG9uY2UKPiBvbi1jaGlwIEVDQyBo
aWRlcyB0aGUgMTI4IGJ5dGUgcGFyaXR5IGFyZWEpLAo+IG9yZ2FuaXplZCBhcyAyMDQ4IGJsb2Nr
cyBvZiA2NCBwYWdlcyBlYWNoLCB1bmxpa2UKPiB0aGUgZXhpc3RpbmcgMjA0OCBieXRlIHBhZ2Ug
VzI1TjA0S1YvVzI1TjA0S1cgcGFydHMuCgpUaGlzIGlzIHByZXR0eSBnb29kIHRpbWluZywgSSB3
YXMganVzdCBsb29raW5nIGF0IHNlbmRpbmcgYSBwYXRjaCBmb3IKVzI1TjA0TFcgbXlzZWxmIQoK
SSBhZ3JlZSB3aXRoIE1pcXXDqGwgdGhhdCB5b3VyIHBhdGNoIGxvb2tzIG9kZCwgeW91IHdyb3Rl
Cj4gKwkJICAgICBOQU5EX01FTU9SRygxLCA0MDk2LCAxMjgsIDY0LCAyMDQ4LCA0MCwgMSwgMSwg
MSksCmJ1dCB0aGUgZXJhc2UgYmxvY2tzIGFyZSAyNTZLIGxvbmcgc28gaXQgc2hvdWxkIGJlCisJ
CSAgICAgTkFORF9NRU1PUkcoMSwgNDA5NiwgMjU2LCA2NCwgMjA0OCwgNDAsIDEsIDEsIDEpLAoK
ZGlkIHlvdSBhY3R1YWxseSB0ZXN0IHRoaXMgZGV2aWNlPwoKSWYgaXQgaGVscHMsIHRoZSBkYXRh
c2hlZXQgZm9yIFcyNU4wNExXWkV4eCAvIFcyNU4wNExXVEJ4eCBpcyBmcmVlbHkKYXZhaWxhYmxl
IGZyb20gZGlnaWtleSBoZXJlWzFdClsxXSBodHRwczovL21tLmRpZ2lrZXkuY29tL1ZvbHVtZTAv
b3Bhc2RhdGEvZDIyMDAwMS9tZWRpYXMvZG9jdXMvNzE4Mi9XMjVOMDRMV1pFeHhfVzI1TjA0TFdU
Qnh4X1JldkRfMjAyNS0wOC0wNS5wZGYKCihBbmQgaXQgYWxzbyBzdXBwb3J0cyBjb250aW51b3Vz
IHJlYWQsIHNvIEknbSBjdXJpb3VzIHRvIHNlZSBpZiBpdCdkCndvcmsgd2l0aCB0aGUgcmVjZW50
IGNvbnRpbm91cyByZWFkIHN1cHBvcnQgZnJvbSBNaXF1w6hsWzJdIG1lcmdlZCBpbgo3LjIuLi4g
SSdtIG5vdCBmYW1pbGlhciB3aXRoIHRoZSBzdWJzeXN0ZW0gc28gd2lsbCBuZWVkIGEgYml0IG9m
IHRpbWUgdG8KcGx1ZyBhbGwgdGhlIGhvb2tzIGluIHByb3Blcmx5KQpbMl0gaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvbGludXgtbXRkLzIwMjYwNDI5LXdpbmJvbmQtdjYtMTgtcmMxLWNvbnQtcmVh
ZC12My0wLTBmMzhiM2MyMjlhZEBib290bGluLmNvbS8KCgpGV0lXLCBJJ3ZlIGNvbmZpcm1lZCBp
dCB3b3JrcyB3aXRoIHRoZSBmb2xsb3dpbmcgZGlmZiAoYXQgbGVhc3QgdXAgdG8KdGhlIHBvaW50
IG9mIGNyZWF0aW5nIGFuIHViaSB2b2x1bWUgYW5kIGJvb3RpbmcgZnJvbSBpdCk7IGhhcHB5IHRv
IHNlbmQKdGhpcyBhcyBhIHBhdGNoIGlmIHRoaXMgaGFzIGluZGVlZCBub3QgYmVlbiB0ZXN0ZWQK
LS0tLS0tLS0tLS0tCmRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3NwaS93aW5ib25kLmMg
Yi9kcml2ZXJzL210ZC9uYW5kL3NwaS93aW5ib25kLmMKaW5kZXggOWI3OGMxZTZjYmM5Li40M2E0
ODg2ZGM0YTUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbXRkL25hbmQvc3BpL3dpbmJvbmQuYworKysg
Yi9kcml2ZXJzL210ZC9uYW5kL3NwaS93aW5ib25kLmMKQEAgLTMzNSw2ICszMzUsMzAgQEAgc3Rh
dGljIGludCB3MjVuMDJrdl9vb2JsYXlvdXRfZnJlZShzdHJ1Y3QgbXRkX2luZm8gKm10ZCwgaW50
IHNlY3Rpb24sCiAJcmV0dXJuIDA7CiB9CiAKK3N0YXRpYyBpbnQgdzI1bjA0bHdfb29ibGF5b3V0
X2VjYyhzdHJ1Y3QgbXRkX2luZm8gKm10ZCwgaW50IHNlY3Rpb24sCisJCQkJICBzdHJ1Y3QgbXRk
X29vYl9yZWdpb24gKnJlZ2lvbikKK3sKKwlpZiAoc2VjdGlvbiA+IDcpCisJCXJldHVybiAtRVJB
TkdFOworCisJcmVnaW9uLT5vZmZzZXQgPSAxMjggKyAoMTYgKiBzZWN0aW9uKTsKKwlyZWdpb24t
Pmxlbmd0aCA9IDEzOworCisJcmV0dXJuIDA7Cit9CisKK3N0YXRpYyBpbnQgdzI1bjA0bHdfb29i
bGF5b3V0X2ZyZWUoc3RydWN0IG10ZF9pbmZvICptdGQsIGludCBzZWN0aW9uLAorCQkJCSAgIHN0
cnVjdCBtdGRfb29iX3JlZ2lvbiAqcmVnaW9uKQoreworCWlmIChzZWN0aW9uID4gNykKKwkJcmV0
dXJuIC1FUkFOR0U7CisKKwlyZWdpb24tPm9mZnNldCA9ICgxNiAqIHNlY3Rpb24pICsgMjsKKwly
ZWdpb24tPmxlbmd0aCA9IDE0OworCisJcmV0dXJuIDA7Cit9CisKIHN0YXRpYyBjb25zdCBzdHJ1
Y3QgbXRkX29vYmxheW91dF9vcHMgdzI1bjAxa3Zfb29ibGF5b3V0ID0gewogCS5lY2MgPSB3MjVu
MDFrdl9vb2JsYXlvdXRfZWNjLAogCS5mcmVlID0gdzI1bjAya3Zfb29ibGF5b3V0X2ZyZWUsCkBA
IC0zNDUsNiArMzY5LDExIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbXRkX29vYmxheW91dF9vcHMg
dzI1bjAya3Zfb29ibGF5b3V0ID0gewogCS5mcmVlID0gdzI1bjAya3Zfb29ibGF5b3V0X2ZyZWUs
CiB9OwogCitzdGF0aWMgY29uc3Qgc3RydWN0IG10ZF9vb2JsYXlvdXRfb3BzIHcyNW4wNGx3X29v
YmxheW91dCA9IHsKKwkuZWNjID0gdzI1bjA0bHdfb29ibGF5b3V0X2VjYywKKwkuZnJlZSA9IHcy
NW4wNGx3X29vYmxheW91dF9mcmVlLAorfTsKKwogc3RhdGljIGludCB3MjVuMDFqd19vb2JsYXlv
dXRfZWNjKHN0cnVjdCBtdGRfaW5mbyAqbXRkLCBpbnQgc2VjdGlvbiwKIAkJCQkgIHN0cnVjdCBt
dGRfb29iX3JlZ2lvbiAqcmVnaW9uKQogewpAQCAtNzY4LDYgKzc5NywxNSBAQCBzdGF0aWMgY29u
c3Qgc3RydWN0IHNwaW5hbmRfaW5mbyB3aW5ib25kX3NwaW5hbmRfdGFibGVbXSA9IHsKIAkJCQkJ
ICAgICAgJnVwZGF0ZV9jYWNoZV92YXJpYW50cyksCiAJCSAgICAgMCwKIAkJICAgICBTUElOQU5E
X0VDQ0lORk8oJncyNW4wMmt2X29vYmxheW91dCwgdzI1bjAya3ZfZWNjX2dldF9zdGF0dXMpKSwK
KwlTUElOQU5EX0lORk8oIlcyNU4wNExXIiwgLyogMS44ViAqLworCQkgICAgIFNQSU5BTkRfSUQo
U1BJTkFORF9SRUFESURfTUVUSE9EX09QQ09ERV9EVU1NWSwgMHhiMiwgMHgyMyksCisJCSAgICAg
TkFORF9NRU1PUkcoMSwgNDA5NiwgMjU2LCA2NCwgMjA0OCwgNDAsIDEsIDEsIDEpLAorCQkgICAg
IE5BTkRfRUNDUkVRKDgsIDUxMiksCisJCSAgICAgU1BJTkFORF9JTkZPX09QX1ZBUklBTlRTKCZy
ZWFkX2NhY2hlX3ZhcmlhbnRzLAorCQkJCQkgICAgICAmd3JpdGVfY2FjaGVfdmFyaWFudHMsCisJ
CQkJCSAgICAgICZ1cGRhdGVfY2FjaGVfdmFyaWFudHMpLAorCQkgICAgIDAsCisJCSAgICAgU1BJ
TkFORF9FQ0NJTkZPKCZ3MjVuMDRsd19vb2JsYXlvdXQsIHcyNW4wMmt2X2VjY19nZXRfc3RhdHVz
KSksCiAJU1BJTkFORF9JTkZPKCJXMzVOMDRKVyIsIC8qIDEuOFYgKi8KIAkJICAgICBTUElOQU5E
X0lEKFNQSU5BTkRfUkVBRElEX01FVEhPRF9PUENPREVfRFVNTVksIDB4ZGYsIDB4MjMpLAogCQkg
ICAgIE5BTkRfTUVNT1JHKDEsIDQwOTYsIDEyOCwgNjQsIDUxMiwgMTAsIDEsIDQsIDEpLAotLS0t
LS0tLS0tLS0tLS0tLQoKVGhhbmtzLAotLSAKRG9taW5pcXVlIE1hcnRpbmV0IHwgQXNtYWRldXMK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
