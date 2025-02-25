Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC9E5C021B8
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Feb 2025 03:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YjMc+5m1EX8G2JpOd5MeWFe3AgibOU9jKFMIkM/88SI=; b=GWrV5ucvjHQYr2
	HbQIukAmkQSnqgFA3Cc8F99/W7JvZmqbShD6OfilLCS+uuxVSvgJkm+QgtpPFlmvrgKP02G4LIJ2/
	vI+3eQctq1UGPAO89ScOIBIyCeCg6sbKwPiBvRt4TlQg3BNepz9dgb7HS/7aRc+6awI8sLVR6FF8Z
	1J2uiIGiKuysQdMpeqQq1REp1914PDIiuSjdsi8f4gipq4RWlqZ7YRWnR+xWpbpmXoXRnVRms2qTX
	5d2pbdaet1PsjdamqzKGLPMtQ9DUWViLtCkjyezTSoHPyTRU6Nu/UzuW7adwhVbWnKeI3lXUec3ks
	hguZAPzwlzZTgCewZ8LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmllO-0000000FsdY-2JaL;
	Tue, 25 Feb 2025 03:37:42 +0000
Received: from [2607:7c80:54:3::138] (helo=mail.zytor.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmllM-0000000FsdG-1AvD
	for linux-mtd@lists.infradead.org;
	Tue, 25 Feb 2025 03:37:41 +0000
Received: from [172.27.1.176] ([76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 51P3aPQT1061652
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Mon, 24 Feb 2025 19:36:26 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 51P3aPQT1061652
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025021701; t=1740454597;
	bh=ISdSv8V44MsbYhNsZikfbFNm2jh7tbbEZwA+56mURdo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iF9iqF5IJij6HEIYPvvetQ6+tmIzHsh+pMTMVnu3P5ykEhZfImV1libD4devCmagC
	 3iyNSk1XFew7r8nfwrcPOMDwT9Cet01bBs8IAXImpdZtFUNL3xujHc86QVgJiUt4X2
	 0obQOYiKlDxXVK9eiAHHN4J1RQO+t4f6a/s1DU/qIj/jceKMbtNss8wjpWMLBt7Ymh
	 YFL/VhabUdylO/46/55nX8FOwHbYthWKv8154FTojDQ/TbamsE3xTiQ8D2e6xanXYX
	 Oq30jBmkXfmGEjBRSmTsnad5TAIoXsXj3RQH1SppbmnJ0+TSzbTmjlZvJzSgp8i1Fw
	 p0rBDMFAbZAag==
Message-ID: <d0067e6a-a6af-4b38-ac72-f655af4d3b3d@zytor.com>
Date: Mon, 24 Feb 2025 19:36:25 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/17] x86: Replace open-coded parity calculation with
 parity8()
To: Uros Bizjak <ubizjak@gmail.com>
Cc: Kuan-Wei Chiu <visitorckw@gmail.com>, tglx@linutronix.de,
        Ingo Molnar <mingo@redhat.com>, bp@alien8.de,
        dave.hansen@linux.intel.com, x86@kernel.org, jk@ozlabs.org,
        joel@jms.id.au, eajames@linux.ibm.com, andrzej.hajda@intel.com,
        neil.armstrong@linaro.org, rfoss@kernel.org,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
        dmitry.torokhov@gmail.com, mchehab@kernel.org, awalls@md.metrocast.net,
        hverkuil@xs4all.nl, miquel.raynal@bootlin.com, richard@nod.at,
        vigneshr@ti.com, louis.peens@corigine.com, andrew+netdev@lunn.ch,
        davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
        parthiban.veerasooran@microchip.com, arend.vanspriel@broadcom.com,
        johannes@sipsolutions.net, gregkh@linuxfoundation.org,
        jirislaby@kernel.org, yury.norov@gmail.com, akpm@linux-foundation.org,
        mingo@kernel.org, alistair@popple.id.au, linux@rasmusvillemoes.dk,
        Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, kuba@kernel.org,
        linux-kernel@vger.kernel.org, linux-fsi@lists.ozlabs.org,
        dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org,
        linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
        oss-drivers@corigine.com, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
        brcm80211-dev-list.pdl@broadcom.com, linux-serial@vger.kernel.org,
        bpf@vger.kernel.org, jserv@ccns.ncku.edu.tw,
        Yu-Chun Lin <eleanor15x@gmail.com>
References: <20250223164217.2139331-1-visitorckw@gmail.com>
 <20250223164217.2139331-4-visitorckw@gmail.com>
 <d080a2d6-9ec7-1c86-4cf4-536400221f68@gmail.com>
 <e0b1c299-7f19-4453-a1ce-676068601213@zytor.com>
 <CAFULd4a_AnP4iqgQs7a6xAsnUFL8oZXxFcAWLmZFMm6MPF_zDQ@mail.gmail.com>
Content-Language: en-US
From: "H. Peter Anvin" <hpa@zytor.com>
In-Reply-To: <CAFULd4a_AnP4iqgQs7a6xAsnUFL8oZXxFcAWLmZFMm6MPF_zDQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_193740_317186_6B746B29 
X-CRM114-Status: UNSURE (   9.74  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Ck9uIDIvMjQvMjUgMTQ6MDgsIFVyb3MgQml6amFrIHdyb3RlOgo+IE9uIE1vbiwgRmViIDI0LCAy
MDI1IGF0IDEwOjU24oCvUE0gSC4gUGV0ZXIgQW52aW4gPGhwYUB6eXRvci5jb20+IHdyb3RlOgo+
Pgo+PiBPbiAyLzI0LzI1IDA3OjI0LCBVcm9zIEJpemphayB3cm90ZToKPj4+Cj4+Pgo+Pj4gT24g
MjMuIDAyLiAyNSAxNzo0MiwgS3Vhbi1XZWkgQ2hpdSB3cm90ZToKPj4+PiBSZWZhY3RvciBwYXJp
dHkgY2FsY3VsYXRpb25zIHRvIHVzZSB0aGUgc3RhbmRhcmQgcGFyaXR5OCgpIGhlbHBlci4gVGhp
cwo+Pj4+IGNoYW5nZSBlbGltaW5hdGVzIHJlZHVuZGFudCBpbXBsZW1lbnRhdGlvbnMgYW5kIGlt
cHJvdmVzIGNvZGUKPj4+PiBlZmZpY2llbmN5Lgo+Pj4KPj4+IFRoZSBwYXRjaCBpbXByb3ZlcyBw
YXJpdHkgYXNzZW1ibHkgY29kZSBpbiBib290ZmxhZy5vIGZyb206Cj4+Pgo+Pj4gICAgIDU4OiAg
ICA4OSBkZSAgICAgICAgICAgICAgICAgICAgbW92ICAgICVlYngsJWVzaQo+Pj4gICAgIDVhOiAg
ICBiOSAwOCAwMCAwMCAwMCAgICAgICAgICAgbW92ICAgICQweDgsJWVjeAo+Pj4gICAgIDVmOiAg
ICAzMSBkMiAgICAgICAgICAgICAgICAgICAgeG9yICAgICVlZHgsJWVkeAo+Pj4gICAgIDYxOiAg
ICA4OSBmMCAgICAgICAgICAgICAgICAgICAgbW92ICAgICVlc2ksJWVheAo+Pj4gICAgIDYzOiAg
ICA4OSBkNyAgICAgICAgICAgICAgICAgICAgbW92ICAgICVlZHgsJWVkaQo+Pj4gICAgIDY1OiAg
ICA0MCBkMCBlZSAgICAgICAgICAgICAgICAgc2hyICAgICVzaWwKPj4+ICAgICA2ODogICAgODMg
ZTAgMDEgICAgICAgICAgICAgICAgIGFuZCAgICAkMHgxLCVlYXgKPj4+ICAgICA2YjogICAgMzEg
YzIgICAgICAgICAgICAgICAgICAgIHhvciAgICAlZWF4LCVlZHgKPj4+ICAgICA2ZDogICAgODMg
ZTkgMDEgICAgICAgICAgICAgICAgIHN1YiAgICAkMHgxLCVlY3gKPj4+ICAgICA3MDogICAgNzUg
ZWYgICAgICAgICAgICAgICAgICAgIGpuZSAgICA2MSA8c2JmX2luaXQrMHg1MT4KPj4+ICAgICA3
MjogICAgMzkgYzcgICAgICAgICAgICAgICAgICAgIGNtcCAgICAlZWF4LCVlZGkKPj4+ICAgICA3
NDogICAgNzQgN2YgICAgICAgICAgICAgICAgICAgIGplICAgICBmNSA8c2JmX2luaXQrMHhlNT4K
Pj4+ICAgICA3NjoKPj4+Cj4+PiB0bzoKPj4+Cj4+PiAgICAgNTQ6ICAgIDg5IGQ4ICAgICAgICAg
ICAgICAgICAgICBtb3YgICAgJWVieCwlZWF4Cj4+PiAgICAgNTY6ICAgIGJhIDk2IDY5IDAwIDAw
ICAgICAgICAgICBtb3YgICAgJDB4Njk5NiwlZWR4Cj4+PiAgICAgNWI6ICAgIGMwIGU4IDA0ICAg
ICAgICAgICAgICAgICBzaHIgICAgJDB4NCwlYWwKPj4+ICAgICA1ZTogICAgMzEgZDggICAgICAg
ICAgICAgICAgICAgIHhvciAgICAlZWJ4LCVlYXgKPj4+ICAgICA2MDogICAgODMgZTAgMGYgICAg
ICAgICAgICAgICAgIGFuZCAgICAkMHhmLCVlYXgKPj4+ICAgICA2MzogICAgMGYgYTMgYzIgICAg
ICAgICAgICAgICAgIGJ0ICAgICAlZWF4LCVlZHgKPj4+ICAgICA2NjogICAgNzMgNjQgICAgICAg
ICAgICAgICAgICAgIGphZSAgICBjYyA8c2JmX2luaXQrMHhiYz4KPj4+ICAgICA2ODoKPj4+Cj4+
PiB3aGljaCBpcyBmYXN0ZXIgYW5kIHNtYWxsZXIgKC0xMCBieXRlcykgY29kZS4KPj4+Cj4+Cj4+
IE9mIGNvdXJzZSwgb24geDg2LCBwYXJpdHk4KCkgYW5kIHBhcml0eTE2KCkgY2FuIGJlIGltcGxl
bWVudGVkIHZlcnkgc2ltcGx5Ogo+Pgo+PiAoQWxzbywgdGhlIHBhcml0eSBmdW5jdGlvbnMgcmVh
bGx5IG91Z2h0IHRvIHJldHVybiBib29sLCBhbmQgYmUgZmxhZ2dlZAo+PiBfX2F0dHJpYnV0ZV9j
b25zdF9fLikKPj4KPj4gc3RhdGljIGlubGluZSBfX2F0dHJpYnV0ZV9jb25zdF9fIGJvb2wgX2Fy
Y2hfcGFyaXR5OCh1OCB2YWwpCj4+IHsKPj4gICAgICAgICAgYm9vbCBwYXJpdHk7Cj4+ICAgICAg
ICAgIGFzbSgiYW5kICUwLCUwIiA6ICI9QGNjbnAiIChwYXJpdHkpIDogInEiICh2YWwpKTsKPiAK
PiBhc20oInRlc3QgJTAsJTAiIDogIj1AY2NucCIgKHBhcml0eSkgOiAicSIgKHZhbCkpOwo+IAo+
IGJlY2F1c2Ugd2UgYXJlIGludGVyZXN0ZWQgb25seSBpbiBmbGFncy4KPiAKCkFsc28sIG5lZWRz
IHRvIGJlICUxLCUxIChteSBtaXN0YWtlLCB0aG91Z2h0IGZsYWdzIG91dHB1dHMgZGlkbid0IGNv
dW50LikKCkZpbmFsbHksIHRoaXMgaXMga2luZCBvZiBhbiBvYnZpb3VzIGltcHJvdmVtZW50OgoK
ICBzdGF0aWMgdm9pZCBfX2luaXQgc2JmX3dyaXRlKHU4IHYpCiAgewogICAgICAgICB1bnNpZ25l
ZCBsb25nIGZsYWdzOwoKICAgICAgICAgaWYgKHNiZl9wb3J0ICE9IC0xKSB7Ci0gICAgICAgICAg
ICAgICB2ICY9IH5TQkZfUEFSSVRZOwogICAgICAgICAgICAgICAgIGlmICghcGFyaXR5KHYpKQot
ICAgICAgICAgICAgICAgICAgICAgICB2IHw9IFNCRl9QQVJJVFk7CisgICAgICAgICAgICAgICAg
ICAgICAgIHYgXj0gU0JGX1BBUklUWTsKCgktaHBhCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
