Return-Path: <SRS0=SuWK=44=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 789ABC10F27
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Mar 2020 13:08:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B5E624680
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Mar 2020 13:08:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BqjSBjIY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4B5E624680
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=74j20Rkg4MimVrtbPxvgDOs4m/kY2+EUdtJJvy2p+Zk=; b=BqjSBjIYsIdw9x
	+HpVoulZdYN54xE6eokcnIs5J0nAbeYkfVXYY9OQupC83KY4H1TZPq/vG1B7ZHzn8Sa90qRVcyARb
	+kitZLNsBKRxoHlKqih8paQPm6WRb9MgbmElL0mVGJCgBPj863N6QwejqJwOw3dInJ2AOLLyt+lqO
	ilaQGeFKuga5esKDSrOT2FXxwBGlzUiBQVJJnh0pQ7LHRgBvEZtByxEZsJFSCgXZm0mUdrba2P29D
	1eprKITSsYXFTFmZgcFTUoe9oIBlQaBEKwcvWSfCFWRMRfmBqd2XjDsK40VcsPZYJjPtbMnRoMt7v
	H+8wmb1Gw02XL6P+zcvA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jC15x-0004kM-FH; Wed, 11 Mar 2020 13:08:21 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jC15t-0004iM-Om
 for linux-mtd@lists.infradead.org; Wed, 11 Mar 2020 13:08:20 +0000
Received: from xps13 (lfbn-tou-1-1473-158.w90-89.abo.wanadoo.fr [90.89.41.158])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 1775B100008;
 Wed, 11 Mar 2020 13:08:07 +0000 (UTC)
Date: Wed, 11 Mar 2020 14:08:07 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH] Revert "mtd: rawnand: denali: get
 ->setup_data_interface() working again"
Message-ID: <20200311140807.6f56baf3@xps13>
In-Reply-To: <d4b4abf4-1af9-d57c-5b93-2d56a5dc456b@denx.de>
References: <20200205070834.3087104-1-marex@denx.de>
 <45a10680-5fe6-7cab-a7ef-f7f7a952e822@denx.de>
 <20200205105045.6877aca6@xps13>
 <bdb54ba5-648a-0b79-661c-5eb9604a1ee5@denx.de>
 <b6f094b7-01a9-34a2-bf10-019a05bc7cb3@denx.de>
 <20200211170707.2183625e@xps13>
 <b1a10583-e110-9568-4007-aa2b3f38a7be@denx.de>
 <CAK7LNARqYDh4AJ+N-PTHui0H89-humECskJVUxW4cTf6edEBMQ@mail.gmail.com>
 <f4e2deeb-cc0e-fb06-46fa-d6cf4f2a73ad@denx.de>
 <CAK7LNAR4MU+Rfmpz99iwLuEbD4jMwUdh91uz3zyQdvjyLEQcMQ@mail.gmail.com>
 <29cce21c-2214-7238-0bc5-db2c1a54576f@denx.de>
 <CAK7LNASckTZO-9uVjtQH8iKhU0HH9WiMK-CzMxjESQOOUM0cKA@mail.gmail.com>
 <CAK7LNAT3EG0XocC0xT0f=6MBpXLga3FehOjEYbRyP6AJUbqb2Q@mail.gmail.com>
 <311cdc3c-59b5-a46b-62f0-e78fc970134a@denx.de>
 <CAK7LNAT1Bzs68X8PiWQHg4g2bpPGd-WM9D4vwf59XfwwLVuVQQ@mail.gmail.com>
 <e86925d0-805c-d364-57ca-6400b77cffd7@denx.de>
 <CAK7LNARDp1Zru3_XAQyBZHwsRov-QWOnrrwodS8pjszsKy2ysw@mail.gmail.com>
 <d4b4abf4-1af9-d57c-5b93-2d56a5dc456b@denx.de>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200311_060818_075650_A36A07AA 
