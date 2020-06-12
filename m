Return-Path: <SRS0=prrA=7Z=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79EE6C433E0
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Jun 2020 07:30:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2CF49207F7
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Jun 2020 07:30:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pxSikTPt";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rWeAMX7R"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2CF49207F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r0WPzgCpdwgpFe4Fy/SpYh8CS5bXbXKTgdoKmOw3gus=; b=pxSikTPtZ7C2rX
	ZGBQ6w6VEf8XgLDWP+XIGl8IJR8MdSPng/gf3vYU8fQs3mDqQdIufp5c8Q88g7T3Zu6+8J53JbxoH
	QVKx7zI3t+B9BLvaahIFc2zneKqXBATNS3dnoHTvFJNMwI8eKtp0gbylfZm5YsEr9OfbOUkM8QKR/
	xfo1OABZRIOE2y+1mPudNb3MeA4wwnzKvTg+UgCzglSW7DZWNeFeu0PhajM4DiBqqBMs/WWQ1G591
	xHf1s+kVCuxJw4hoOfU/Bry0wV/VWoSbuybTgIFWRzJZlweBKuNQfP1fWFLR3HiR7igiOqnkm0MXu
	Ef6dZiaL3qc6N+U9VQbg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jje9C-0001jJ-PM; Fri, 12 Jun 2020 07:30:42 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jje92-0001az-Ru; Fri, 12 Jun 2020 07:30:34 +0000
Received: by mail-wr1-x444.google.com with SMTP id x6so8611992wrm.13;
 Fri, 12 Jun 2020 00:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=DReOUYdztPylpdjVRQA5TEUDA2odSY681B+OMP5uRTY=;
 b=rWeAMX7RKAcqCkHAbOibmoOM7VAOP8tPjp/cnq3Xnm+09GzicRN0Mru1XrfP6VF7+4
 MuzWGXkqGUP2OIoC4rxD7rHykF0TeMPD+pwqnYdkFZDrF0mxNuCjk0N4zJO3aDeP6qzM
 LoIcXPj9LBjbfSqLe/JyIr+jryIFqtw1Uxm2AbgqbNVp0+LyB0vYqfP6kJXle6+m/Xyj
 5Je5+fu/D7jGXvQhE7w3k0pXFw7iqBYFSaOUd7IhkY7XuCeKwOF6Kmkj67atoUT4onb5
 /hcVeY0u5sUBlzdFebIuketD3Uf93uvh9n1PoQILyMTOqA5dGTL/oBNq3Q1H8paDM6qF
 dW4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=DReOUYdztPylpdjVRQA5TEUDA2odSY681B+OMP5uRTY=;
 b=idr+XXnArOpg5u7mrsIwc18SCj2/rE6zu6AGyyyCWuMWktfqIlZckxs6Sn57O09iPU
 tjaoU0fZlJQKvSXUyp3+V0TbgJYQ8Mmpc3Z/5E85HqzCzcSd2rNSHaByZFTeWk+EfVZ5
 z0+RDOqfhypC1XmlcNjFhWyDvGFSFZUp3nIkHZqGBXIPvnd+z9wYwOVieo4n6NyECzGm
 gUZObeUSaZAxJDmDJiSs3KBhGdzJFNWp9lQwAFNFf9DI7INh1AsnernLqy7MQEU9z1U0
 Mk8J4fmgyDCwQlyrkE6BarBqm9AaI0YUWrFevHgFyeae44swcXBuGx2q9trKtakwc3h5
 O0kw==
X-Gm-Message-State: AOAM533Ww7lGYQZML5jYyOpCeOpRHszl2j3LH2bd/gKjDLQGewhW/FgP
 dIaRbEdFwBAlWOvOKWD2v7Q=
X-Google-Smtp-Source: ABdhPJzSOGqZUhra7OujKz+a5rzpu134zvWIrWQQMC++N7mcobmm3qvAGTAzVuouU50UY9fb0qddZA==
X-Received: by 2002:a05:6000:1104:: with SMTP id
 z4mr13360063wrw.272.1591947029285; 
 Fri, 12 Jun 2020 00:30:29 -0700 (PDT)
