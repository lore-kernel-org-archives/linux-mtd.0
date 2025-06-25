Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F15D2C7EE39
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Jun 2025 21:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8gVChzA1OQCY2X32sFEOrFkJ/mWBUQ0skAYj8TE3ssA=; b=gJjo5TdSifXQc1
	2d/PyneNC+E96xVsFThf51Y6TcC5NS6kyQTV3Jp1nTZuh9xuEm2TINEARii9usCLxp/AKwaGY/6ue
	HQ+uZnd3JPmkb6eIaoxnH2BKO+i/rF83wURI509Nu1mb8UEQPnnBH1KMc1nDiAXAtbCzvuVx8xE9T
	LY5jf+CVEZVvAzoWa2MqX1PHe07PXpmTz8e6YGEMIRyrYxujb4ZFvv8jGPL9eN8DKAetc5CxaIL2H
	tmqIQyfvMDXb0syTTaPJ/YakP3myznydlSHkCpQrsPoBrVUV3FLnOZCphV+yTcJ8DQsM/ydM8/Pyu
	hlOzJ4kHNFkjf0iKz0DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUXpW-00000009ygF-1u7V;
	Wed, 25 Jun 2025 21:38:54 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUVco-00000009jN8-0ZrM
	for linux-mtd@lists.infradead.org;
	Wed, 25 Jun 2025 19:17:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2EC7C60010;
	Wed, 25 Jun 2025 19:17:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9715BC4CEEA;
	Wed, 25 Jun 2025 19:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750879056;
	bh=e6mdajjaaY5koL3e5Crmq60SgZT4vYU/Wk5mcE5cq1s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Zj7hSevzFjb9nv0J7kpQsGJy2uqoqv/HX/Syg50/I+VKdIlWz5Ct06R68BfydP4ak
	 OWofz6fZdZ8o7zke1xi9L5JvMnkTnsC3vwwqSBEfYLWUou+uyuewdc5mMWeu6svGz3
	 aPPPpk9Vk1YTFlDIfry6lPaJoEa2oA7lMLFXRvq3CNoK1o6DEC/PoVOeU2/8Ucha9F
	 ZTIrHr0nU/srtYm5KMh+ysaprYtF48Rf6HpnyQ3kYKeGGFldsA1l3p2OuUU1qcYalT
	 +8pfDNBZGj2cUuvB7BLrG1tPmX5idHxcgBGuqvy2SVh9zltJRM+3Y0M8tGAgF0uasH
	 4GSjy+3D9tS6g==
Date: Wed, 25 Jun 2025 12:17:01 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Maxime MERE <maxime.mere@foss.st.com>
Cc: Simon Richter <Simon.Richter@hogyros.de>, linux-fscrypt@vger.kernel.org,
	linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-ext4@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, ceph-devel@vger.kernel.org
Subject: Re: [PATCH] fscrypt: don't use hardware offload Crypto API drivers
Message-ID: <20250625191701.GC1703@sol>
References: <20250611205859.80819-1-ebiggers@kernel.org>
 <7f63be76-289b-4a99-b802-afd72e0512b8@hogyros.de>
 <20250612005914.GA546455@google.com>
 <20250612062521.GA1838@sol>
 <20250625063252.GD8962@sol>
 <f174540e-4b9a-4dc1-9ab8-f4f36fe1f837@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f174540e-4b9a-4dc1-9ab8-f4f36fe1f837@foss.st.com>
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

