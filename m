Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 699A4C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Mar 2022 15:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dRFF+7ZQ7VNdwq3Q+Wvxxz/FA/0h3UtxLq9ho6c5AtM=; b=JpZTvZjrLxC3rH
	JhJ8QqSYo0K78pu/fuX5CnIrdYmvkItnnN0nAzD79UrAQfKsF4oRFo86JYXeqWuSB/38FmmXSzgtu
	RD0EbUJbFcrQUf1d2ilSTv7MqU00vOFITsODv51sAop3jKoAx4usa8XK9Zx0gF+/ZGpHjUuEjUznt
	xcvx2CF7qV1P38+RESbezlgtVpqDy/eB47EBmUejJZuVj3C/+O+qg0jebZUYhkprH+eUlHr69Evgy
	ZBRD4n6OWMizVQrSD2IGuZQaho5zZFNz1DKtA4IRP400Tg6hSBcPgAtbEADfx58Npi12CnDShk+j8
	OMNPy/QiKxDg5XkKybQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nYrHr-009MFo-CF; Mon, 28 Mar 2022 15:28:07 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nYrHk-009MCG-TF
 for linux-mtd@lists.infradead.org; Mon, 28 Mar 2022 15:28:05 +0000
Received: by mail-pj1-x1031.google.com with SMTP id
 o3-20020a17090a3d4300b001c6bc749227so16074602pjf.1
 for <linux-mtd@lists.infradead.org>; Mon, 28 Mar 2022 08:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=2wUZeWRV76xbjqB2fVfVl+7prBFOA+iotI361ZSnUuQ=;
 b=iOx/n0NmFiRMi00/5wnH7KJDBUK1ZW+Jmn+aZEJTT6exk/Z72hHDI8l/RrY94YuKh+
 k0htH3T8bItoeaZqCEtqkpzKnn+jwA7kNHEnfurxBiBEKNp2vpd0ftzOmBtYtJ6VNGeg
 mEFgPxGU6wEnRd3jXaN1lVy0yRAkRPaLzbAC6hQTWaSBOv9aXDJaNo4Nbps4w3Q8nRkG
 aqAN5WJ82b3eRQqEPXtSIXO/iuLVQNPZfIdEgLKy/dOdLnVMbwSinsrarULpsasUfPib
 7liRUyhDXrII3q7dxf+jhEMTQPnItmuEDQcGb1LkwL+onR1TBk6xRNX1QtMUkCmd2Pjk
 Vltw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2wUZeWRV76xbjqB2fVfVl+7prBFOA+iotI361ZSnUuQ=;
 b=pX1s5KViCDH60UQHKRJzVysVj/vd83k7mnYUJZVNd2npPicM4fg4/n4ppIw6r7tqdr
 7xvntB9GVyhgj1AVi3kLL8FQz/kWlF3/mhQlKMdAJwBQw252I+Aaqs/hLWd+eVt2ka0Z
 mfup8BeEHP5x1ZBzX1wqum0eTHT1EJCJBvlqK+sRrBxUbJG5P77/gkEl37rttN8E7K8u
 osmJ+1JAIDBkyt0xqnbDqd2XLBGjk62tLxqTGLY1LK5juJMmaPU8pe6ewX4apAZnn0IS
 h8fzcEKzvRd0krC+RfT2W0mFrxPN0EEhM8hkFgKZnHe0it4x6pVULH1MzguhLJp1ZX/d
 +oDA==
X-Gm-Message-State: AOAM5314fR5SjRsjSfm2liaf3ZapUqQeh8AMSlThOnv1GrcGrbT2p1dl
 714Hkx/hTDOHEShvZT4wL5A=
X-Google-Smtp-Source: ABdhPJw0X+Pgep7POktGMi2nL5C/vsxPf6OmC2e7Thsp8CCzFsLePk//8DH9amtsOKRtbVY/muGrpQ==
X-Received: by 2002:a17:90a:8d08:b0:1c6:5ada:9920 with SMTP id
 c8-20020a17090a8d0800b001c65ada9920mr41483012pjo.126.1648481278726; 
 Mon, 28 Mar 2022 08:27:58 -0700 (PDT)
