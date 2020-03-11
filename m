Return-Path: <SRS0=SuWK=44=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85879C10F27
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Mar 2020 13:33:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 579DF20873
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Mar 2020 13:33:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YaBu8UR1";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="HYdwwQZ/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 579DF20873
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oMFKuQgphhiSiHHtBs/vwwzJYyW5vnLtVF3acpgWx34=; b=YaBu8UR1NRGmOa
	0ehJ7ODmbnY4IBIBGQz5kCytICRptcaeLYYakDJPCA3FBFef72iRw1fQOdgxnGKYTwEEmlpJnp2cY
	jvGdooiDvJxO6JDkkS9uiaC36+k3IJn1tDB1w0TEd/2A08UaiDnXQkOckOo1/FX88GqWvCqQ30gnO
	Rov/f7RTQoRIMMnJ6DDlFm2tdKE8yPJIUwHJthp9DB0AZTeqIweVQn75BHk7PYzEBNEQ0/yWFboY5
	aeNzvQjhnncF5QR/5EeR3X7NFyjJR1Gp61SaHCrxknP3Gw5hfPERX8JrWi3SghjUhCMTHjhEDPcJN
	8NMXP6OBWINgcGFweUUQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jC1UR-0006gy-Nn; Wed, 11 Mar 2020 13:33:39 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jC1UP-0006gh-F2
 for linux-mtd@bombadil.infradead.org; Wed, 11 Mar 2020 13:33:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=42OcP4+j7F8u/WTyfG6VE0566XSUnCfO2WF9otUyYJY=; b=HYdwwQZ/ZmZMekXpCHc46IshqQ
 VPPk6q5uuoADjXLRU646Uwl4o9aLIsR0mfrgkcMuJ99cewSUwfcyA1t5cSV2Qp3ncz3OyGX5helqG
 mdP2d90QaSQx30Mk5+XNz8jxFvX+kmWG0QKvDiY1TesxhLS+hbBzceNIgsf8VmUqtP14WFo4lNV74
 YwVVaCOfPcFYsSmWWlxGyFsn0pmQvZmaBKcJicOH6vLihcMlP5rYibaetOZNqED+6yfgUIw+jOOdA
 c3aWl+HQMGBsu2asXJ5+PmogdRJPbcpx39eHwIAS/yXra4MTqJKmhVkOsaMqEeVUuAAzJua8YKkIU
 MCZL8HcQ==;
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jC1UM-0007sE-J1
 for linux-mtd@lists.infradead.org; Wed, 11 Mar 2020 13:33:35 +0000
X-Originating-IP: 90.89.41.158
Received: from xps13 (lfbn-tou-1-1473-158.w90-89.abo.wanadoo.fr [90.89.41.158])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id F3BC01C0017;
 Wed, 11 Mar 2020 13:33:03 +0000 (UTC)
Date: Wed, 11 Mar 2020 14:33:02 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH] Revert "mtd: rawnand: denali: get
 ->setup_data_interface() working again"