Received: from macbook-pro-alvaro.lan (28.red-83-49-61.dynamicip.rima-tde.net.
 [83.49.61.28])
 by smtp.gmail.com with ESMTPSA id t188sm7596560wmt.27.2020.06.12.00.30.28
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 12 Jun 2020 00:30:28 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH v2] mtd: parsers: bcm63xx: simplify CFE detection
From: =?utf-8?Q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>
In-Reply-To: <20200612090252.02581c21@xps13>
Date: Fri, 12 Jun 2020 09:30:27 +0200
Message-Id: <CBDB2BF7-07CB-4231-B200-86DE2BFE86A0@gmail.com>
References: <20200608094053.3381512-1-noltari@gmail.com>
 <20200608160649.3717152-1-noltari@gmail.com> <20200611095540.250184d2@xps13>
 <779D37C7-58CB-49AF-8739-C34295B86FC4@gmail.com>
 <715b0947-f4dd-0c04-5c52-5da06c04d665@gmail.com>
 <7DC0E349-1319-47FE-8565-9B30C190EACB@gmail.com>
 <20200612090252.02581c21@xps13>
To: Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200612_003032_901899_18F3C25A 
X-CRM114-Status: GOOD (  18.00  )
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
Cc: Florian Fainelli <f.fainelli@gmail.com>, vigneshr@ti.com, richard@nod.at,
 linus.walleij@linaro.org, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, tsbogend@alpha.franken.de,
 bcm-kernel-feedback-list@broadcom.com, Jonas Gorski <jonas.gorski@gmail.com>,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWlxdcOobCwKCj4gRWwgMTIganVuIDIwMjAsIGEgbGFzIDk6MDIsIE1pcXVlbCBSYXluYWwg