Received: from ?IPV6:240b:10:2720:5500:1b5:6130:7e8a:99b6?
 ([240b:10:2720:5500:1b5:6130:7e8a:99b6])
 by smtp.gmail.com with ESMTPSA id
 nn7-20020a17090b38c700b001c9ba103530sm2815006pjb.48.2022.03.28.08.27.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Mar 2022 08:27:58 -0700 (PDT)
Message-ID: <60711319-5ad3-d41c-449d-2361708dac84@gmail.com>
Date: Tue, 29 Mar 2022 00:27:56 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v4 2/3] mtd: cfi_cmdset_0002: Use chip_ready() for write
 on S29GL064N
Content-Language: en-US
To: Ahmad Fatoum <a.fatoum@pengutronix.de>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-mtd@lists.infradead.org, stable@vger.kernel.org
References: <20220316155455.162362-1-ikegami.t@gmail.com>
 <20220316155455.162362-3-ikegami.t@gmail.com> <20220316182100.6e2e5876@xps13>
 <01fed0aa-8844-1db9-f167-e7e7944bc092@ti.com>
 <201907b1-c43a-8c45-7ab1-4a4606591bef@pengutronix.de>
 <e4142a59-6193-8dd9-0562-fd3310067b09@gmail.com>
 <0101a00f-a5a1-a4f7-7c6d-cd468805f284@pengutronix.de>
From: Tokunori Ikegami <ikegami.t@gmail.com>
In-Reply-To: <0101a00f-a5a1-a4f7-7c6d-cd468805f284@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220328_082801_000692_AE2A7E83 
X-CRM114-Status: GOOD (  24.21  )
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