Message-ID: <20200311143302.309bf468@xps13>
In-Reply-To: <5fa809a3-cd2b-74de-3615-387232051ae2@denx.de>
References: <20200205070834.3087104-1-marex@denx.de>
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
 <20200311140807.6f56baf3@xps13>
 <5fa809a3-cd2b-74de-3615-387232051ae2@denx.de>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
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
YXIgMjAyMCAxNDoxOToxNyArMDEwMDoKCj4gT24gMy8xMS8yMCAyOjA4IFBNLCBNaXF1ZWwgUmF5
bmFsIHdyb3RlOgo+ID4gSGkgTWFyZWssICAKPiAKPiBIaSBNaXF1ZWwsCj4gCj4gPiBNYXJlayBW
YXN1dCA8bWFyZXhAZGVueC5kZT4gd3JvdGUgb24gV2VkLCAxMSBNYXIgMjAyMCAxMzo1MjozMCAr
MDEwMDoKPiA+ICAgCj4gPj4gT24gMy85LzIwIDExOjI3IEFNLCBNYXNhaGlybyBZYW1hZGEgd3Jv
dGU6ICAKPiA+Pj4gSGkuICAgIAo+ID4+Cj4gPj4gSGksCj4gPj4KPiA+PiBbLi4uXQo+ID4+ICAK
PiA+Pj4+Pj4gU2VlIGF0dGFjaGVkIHBhdGNoLCB3aXRoIHdoaWNoICh3aXRob3V0IHRoaXMgcmV2
ZXJ0KSB5b3UgZ2V0IHRoaXM6Cj4gPj4+Pj4+IGRlbmFsaS0+cmVnICsgVFdIUjJfQU5EX1dFXzJf
UkUgPSAweDAwMDAxNDE0IC0+IDB4MDAwMDE0M2YKPiA+Pj4+Pj4gZGVuYWxpLT5yZWcgKyBUQ1dB
V19BTkRfQUREUl8yX0RBVEEgPSAweDAwMDAxNDNmIC0+IDB4MDAwMDE0MzIKPiA+Pj4+Pj4gZGVu
YWxpLT5yZWcgKyBSRV8yX1dFID0gMHgwMDAwMDAxNCAtPiAweDAwMDAwMDE5Cj4gPj4+Pj4+IGRl
bmFsaS0+cmVnICsgQUNDX0NMS1MgPSAweDAwMDAwMDA0IC0+IDB4MDAwMDAwMDUKPiA+Pj4+Pj4g
ZGVuYWxpLT5yZWcgKyBSRFdSX0VOX0xPX0NOVCA9IDB4MDAwMDAwMDIgLT4gMHgwMDAwMDAwOQo+
ID4+Pj4+PiBkZW5hbGktPnJlZyArIFJEV1JfRU5fSElfQ05UID0gMHgwMDAwMDAwMiAtPiAweDAw
MDAwMDA0Cj4gPj4+Pj4+IGRlbmFsaS0+cmVnICsgQ1NfU0VUVVBfQ05UID0gMHgwMDAwMDAwMSAt
PiAweDAwMDAwMDA4Cj4gPj4+Pj4+IGRlbmFsaS0+cmVnICsgUkVfMl9SRSA9IDB4MDAwMDAwMTQg
LT4gMHgwMDAwMDAxOSAgICAKPiA+Pj4+Pgo+ID4+Pj4+IE9LLCB0aGUgbGVmdC1oYW5kIHNpZGUg
aXMgcHJvYmFibHkgdGhlIHRpbWluZwo+ID4+Pj4+IHNldCB1cCBieSBVLUJvb3QuICAgIAo+ID4+
Pj4KPiA+Pj4+IFllcCwgdGhlIHRpbWluZ3MgdGhhdCB3b3JrLiBTbyBub3csIGhvdyBkbyB5b3Ug
Z2V0IHRvIHRob3NlIHdvcmtpbmcKPiA+Pj4+IHRpbWluZ3MgdXNpbmcgdGhlIExpbnV4IGRyaXZl
ciA/ICAgIAo+ID4+Pgo+ID4+Pgo+ID4+PiBIb3cgYWJvdXQKPiA+Pj4gMDAwMS1kZW5hbGktbW9y
ZS1jb21wbGljYXRlZC1jYWxjdWxhdGlvbi1mb3ItdGltaW5ncy5wYXRjaAo+ID4+Pgo+ID4+PiAr
IGZvbGxvd2luZyA/Cj4gPj4+Cj4gPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jh
dy9kZW5hbGkuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2RlbmFsaS5jCj4gPj4+IGluZGV4IGIw
NDgyMTA4YTEyNy4uZWEzOGFhNDI4NzNlIDEwMDY0NAo+ID4+PiAtLS0gYS9kcml2ZXJzL210ZC9u
YW5kL3Jhdy9kZW5hbGkuYwo+ID4+PiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9kZW5hbGku
Ywo+ID4+PiBAQCAtODYwLDkgKzg2MCw5IEBAIHN0YXRpYyBpbnQgZGVuYWxpX3NldHVwX2RhdGFf
aW50ZXJmYWNlKHN0cnVjdAo+ID4+PiBuYW5kX2NoaXAgKmNoaXAsIGludCBjaGlwbnIsCj4gPj4+
Cj4gPj4+ICAgICAgICAgLyoKPiA+Pj4gICAgICAgICAgKiBEZXRlcm1pbmUgdGhlIG1pbmltdW0g
b2YgYWNjX2Nsa3MgdG8gbWVldCB0aGUgZGF0YSBzZXR1cCB0aW1pbmcuCj4gPj4+IC0gICAgICAg
ICogKG9uZSBhZGRpdGlvbmFsIGNsb2NrIGN5Y2xlIGp1c3QgaW4gY2FzZSkKPiA+Pj4gKyAgICAg
ICAgKiAodHdvIGFkZGl0aW9uYWwgY2xvY2sgY3ljbGVzIGp1c3QgaW4gY2FzZSkKPiA+Pj4gICAg
ICAgICAgKi8KPiA+Pj4gLSAgICAgICBhY2NfY2xrcyA9IERJVl9ST1VORF9VUCh0aW1pbmdzLT50
UkVBX21heCwgdF94KSArIDE7Cj4gPj4+ICsgICAgICAgYWNjX2Nsa3MgPSBESVZfUk9VTkRfVVAo
dGltaW5ncy0+dFJFQV9tYXgsIHRfeCkgKyAyOwo+ID4+Pgo+ID4+PiAgICAgICAgIC8qIERldGVy
bWluZSB0aGUgbWluaW11bSBvZiByZHdyX2VuX2xvX2NudCBmcm9tIFJFIy9XRSMgcHVsc2Ugd2lk
dGggKi8KPiA+Pj4gICAgICAgICByZHdyX2VuX2xvID0gRElWX1JPVU5EX1VQKG1heCh0aW1pbmdz
LT50UlBfbWluLCB0aW1pbmdzLT50V1BfbWluKSwgdF94KTsgICAgCj4gPj4KPiA+PiBMaWtlIHRo
ZSBhdHRhY2hlZCBvbmUgPwo+ID4+Cj4gPj4gVGhhdCBzZWVtcyB0byB3b3JrLCBidXQgLS0gdGhl
IGNhbGN1bGF0ZWQgdGltaW5ncyBkaWZmZXIgZnJvbSB0aGUgb25lcwo+ID4+IHdoaWNoIGFyZSBj
YWxjdWxhdGVkIGJ5IFUtQm9vdCBhbmQgd2hpY2ggd2VyZSB0ZXN0ZWQgdG8gd29yayB3ZWxsLgo+
ID4+IFRoYXQncyBub3QgZ29vZCwgSSB3b3VsZCBleHBlY3QgYm90aCB0aW1pbmdzIHRvIGJlIGlk
ZW50aWNhbDogIAo+ID4gCj4gPiBUaGVyZSBpcyBubyBzdWNoICJ0aW1pbmdzIHRlc3RlZCB0byB3
b3JrIHdlbGwiLiAgCj4gCj4gSG1tbSwgdGhlIGJvYXJkIHdlbnQgdGhyb3VnaCBmdWxsIHRlbXBl
cmF0dXJlIHJhbmdlIHRlc3RpbmcgaW4gYSBjaGFtYmVyCj4gd2l0aCB0aG9zZSB0aW1pbmdzIGFu
ZCBwYXNzZWQsIGFuZCB0aGVyZSBhcmUgYm9hcmRzIHdpdGggdGhvc2UgZXhhY3QKPiB0aW1pbmdz
IGRlcGxveWVkIGZvciB5ZWFycyBub3cgd2l0aCBvbGRlciBrZXJuZWwgdmVyc2lvbiwgd2hpY2gg
d29yawo+IHRvby4gU28gSSB3b3VsZCBleHBlY3QgdGhleSBhcmUgZ29vZCBhbmQgInRpbWluZ3Mg
dGVzdGVkIHRvIHdvcmsgd2VsbCIuCj4gCj4gPiBUaW1pbmdzIHJlcHJlc2VudAo+ID4gbWluaW11
bSBhbmQgbWF4aW11bSB2YWx1ZXMgZm9yIGNlcnRhaW4gb3BlcmF0aW9ucyBvbiB0aGUgTkFORCBi
dXMsIHlvdQo+ID4gY2FuIGhhdmUgdHdvIGRpZmZlcmVudCB2YWx1ZXMgdGhhdCB3aWxsIGJvdGgg
d29yayBpbiB0aGUgc2FtZQo+ID4gY29uZGl0aW9uLiBBbmQgaXQgaXMgZXhwZWN0ZWQgdGhhdCBM
aW51eCBpcyBtb3JlIGNsZXZlciB0aGFuIFUtQm9vdCAgCj4gCj4gRXJyciwgd2h5ID8KCkJlY2F1
c2Ugc29tZXRpbWVzIHBlb3BsZSB3cml0ZSBzaW1wbGVyIGRyaXZlciBpbiBVLUJvb3QsIG9yIGV2
ZW4KaGFyZGNvZGVkIHZhbHVlcy4KCkkgY2hlY2tlZCB0aGUgZGVuYWxpIGRyaXZlciBhbmQgaW5k
ZWVkIHUtYm9vdCBzaG91bGQgbm90IGJlIG11Y2ggY2xldmVyCnRoYW4gTGludXguIEFyZSB0aGUg
ZGlmZmVyZW5jZXMgc2lnbmlmaWNhbnQ/IFRoZSBjb2RlIGlzIHNvIGNsb3NlLCB5b3UKY2FuIHBy
b2JhYmx5IGNoZWNrIHdoeSB5b3UgaGF2ZSBkaWZmZXJlbmNlcy4gQWxzbyB2ZXJpZnkgdGhhdCB0
aGUgc2FtZQpPTkZJIG1vZGUgaXMgdXNlZC4KCj4gCj4gPiBhbmQKPiA+IG1heSBvcHRpbWl6ZSBi
ZXR0ZXIgdGhlIHRpbWluZ3MgZGVwZW5kaW5nIG9uIHRoZSBzZWxlY3RlZCBtb2RlIChbMC01XSkK
PiA+IChoZW5jZSB0aGUgZGlmZmVyZW50IGNhbGxzIHRvIC0+c2V0dXBfZGF0YV9pbnRlcmZhY2Uo
KS4gIAo+IAo+IEkgd291bGQgZXhwZWN0IHRob3NlIHR3byBzaG91bGQgcHJvZHVjZSBpZGVudGlj
YWwgdGltaW5nIHBhcmFtZXRlcnMsCj4gcGVyaW9kLCBvdGhlcndpc2Ugb25lIG9yIHRoZSBvdGhl
ciBpcyB3cm9uZy4gVGh1cyBmYXIsIGl0IHdhcyBMaW51eCB0aGF0Cj4gcHJvZHVjZWQgbm9uLXdv
cmtpbmcgcmVzdWx0cy4KCkFnYWluLCB3ZSBkZWZpbmUgbWluaW11bSBhbmQgbWF4aW11bSBkZWxh
eXMuIElmIHRoZSByaWdodCB0aGluZyBpcyB0bwpub3Qgd2FpdCBtb3JlIHRoYW4gNXVzIGFuZCB5
b3Ugd2FpdCB1cCB0byA2LCBpdCBkb2VzIG5vdCBtZWFuIHlvdQp3cm90ZSAiYmFkIHRpbWluZ3Mi
LiA0dXMgd291bGQgYmUgYSBiYWQgdGltaW5nIHRob3VnaC4gSXQgZGVwZW5kcyBvbgp3aGF0IHlv
dSBhcmUgbG9va2luZyBhdC4KCj4gCj4gPiBSdW4gYSBzdHJlc3MgdGVzdCwgaWYgaXQgcGFzc2Vz
LCB5b3Ugc2hvdWxkIGJlIGdvb2QgOikgIAo+IAo+IFRoYW5rIHlvdSBmb3IgdGhlIGhpbnQsIEkg
dGhpbmsgdGhlIHN0cmVzcyB0ZXN0IHRodXMgZmFyIGNvdWxkIGJlCj4gY29uc2lkZXJlZCBzdWZm
aWNpZW50LiBJIGd1ZXNzIHdlIGNhbiBhZ3JlZSBvbiB0aGF0ID8KCk9oIHllYWggYWJzb2x1dGVs
eSA6KQoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
