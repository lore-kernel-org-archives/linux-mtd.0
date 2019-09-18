Return-Path: <SRS0=mMzh=XN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 967EEC4CECE
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Sep 2019 13:41:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C8EC208C0
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Sep 2019 13:41:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pmFZCE16";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="t+bdsfKH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C8EC208C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=66cnM8XZDOIlf7r7eh+VvgHRNIxsdcRdq58tjbRdnx8=; b=pmFZCE16fO8ytG8n94XuxciC7
	vB7epY8JBMO9QnOSjx59cNFhCUC9/kTcxGodzmsxjAZuivuRLnauPQeV8/BWJIoWYQpNR4lu1W3Nq
	bOsePET+NVoirkRg5kZxPVb3AMo+gqsrJGXqme4OU6tZXQHftqx3lTiGZ5c95ZVM53ILMa+wtDDfI
	sUq/+ik2UipLbomcgqtrX7vPK0H4o3VthDEhuJg3NJfY/uwV9Ux0SRdCUEheWjRgELxQvHXcX8nlD
	h7fUy9rwHpEtglm9xyjBrPcR9s8HPGdnCKaLdQq6qaBfK6nqA5GRTsw6o2Mzy5yYN+x06njczebn0
	JLRSz+Iow==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iAaCZ-000711-9M; Wed, 18 Sep 2019 13:40:59 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iAaCW-00070Q-7w
 for linux-mtd@lists.infradead.org; Wed, 18 Sep 2019 13:40:57 +0000
Received: by mail-pl1-x641.google.com with SMTP id b10so3217080plr.4
 for <linux-mtd@lists.infradead.org>; Wed, 18 Sep 2019 06:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=z8ZakjTYBijQEJv1jSZoGV/vVQfhEASCOffIQCNpFvE=;
 b=t+bdsfKHX4uOxvMgv0tDumbSdPYPGRPa8mfOVqw7qOrdNXWQ5HLisFXnFu613MAaA5
 qC4ujHbsmegDJqTatVWAHC9NxkU0Zd63inK8SUOKuggRVGYkOae0BJpr1pbb0gAFmLQ6
 ZwsQFoQ0P+DtRKpVvOi0Lk9M215p08+zrLcPMJLum6ddWhICuHA3bRNGtaKVn+OyM4OK
 pKpb7WzIs+w+9lgLRYKAWk4C7AU+CS21CTtk0OTYr2wRNQL0xmiC0d9LdaP9UfQSvAOH
 n0HMWtsKjPu4RJvQNYFmOOTf8Sfe3MBGmKXmzh71+KUR+xOMm8jEs8SKz1BYnZdgx+66
 p2IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=z8ZakjTYBijQEJv1jSZoGV/vVQfhEASCOffIQCNpFvE=;
 b=IorIM7tR2ap4i7plcO53NCXSSo0YyKq5Vd7YUEGPQWOmwo4fDvCpevF+sDM82jzjcV
 hP7/cC6J3Der8xmSOAxBUleegdWT9bBAeTtmPaviPJvKYsMarmsVPSq5LagtmAcN1l7/
 1nTxYectI+h7WL4JzRbjWpnISOAGdSzu3HjfkeG4YumroGqxBLUpcg0Qu7G+hK5IZHbO
 teJwhelChbcfT3doodLoj/lfREbFOXF9PnIDS56ujstPQKJ8AMDAnVYv6C0sMeVg0sow
 RyY17oPSP9xO77sR1Gm+yeo5+14Nsvp4TANGH8xPG/39Y4KE1GS0dDHwJrnBlmLUAAsT
 bFCg==
X-Gm-Message-State: APjAAAVIBY3QjBnUDsKY4uJDHANHXLUdiZsDkmWx24k++NArFpzf8qS6
 PMgL30SQLkmjAKgo5yLFLvcek/pF