X-CRM114-Status: GOOD (  17.76  )
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
Cc: Dinh Nguyen <dinguyen@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 linux-mtd <linux-mtd@lists.infradead.org>, Tim Sander <tim@krieglstein.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWFyZWssCgpNYXJlayBWYXN1dCA8bWFyZXhAZGVueC5kZT4gd3JvdGUgb24gV2VkLCAxMSBN
YXIgMjAyMCAxMzo1MjozMCArMDEwMDoKCj4gT24gMy85LzIwIDExOjI3IEFNLCBNYXNhaGlybyBZ
YW1hZGEgd3JvdGU6Cj4gPiBIaS4gIAo+IAo+IEhpLAo+IAo+IFsuLi5dCj4gCj4gPj4+PiBTZWUg
YXR0YWNoZWQgcGF0Y2gsIHdpdGggd2hpY2ggKHdpdGhvdXQgdGhpcyByZXZlcnQpIHlvdSBnZXQg
dGhpczoKPiA+Pj4+IGRlbmFsaS0+cmVnICsgVFdIUjJfQU5EX1dFXzJfUkUgPSAweDAwMDAxNDE0
IC0+IDB4MDAwMDE0M2YKPiA+Pj4+IGRlbmFsaS0+cmVnICsgVENXQVdfQU5EX0FERFJfMl9EQVRB
ID0gMHgwMDAwMTQzZiAtPiAweDAwMDAxNDMyCj4gPj4+PiBkZW5hbGktPnJlZyArIFJFXzJfV0Ug
PSAweDAwMDAwMDE0IC0+IDB4MDAwMDAwMTkKPiA+Pj4+IGRlbmFsaS0+cmVnICsgQUNDX0NMS1Mg
PSAweDAwMDAwMDA0IC0+IDB4MDAwMDAwMDUKPiA+Pj4+IGRlbmFsaS0+cmVnICsgUkRXUl9FTl9M
T19DTlQgPSAweDAwMDAwMDAyIC0+IDB4MDAwMDAwMDkKPiA+Pj4+IGRlbmFsaS0+cmVnICsgUkRX
Ul9FTl9ISV9DTlQgPSAweDAwMDAwMDAyIC0+IDB4MDAwMDAwMDQKPiA+Pj4+IGRlbmFsaS0+cmVn
ICsgQ1NfU0VUVVBfQ05UID0gMHgwMDAwMDAwMSAtPiAweDAwMDAwMDA4Cj4gPj4+PiBkZW5hbGkt
PnJlZyArIFJFXzJfUkUgPSAweDAwMDAwMDE0IC0+IDB4MDAwMDAwMTkgIAo+ID4+Pgo+ID4+PiBP
SywgdGhlIGxlZnQtaGFuZCBzaWRlIGlzIHByb2JhYmx5IHRoZSB0aW1pbmcKPiA+Pj4gc2V0IHVw
IGJ5IFUtQm9vdC4gIAo+ID4+Cj4gPj4gWWVwLCB0aGUgdGltaW5ncyB0aGF0IHdvcmsuIFNvIG5v
dywgaG93IGRvIHlvdSBnZXQgdG8gdGhvc2Ugd29ya2luZwo+ID4+IHRpbWluZ3MgdXNpbmcgdGhl
IExpbnV4IGRyaXZlciA/ICAKPiA+IAo+ID4gCj4gPiBIb3cgYWJvdXQKPiA+IDAwMDEtZGVuYWxp
LW1vcmUtY29tcGxpY2F0ZWQtY2FsY3VsYXRpb24tZm9yLXRpbWluZ3MucGF0Y2gKPiA+IAo+ID4g
KyBmb2xsb3dpbmcgPwo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcv
ZGVuYWxpLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9kZW5hbGkuYwo+ID4gaW5kZXggYjA0ODIx
MDhhMTI3Li5lYTM4YWE0Mjg3M2UgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jh
dy9kZW5hbGkuYwo+ID4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvZGVuYWxpLmMKPiA+IEBA
IC04NjAsOSArODYwLDkgQEAgc3RhdGljIGludCBkZW5hbGlfc2V0dXBfZGF0YV9pbnRlcmZhY2Uo
c3RydWN0Cj4gPiBuYW5kX2NoaXAgKmNoaXAsIGludCBjaGlwbnIsCj4gPiAKPiA+ICAgICAgICAg
LyoKPiA+ICAgICAgICAgICogRGV0ZXJtaW5lIHRoZSBtaW5pbXVtIG9mIGFjY19jbGtzIHRvIG1l
ZXQgdGhlIGRhdGEgc2V0dXAgdGltaW5nLgo+ID4gLSAgICAgICAgKiAob25lIGFkZGl0aW9uYWwg
Y2xvY2sgY3ljbGUganVzdCBpbiBjYXNlKQo+ID4gKyAgICAgICAgKiAodHdvIGFkZGl0aW9uYWwg
Y2xvY2sgY3ljbGVzIGp1c3QgaW4gY2FzZSkKPiA+ICAgICAgICAgICovCj4gPiAtICAgICAgIGFj
Y19jbGtzID0gRElWX1JPVU5EX1VQKHRpbWluZ3MtPnRSRUFfbWF4LCB0X3gpICsgMTsKPiA+ICsg
ICAgICAgYWNjX2Nsa3MgPSBESVZfUk9VTkRfVVAodGltaW5ncy0+dFJFQV9tYXgsIHRfeCkgKyAy
Owo+ID4gCj4gPiAgICAgICAgIC8qIERldGVybWluZSB0aGUgbWluaW11bSBvZiByZHdyX2VuX2xv
X2NudCBmcm9tIFJFIy9XRSMgcHVsc2Ugd2lkdGggKi8KPiA+ICAgICAgICAgcmR3cl9lbl9sbyA9
IERJVl9ST1VORF9VUChtYXgodGltaW5ncy0+dFJQX21pbiwgdGltaW5ncy0+dFdQX21pbiksIHRf
eCk7ICAKPiAKPiBMaWtlIHRoZSBhdHRhY2hlZCBvbmUgPwo+IAo+IFRoYXQgc2VlbXMgdG8gd29y
aywgYnV0IC0tIHRoZSBjYWxjdWxhdGVkIHRpbWluZ3MgZGlmZmVyIGZyb20gdGhlIG9uZXMKPiB3
aGljaCBhcmUgY2FsY3VsYXRlZCBieSBVLUJvb3QgYW5kIHdoaWNoIHdlcmUgdGVzdGVkIHRvIHdv
cmsgd2VsbC4KPiBUaGF0J3Mgbm90IGdvb2QsIEkgd291bGQgZXhwZWN0IGJvdGggdGltaW5ncyB0
byBiZSBpZGVudGljYWw6CgpUaGVyZSBpcyBubyBzdWNoICJ0aW1pbmdzIHRlc3RlZCB0byB3b3Jr
IHdlbGwiLiBUaW1pbmdzIHJlcHJlc2VudAptaW5pbXVtIGFuZCBtYXhpbXVtIHZhbHVlcyBmb3Ig
Y2VydGFpbiBvcGVyYXRpb25zIG9uIHRoZSBOQU5EIGJ1cywgeW91CmNhbiBoYXZlIHR3byBkaWZm
ZXJlbnQgdmFsdWVzIHRoYXQgd2lsbCBib3RoIHdvcmsgaW4gdGhlIHNhbWUKY29uZGl0aW9uLiBB
bmQgaXQgaXMgZXhwZWN0ZWQgdGhhdCBMaW51eCBpcyBtb3JlIGNsZXZlciB0aGFuIFUtQm9vdCBh
bmQKbWF5IG9wdGltaXplIGJldHRlciB0aGUgdGltaW5ncyBkZXBlbmRpbmcgb24gdGhlIHNlbGVj
dGVkIG1vZGUgKFswLTVdKQooaGVuY2UgdGhlIGRpZmZlcmVudCBjYWxscyB0byAtPnNldHVwX2Rh
dGFfaW50ZXJmYWNlKCkuCgpSdW4gYSBzdHJlc3MgdGVzdCwgaWYgaXQgcGFzc2VzLCB5b3Ugc2hv
dWxkIGJlIGdvb2QgOikKClRoYW5rcywKTWlxdcOobAoKPiAgRGVuYWxpOiBjbGtfcmF0ZT0zMTI1
MDAwMCwgY2xrX3hfcmF0ZT0xMjUwMDAwMDAKPiAgRGVuYWxpOiB0UkVBPTQwMDAwCj4gIERlbmFs
aTogdFJIVz0yMDAwMDAKPiAgRGVuYWxpOiB0UkhaPTIwMDAwMAo+ICBEZW5hbGk6IHRDQ1M9NTAw
MDAwMDAwCj4gIERlbmFsaTogdFdIUj0xMjAwMDAKPiAgRGVuYWxpOiB0QURMPTQwMDAwMAo+ICBE
ZW5hbGk6IHRSRUg9MzAwMDAKPiAgRGVuYWxpOiB0V0g9MzAwMDAKPiAgRGVuYWxpOiB0UlA9NTAw
MDAKPiAgRGVuYWxpOiB0V1A9NTAwMDAKPiAgRGVuYWxpOiB0UkM9MTAwMDAwCj4gIERlbmFsaTog
dFdDPTEwMDAwMAo+ICBEZW5hbGk6IHRDUz03MDAwMAo+ICBEZW5hbGk6IHRDRUE9MTAwMDAwCj4g
IERlbmFsaTogYWNjX2Nsa3M9OAo+ICBEZW5hbGk6IHJlXzJfd2U9MjUKPiAgRGVuYWxpOiByZV8y
X3JlPTI1Cj4gIERlbmFsaTogd2VfMl9yZT02Mwo+ICBEZW5hbGk6IGFkZHJfMl9kYXRhPTUwCj4g
IERlbmFsaTogcmR3cl9lbl9oaT00Cj4gIERlbmFsaTogcmR3cl9lbl9sb19oaT0xMwo+ICBEZW5h
bGk6IHJkd3JfZW5fbG89OQo+ICBEZW5hbGk6IGNzX3NldHVwPTUKPiAKPiAgZGVuYWxpLT5yZWcg
KyBUV0hSMl9BTkRfV0VfMl9SRSA9IDB4MDAwMDE0MTQgLT4gMHgwMDAwMTQzZgo+ICBkZW5hbGkt
PnJlZyArIFRDV0FXX0FORF9BRERSXzJfREFUQSA9IDB4MDAwMDE0M2YgLT4gMHgwMDAwMTQzMgo+
ICBkZW5hbGktPnJlZyArIFJFXzJfV0UgPSAweDAwMDAwMDE0IC0+IDB4MDAwMDAwMTkKPiAgZGVu
YWxpLT5yZWcgKyBBQ0NfQ0xLUyA9IDB4MDAwMDAwMDQgLT4gMHgwMDAwMDAwOAo+ICBkZW5hbGkt
PnJlZyArIFJEV1JfRU5fTE9fQ05UID0gMHgwMDAwMDAwMiAtPiAweDAwMDAwMDA5Cj4gIGRlbmFs
aS0+cmVnICsgUkRXUl9FTl9ISV9DTlQgPSAweDAwMDAwMDAyIC0+IDB4MDAwMDAwMDQKPiAgZGVu
YWxpLT5yZWcgKyBDU19TRVRVUF9DTlQgPSAweDAwMDAwMDAxIC0+IDB4MDAwMDAwMDUKPiAgZGVu
YWxpLT5yZWcgKyBSRV8yX1JFID0gMHgwMDAwMDAxNCAtPiAweDAwMDAwMDE5Cj4gCj4gIGRlbmFs
aS0+cmVnICsgVFdIUjJfQU5EX1dFXzJfUkUgPSAweDAwMDAxNDNmIC0+IDB4MDAwMDE0M2YKPiAg
ZGVuYWxpLT5yZWcgKyBUQ1dBV19BTkRfQUREUl8yX0RBVEEgPSAweDAwMDAxNDMyIC0+IDB4MDAw
MDE0MzIKPiAgZGVuYWxpLT5yZWcgKyBSRV8yX1dFID0gMHgwMDAwMDAxOSAtPiAweDAwMDAwMDE5
Cj4gIGRlbmFsaS0+cmVnICsgQUNDX0NMS1MgPSAweDAwMDAwMDA4IC0+IDB4MDAwMDAwMDgKPiAg
ZGVuYWxpLT5yZWcgKyBSRFdSX0VOX0xPX0NOVCA9IDB4MDAwMDAwMDkgLT4gMHgwMDAwMDAwOQo+
ICBkZW5hbGktPnJlZyArIFJEV1JfRU5fSElfQ05UID0gMHgwMDAwMDAwNCAtPiAweDAwMDAwMDA0
Cj4gIGRlbmFsaS0+cmVnICsgQ1NfU0VUVVBfQ05UID0gMHgwMDAwMDAwNSAtPiAweDAwMDAwMDA1
Cj4gIGRlbmFsaS0+cmVnICsgUkVfMl9SRSA9IDB4MDAwMDAwMTkgLT4gMHgwMDAwMDAxOQo+IAo+
ICBkZW5hbGktPnJlZyArIFRXSFIyX0FORF9XRV8yX1JFID0gMHgwMDAwMTQzZiAtPiAweDAwMDAx
NDNmCj4gIGRlbmFsaS0+cmVnICsgVENXQVdfQU5EX0FERFJfMl9EQVRBID0gMHgwMDAwMTQzMiAt
PiAweDAwMDAxNDMyCj4gIGRlbmFsaS0+cmVnICsgUkVfMl9XRSA9IDB4MDAwMDAwMTkgLT4gMHgw
MDAwMDAxOQo+ICBkZW5hbGktPnJlZyArIEFDQ19DTEtTID0gMHgwMDAwMDAwOCAtPiAweDAwMDAw
MDA4Cj4gIGRlbmFsaS0+cmVnICsgUkRXUl9FTl9MT19DTlQgPSAweDAwMDAwMDA5IC0+IDB4MDAw
MDAwMDkKPiAgZGVuYWxpLT5yZWcgKyBSRFdSX0VOX0hJX0NOVCA9IDB4MDAwMDAwMDQgLT4gMHgw
MDAwMDAwNAo+ICBkZW5hbGktPnJlZyArIENTX1NFVFVQX0NOVCA9IDB4MDAwMDAwMDUgLT4gMHgw
MDAwMDAwNQo+ICBkZW5hbGktPnJlZyArIFJFXzJfUkUgPSAweDAwMDAwMDE5IC0+IDB4MDAwMDAw
MTkKPiAuLi4KPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
