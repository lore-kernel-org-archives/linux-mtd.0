Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03AC1E93709
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Oct 2023 12:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VqkrS9LesWOykP0CT9j9WMJvAASOVxZE9fCaT3mI1II=; b=xd8SssM5tvqp7c
	jPgH8BZ2uwZQfcF4XgClZZM3VsvV++GAPNnUM1XsB2JNgMS3o9lo1RVoor0cfqr8BBMaLmGExY0zD
	o3BCEYVvWZ5hUh3JZmZh/WDN3TAq6qV4pZGZm0rmwCJk4ytybYYyAM09PUbt5q6WcqHoY07RsiPHt
	YuIvAoEhc+f4kOGkXsn7F8ARShjxsuXILTCKe3UDtTtiDxMDjsPMzrDudmrazUHvzGcotoJbgCs0z
	g1Tc2fEuBZ/7XF8nbe6dIczJz5N36ATIXeMiOdP7Z34cIfcLpbwsYUaN5PUgAfJ7w1ezlwRymiyns
	8Pm3PVNPqcp+5U0ZXIvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qoNEz-002flV-0a;
	Thu, 05 Oct 2023 12:14:05 +0000
Received: from mail.kernel-space.org ([195.201.34.187])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qoNEv-002fet-0F
	for linux-mtd@lists.infradead.org;
	Thu, 05 Oct 2023 12:14:02 +0000
Received: from kernel-space.org (localhost [127.0.0.1])
	by kernel-space.org (OpenSMTPD) with ESMTP id 31bd6c93;
	Thu, 5 Oct 2023 12:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=kernel-space.org; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=s1; bh=Ip
	2sl+TW6QDV2sktbR2m+S539Uo=; b=EzAirOubGIrMTC5iOAVSLGGq95vNHfMBQa
	iuxzCjzRBS3ewjcnUomoB6dbw46q2u8hX2CfgmFSVgGsqUvjvPPSaIY+0tLkIxUa
	bgDGKnFOsHe46cnS95RlTQF9/8cAaUZm7+aWG+70icDD77ELEEvRmCsYovv17tQF
	/mEwfaQo0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=kernel-space.org; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; q=dns; s=s1; b=
	AuXfRb+aroKwBDBhxbtwpfpK9gfi5iw7JnDr1B3djd0nLjXwfBRD57wB8cyUpmaB
	sVCIQ165wQeMjqxe1tCTIgjfTiJR8DDgDjmS+jFVSGX0sJJTXCCm+Cco4D4KjwXs
	kM7STW2LNDsZw0LeJgmtJSqZG45l5qA16gLGUcbSD9M=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel-space.org;
	s=s1; t=1696508036;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w0RNZthu49DKR/z6bq7QMiSCk5+esU3pUq73juaPRT4=;
	b=BbF15pYxnmQwDWFY9+4LRnlIJITSqGzGMbsJtRE0YU29aeJ45cQGfhClMNeEtiU/zq3IKK
	qbDWHaP4mZ2lUGmMwwZdS46n/+o+BbYsesVPMSut94h5sk97I9hNvGMywqVylRCK5qvgcy
	XFBmj97gGAiTBDwR+IM+y65mcLtKfQY=