X-Google-Smtp-Source: APXvYqydVpCscuuzP1JryZDFKSK8hQSM2jwn2rA5L5IANOeZQRBUStXQ/3SQrjb1srY1qlwvrkVF6g==
X-Received: by 2002:a17:902:b7c2:: with SMTP id
 v2mr3967396plz.319.1568814053830; 
 Wed, 18 Sep 2019 06:40:53 -0700 (PDT)
Received: from ?IPv6:240b:10:2720:5510:a182:288:3ffa:432a?
 ([240b:10:2720:5510:a182:288:3ffa:432a])
 by smtp.gmail.com with ESMTPSA id y15sm6601655pfp.111.2019.09.18.06.40.51
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 18 Sep 2019 06:40:53 -0700 (PDT)
Subject: Re: [PATCH v8 1/9] mtd: cfi_cmdset_0002: Use chip_good() to retry in
 do_write_oneword()
To: Vignesh Raghavendra <vigneshr@ti.com>,
 Tokunori Ikegami <ikegami_to@yahoo.co.jp>, Sasha Levin <sashal@kernel.org>
References: <20190805190326.28772-2-ikegami.t@gmail.com>
 <20190806004303.EBEF82147A@mail.kernel.org>
 <9fd8b17b-abb4-114e-d6fb-252430d98432@gmail.com>
 <a74e201d-4f1c-1bd6-babf-8dac0d515d6d@yahoo.co.jp>
 <6d1d5eff-af08-5f86-367f-ada671a1d9bf@ti.com>