PG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+IGVzY3JpYmnDszoKPiAKPiBIaSDDgWx2YXJvLAo+
IAo+IMOBbHZhcm8gRmVybsOhbmRleiBSb2phcyA8bm9sdGFyaUBnbWFpbC5jb20+IHdyb3RlIG9u
IFRodSwgMTEgSnVuIDIwMjAKPiAxODoxNDoyMCArMDIwMDoKPiAKPj4gSGkgRmxvcmlhbiwKPj4g
Cj4+PiBFbCAxMSBqdW4gMjAyMCwgYSBsYXMgMTc6NDIsIEZsb3JpYW4gRmFpbmVsbGkgPGYuZmFp
bmVsbGlAZ21haWwuY29tPiBlc2NyaWJpw7M6Cj4+PiAKPj4+IAo+Pj4gCj4+PiBPbiA2LzExLzIw
MjAgODoxNiBBTSwgw4FsdmFybyBGZXJuw6FuZGV6IFJvamFzIHdyb3RlOiAgCj4+Pj4gSGkgTWlx
dWVsLAo+Pj4+IAo+Pj4+PiBFbCAxMSBqdW4gMjAyMCwgYSBsYXMgOTo1NSwgTWlxdWVsIFJheW5h
bCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4gZXNjcmliacOzOgo+Pj4+PiAKPj4+Pj4gSGkg
w4FsdmFybywKPj4+Pj4gCj4+Pj4+IMOBbHZhcm8gRmVybsOhbmRleiBSb2phcyA8bm9sdGFyaUBn
bWFpbC5jb20+IHdyb3RlIG9uIE1vbiwgIDggSnVuIDIwMjAKPj4+Pj4gMTg6MDY6NDkgKzAyMDA6
Cj4+Pj4+IAo+Pj4+Pj4gSW5zdGVhZCBvZiB0cnlpbmcgdG8gcGFyc2UgQ0ZFIHZlcnNpb24gc3Ry
aW5nLCB3aGljaCBpcyBjdXN0b21pemVkIGJ5IHNvbWUKPj4+Pj4+IHZlbmRvcnMsIGxldCdzIGp1
c3QgY2hlY2sgdGhhdCAiQ0ZFMSIgd2FzIHBhc3NlZCBvbiBhcmd1bWVudCAzLgo+Pj4+Pj4gCj4+
Pj4+PiBTaWduZWQtb2ZmLWJ5OiDDgWx2YXJvIEZlcm7DoW5kZXogUm9qYXMgPG5vbHRhcmlAZ21h
aWwuY29tPgo+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogSm9uYXMgR29yc2tpIDxqb25hcy5nb3Jza2lA
Z21haWwuY29tPgo+Pj4+Pj4gLS0tCj4+Pj4+PiB2MjogdXNlIENGRV9FUFRTRUFMIGRlZmluaXRp
b24gYW5kIGF2b2lkIHVzaW5nIGFuIGFkZGl0aW9uYWwgZnVudGlvbi4KPj4+Pj4+IAo+Pj4+Pj4g
ZHJpdmVycy9tdGQvcGFyc2Vycy9iY202M3h4cGFydC5jIHwgMjkgKysrKy0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0KPj4+Pj4+IDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDI1IGRl
bGV0aW9ucygtKQo+Pj4+Pj4gCj4+Pj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvcGFyc2Vy
cy9iY202M3h4cGFydC5jIGIvZHJpdmVycy9tdGQvcGFyc2Vycy9iY202M3h4cGFydC5jCj4+Pj4+
PiBpbmRleCA3OGY5MGM2YzE4ZmQuLjQ5M2E3NWIyZjI2NiAxMDA2NDQKPj4+Pj4+IC0tLSBhL2Ry
aXZlcnMvbXRkL3BhcnNlcnMvYmNtNjN4eHBhcnQuYwo+Pj4+Pj4gKysrIGIvZHJpdmVycy9tdGQv
cGFyc2Vycy9iY202M3h4cGFydC5jCj4+Pj4+PiBAQCAtMjIsNiArMjIsOSBAQAo+Pj4+Pj4gI2lu
Y2x1ZGUgPGxpbnV4L210ZC9wYXJ0aXRpb25zLmg+Cj4+Pj4+PiAjaW5jbHVkZSA8bGludXgvb2Yu
aD4KPj4+Pj4+IAo+Pj4+Pj4gKyNpbmNsdWRlIDxhc20vYm9vdGluZm8uaD4KPj4+Pj4+ICsjaW5j
bHVkZSA8YXNtL2Z3L2NmZS9jZmVfYXBpLmg+ICAKPj4+Pj4gCj4+Pj4+IEFyZSB5b3Ugc3VyZSBi
b3RoIGluY2x1ZGVzIGFyZSBuZWVkZWQ/ICAKPj4+PiAKPj4+PiBhc20vYm9vdGluZm8uaCBpcyBu
ZWVkZWQgZm9yIGZ3X2FyZzMgYW5kIGFzbS9mdy9jZmUvY2ZlX2FwaS5oIGlzIG5lZWRlZCBmb3Ig
Q0ZFX0VQVFNFQUwuCj4+Pj4gCj4+Pj4+IAo+Pj4+PiBJIGRvbid0IHRoaW5rIGl0IGlzIGEgZ29v
ZCBoYWJpdCB0byBpbmNsdWRlIGFzbS8gaGVhZGVycywgYXJlIHlvdSBzdXJlCj4+Pj4+IHRoZXJl
IGlzIG5vdCBhbm90aGVyIGhlYWRlciBkb2luZyBpdCBqdXN0IGZpbmU/ICAKPj4+PiAKPj4+PiBC
b3RoIGFyZSBuZWVkZWQgdW5sZXNzIHlvdSB3YW50IHRvIGFkZCBhbm90aGVyIGRlZmluaXRpb24g
b2YgQ0ZFX0VQVFNFQUwgdmFsdWUuCj4+Pj4gVGhlcmUgYXJlIGN1cnJlbnRseSB0d28gQ0ZFIG1h
Z2ljIGRlZmluaXRpb25zLCB0aGUgb25lIGluIGFzbS9mdy9jZmUvY2ZlX2FwaS5oIGFuZCBhbm90
aGVyIG9uZSBpbiBiY200N3h4cGFydC5jOgo+Pj4+IGh0dHBzOi8vZ2l0aHViLmNvbS90b3J2YWxk
cy9saW51eC9ibG9iL21hc3Rlci9hcmNoL21pcHMvaW5jbHVkZS9hc20vZncvY2ZlL2NmZV9hcGku
aCNMMjgKPj4+PiBodHRwczovL2dpdGh1Yi5jb20vdG9ydmFsZHMvbGludXgvYmxvYi9tYXN0ZXIv
ZHJpdmVycy9tdGQvcGFyc2Vycy9iY200N3h4cGFydC5jI0wzMyAgCj4+PiAKPj4+IFRoZSBjYXZl
YXQgd2l0aCB0aGF0IGFwcHJvYWNoIGlzIHRoYXQgdGhpcyByZWR1Y2VzIHRoZSBjb21waWxhdGlv
bgo+Pj4gc3VyZmFjZSB0byBNSVBTIGFuZCBCTUlQU19HRU5FUklDIGFuZCBCQ002M1hYIG9ubHks
IHdoaWNoIGlzIGEgYml0Cj4+PiBzbWFsbC4gSWYgd2UgY291bGQgbW92ZSB0aGUgQ0ZFIGRlZmlu
aXRpb25zIHRvIGEgc2hhcmVkIGhlYWRlciwgYW5kCj4+PiBjb25zb2xpZGF0ZSB0aGUgdmFsdWUg
dXNlZCBieSBiY200N3h4cGFydC5jIGFzIHdlbGwsIHRoYXQgd291bGQgYWxsb3cgdXMKPj4+IHRv
IGJ1aWxkIHRoZSBiY202M3h4cGFydC5jIGZpbGUgd2l0aCBDT01QSUxFX1RFU1Qgb24gb3RoZXIK
Pj4+IGFyY2hpdGVjdHVyZXMuIFRoaXMgZG9lcyBub3QgcmVhbGx5IGhhdmUgZnVuY3Rpb25hbCB2
YWx1ZSwgYnV0IGZvcgo+Pj4gbWFpbnRhaW5lcnMgbGlrZSBNaXF1ZWwsIGl0IGFsbG93cyB0aGVt
IHRvIHF1aWNrbHkgdGVzdCB0aGVpciBlbnRpcmUKPj4+IGRyaXZlcnMvbXRkLyBkaXJlY3Rvcnku
ICAKPj4gCj4+IEkgZG9u4oCZdCB0aGluayBmd19hcmczIGF2YWlsYWJsZSBvbiBub24gbWlwcyBh
cmNocywgaXMgaXQ/Cj4+IEnigJltIGhhcHB5IHRvIG1vdmUgaXQgdG8gYSBzaGFyZWQgaGVhZGVy
ICh3aGljaCB3b3VsZCBiZSBhIGdvb2QgbG9jYXRpb24gZm9yIHRoaXM/KSwgYnV0IGlmIEnigJlt
IHJpZ2h0IGl0IHdvdWxkIHN0aWxsIGJlIHJlc3RyaWN0ZWQgdG8gTUlQUy4KPiAKPiBSZXN0cmlj
dGluZyBhIGRlZmluaXRpb24gdG8gTUlQUywgZXZlbiBpZiBpdCBtYWtlcyBzZW5zZSBmb3IgeW91
IGlzCj4gdmVyeSBsaW1pdGluZyBmb3IgbWUuIEkgbmVlZCB0byBiZSBhYmxlIHRvIGJ1aWxkIGFz
IG11Y2ggZHJpdmVycyBhcyBJCj4gY2FuIGZyb20gbXkgbGFwdG9wIGFuZCB2ZXJpZnkgdGhleSBh
dCBsZWFzdCBjb21waWxlIGNvcnJlY3RseS4gSWYgSSBuZWVkCj4gYSBNSVBTIHRvb2xjaGFpbiwg
YW4gQVJDIHRvb2xjaGFpbiwgYSBQb3dlclBDLCBhbiBBUk0sIGFuIEFSTTY0IGFuZAo+IHdoYXRl
dmVyIG90aGVyIGZ1bmt5IHRvb2xjaGFpbiB0byBkbyBqdXN0IHRoYXQgaW4gWCBzdGVwczogaXQn
cyB2ZXJ5Cj4gcGFpbmZ1bC4gV2UgaGF2ZSBiZWVuIGFkZGluZyBDT01QSUxFX1RFU1QgZGVwZW5k
ZW5jaWVzIG9uIGFzIG11Y2gKPiBkcml2ZXJzIGFzIHdlIGNvdWxkIGFuZCB3ZSB3YW50IHRvIGNv
bnRpbnVlIG1vdmluZyBmb3J3YXJkLiBVc2luZyBzdWNoCj4gaW5jbHVkZSB3b3VsZCBuZWVkIHRv
IGRyb3AgdGhlIENPTVBJTEVfVEVTVCBjb25kaXRpb24gZnJvbSBLY29uZmlnIGFuZAo+IHRoaXMg
aXMgbm90IHNvbWV0aGluZyBJIGFtIHdpbGxpbmcgdG8gZG8uCgpJIHRvdGFsbHkgdW5kZXJzdGFu
ZCBhbmQgYWdyZWUgd2l0aCB5b3VyIHBvaW50LCBidXQgSSBzdGlsbCB0aGluayB0aGF0IHRoZXJl
IGNvdWxkIGJlIGEgc29sdXRpb24gd2hpY2ggd291bGQgYmUgdmFsaWQgZm9yIGJvdGggb2YgdXMu
Cgo+IAo+IFRoYW5rcyBmb3IgeW91ciB1bmRlcnN0YW5kaW5nIDopCgpUaGUgY3VycmVudCB3YXkg
b2YgZGV0ZWN0aW5nIENGRSBpc27igJl0IHRoZSBwcm9wZXIgb25lLgpUaGFuayB5b3UgZm9yIHVu
ZGVyc3RhbmRpbmcgdGhhdCB0b28uCgo+IE1pcXXDqGwKCkJlc3QgcmVnYXJkcywKw4FsdmFyby4K
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