T24gV2VkLCBKdW4gMjUsIDIwMjUgYXQgMDY6Mjk6MjZQTSArMDIwMCwgTWF4aW1lIE1FUkUgd3Jv
dGU6Cj4gSGksCj4gCj4gT24gNi8yNS8yNSAwODozMiwgRXJpYyBCaWdnZXJzIHdyb3RlOgo+ID4g
VGhhdCB3YXMgdGhlIHN5bmNocm9ub3VzIHRocm91Z2hwdXQuICBIb3dldmVyLCBzdWJtaXR0aW5n
IG11bHRpcGxlIHJlcXVlc3RzCj4gPiBhc3luY2hyb25vdXNseSAod2hpY2ggYWdhaW4sIGZzY3J5
cHQgZG9lc24ndCBhY3R1YWxseSBkbykgYmFyZWx5IGhlbHBzLgo+ID4gQXBwYXJlbnRseSB0aGUg
U1RNMzIgY3J5cHRvIGVuZ2luZSBoYXMgb25seSBvbmUgaGFyZHdhcmUgcXVldWUuCj4gPiAKPiA+
IEkgYWxyZWFkeSBzdHJvbmdseSBzdXNwZWN0ZWQgdGhhdCB0aGVzZSBub24taW5saW5lIGNyeXB0
byBlbmdpbmVzIGFyZW4ndCB3b3J0aAo+ID4gdXNpbmcuICBCdXQgSSBkaWRuJ3QgcmVhbGl6ZSB0
aGV5IGFyZSBxdWl0ZSB0aGlzIGJhZC4gIEV2ZW4gd2l0aCBBRVMgb24gYQo+ID4gQ29ydGV4LUE3
IENQVSB0aGF0IGxhY2tzIEFFUyBpbnN0cnVjdGlvbnMsIHRoZSBDUFUgaXMgbXVjaCBmYXN0ZXIh
Cj4gCj4gRnJvbSBhIHBlcmZvcm1hbmNlIHBlcnNwZWN0aXZlLCB1c2luZyBoYXJkd2FyZSBjcnlw
dG8gb2ZmbG9hZHMgdGhlIENQVSwKPiB3aGljaCBpcyBpbXBvcnRhbnQgaW4gcmVhbC13b3JsZCBh
cHBsaWNhdGlvbnMgd2hlcmUgdGhlIENQVSBtdXN0IGhhbmRsZQo+IG11bHRpcGxlIHRhc2tzLiBP
dXIgcHJvY2Vzc29ycyBhcmUgb2Z0ZW4gc2luZ2xlLWNvcmUgYW5kIG5vdCB0aGUgaGlnaGVzdAo+
IHBlcmZvcm1pbmcsIHNvIGhhcmR3YXJlIGFjY2VsZXJhdGlvbiBpcyB2YWx1YWJsZS4KPiAKPiBJ
IGNhbiBzaG93IHlvdSBwZXJmb3JtYW5jZSB0ZXN0IHJlYWxpemVkIHdpdGggb3BlblNTTCAoMy4y
LjQpIHdobyBzaG93cywKPiBsZXNzIENQVSB1c2FnZSBhbmQgYmV0dGVyIHBlcmZvcm1hbmNlIGZv
ciBsYXJnZSBibG9jayBvZiBkYXRhIHdoZW4gb3VyCj4gZHJpdmVyIGlzIHVzZWQgKHZpYSBhZmFs
Zyk6Cj4gCj4gY29tbWFuZCB1c2VkOiBgYGBvcGVuc3NsIHNwZWVkIC1ldnAgYWVzLTI1Ni1jYmMg
LWVuZ2luZSBhZmFsZyAtZWxhcHNlZGBgYAo+IAo+ICstLS0tLS0tLS0tLS0tLS0tLS0tLSstLS0t
LS0tLS0tLS0tLSstLS0tLS0tLS0tLS0tLS0tLSsKPiB8IEJsb2NrIFNpemUgKGJ5dGVzKSB8IEFG
QUxHIChNQi9zKSB8IFNXIEJBU0VEIChNQi9zKSB8Cj4gKy0tLS0tLS0tLS0tLS0tLS0tLS0tKy0t
LS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLS0tLS0tKwo+IHwgMTYgICAgICAgICAgICAgICAgIHwg
MC4wOSAgICAgICAgIHwgOS40NCAgICAgICAgICAgIHwKPiB8IDY0ICAgICAgICAgICAgICAgICB8
IDAuMzQgICAgICAgICB8IDExLjQzICAgICAgICAgICB8Cj4gfCAyNTYgICAgICAgICAgICAgICAg
fCAxLjMxICAgICAgICAgfCAxMi4wOCAgICAgICAgICAgfAo+IHwgMTAyNCAgICAgICAgICAgICAg
IHwgNC45NiAgICAgICAgIHwgMTIuMjcgICAgICAgICAgIHwKPiB8IDgxOTIgICAgICAgICAgICAg
ICB8IDE4LjE4ICAgICAgICB8IDEyLjMzICAgICAgICAgICB8Cj4gfCAxNjM4NCAgICAgICAgICAg
ICAgfCAyMi40OCAgICAgICAgfCAxMi4zMyAgICAgICAgICAgfAo+ICstLS0tLS0tLS0tLS0tLS0t
LS0tLSstLS0tLS0tLS0tLS0tLSstLS0tLS0tLS0tLS0tLS0tLSsKPiAKPiB0byB0ZXN0IENQVSB1
c2FnZSBJJ3ZlIHVzZWQgYSBtb25vY29yZSBzdG0zMm1wMTU3Zi4KPiBoZXJlIHdpdGggYWZhbGcs
IHdlIGhhdmUgYW4gYXZlcmFnZSBDUFUgdXNhZ2Ugb2Ygfjc1JSwgd2l0aCB0aGUgc3cgYmFzZWQK
PiBhcHByb2FjaCBDUFUgaXMgdXNlZCBhdCB+MTAwJQo+IAo+IE1heGltZQoKZnNjcnlwdCBpcyBh
bG1vc3QgYWx3YXlzIHVzZWQgd2l0aCA0MDk2LWJ5dGUgYmxvY2tzLCB3aGljaCBpbiBteSBiZW5j
aG1hcmsgdG9vawphYm91dCAxMzAwIM68cyBlYWNoIHdpdGggQUVTLTEyOC1DQkMtRVNTSVYgdy8g
U1RNMzIgZW5naW5lLCAyNjQgzrxzIGVhY2ggd2l0aApBRVMtMTI4LUNCQy1FU1NJViB3LyBDUFUs
IG9yIDc3IM68cyBlYWNoIHdpdGggQWRpYW50dW0gdy8gQ1BVLiAgVGhlIENQVS1iYXNlZAp0aW1l
cyBzZWVtIHNob3J0IGVub3VnaCB0aGF0IHRoZXJlIGlzbid0IG11Y2ggdGltZSBmb3IgYW5vdGhl
ciB0YXNrIHRvIGJlCnVzZWZ1bGx5IHNjaGVkdWxlZCB3aGlsZSB3YWl0aW5nIGZvciBlYWNoIGJs
b2NrLiAgSXQncyBpbXBvcnRhbnQgdG8gY29uc2lkZXIgKGEpCmRyaXZlciBvdmVyaGVhZCwgKGIp
IHNjaGVkdWxpbmcgb3ZlcmhlYWQsIGFuZCAoYykgdGhlIGxvdyBpbnN0cnVjdGlvbnMgcGVyCnNl
Y29uZCBvZiB0aGlzIHByb2Nlc3NvciBpbiB0aGUgZmlyc3QgcGxhY2UuCgpCeSB0aGUgd2F5LCB0
aGUgYm9hcmQgSSBoYXZlIChTVE0zMk1QMTU3Ri1ESzIpIGlzIGFjdHVhbGx5IG11bHRpLWNvcmUu
ICBJdCBzZWVtcwp0aGlzIGlzIGNvbW1vbiBhbW9uZyBTVCdzIG9mZmVyaW5ncyB0aGF0IGFyZSBp
bnRlbmRlZCB0byBydW4gTGludXg/ICAoT2YgY291cnNlLAp0aGUgbWljcm9jb250cm9sbGVycyB0
aGF0IGRvbid0IHJ1biBMaW51eCBhcmUgYW5vdGhlciBzdG9yeS4pCgotIEVyaWMKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==