SGkgQWhtYWQtc2FuLAoKT24gMjAyMi8wMy8yOCAxOTo0OSwgQWhtYWQgRmF0b3VtIHdyb3RlOgo+
IE9uIDIyLjAzLjIyIDAzOjQ5LCBUb2t1bm9yaSBJa2VnYW1pIHdyb3RlOgo+PiBIaSBBaG1hZC1z
YW4sCj4+Cj4+IE9uIDIwMjIvMDMvMTcgMjM6MTYsIEFobWFkIEZhdG91bSB3cm90ZToKPj4+IEhl
bGxvIFZpZ25lc2gsCj4+Pgo+Pj4gT24gMTcuMDMuMjIgMTE6MDEsIFZpZ25lc2ggUmFnaGF2ZW5k
cmEgd3JvdGU6Cj4+Pj4gT24gMTYvMDMvMjIgMTA6NTEgcG0sIE1pcXVlbCBSYXluYWwgd3JvdGU6
Cj4+Pj4+IEhpIFRva3Vub3JpLAo+Pj4+Pgo+Pj4+PiBpa2VnYW1pLnRAZ21haWwuY29tIHdyb3Rl
IG9uIFRodSwgMTcgTWFyIDIwMjIgMDA6NTQ6NTQgKzA5MDA6Cj4+Pj4+Cj4+Pj4+PiBBcyBwb2lu
dGVkIG91dCBieSB0aGlzIGJ1ZyByZXBvcnQgWzFdLCBidWZmZXJlZCB3cml0ZXMgYXJlIG5vdyBi
cm9rZW4gb24KPj4+Pj4+IFMyOUdMMDY0Ti4gVGhpcyBpc3N1ZSBjb21lcyBmcm9tIGEgcmV3b3Jr
IHdoaWNoIHN3aXRjaGVkIGZyb20gdXNpbmcgY2hpcF9nb29kKCkKPj4+Pj4+IHRvIGNoaXBfcmVh
ZHkoKSwgYmVjYXVzZSBEUSB0cnVlIGRhdGEgMHhGRiBpcyByZWFkIG9uIFMyOUdMMDY0TiBhbmQg
YW4gZXJyb3IKPj4+Pj4+IHJldHVybmVkIGJ5IGNoaXBfZ29vZCgpLgo+Pj4+PiBWaWduZXNoLCBJ
IGJlbGlldmUgeW91IHVuZGVyc3RhbmQgdGhpcyBpc3N1ZSBiZXR0ZXIgdGhhbiBJIGRvLCBjYW4g
eW91Cj4+Pj4+IHByb3Bvc2UgYW4gaW1wcm92ZWQgY29tbWl0IGxvZz8KPj4+PiBIb3cgYWJvdXQ6
Cj4+Pj4KPj4+PiBTaW5jZSBjb21taXQgZGZlYWUxMDczNTgzKCJtdGQ6IGNmaV9jbWRzZXRfMDAw
MjogQ2hhbmdlIHdyaXRlIGJ1ZmZlciB0bwo+Pj4+IGNoZWNrIGNvcnJlY3QgdmFsdWUiKSBidWZm
ZXJlZCB3cml0ZXMgZmFpbCBvbiBTMjlHTDA2NE4uIFRoaXMgaXMKPj4+PiBiZWNhdXNlLCBvbiBT
MjlHTDA2NE4sIHJlYWRzIHJldHVybiAweEZGIGF0IHRoZSBlbmQgb2YgRFEgcG9sbGluZyBmb3IK
Pj4+PiB3cml0ZSBjb21wbGV0aW9uLCB3aGVyZSBhcywgY2hpcF9nb29kKCkgY2hlY2sgZXhwZWN0
cyBhY3R1YWwgZGF0YQo+Pj4+IHdyaXR0ZW4gdG8gdGhlIGxhc3QgbG9jYXRpb24gdG8gYmUgcmV0
dXJuZWQgcG9zdCBEUSBwb2xsaW5nIGNvbXBsZXRpb24uCj4+Pj4gRml4IGlzIHRvIHJldmVydCB0
byB1c2luZyBjaGlwX2dvb2QoKSBmb3IgUzI5R0wwNjROIHdoaWNoIG9ubHkgY2hlY2tzCj4+Pj4g
Zm9yIERRIGxpbmVzIHRvIHNldHRsZSBkb3duIHRvIGRldGVybWluZSB3cml0ZSBjb21wbGV0aW9u
Lgo+Pj4gTWVzc2FnZSBzb3VuZHMgZ29vZCB0byBtZSB3aXRoIG9uZSByZW1hcms6IFRoZSBpc3N1
ZSBpcyBpbmRlcGVuZGVudCBvZgo+Pj4gd2hldGhlciBidWZmZXJlZCB3cml0ZXMgYXJlIHVzZWQg
b3Igbm90LiBJdCdzIGp1c3QgYmVjYXVzZSBidWZmZXJlZCB3cml0ZXMKPj4+IGFyZSB0aGUgZGVm
YXVsdCwgdGhhdCBpdCB3YXMgYnJva2VuIGJ5IGRmZWFlMTA3MzU4MyAoIm10ZDogY2ZpX2NtZHNl
dF8wMDAyOgo+Pj4gQ2hhbmdlIHdyaXRlIGJ1ZmZlciB0byBjaGVjayBjb3JyZWN0IHZhbHVlIiku
IFRoZSB3b3JkIHdyaXRlIGNhc2Ugd2FzIGJyb2tlbgo+Pj4gYnkgMzdjNjczYWRlMzVjICgibXRk
OiBjZmlfY21kc2V0XzAwMDI6IFVzZSBjaGlwX2dvb2QoKSB0byByZXRyeSBpbgo+Pj4gZG9fd3Jp
dGVfb25ld29yZCgpIiksIHNvIHRoZSBjb21taXQgbWVzc2FnZSBzaG91bGQgcHJvYmFibHkgcmVm
ZXJlbmNlCj4+PiBib3RoLiBhcyB0aGlzIGNvbW1pdCBpbmRlZWQgZml4ZXMgYm90aCBGT1JDRV9X
T1JEX1dSSVRFID09IDAgYW5kID09IDEuCj4+IElzIHRoaXMgcmVhbGx5IGNhdXNlZCB0aGUgZXJy
b3Igb24gZG9fd3JpdGVfb25ld29yZCBieSB0aGUgY2hhbmdlZD8KPj4gQWN0dWFsbHkgaXQgd2Fz
IGNoYW5nZWQgdG8gdXNlIGNoaXBfZ29vZCBpbnN0ZWFkIG9mIGNoaXBfcmVhZHkuCj4+IEJ1dCBi
ZWZvcmUgdGhlIGNoYW5nZSBzdGlsbCBkb193cml0ZV9vbmV3b3JkIHVzZXMgYm90aCBjaGlwX3Jl
YWR5IGFuZCBjaGlwX2dvb2QuCj4+IFNvIGl0IHNlZW1zIHRoYXQgaXQgaXMgcG9zc2libGUgdG8g
YmUgY2F1c2VkIHRoZSBlcnJvciBiZWZvcmUgdGhlIGNoYW5nZSBhbHNvLgo+IE9oLCBJIHRoaW5r
IHlvdSdyZSByaWdodC4gRGlzcmVnYXJkIG15IHN1Z2dlc3Rpb24gZm9yIHRoZSBvdGhlcgo+IEZp
eGVzOiBlbnRyeSB0aGVuLgpUaGFua3MgZm9yIHRoZSBjb25maXJtYXRpb24uCj4KPj4gQnkgdGhl
IHdheSBjb3VsZCB5b3UgcGxlYXNlIHRyeSB0byB0ZXN0IHRoZSB2ZXJzaW9uIDUgcGF0Y2hlcyBh
Z2Fpbj8KPiBKdXN0IGRpZCBzbyBmb3IgdjcuIFNvcnJ5IGZvciB0aGUgZGVsYXkuCgpUaGFuayB5
b3Ugc28gbXVjaCBmb3IgeW91ciBoZWxwLiBTb3JyeSBJIG1pc3NlZCB0byBjYyBvbiB2ZXJzaW9u
IDUgdG8gCnZlcnNpb24gNyBwYXRjaGVzLgoKUmVnYXJkcywKSWtlZ2FtaQoKPgo+IENoZWVycywK
PiBBaG1hZAo+Cj4+IFJlZ2FyZHMsCj4+IElrZWdhbWkKPj4KPj4+IFRoYW5rcywKPj4+IEFobWFk
Cj4+Pgo+Pj4KPj4+Pj4+IE9uZSB3YXkgdG8gc29sdmUgdGhlIGlzc3VlIGlzIHRvIHJldmVydCB0
aGUgY2hhbmdlCj4+Pj4+PiBwYXJ0aWFsbHkgdG8gdXNlIGNoaXBfcmVhZHkgZm9yIFMyOUdMMDY0
Ti4KPj4+Pj4+Cj4+Pj4+PiBbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci9iNjg3YzI1OS02
NDEzLTI2YzktZDRjOS1iM2FmYTY5ZWExMjRAcGVuZ3V0cm9uaXguZGUvCj4+Pj4+Pgo+Pj4+Pj4g
Rml4ZXM6IGRmZWFlMTA3MzU4MygibXRkOiBjZmlfY21kc2V0XzAwMDI6IENoYW5nZSB3cml0ZSBi
dWZmZXIgdG8gY2hlY2sgY29ycmVjdCB2YWx1ZSIpCj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBUb2t1
bm9yaSBJa2VnYW1pIDxpa2VnYW1pLnRAZ21haWwuY29tPgo+Pj4+Pj4gVGVzdGVkLWJ5OiBBaG1h
ZCBGYXRvdW0gPGEuZmF0b3VtQHBlbmd1dHJvbml4LmRlPgo+Pj4+Pj4gQ2M6IHN0YWJsZUB2Z2Vy
Lmtlcm5lbC5vcmcKPj4+Pj4+IC0tLQo+Pj4+Pj4gIMKgIGRyaXZlcnMvbXRkL2NoaXBzL2NmaV9j
bWRzZXRfMDAwMi5jIHwgMjUgKysrKysrKysrKysrKysrKysrKysrLS0tLQo+Pj4+Pj4gIMKgIDEg
ZmlsZSBjaGFuZ2VkLCAyMSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+Pj4+Pj4KPj4+
Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9jaGlwcy9jZmlfY21kc2V0XzAwMDIuYyBiL2Ry
aXZlcnMvbXRkL2NoaXBzL2NmaV9jbWRzZXRfMDAwMi5jCj4+Pj4+PiBpbmRleCBlNjhkZGYwZjdm
YzAuLjZjNTdmODVlMWI4ZSAxMDA2NDQKPj4+Pj4+IC0tLSBhL2RyaXZlcnMvbXRkL2NoaXBzL2Nm
aV9jbWRzZXRfMDAwMi5jCj4+Pj4+PiArKysgYi9kcml2ZXJzL210ZC9jaGlwcy9jZmlfY21kc2V0
XzAwMDIuYwo+Pj4+Pj4gQEAgLTg2Niw2ICs4NjYsMjMgQEAgc3RhdGljIGludCBfX3hpcHJhbSBj
aGlwX2NoZWNrKHN0cnVjdCBtYXBfaW5mbyAqbWFwLCBzdHJ1Y3QgZmxjaGlwICpjaGlwLAo+Pj4+
Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoCBjaGlwX2NoZWNrKG1hcCwgY2hpcCwgYWRkciwgJmRhdHVt
KTsgXAo+Pj4+Pj4gIMKgwqDCoMKgwqAgfSkKPj4+Pj4+ICDCoCArc3RhdGljIGJvb2wgX194aXBy
YW0gY2ZpX3VzZV9jaGlwX3JlYWR5X2Zvcl93cml0ZShzdHJ1Y3QgbWFwX2luZm8gKm1hcCkKPj4+
Pj4gQXQgdGhlIHZlcnkgbGVhc3QgSSB3b3VsZCBjYWxsIHRoaXMgZnVuY3Rpb246Cj4+Pj4+IGNm
aV91c2VfY2hpcF9yZWFkeV9mb3Jfd3JpdGVzKCkKPj4+Pj4KPj4+Pj4gWWV0LCBJIHN0aWxsIGRv
bid0IGZ1bGx5IGdldCB3aGF0IGNoaXBfcmVhZHkgaXMgdmVyc3VzIGNoaXBfZ29vZC4KPj4+Pj4K
Pj4+Pj4+ICt7Cj4+Pj4+PiArwqDCoMKgIHN0cnVjdCBjZmlfcHJpdmF0ZSAqY2ZpID0gbWFwLT5m
bGRydl9wcml2Owo+Pj4+Pj4gKwo+Pj4+Pj4gK8KgwqDCoCByZXR1cm4gY2ZpLT5tZnIgPT0gQ0ZJ
X01GUl9BTUQgJiYgY2ZpLT5pZCA9PSAweDBjMDE7Cj4+Pj4+PiArfQo+Pj4+Pj4gKwo+Pj4+Pj4g
K3N0YXRpYyBpbnQgX194aXByYW0gY2hpcF9nb29kX2Zvcl93cml0ZShzdHJ1Y3QgbWFwX2luZm8g
Km1hcCwKPj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1
Y3QgZmxjaGlwICpjaGlwLCB1bnNpZ25lZCBsb25nIGFkZHIsCj4+Pj4+PiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbWFwX3dvcmQgZXhwZWN0ZWQpCj4+Pj4+PiArewo+
Pj4+Pj4gK8KgwqDCoCBpZiAoY2ZpX3VzZV9jaGlwX3JlYWR5X2Zvcl93cml0ZShtYXApKQo+Pj4+
Pj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiBjaGlwX3JlYWR5KG1hcCwgY2hpcCwgYWRkcik7Cj4+
Pj4+IElmIHBvc3NpYmxlIGFuZCBub3QgdG9vIGludmFzaXZlIEkgd291bGQgZGVmaW5pdGVseSBh
ZGQgYSAicXVpcmtzIiBmbGFnCj4+Pj4+IHNvbWV3aGVyZSBpbnN0ZWFkIG9mIHRoaXMgY2ZpX3Vz
ZV9jaGlwX3JlYWR5X2Zvcl93cml0ZSgpIGNoZWNrLgo+Pj4+Pgo+Pj4+PiBBbnl3YXksIEkgd291
bGQgbW92ZSB0aGlzIHRvIHRoZSBjaGlwX2dvb2QoKSBpbXBsZW1lbnRhdGlvbiBkaXJlY3RseSBz
bwo+Pj4+PiB3ZSBwYXJ0aWFsbHkgaGlkZSB0aGUgcXVpcmtzIGNvbXBsZXhpdHkgZnJvbSB0aGUg
Y29yZS4KPj4+PiBZZWFoLCB1bmZvcnR1bmF0ZWx5IHRoaXMgZHJpdmVyIGRvZXMgbm90IHVzZSBx
dWlyayBmbGFncyBhbmQgdGVuZHMgdG8KPj4+PiBoaWRlIHF1aXJrcyBiZWhpbmQgYm9vbCBmdW5j
dGlvbnMgbGlrZSBhYm92ZQo+Pj4+Cj4+Pj4gUmVnYXJkcwo+Pj4+IFZpZ25lc2gKPj4+Pgo+Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
