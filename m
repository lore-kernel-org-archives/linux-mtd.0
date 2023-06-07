Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99C56C7EE25
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Jun 2023 14:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YrH8EVYvKSg1+8WfZC9g8rgXqSaHwRE1KhzWVCFjoQA=; b=rEQdGPLODy6NMR
	zAh02H5ApQ8s29h3BgoEswyYEGt7qWAf1DJkTezUPcnrPw/h/1RpDiei54Nh33SLJXHGEwrZgd+t4
	bLRroOesMV99Aav5qFjWqhGzngNHoSbdg9vr97cUfyNzlUaey0m248J24SRgtUDMoDBAI+6Cc7iZv
	MOmQfXjsI0o7e27wqc6GBu9HP5Xti2r8uFGPdRzx9TkvjA3+zPghhK7Td4sFLPSmYAcU799+VWOjL
	aARxwiJHUA6C4K4ZTWTZbQhlQQ0JtAnM5I/YKLhgT2pPMagirDezoy0humUMKMLKmCl8kPP2Yrr6I
	TmNlKdbO0YdEEDtMLgPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6ubO-006KAE-0f;
	Wed, 07 Jun 2023 14:57:34 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6ubJ-006K7a-2r;
	Wed, 07 Jun 2023 14:57:31 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id AE6045FD6E;
	Wed,  7 Jun 2023 17:57:27 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1686149847;
	bh=c5e9Hn2iWEoovV4OiRRedc1P1r4+v4qAhT08M7pHODc=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	b=gAaEepNtKegJU7Wc0IZhBJxXUjdudfDS2bXbuTPi2rcMrWr4upfpX+yvwDlMlTdMG
	 Newa/obL3r7plfg8OhFB7PwIcHtM1bnyZoKxCpHUDQggc0B/Nb4j0xL/ew1/A2Pyuq
	 DbnyxuePczlzcMcz9Px0V4rBOhnoapxGEXO12SsfxNt2s55T0Xa3qf70AejXZTBm+B
	 F7t1h9PUFWIQE+iAPINfqpNze08/oD3YeebSpID4U/atjAMZiqiZQ6skdKuB/qxc0f
	 1cXBq6Ew3jLIX0Oc1R4E19jQVNzyQEgo+iDII+8fjiR9pGG0OtTFiJ0YH+VoOc0Atr
	 pMCYg1N2lDF4Q==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Wed,  7 Jun 2023 17:57:27 +0300 (MSK)
Message-ID: <6c1973d1-38c0-6048-90ad-da2f60df8238@sberdevices.ru>
Date: Wed, 7 Jun 2023 17:52:32 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v1] dt-bindings: nand: meson: Fix 'nand-rb' property
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Liang Yang
	<liang.yang@amlogic.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Neil Armstrong
	<neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>, <oxffffaa@gmail.com>,
	<kernel@sberdevices.ru>, <linux-mtd@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20230606193507.35024-1-AVKrasnov@sberdevices.ru>
 <20230607095802.3adcd4f9@xps-13>
 <166bdc27-f77c-9076-f866-180cfa5bff76@sberdevices.ru>
 <08da4e86-433a-7d2e-25ff-ffa24221abdf@linaro.org>
 <835a3587-1e0f-64d7-1d1a-b639ae8b7307@sberdevices.ru>
 <2ca6e619-1d57-8fff-6176-9ee890e0d167@linaro.org>
 <5ca9eb2b-4bc8-5883-a029-3eeca905fe6e@sberdevices.ru>
 <20230607113605.50a992bb@xps-13>
From: Arseniy Krasnov <avkrasnov@sberdevices.ru>
In-Reply-To: <20230607113605.50a992bb@xps-13>
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH01.sberdevices.ru (172.16.1.4) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/06/07 09:39:00 #21450961
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_075730_276971_F873FA99 
X-CRM114-Status: GOOD (  16.89  )
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

