Return-Path: <SRS0=TRF+=P5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2246C31681
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Jan 2019 18:14:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 729CD2085A
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Jan 2019 18:14:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dpiuqP5A";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="puBCZg+t"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 729CD2085A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mMI5CesZ2VlfQschZm8RpClTjYaAgQNadwYx0Hm0dT0=; b=dpiuqP5ApaqWuY1w+2OUc4h94
	OtGG72ZfZJM1O79RpejnW9wdp1IpXgz9cWu75SnDhQzw9NlQRRPqU8M6FC8L+HYUgcX830+A1ZoNk
	iHRxKeBtgLaOnSywctjavNVRjVC1CJMLEre5SMJ7TwKqyC5rChpeDDpf5IUCmNVQSuR8Q/lpJK7kS
	s3j0GlH2Vp8P1YdpZOS64mNPRSJukkWrRTfkHuQYZ5uaQtNXns4OsaXkhq3ftJf6qqPEMlTZQWdHy
	9dqC/Su54+DqQyKg7iVSiwxlK/VDCauRCxnsSovx2RWMBGa0epkrOwYuUuJkuwyMszDdx03eyGe2T
	fZNJG0X+g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gle5q-0006Ql-NL; Mon, 21 Jan 2019 18:14:42 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gle5n-0006Py-H1
 for linux-mtd@lists.infradead.org; Mon, 21 Jan 2019 18:14:41 +0000
Received: by mail-lj1-x230.google.com with SMTP id g11-v6so18332113ljk.3
 for <linux-mtd@lists.infradead.org>; Mon, 21 Jan 2019 10:14:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=iudzzWzSBz+nj3eY7c9DqH/PP/FJDB3ad1ZzE6JNHuE=;
 b=puBCZg+tQ4e1yfBlwEe2MxURh5+iKHePnG5jgo2r/cOpZiM0eyB67zygJIdetxl9UV
 jUyHgcJFyg585qwLtVlwtdPGr8xEAz5YbaZ0kuGL4ztaoSEHjKXePhk736rHtBiAllfC
 A6gI6L1x9huAlRAygOgmwZb6TLo4cwIHVKe+hQtYfwQqOyhQDkGTHJLaSMlH3aJ4+ZUi
 IFgtERGMkdw+mOzVw5Tsnb5+S9SVYpRJnQ+K0BjpP0rRtiklsLw/1nCEVG915mJakQtn
 Qy34YejseQGeLLJMaUZDNyaRiH95sR5Ic7m/ua1d+Rqro/HMsIiAA2MmXWTe6BTW8RDN
 HTXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=iudzzWzSBz+nj3eY7c9DqH/PP/FJDB3ad1ZzE6JNHuE=;
 b=OZz4UOyX+ABfpedABU9nkqjVlOgdmRuyCyezaQYh0zhfZjSqmaDP1fEgE9SXbhpQQj
 CIyC6d3CTbd71nwfBf1W45q92pzHAChyG6ZYDcZlsM2Oy1HGgZY6S+PwE4cWy4MkONEW
 xIoUqA+t+kLZzXyCL8RUUTI3VJ3H5pysTWPQ9g1P8SQYEdGZjHx4CgYmYczfYatHe0Sz
 U1QlxwTy84JblXpBRzA2+jM0v04mlHAN9XiRaW8Ljn/ILmWNogm8kpTaRy+PZg4SUNCn
 WzRsfcQC8rfuX9f17rbcPvP2rK1vFHBQ1KU+Whsot6Fg0CuS2J3aIebxLSXl96Dkkn+9
 sRtg==
X-Gm-Message-State: AJcUukeac1It8KR6Pl2Jao+/cc0PIfn4H1VBsVIRvx+by8/kVdpQn/YR
 4qsX7kY2VceHg8LWD8yhrIo5VG8s
X-Google-Smtp-Source: ALg8bN6ySH5T1RmuJT/GY9vNRnqmZ0baXT4YFgMNBGDKl2EQHP2y+Kf12u3vHnjTpgrmZtcUJSpCqg==
X-Received: by 2002:a2e:7c13:: with SMTP id
 x19-v6mr18481879ljc.83.1548094476646; 
 Mon, 21 Jan 2019 10:14:36 -0800 (PST)
