Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E71FB103E178
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Mar 2026 13:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q2cmy6BIo088Vic/XtEKiOogtRPV5TJvkqHCQGf0pDE=; b=GRHGAQ3CSisBIK
	7KxYYVHi5m6pXz4zGrWw2idYK+UhhWyio+rj06ZRgrmREkW/zU9hn3j52xNpceLP812cyG35+nYwU
	FmFz4nldSdPAmq9RC6PvxtLz0E8Xoz07M5KvKynlIQxckZJzIwg9+fV0//PdRNzRv0qhDNoDHQpOP
	GP5M1R9sBIMCOdo1Q+WvPBBtGLssGrZWLycoZKhlvByl/Matobw6u4tT/g4i5S6CZtG77timrmKrP
	N3Y+HcmuaXZv/ZjTOxi7jVb7KneYwSLkayUFtcz4PkC7ltqjR1SLn4gQXDXDdwXoacrpuliOYMng9
	4c6eizxTVNO9NcjP85eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2rD1-00000008VYf-35pS;
	Wed, 18 Mar 2026 13:45:15 +0000
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.53])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2rCy-00000008VYH-3xKv
	for linux-mtd@lists.infradead.org;
	Wed, 18 Mar 2026 13:45:14 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1773841497; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=JM5NMtptFV7kW+rHzGnODRLSleLJ8ehWQ5+QIDQ+88wkwhoHKtE+OjwD0HwpxPjnkC
    3CdwBMjV3vgq2MLcJOfmDATVNHnl9lr7GoMKiVQs3gUJh1LBrwhclH12O2ayopNWYzWB
    +KzwcssxRgz4/sanljo+1AAw6xB94q/jVTstpS9x5gxOmEOuq7EimKY9ULMj0au7O1QK
    mS3InUjcbm7SpjGz/xwreX14O6sQXX9pxMf3PfyLE9lf09eFR89Q+1GJmGunQPNBJu4i
    oi8+fHpz2Lav+tKNsGZ1VP3/63Y4B/tiEvvlFv+NS6cuSZfakBDdqUG03DkZ1KDj5LXo
    nfqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1773841497;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=m6pCCyTLH/R/upQpHKKOxNO9tql4wMirFmnQbXLSPIc=;
    b=MfXe0zweFIKg3fN7en7Q8u6J6I7edRYgokW26q7oZAACBvlPQ+mFCgxtO24IXSe09j
    mAeGorNp5rHfeFDXvVB9b18h1/0AI/nFlZqXNAtG0cSrtcv4PkRyYR0Krrkf/feLP9NN
    306zNGYrxksB1C6VPlt5oVyC57bDf2CVzMx97ADUAY0a/NehFdyOYZxtan4HinLzcjE+
    N6QOkERdFWJ2A+9NKn9GHuXWzWkP/hsj2w1I4gmZD4YoK/cEP2ltZ77Bg7pkgrpiRGJ6
    y+8DynmbjCpyKLgw+qWDW8BbHQOe45w78n2Yjz76f4jg0+BBkam2KCoX25/W9wBUnZJZ
    4BnA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1773841497;
    s=strato-dkim-0002; d=iokpp.de;
    h=References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=m6pCCyTLH/R/upQpHKKOxNO9tql4wMirFmnQbXLSPIc=;
    b=WkWrV69uLWXDFdtKoIDBklGSeBQyfIQKVDGu2fOs+ZK7JeF3iZq0PdwP9VaHeg8/eM
    CFNOBX7ePM886ftCpUG4nAQDoz/xvviscLHHlZ8J/FeimUtT13JWvJRKqIe5QdD4Z5l4
    DYD3ggedahc5V8CHHf05RI3BnRAIRLxaxsl9dPuLcC6+OwY9cxOY0DehU6WT8fUC2kRj
    uexI1tBP+Ynt3+MIVfQmSXPsauxPS+mpRyOMs6ZLDoxthj5WKABTc8PtaC7lNgV/SLKd
    s0pIgb8yjHL3Blb1lQSjatWp6QVVXV/c7srSJyIHZh2A2vtk2SJWBFWtsLpvlIubkkcR
    LVag==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1773841497;
    s=strato-dkim-0003; d=iokpp.de;
    h=References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=m6pCCyTLH/R/upQpHKKOxNO9tql4wMirFmnQbXLSPIc=;
    b=IFpBefrVzHBV9RPq85szZjFosyFJ87rTvMNtL5qQd89whxWOD26PAJQy/ddGNRlIIJ
    jsxO/kk1PIRqX9P8knAg==
X-RZG-AUTH: ":LmkFe0i9dN8c2t4QQyGBB/NDXvjDB6pBSe9tgBDSDt0V0DBslXBtZUxPOub3IZqk"
Received: from [10.176.235.211]
    by smtp.strato.de (RZmta 55.0.1 AUTH)
    with ESMTPSA id z7934522IDiu9PR
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Wed, 18 Mar 2026 14:44:56 +0100 (CET)
Message-ID: <3c94f0e1c5a8bf184d7a81f49b7beb999355dcd3.camel@iokpp.de>
Subject: Re: [PATCH] mtd: spi-nor: micron-st: fix FSR read fallback for
 controllers returning -ENOTSUPP
From: Bean Huo <beanhuo@iokpp.de>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, pratyush@kernel.org, 
	mwalle@kernel.org
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
	zaizhang@cisco.com, Bean Huo <beanhuo@micron.com>
Date: Wed, 18 Mar 2026 14:44:56 +0100
In-Reply-To: <639bd964-b499-4e9f-9035-0010fecfb17c@linaro.org>
References: <20260318131857.2685004-1-beanhuo@iokpp.de>
	 <639bd964-b499-4e9f-9035-0010fecfb17c@linaro.org>