Received: from [192.168.0.2] (host-80-116-143-4.retail.telecomitalia.it [80.116.143.4])
	by kernel-space.org (OpenSMTPD) with ESMTPSA id 9ce76fcb (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Thu, 5 Oct 2023 12:13:56 +0000 (UTC)
Message-ID: <3608d2fa-5097-bd94-5dac-9fea9d45654a@kernel-space.org>
Date: Thu, 5 Oct 2023 14:13:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Betterbird/102.11.0
Subject: Re: EM016LXQAB313CS1T
To: Michael Walle <michael@walle.cc>
Cc: linux-mtd@lists.infradead.org, pratyush@kernel.org,
 tudor.ambarus@linaro.org
References: <6e5e4221-9abf-e572-304d-1150ebd15ab9@kernel-space.org>
 <fbff7dde1b2d6c85650fe16560ce38a7@walle.cc>
Content-Language: en-US
From: Angelo Dureghello <angelo@kernel-space.org>
In-Reply-To: <fbff7dde1b2d6c85650fe16560ce38a7@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231005_051401_429146_630E90C5 
X-CRM114-Status: GOOD (  19.18  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWljaGFlbCwKCk9uIDA1LzEwLzIzIDEwOjMyIEFNLCBNaWNoYWVsIFdhbGxlIHdyb3RlOgo+
IEhpLAo+IAo+PiBhcyBmYXIgYXMgeW91IGtub3csCj4+IGlzIHRoZXJlIHNvbWUgZGV2ZWxvcG1l
bnQgb25nb2luZyBmb3IgdGhlIEVNMDE2TFhRQUIzMTNDUzFUCj4+IG1yYW0gPwo+IAo+IE5vLCBp
biBmYWN0LCB3ZSdkIGxpa2UgdG8gZ2V0IHJpZCBvZiB0aGVzZSBNUkFNIGRldmljZXMgYXMgdGhl
eSBkb24ndAo+IGhhdmUgYW55dGhpbmcgdG8gZG8gd2l0aCBOT1IgZmxhc2hlcyAtIG9yIG1vdmUg
dGhlbSBvdmVyIHRvIHRoZSBhdDI1Cj4gZHJpdmVyLgo+IAo+IE5vdyBJIHNlZSB0aGF0IHRoaXMg
cGFydCBpcyByYXRoZXIgbmV3LCBzdXBwb3J0cyBmYXN0ZXIgbW9kZXMgYW5kCj4gZXZlbiBEVFIs
IGVtdWxhdGVzIGVyYXNlIG9wIGNvZGVzLCBldGMuIEJ1dCB0aGV5IGFyZSBsYWNraW5nIFNGRFAg
c3VwcG9ydC4uCj4gCj4gWW91IG1pZ2h0IGdldCBhd2F5IHdpdGggYWRkaW5nIGFuIGVudHJ5IHRv
IHRoZSBkYXRhYmFzZSB3aXRoIGl0J3MgSUQuCj4gQnV0IHBsZWFzZSAqZG9uJ3QqIHVzZSB0aGUg
U1BJX05PUl9OT19FUkFTRS4KPiAKPiBJJ20gY3VyaW91cywgZG8geW91IGhhdmUgYSBib2FyZCB3
aXRoIHRoYXQgY2hpcD8gSWYgc28sIHdoeSBkb24ndCB5b3UKPiB1c2UgYSBjaGVhcGVyIE5PUiBm
bGFzaD8gR2VudWluZSBxdWVzdGlvbi4KPiAKCnRoYW5rcyBhIGxvdCBmb3IgdGhlIGNsYXJpZmlj
YXRpb25zLCBpIGFtIHdvcmtpbmcgb24gYSBjdXN0b20KaGFyZHdhcmUgdGhhdCBzaG91bGQgbW91
bnQgdGhpcyBjaGlwLCBub3Qgc3VyZSBpdCBjYW4gYmUKY2hhbmdlZCBhdCB0aGlzIHBoYXNlLgoK
U3VwcG9zaW5nIGkgY2FuIGhhdmUgaXQgd29ya2luZyBieSB0aGUgc3BpLW5vciBkcml2ZXIsCmlz
IGl0IHBvc3NpYmxlIHRvIHNlZSB0aGUgZGV2aWNlIGFzIG1lbW9yeSBtYXBwZWQgdG8gYmUKYWNj
ZXNzZWQgZnJvbSB1c2Vyc3BhY2UgPwoKPj4gT24gbWFpbmxpbmUgaSBvbmx5IHNlZQo+Pgo+PiDC
oMKgwqDCoMKgwqDCoCAvKiBFdmVyc3BpbiBNUkFNcyAobm9uLUpFREVDKSAqLwo+PiDCoMKgwqDC
oMKgwqDCoCB7ICJtcjI1aDEyOCIgfSwgLyogMTI4IEtpYiwgNDAgTUh6ICovCj4+IMKgwqDCoMKg
wqDCoMKgIHsgIm1yMjVoMjU2IiB9LCAvKiAyNTYgS2liLCA0MCBNSHogKi8KPj4gwqDCoMKgwqDC
oMKgwqAgeyAibXIyNWgxMCIgfSzCoCAvKsKgwqAgMSBNaWIsIDQwIE1IeiAqLwo+PiDCoMKgwqDC
oMKgwqDCoCB7ICJtcjI1aDQwIiB9LAo+IAo+IEJ0dywgaGF2ZSBhIGxvb2sgYXQgdGhlIG5ldyBs
aW51eC1uZXh0LiB0aGF0IGZvcm1hdCBoYXMgY2hhbmdlZC4KPiAKClN1cmUgdGhhbmtzLAoKPiAK
PiAtbWljaGFlbAoKClJlZ2FyZHMsCi0tIApBbmdlbG8gRHVyZWdoZWxsbwp3OiB3d3cua2VybmVs
LXNwYWNlLm9yZwplOiBhbmdlbG9Aa2VybmVsLXNwYWNlLm9yZwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