From: Tokunori Ikegami <ikegami.t@gmail.com>
Message-ID: <19da2ddd-eb3e-6f3a-572e-3f6ab74f576b@gmail.com>
Date: Wed, 18 Sep 2019 22:40:49 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <6d1d5eff-af08-5f86-367f-ada671a1d9bf@ti.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190918_064056_319778_F854ED3D 
X-CRM114-Status: GOOD (  14.60  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 linux-mtd@lists.infradead.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGksCgpPbiAyMDE5LzA5LzE4IDE0OjI5LCBWaWduZXNoIFJhZ2hhdmVuZHJhIHdyb3RlOgo+IEhp
LAo+Cj4gT24gMTcvMDkvMTkgMTE6MzQgUE0sIFRva3Vub3JpIElrZWdhbWkgd3JvdGU6Cj4+IEhp
LAo+Pgo+PiBUaGUgcGF0Y2ggaGFzIGJlZW4gbWVyZ2VkIGludG8KPj4gZ2l0Oi8vZ2l0Lmtlcm5l
bC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L210ZC9saW51eC5naXQgbXRkL25leHQgZm9y
Cj4+IHY1LjQtcmMxLgo+PiBTbyBJIGhhdmUganVzdCBzZW50IHBhdGNoZXMgZm9yIHY1LjIueSwg
djQuMTkueSwgdjQuMTQueSwgdjQuOS55IGFuZAo+PiB2LjQuNC55IHNlcGFyYXRlbHkuCj4+Cj4g
Tm9ybWFsIGZsb3cgaXMgdG8gd2FpdCB1bnRpbCBwYXRjaCBnb2VzIGludG8gTGludXMncyB0cmVl
LiBTbyBwbGVhc2UKPiB3YWl0IHVudGlsIHRoZW4uCgpUaGFuayB5b3UgZm9yIHlvdXIgYWR2aWNl
LgpOb3RlZCBpdCBzbyBJIHdpbGwgZG8gdGhhdC4KClJlZ2FyZHMsCklrZWdhbWkKCj4KPiBSZWdh
cmRzCj4gVmlnbmVzaAo+Cj4+IFJlZ2FyZHMsCj4+IElrZWdhbWkKPj4KPj4gT24gMjAxOS8wOC8w
NiAyMzozMCwgVG9rdW5vcmkgSWtlZ2FtaSB3cm90ZToKPj4+IEhpLAo+Pj4KPj4+IFRoYW5rcyBm
b3IgdGhlIG1haWwuCj4+Pgo+Pj4gT24gMjAxOS8wOC8wNiA5OjQzLCBTYXNoYSBMZXZpbiB3cm90
ZToKPj4+PiBIaSwKPj4+Pgo+Pj4+IFtUaGlzIGlzIGFuIGF1dG9tYXRlZCBlbWFpbF0KPj4+Pgo+
Pj4+IFRoaXMgY29tbWl0IGhhcyBiZWVuIHByb2Nlc3NlZCBiZWNhdXNlIGl0IGNvbnRhaW5zIGEg
LXN0YWJsZSB0YWcuCj4+Pj4gVGhlIHN0YWJsZSB0YWcgaW5kaWNhdGVzIHRoYXQgaXQncyByZWxl
dmFudCBmb3IgdGhlIGZvbGxvd2luZyB0cmVlczogYWxsCj4+Pj4KPj4+PiBUaGUgYm90IGhhcyB0
ZXN0ZWQgdGhlIGZvbGxvd2luZyB0cmVlczogdjUuMi42LCB2NC4xOS42NCwgdjQuMTQuMTM2LAo+
Pj4+IHY0LjkuMTg3LCB2NC40LjE4Ny4KPj4+Pgo+Pj4+IHY1LjIuNjogRmFpbGVkIHRvIGFwcGx5
ISBQb3NzaWJsZSBkZXBlbmRlbmNpZXM6Cj4+Pj4gIMKgwqDCoMKgIDQ4NDRlZjgwMzA1ZCAoIm10
ZDogY2ZpX2NtZHNldF8wMDAyOiBBZGQgc3VwcG9ydCBmb3IgcG9sbGluZwo+Pj4+IHN0YXR1cyBy
ZWdpc3RlciIpCj4+Pj4KPj4+PiB2NC4xOS42NDogRmFpbGVkIHRvIGFwcGx5ISBQb3NzaWJsZSBk
ZXBlbmRlbmNpZXM6Cj4+Pj4gIMKgwqDCoMKgIDQ4NDRlZjgwMzA1ZCAoIm10ZDogY2ZpX2NtZHNl
dF8wMDAyOiBBZGQgc3VwcG9ydCBmb3IgcG9sbGluZwo+Pj4+IHN0YXR1cyByZWdpc3RlciIpCj4+
Pj4gIMKgwqDCoMKgIGQ5YjhhNjdiM2I5NSAoIm10ZDogY2ZpOiBmaXggZGVhZGxvb3AgaW4gY2Zp
X2NtZHNldF8wMDAyLmMKPj4+PiBkb193cml0ZV9idWZmZXIiKQo+Pj4+Cj4+Pj4gdjQuMTQuMTM2
OiBGYWlsZWQgdG8gYXBwbHkhIFBvc3NpYmxlIGRlcGVuZGVuY2llczoKPj4+PiAgwqDCoMKgwqAg
NDg0NGVmODAzMDVkICgibXRkOiBjZmlfY21kc2V0XzAwMDI6IEFkZCBzdXBwb3J0IGZvciBwb2xs
aW5nCj4+Pj4gc3RhdHVzIHJlZ2lzdGVyIikKPj4+PiAgwqDCoMKgwqAgYzY0ZDQ0MTlhMTdjICgi
bXRkOiBjZmlfY21kc2V0XzAwMDI6IENoYW5nZSBlcmFzZSBvbmUgYmxvY2sgdG8KPj4+PiBlbmFi
bGUgWElQIG9uY2UiKQo+Pj4+ICDCoMKgwqDCoCBkOWI4YTY3YjNiOTUgKCJtdGQ6IGNmaTogZml4
IGRlYWRsb29wIGluIGNmaV9jbWRzZXRfMDAwMi5jCj4+Pj4gZG9fd3JpdGVfYnVmZmVyIikKPj4+
PiAgwqDCoMKgwqAgZWEwOTJmYjNjZTY2ICgibXRkOiBjZmlfY21kc2V0XzAwMDI6IEZpeCBjb2Rp
bmcgc3R5bGUgaXNzdWVzIikKPj4+Pgo+Pj4+IHY0LjkuMTg3OiBGYWlsZWQgdG8gYXBwbHkhIFBv
c3NpYmxlIGRlcGVuZGVuY2llczoKPj4+PiAgwqDCoMKgwqAgNDg0NGVmODAzMDVkICgibXRkOiBj
ZmlfY21kc2V0XzAwMDI6IEFkZCBzdXBwb3J0IGZvciBwb2xsaW5nCj4+Pj4gc3RhdHVzIHJlZ2lz
dGVyIikKPj4+PiAgwqDCoMKgwqAgYzY0ZDQ0MTlhMTdjICgibXRkOiBjZmlfY21kc2V0XzAwMDI6
IENoYW5nZSBlcmFzZSBvbmUgYmxvY2sgdG8KPj4+PiBlbmFibGUgWElQIG9uY2UiKQo+Pj4+ICDC
oMKgwqDCoCBkOWI4YTY3YjNiOTUgKCJtdGQ6IGNmaTogZml4IGRlYWRsb29wIGluIGNmaV9jbWRz
ZXRfMDAwMi5jCj4+Pj4gZG9fd3JpdGVfYnVmZmVyIikKPj4+PiAgwqDCoMKgwqAgZWEwOTJmYjNj
ZTY2ICgibXRkOiBjZmlfY21kc2V0XzAwMDI6IEZpeCBjb2Rpbmcgc3R5bGUgaXNzdWVzIikKPj4+
Pgo+Pj4+IHY0LjQuMTg3OiBGYWlsZWQgdG8gYXBwbHkhIFBvc3NpYmxlIGRlcGVuZGVuY2llczoK
Pj4+PiAgwqDCoMKgwqAgNDg0NGVmODAzMDVkICgibXRkOiBjZmlfY21kc2V0XzAwMDI6IEFkZCBz
dXBwb3J0IGZvciBwb2xsaW5nCj4+Pj4gc3RhdHVzIHJlZ2lzdGVyIikKPj4+PiAgwqDCoMKgwqAg
YzY0ZDQ0MTlhMTdjICgibXRkOiBjZmlfY21kc2V0XzAwMDI6IENoYW5nZSBlcmFzZSBvbmUgYmxv
Y2sgdG8KPj4+PiBlbmFibGUgWElQIG9uY2UiKQo+Pj4+ICDCoMKgwqDCoCBkOWI4YTY3YjNiOTUg
KCJtdGQ6IGNmaTogZml4IGRlYWRsb29wIGluIGNmaV9jbWRzZXRfMDAwMi5jCj4+Pj4gZG9fd3Jp
dGVfYnVmZmVyIikKPj4+PiAgwqDCoMKgwqAgZWEwOTJmYjNjZTY2ICgibXRkOiBjZmlfY21kc2V0
XzAwMDI6IEZpeCBjb2Rpbmcgc3R5bGUgaXNzdWVzIikKPj4+Pgo+Pj4+Cj4+Pj4gTk9URTogVGhl
IHBhdGNoIHdpbGwgbm90IGJlIHF1ZXVlZCB0byBzdGFibGUgdHJlZXMgdW50aWwgaXQgaXMgdXBz
dHJlYW0uCj4+Pj4KPj4+PiBIb3cgc2hvdWxkIHdlIHByb2NlZWQgd2l0aCB0aGlzIHBhdGNoPwo+
Pj4gWWVzIEkgd2lsbCBkbyBmaXggdGhlIHBhdGNoIGZvciB0aGUgdHJlZXMgZmFpbGVkIHRvIGFw
cGx5IGlmIGl0IHdhcwo+Pj4gdXBzdHJlYW0uCj4+Pgo+Pj4gUmVnYXJkcywKPj4+IElrZWdhbWkK
Pj4+Cj4+Pj4gLS0gCj4+Pj4gVGhhbmtzLAo+Pj4+IFNhc2hhCj4+PiBfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4+IExpbnV4IE1URCBkaXNj
dXNzaW9uIG1haWxpbmcgbGlzdAo+Pj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCj4+PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlz
dApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