CgpPbiAwNy4wNi4yMDIzIDEyOjM2LCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+IEhpIEFyc2VuaXks
Cj4gCj4gYXZrcmFzbm92QHNiZXJkZXZpY2VzLnJ1IHdyb3RlIG9uIFdlZCwgNyBKdW4gMjAyMyAx
MjowNDoyOSArMDMwMDoKPiAKPj4gT24gMDcuMDYuMjAyMyAxMjowOCwgS3J6eXN6dG9mIEtvemxv
d3NraSB3cm90ZToKPj4+IE9uIDA3LzA2LzIwMjMgMTA6NTcsIEFyc2VuaXkgS3Jhc25vdiB3cm90
ZTogIAo+Pj4+Cj4+Pj4KPj4+PiBPbiAwNy4wNi4yMDIzIDExOjUzLCBLcnp5c3p0b2YgS296bG93
c2tpIHdyb3RlOiAgCj4+Pj4+IE9uIDA3LzA2LzIwMjMgMTA6NDAsIEFyc2VuaXkgS3Jhc25vdiB3
cm90ZTogIAo+Pj4+Pj4gSGVsbG8gTWlxdWVsLCAKPj4+Pj4+Cj4+Pj4+PiBPbiAwNy4wNi4yMDIz
IDEwOjU4LCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+Pj4+Pj4gIAo+Pj4+Pj4+IEhpIEFyc2VuaXks
Cj4+Pj4+Pj4KPj4+Pj4+PiBBVktyYXNub3ZAc2JlcmRldmljZXMucnUgd3JvdGUgb24gVHVlLCA2
IEp1biAyMDIzIDIyOjM1OjA3ICswMzAwOgo+Pj4+Pj4+ICAKPj4+Pj4+Pj4gQWRkIGRlc2NyaXB0
aW9uIG9mICduYW5kLXJiJyBwcm9wZXJ0eS4gVXNlICJGaXhlcyIgYmVjYXVzZSB0aGlzIHByb3Bl
cnR5Cj4+Pj4+Pj4+IG11c3QgYmUgc3VwcG9ydGVkIHNpbmNlIHRoZSBiZWdpbm5pbmcuIEZvciB0
aGlzIGNvbnRyb2xsZXIgJ25hbmQtcmInIGlzCj4+Pj4+Pj4+IHN0b3JlZCBpbiB0aGUgY29udHJv
bGxlciBub2RlIChub3QgaW4gY2hpcCksIGJlY2F1c2UgaXQgaGFzIG9ubHkgc2luZ2xlCj4+Pj4+
Pj4+IHIvYiB3aXJlIGZvciBhbGwgY2hpcHMuICAKPj4+Pj4+Pgo+Pj4+Pj4+IFNvcnJ5IGlmIEkg
bWlzbGVhZCB5b3UgaW4gdGhlIGZpcnN0IHBsYWNlLCBidXQgeW91IGNvdWxkIGRlZmluaXRlbHkK
Pj4+Pj4+PiBoYXZlIHR3byBjaGlwcyBhbmQgb25seSBvbmUgd2l0aCBSQiB3aXJlZC4gSXQgbmVl
ZHMgdG8gYmUgZGVmaW5lZCBpbgo+Pj4+Pj4+IHRoZSBjaGlwcy4gIAo+Pj4+Pj4KPj4+Pj4+IE9r
LCBzbyB0byBjbGFyaWZ5OiBpcyBpdCBvaywgdGhhdCBpbiBiaW5kaW5ncyB0aGlzIHByb3BlcnR5
IHdpbGwgYmUgcGxhY2VkIGluIHRoZQo+Pj4+Pj4gY2hpcCwgYnV0IGluIGRyaXZlciwgaSdtIHRy
eWluZyB0byByZWFkIGl0IGZyb20gdGhlIGNvbnRyb2xsZXIgbm9kZSAodGh1cyAgaW4KPj4+Pj4+
IGR0cyBmaWxlIGl0IHdpbGwgYmUgYWxzbyBpbiBjb250cm9sbGVyIG5vZGUpPyAgCj4gCj4gVGhl
IGJpbmRpbmdzIGFuZCB5b3VyIGRyaXZlciBpbnRlcm5hbCByZXByZXNlbnRhdGlvbiBhcmUgdHdv
IGRpZmZlcmVudAo+IHRoaW5ncy4gQW55d2F5LCBhcyBtZW50aW9uZWQgYWJvdmUsIHdpcmluZyB0
aGUgUkIgbGluZSB0byBvbmUgZGllIGFuZAo+IG5vdCB0aGUgb3RoZXIgd291bGQgYmUgdmFsaWQg
aGFyZHdhcmUgZGVzaWduIGFuZCB3b3VsZCByZXF1aXJlIHRoZSByYgo+IHByb3BlcnR5IHRvIGJl
IGluIHRoZSBjaGlwIG5vZGUuIFBsZWFzZSBwZXJmb3JtIGEgcGVyLWNoaXAgcHJvcGVydHkgcmVh
ZAo+IGluIHRoZSBkcml2ZXIgYXMgd2VsbC4KCkRvbmUsIEkgcmVzZW5kIGJvdGggcGF0Y2hlcyAo
YmluZGluZ3MgKyBkcml2ZXIgdXBkYXRlKSBhcyBhIHNpbmdsZSBwYXRjaHNldC4gWW91ciByZXZp
ZXcgY29tbWVudHMKZm9yIGRyaXZlciBjb2RlIHdlcmUgYWxzbyBmaXhlZC4KCj4gCj4+Pj4+Cj4+
Pj4+IE5vLCBiZWNhdXNlIGhvdyB3b3VsZCB5b3VyIERUUyBwYXNzIHZhbGlkYXRpb24/IEkgdW5k
ZXJzdGFuZCB5b3UgZGlkIG5vdAo+Pj4+PiB0ZXN0IHRoZSBiaW5kaW5ncywgYnV0IHRoaXMgd2ls
bCBpbXByb3ZlLCByaWdodD8gIAo+Pj4+Cj4+Pj4gT2ssIGknbGwgZm9sbG93IERUUyBsYXlvdXQg
aW4gdGhlIGRyaXZlciwgInRlc3QgdGhlIGJpbmRpbmdzIiBZb3UgbWVhbiAibWFrZSBkdF9iaW5k
aW5nX2NoZWNrIj8gIAo+Pj4KPj4+IFllcy4gVGhleSB3ZXJlIHNlbnQgd2l0aG91dCB0ZXN0aW5n
Lgo+Pj4KPj4+IEJ1dCBwbGVhc2UgYWxzbyB0ZXN0IHlvdXIgRFRTIHdpdGggZHRic19jaGVjay4g
CgpEb25lCgpUaGFua3MsIEFyc2VuaXkKCj4+Cj4+IEdvdCBpdCEKPj4KPj4gVGhhbmtzLCBBcnNl
bml5Cj4+Cj4+Pgo+Pj4KPj4+IEJlc3QgcmVnYXJkcywKPj4+IEtyenlzenRvZgo+Pj4gICAKPiAK
PiAKPiBUaGFua3MsCj4gTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