Received: from [192.168.75.106] (staticline-31-182-180-253.toya.net.pl.
 [31.182.180.253])
 by smtp.gmail.com with ESMTPSA id w9sm2389786lfc.66.2019.01.21.10.14.35
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 21 Jan 2019 10:14:35 -0800 (PST)
Subject: Re: VIRTIO iface in mtd
To: Boris Brezillon <bbrezillon@kernel.org>
References: <7f5ad942-3857-2cbb-5c54-e27a4613cae8@gmail.com>
 <f53fe2ac-c1a1-1e64-1f4c-046b8e9daa2b@gmail.com>
 <20190118214455.18345232@bbrezillon> <2945987.RD84OsBdxl@blindfold>
 <a978c3ac-83fb-04e7-4143-f16c2e5ca5c3@gmail.com>
 <20190121090743.3b343c2a@bbrezillon>
From: =?UTF-8?Q?Marcin_Krzemi=c5=84ski?= <mar.krzeminski@gmail.com>
Message-ID: <69812b45-6dc4-f11f-f87e-4cf9a099cf50@gmail.com>
Date: Mon, 21 Jan 2019 19:14:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20190121090743.3b343c2a@bbrezillon>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190121_101439_562359_0D4B3D54 
X-CRM114-Status: GOOD (  34.64  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgQm9yaXMsCgoKT24gMjEuMDEuMjAxOSAwOTowNywgQm9yaXMgQnJlemlsbG9uIHdyb3RlOgo+
IEhpIE1hcmNpbiwKPgo+IE9uIFN1biwgMjAgSmFuIDIwMTkgMjA6NDk6NDYgKzAxMDAKPiBNYXJj
aW4gS3J6ZW1pxYRza2kgPG1hci5rcnplbWluc2tpQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPj4gT24g
MTguMDEuMjAxOSAyMjoyNSwgUmljaGFyZCBXZWluYmVyZ2VyIHdyb3RlOgo+Pj4gSGkhCj4+Pgo+
Pj4gU29ycnkgZm9yIGpvaW5pbmcgdGhpcyBkaXNjdXNzaW9uIHNvIGxhdGUuCj4+PiBJIGRpZG4n
dCBub3RpY2UgdGhlIHByaXZhdGUgbWFpbHMuIDstXAo+PiBObyBwcm9ibGVtIDopCj4+PiBBbSBG
cmVpdGFnLCAxOC4gSmFudWFyIDIwMTksIDIxOjQ0OjU1IENFVCBzY2hyaWViIEJvcmlzIEJyZXpp
bGxvbjoKPj4+PiBPbiBGcmksIDE4IEphbiAyMDE5IDIxOjAzOjE3ICswMTAwCj4+Pj4gTWFyY2lu
IEtyemVtacWEc2tpIDxtYXIua3J6ZW1pbnNraUBnbWFpbC5jb20+IHdyb3RlOgo+Pj4+ICAgCj4+
Pj4+PiAgICAgIAo+Pj4+Pj4+IE15IHVuZGVyc3RhbmRpbmcgaXMgdGhhdCB0aGlzIGRyaXZlciB3
aWxsIHVzZSBWSVJUSU8gdG8gY29tbXVuaWNhdGUKPj4+Pj4+PiB3aXRoIFFlbXUuIEZyb20gUWVt
dSBzaWRlIGF0IHRoZSBlbmQgdGhlcmUgd2lsbCBiZSBhIGZpbGUgdGhhdCB3aWxsCj4+Pj4+Pj4g
c2ltdWxhdGUgTkFORC9OT1IuIElzIGl0IGNvcnJlY3Q/Cj4+Pj4+PiBUaGF0J3MgbXkgdW5kZXJz
dGFuZGluZywgYnV0IEknbSBub3QgcmVhbGx5IGEgdmlydGlvIG9yIHFlbXUgZXhwZXJ0IHNvCj4+
Pj4+PiBJIG1pZ2h0IGJlIHdyb25nLgo+Pj4+Pj4gICAgICAKPj4+Pj4+PiBXaGF0IHVzZSBjYXNl
cyBkbyB5b3UgaGF2ZSBpbiBtaW5kIGZvciB0aGlzPwo+Pj4+Pj4gSSBoYXZlIG9uZSBpbiBtaW5k
OiBzaW11bGF0ZSBOQU5EIChpbiBwYXJ0aWN1bGFyIE1MQyBOQU5EKSBiZWhhdmlvciBpbgo+Pj4+
Pj4gYSBwc2V1ZG8tcmVhbGlzdGljIHdheSB0byB2YWxpZGF0ZSBVQkkvVUJJRlMgY29kZSAob3Ig
YW55IG90aGVyCj4+Pj4+PiBGUy93ZWFyLWxldmVsaW5nL0ZUTCBjb2RlKSB3ZSBtaWdodCB3YW50
IHRvIHVzZSBvbiB0b3Agb2Ygc3VjaCBkZXZpY2VzCj4+Pj4+IEluIHRoaXMgcGxhY2UgbXkgcXVl
c3Rpb24gaXMgd2hhdCB3ZSByZW1vdmUgZnJvbSBlbXVsYXRpb24/Cj4+Pj4+IEkgdW5kZXJzdGFu
ZCB0aGF0IGNvbW11bmljYXRpb24gbGF5ZXIgaXMgcmVtb3ZlZCwgaG93ZXZlciBjb21tdW5pY2F0
aW9uCj4+Pj4+IHByb3RvY29sCj4+Pj4+IG5lZWQgdCBvIHN0YXk/IEVnLiBiZWNhdXNlIE5BTkQg
YW5kIE9PQi4KPj4+PiBJZiBieSBwcm90b2NvbCB5b3UgbWVhbiB0aGUgZmFjdCB0aGF0IGEgTkFO
RCBoYXMgYW4gb3V0LW9mLWJhbmQgYW5kIGFuCj4+Pj4gaW4tYmFuZCBhcmVhLCB0aGVuIHllcywg
d2Ugd2FudCB0byBlbXVsYXRlIHRoYXQuIFdoYXQgSSBtZWFudCBieQo+Pj4+ICJwcm90b2NvbCIg
d2FzIHRoZSBob3cgeW91IGludGVyYWN0IHdpdGggYSBwYXJhbGxlbCBvciBTUEkgTkFORCAoInNl
bmQKPj4+PiB0aGlzIG9wY29kZSB0byBkbyB0aGlzIG9yIHRoYXQiKSwgYW5kIHdlIGRlZmluaXRl
bHkgZG9uJ3Qgd2FudCB0bwo+Pj4+IGVtdWxhdGUgdGhhdCBwYXJ0Lgo+Pj4+ICAgCj4+Pj4+PiBJ
J2QgYWxzbyBsaWtlIHRvIHJlcGxhY2UgbmFuZHNpbSBieSB0aGlzIGVtdWxhdGlvbiBhcHByb2Fj
aC4gSW5kZWVkLAo+Pj4+Pj4gbmFuZHNpbSBpcyBlbXVsYXRpbmcgdGhlIHBhcmFsbGVsIE5BTkQg
cHJvdG9jb2wgbW9yZSB0aGFuIGFueXRoaW5nCj4+Pj4+PiBlbHNlLCB3aGljaCB3ZSBkb24ndCBy
ZWFsbHkgY2FyZSBhYm91dCB1bmxlc3Mgd2UgbmVlZCB0byB0ZXN0IHRoZSByYXcKPj4+Pj4+IE5B
TkQgZnJhbWV3b3JrIChhbmQgSSB0aGluayB0aGVyZSBhcmUgYmV0dGVyIHNvbHV0aW9ucyB0byBk
byB0aGF0KS4gT24KPj4+Pj4+IHRoZSBvdGhlciBoYW5kLCBiZWNhdXNlIG5hbmRzaW0gdHJpZXMg
dG8gdXNlIHRoZSBmdWxsIHJhdyBOQU5EIHN0YWNrLAo+Pj4+Pj4gaXQncyBvZnRlbiBoYXJkIHRv
IGVtdWxhdGUgcmVhbCBkZXZpY2VzIChJRC1iYXNlZCBkZXRlY3Rpb24gZG9lcyBub3QKPj4+Pj4+
IHdvcmsgZm9yIE9ORkkvSkVERUMgY29tcGF0aWJsZSBkZXZpY2VzKS4gQWxsIG9mIHRoaXMgbWFr
ZXMgbmFuZHNpbSBhCj4+Pj4+PiBwb29yIGNob2ljZSB3aGVuIHRoZSB1c2VyIHdhbnRzIHRvIGVt
dWxhdGUgYSBOQU5EIGRldmljZSB0byBkbwo+Pj4+Pj4gcG9zdC1tb3J0ZW0gYW5hbHlzaXMgdXNp
bmcgYSBOQU5EIGR1bXAuCj4+Pj4+IFRoaXMgSSBuZWVkIHRvIHVuZGVyc3RhbmQgYmV0dGVyLiBJ
ZiB3ZSBlZy4gaGF2ZSBOQU5EIGR1bXAsIGRvIHdlIGNhcmUKPj4+Pj4gd2l0aCBPT0Igb3IgRUND
LAo+Pj4+PiBvciBub3Q/Cj4+Pj4gWWVzIHdlIHNob3VsZC4gRm9yIHRoZSBFQ0MgcGFydCwgaXQg
d2lsbCBiZSBoYXJkIHRvIGVtdWxhdGUgSFcgRUNDCj4+Pj4gZW5naW5lLCBidXQgd2UgY2FuIGF0
IGxlYXN0IHNwZWNpZnkgdGhlIGxheW91dCBpbiB1c2Ugb24gdGhlIGJvYXJkCj4+Pj4gKHdoaWNo
IE9PQiBwb3J0aW9ucyBhcmUgdXNlZCB0byBzdG9yZSBFQ0MgYnl0ZXMgYW5kIHdoaWNoIG9uZXMg
YXJlCj4+Pj4gY29udGFpbmluZyB1c2VyIGRhdGEgb3IgYmFkIGJsb2NrIG1hcmtlcnMpLgo+Pj4+
ICAgCj4+Pj4+IEF0IHRoZSBlbmQgSSBhbHNvIG5lZWQgdG8gYWRkLCB0aGF0IEkgdW5kZXJzdGFu
ZCBOT1IgZGV2aWNlcywgYnV0Cj4+Pj4+IHVuZm9ydHVuYXRlbHkKPj4+Pj4gSSBoYXZlIGxvdyBl
eHBlcmllbmNlIHdpdGggTkFORHMuIFRoaXMgY291bGQgbGVhZCB0byBzb21lIG1pc3VuZGVyc3Rh
bmRzIDooCj4+Pj4gV2UgY2FuIGhlbHAgd2l0aCB0aGF0Lgo+Pj4gWWVzLCBJJ2xsIGhhcHBpbHkg
aGVscC4KPj4+Cj4+PiBJJ20gdW5oYXBweSB3aXRoIG5hbmRzaW0gbW9zdGx5IGJlY2F1c2UgaXQg
ZW11bGF0ZXMgdGhlIGNoaXAgaXRzZWxmLCB3aGljaCBpcwo+Pj4gdGhlc2UgZGF5cyBhbG1vc3Qg
dXNlbGVzcyBhbmQgaW5lZmZpY2llbnQuCj4+PiBUbyBmaW5kIGJ1Z3MgaW4gbmFuZF9iYXNlLmMg
aXQgaGVscHMgb25seSBpbiB0aGVvcnksIGluIHJlYWxpdHkgd2UgdHJpZ2dlcgo+Pj4gYnVncyBp
biBuYW5kc2ltJ3MgTkFORCBlbXVsYXRpb24uCj4+IEkgZ3Vlc3MgaXQgY291bGQgaGVscCB0byBj
YXRjaCByZWdyZXNzaW9uLi4uCj4gSW4gcHJhY3RpY2UgbmFuZHNpbSBkb2VzIG5vdCBjYXRjaCBt
b3N0IHJlZ3Jlc3Npb25zLCBzaW1wbHkgYmVjYXVzZQo+IGl0J3Mgb25seSB1c2luZyBhIHNtYWxs
IHBhcnQgb2YgdGhlIHJhdyBOQU5EIGNvZGUgYmFzZS4KPgo+Pj4gSSB0cmllZCB0byBvdmVyaGF1
bCBuYW5kc2ltIHNvbWUgdGltZSBhZ286Cj4+PiBodHRwczovL2xrbWwub3JnL2xrbWwvMjAxNi84
LzMxLzY3Cj4+PiBCdXQgQm9yaXMgY29udmluY2VkIG1lIHRoYXQgSSBzaG91bGQgbm90IHJpZGUg
YSBkZWFkIGhvcnNlLiA7LSkKPj4+Cj4+PiBTbywgdGhlIGJhc2ljIGlkZWEgaXMgaGF2aW5nIGEg
c2ltcGxlIGFuZCBzdHVwaWQga2VybmVsLWRyaXZlciB3aGljaCBpbXBsZW1lbnRzCj4+PiB0aGUg
TVREIGludGVyZmFjZSBhbmQgY2FuIGFjdCBsaWtlIHdoYXRldmVyIHdlIHdhbnQuCj4+PiBUaGUg
bG9naWMgc2hhbGwgaGFwcGVuIGluIGFuIGVtdWxhdG9yIGxpa2UgcWVtdS4KPj4+IFRoaW5rIG9m
IHZpcnRpby1ibGsgb3IgdmlydGlvLXNjc2kuCj4+IFRoYXQgc2VlbSB0byBiZSByZWFzb25hYmxl
IGFuZCBtYWNoIG15IHVuZGVyc3RhbmQgb2YgdGhlIHRvcGljLgo+PiBNVEQgZHJpdmVyIHdvdWxk
IGJlIG5vdGhpbmcgbW9yZSB0aGF0IHRyYW5zbGF0b3IgYmV0d2VlbiBNVEQgYW5kIFFlbXUKPj4g
KG92ZXIgdmlydGlvKS4KPj4gQXMgQm9yaXMgc3VnZ2VzdGVkIGFuZCBhZGRpdGlvbmFsIGNoYW5u
ZWwgdG8gbW9kaWZ5IFFlbXVzIGJlaGF2aW9yIGZyb20KPj4gZ3Vlc3QgKGVnLiBpbnNlcnRpbmcg
RUNDIGVycm9ycyk/Cj4gQWN0dWFsbHksIEkgd2FzIGV4cGVjdGluZyB0byBpbnNlcnQgYml0Zmxp
cHMsIGVyYXNlL3Byb2dyYW0gZXJyb3JzLAo+IGJhZGJsb2NrLCAuLi4gb24gdGhlIGhvc3Qgc2lk
ZS4gVGhlIHNpZGUgY2hhbm5lbCB3b3VsZCBhbGxvdyB1cyB0bwo+IGluZm9ybSB0aGUgZ3Vlc3Qg
YWJvdXQgdGhvc2UgZXJyb3JzLgpJIGFtIHByb3Bvc2luZyBndWVzdCB0byBhbGxvdyBpbnNlcnRp
bmcgZXJyb3JzIGluIHRoZSBnaXZlbiBtb21lbnQgb2YgdGltZS4KIEZyb20gdGhlIG90aGVyIHNp
ZGUgdGhpcyBjYW4gYmUgZG9uZSBpbiBhIGRpZmZlcmVudCB3YXkuIFdlIGNvdWxkIHNraXAgdGhp
cwp0b3BpYyBhdCB0aGUgbW9tZW50Lwo+Cj4+IEVnLiBmcm9tIHN5c2Y/Cj4+Cj4+IFJlYWwgdW5r
bm93biBmb3IgbWUgaXMgUWVtdSBwYXJ0LiBFZy4gYmFzaWMgcXVlc3Rpb24gaG93IGRvZXMgTkFO
RCBkdW1wcwo+PiBzaG91bGQgbG9vayBsaWtlPwo+PiBJdCBzaG91bGQgY29uc2lzdCBvbmx5IHJl
YWwgZGF0YSBvciBzZWN0b3JzIGltYWdlcyh3aXRoIE9PQikuIE9yIGJvdGg/Cj4gTm90IHN1cmUg
d2hhdCB5b3UgbWVhbiBieSAicmVhbCBkYXRhIiBhbmQgInNlY3RvcnMgaW1hZ2VzIiwgYnV0IHFl
bXUKPiBOQU5EIGltYWdlcyBzaG91bGQgZGVmaW5pdGVseSBjb250YWluIE9PQiB3aGVuIGFwcGxp
Y2FibGUgKElPVywKPiB3aGVuIGVtdWxhdGluZyBOQU5EIGRldmljZXMpLiBIb3cgeW91IHN0b3Jl
IGl0IGlzIHVwIHRvIHlvdSAoY2FuIGJlCj4gaW50ZXJsZWF2ZWQgd2l0aCBpbi1iYW5kIGRhdGEg
bGlrZSBvZiBhIHJlYWwgZGV2aWNlIG9yIHN0b3JlZCBpbiBhCj4gc2VwYXJhdGUgc2VjdGlvbiBv
ZiB0aGUgcWVtdSBOQU5EIGltYWdlIGZpbGUsIG9yIGV2ZW4gc3RvcmVkIGluIGEKPiBzZXBhcmF0
ZSBmaWxlKS4gT2gsIGFuZCB5b3UnbGwgaGF2ZSB0byBzdG9yZSBtZXRhZGF0YSB0b28sIGxpa2Ug
d2hpY2gKPiBibG9jayBpcyBiYWQsIHRoZSBwb3NpdGlvbiBvZiB0aGUgZW11bGF0ZWQgYml0Zmxp
cHMgaW4gZWFjaCBwYWdlLCB0aGUKPiBwYWdlcy9ibG9ja3MgeW91IHdhbnQgdG8gZ2VuZXJhdGUg
ZXJyb3JzIG9uIHdoZW4gYSB3cml0ZS9lcmFzZSBpdAo+IGV4ZWN1dGVkLCAuLi4KSSBuYXJyb3dl
ZCBkb3duIHRoZSBwcm9ibGVtIHRvIG9uZSByZWFsIGZpbGUuIFlvdSBhcmUgcmlnaHQsIGJlc2lk
ZSAKYWN0dWFsIGRhdGEsCm1hbnkgbWV0YWRhdGEgbmVlZHMgdG8gYmUgZW11bGF0ZWQuCj4KPiBB
bHNvLCBJIHRoaW5rIG9uZSBmZWF0dXJlIFJpY2hhcmQgd291bGQgbG92ZSBpcyBhIHdheSB0byBy
ZWNvcmQgZWFjaAo+IHdyaXRlL2VyYXNlIG9wZXJhdGlvbiBpbiBvcmRlciBzbyB0aGFuIHlvdSBj
YW4gZWFzaWx5IHJlcGxheSBhCj4gc2VxdWVuY2Ugc3RlcCBieSBzdGVwIGFuZCBzZWUgaWYgRlMv
V2Vhci1sZXZlbGluZyBsYXllciBpcyBhYm91dCB0bwo+IG1vdW50L3JlY292ZXIgZnJvbSBlcnJv
cnMgaW4gYmV0d2VlbiBlYWNoIG9mIHRob3NlIGludGVybWVkaWF0ZQo+IHN0YXRlcy4gVGhpcyB3
b3VsZCByZXF1aXJlIGhhdmluZyBhIGV4dHJhIGZpbGUgd2hlcmUgeW91IHN0b3JlCj4gb3BlcmF0
aW9uIGFuZCBhc3NvY2lhdGVkIG1ldGFkYXRhIChsaWtlIHRoZSBkYXRhIHdyaXR0ZW4gaW4gY2Fz
ZSBvZiBhCj4gd3JpdGUpIGluIGEgc2VwYXJhdGUgZmlsZS4KQWN0dWFsbHkgdGhpcyBsb29rIHRv
IGJlIHByZXR0eSBzaW1wbGUgOikKPgo+IEFueXdheSwgdGhpcyBpcyBhbHJlYWR5IGFuIGFkdmFu
Y2VkIGZlYXR1cmUsIGFuZCBJIHRoaW5rIHdlIHNob3VsZAo+IHN0YXJ0IHNtYWxsOiBlbXVsYXRl
IE5PUi9OQU5EIGRldmljZXMgd2l0aG91dCBhbnkgd2F5IHRvIGVtdWxhdGUKPiBiaXRmbGlwcyBv
ciBlcmFzZS9wcm9ncmFtIGVycm9ycy4gT25jZSB3ZSBoYXZlIHRoYXQgaW4gcGxhY2UsIHdlIGNh
bgo+IHN0YXJ0IGFkZGluZyBmYW5jeSBmZWF0dXJlcyBvbiB0b3AuClRoYXQgaXMgZXhhY3RseSB3
aGF0IEkgd2FudGVkIHRvIHByb3Bvc2UuIFNpbXBsZSBrZXJuZWwgZHJpdmVyIGFuZCBRZW11IApp
bXBsZW1lbnRhdGlvbi4KQ2FuIHlvdSB0ZWxsIG1lIHdoaWNoIE1URCBkcml2ZXIgd291bGQgYmUg
dGhlIGJlc3Qgc3RhcnRpbmcgcG9pbnQ/CgpUaGFua3MsCk1hcmNpbgo+Cj4gUmVnYXJkcywKPgo+
IEJvcmlzCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