User-Agent: Evolution 3.44.4-0ubuntu2.1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_064513_239438_BB707CEA 
X-CRM114-Status: GOOD (  15.25  )
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

T24gV2VkLCAyMDI2LTAzLTE4IGF0IDE1OjI2ICswMjAwLCBUdWRvciBBbWJhcnVzIHdyb3RlOgo+
IEhpLCBCZWFuIQo+IAo+IE9uIDMvMTgvMjYgMzoxOCBQTSwgQmVhbiBIdW8gd3JvdGU6Cj4gPiBG
cm9tOiBCZWFuIEh1byA8YmVhbmh1b0BtaWNyb24uY29tPgo+ID4gCj4gPiBtaWNyb25fc3Rfbm9y
X3JlYWR5KCkgZmFsbHMgYmFjayB0byBTUi1vbmx5IHBvbGxpbmcgd2hlbiB0aGUgU1BJCj4gPiBj
b250cm9sbGVyIGRvZXMgbm90IHN1cHBvcnQgbG93LWxldmVsIEZTUiByZWFkcywgYnV0IG9ubHkg
Y2hlY2tzIGZvcgo+ID4gLUVPUE5PVFNVUFAgKDk1KS7CoCBTb21lIFNQSSBtYXN0ZXIgZHJpdmVy
cyByZXR1cm4gdGhlIGtlcm5lbC1pbnRlcm5hbAo+ID4gLUVOT1RTVVBQICg1MjQpIGZvciB0aGUg
c2FtZSBjb25kaXRpb24uwqAgVGhlIHR3byBjb2RlcyBjYXJyeSBpZGVudGljYWwKPiAKPiBJc24n
dCBpdCBhIGJldHRlciBmaXggdG8gdXBkYXRlIHRoZSBzcGkgY29udHJvbGxlcnMgdG8gdXNlIEVP
UE5PVFNVUFA/CgoKSGkgWmFpbGlhbmcgWmhhbmcsIAoKQ2FuIHlvdSBmb3J3YXJkIHRoaXMgdG8g
eW91ciBjb2xsZWFndWVzIGFuZCBjaGVjayBpZiB0aGUgU1BJIG1hc3RlciBkcml2ZXIgY2FuCmJl
IGZpeGVkIHRvIHJldHVybiAtRU9QTk9UU1VQUCBpbnN0ZWFkIG9mIC1FTk9UU1VQUD8KCgpIaSBU
dWRvciwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIApUaGFuayB5b3UgZm9yIHRoZSByZXZpZXcuCiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKWW91IGFyZSByaWdodCB0
aGF0IGZpeGluZyB0aGUgc3BpIGNvbnRyb2xsZXIgdG8gcmV0dXJuIC1FT1BOT1RTVVBQIGlzIHRo
ZSBpZGVhbApzb2x1dGlvbiwgYW5kIEkgaGF2ZSByZWFjaGVkIG91dCB0byB0aGUgcmVwb3J0ZXIg
dG8gaW52ZXN0aWdhdGUgb24gdGhlaXIgZW5kLiAgCiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKSG93ZXZlciwgSSB3b3VsZCBzdWdn
ZXN0IGtlZXBpbmcgdGhpcyBmaXggaW4gbWljcm9uLXN0LmMgZm9yIHRoZSBmb2xsb3dpbmcKcmVh
c29uczogICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgCjEsIFRoZSBvZmZlbmRpbmcgU1BJ
IG1hc3RlciBkcml2ZXIgYXBwZWFycyB0byBiZSBvdXQtb2YtdHJlZS9kb3duc3RyZWFtLCBzbyB3
ZQpjYW5ub3QgZ3VhcmFudGVlIGFuIHVwc3RyZWFtIGZpeCB3aWxsIHJlYWNoIGFsbCBhZmZlY3Rl
ZCBwbGF0Zm9ybXMuCjIsIHNwaS1tZW0uYyBhbHJlYWR5IHRyZWF0cyBib3RoIC1FTk9UU1VQUCBh
bmQgLUVPUE5PVFNVUFAgYXMgZXF1aXZhbGVudCBpbgpzcGlfbWVtX2V4ZWNfb3AoKSBzbyB0aGlz
IG9uZS1saW5lciBhbGlnbnMgbWljcm9uX3N0X25vcl9yZWFkeSgpIHdpdGggdGhlCmNvbnZlbnRp
b24gYWxyZWFkeSBlc3RhYmxpc2hlZCBpbiB0aGUgU1BJIG1lbSBmcmFtZXdvcmsuCjMsIHRoZXJl
IG1heSBiZSBvdGhlciBTUEkgY29udHJvbGxlcnMgaW4gdGhlIGZpZWxkIHdpdGggdGhlIHNhbWUg
YmVoYXZpb3IgdGhhdAp3ZSBhcmUgbm90IGF3YXJlIG9mLiBBIGRlZmVuc2l2ZSBmaXggaGVyZSBj
b3N0cyBub3RoaW5nIGFuZCBwcmV2ZW50cyBmdXR1cmUKcmVwb3J0cy4gCgpJIGFtIGhhcHB5IHRv
IGRyb3AgdGhpcyBwYXRjaCBpZiB5b3UgZmVlbCBzdHJvbmdseSB0aGF0IHRoZSBmaXggYmVsb25n
cyBvbmx5IGluCnRoZSBjb250cm9sbGVyIGRyaXZlciBhbmQgdGhlIHJlcG9ydGVyIGNvbmZpcm1z
IHRoZXkgY2FuIGZpeCBpdCBvbiB0aGVpciBzcGkgbm9yCm1hc3RlciBkcml2ZXIuCgpLaW5kIHJl
Z2FyZHMsCkJlYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
