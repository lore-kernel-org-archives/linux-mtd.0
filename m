Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80883D41C1F
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Nov 2024 09:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N/iFlmzaVK/1YFBBXN2auEHeJ8FTfzjisz2MPSmvy2s=; b=VEmnZR81aQS0Zn
	5XvIKWHPqBp4Z2JCRKrTAq5/Ps5vpeRhLDAEC205xDLgLJALupNgiSXwKYq3TkS/rYvDaWrJXfFBW
	ngNCwOzFRFUsTOrf6/FVX8mmwj5sKr4om3ZggyBvAcd5e5X00NFRLOHmXTq1VBPdGwaeZXk9HVvGV
	mVMQ9ZAUIIew9OaepCtOIgV37sbf+Tr6LvHUGaYGVsXlXBN/5AxaC1xQIu34h4lDeBY9o0oW8F2Xm
	R1qpIZVzGayDq4A6M2uKr/elLNtccaqdr3H5f8XDeKvnPKNjYKHKvYt6z8oU8ZOUKZS4IqKymt/8A
	wYQhLQpk0cIc5n+u5xHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tB9N1-00000006CGi-1lMp;
	Wed, 13 Nov 2024 09:09:03 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tB9JU-00000006BMw-2mZj
	for linux-mtd@lists.infradead.org;
	Wed, 13 Nov 2024 09:05:26 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id DAD4E1BF207;
	Wed, 13 Nov 2024 09:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731488718;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4pzdwduV3E3sigQDNHbRFtsN90uitBQ9OIl63oA0zQQ=;
	b=HVYdKZtuLWrNKSapXa9VCXfCH6r+MAmzEwmShfrOhvPLsAbvhXcD0muMG5UtO3f4/ANMsN
	6g6GOogMHuyn9IGA5d0GY7YrifedGpnMOSEOpul/5wSVdwW2gbGWrVTpiw+J3QY++9j167
	sWRLuCtOxpWGwS/0NlY8QAdVOMZuaLEWDsb5HuaDXDw9T1n8I3thbqX+Vi5WCsusI88keS
	0MfahMs9YyK6CANycALk1uhUQJmIQWb5IEnsotzxJuBe+oZtjKuNLEEwQ2ip9inuI6bx6Q
	g0BbE47tZFc5u7FS/kP5Kz720bZNqAsSJme5VKHTZ6liT4sIn1MWLt2Lx6tT4w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: SkyLake Huang (=?utf-8?B?6buD5ZWf5r6k?=) <SkyLake.Huang@mediatek.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
  "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
  "mmkurbanov@salutedevices.com" <mmkurbanov@salutedevices.com>,
  "kernel@sberdevices.ru" <kernel@sberdevices.ru>,  "d-gole@ti.com"
 <d-gole@ti.com>,  "dev@kicherer.org" <dev@kicherer.org>,
  "gch981213@gmail.com" <gch981213@gmail.com>,  "vigneshr@ti.com"
 <vigneshr@ti.com>,  "richard@nod.at" <richard@nod.at>
Subject: Re: [PATCH v2] mtd: spinand: add support for FORESEE F35SQA002G
In-Reply-To: <12f4d28f3efb7fe319ec919df92145c4ad24da01.camel@mediatek.com>
	("SkyLake Huang =?utf-8?B?KOm7g+WVn+a+pCkiJ3M=?= message of "Tue, 12 Nov
 2024 11:25:25
	+0000")
References: <20241108163455.885-1-SkyLake.Huang@mediatek.com>
	<20241108163455.885-4-SkyLake.Huang@mediatek.com>
	<dbdb45ed1135e73b4eebd76e6f61b96d48aaedc6.camel@mediatek.com>
	<87ikssu3qq.fsf@bootlin.com>
	<12f4d28f3efb7fe319ec919df92145c4ad24da01.camel@mediatek.com>
User-Agent: mu4e 1.12.1; emacs 29.4
Date: Wed, 13 Nov 2024 10:05:17 +0100
Message-ID: <87h68bsdv6.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_010525_239901_FF68108A 
X-CRM114-Status: GOOD (  17.46  )
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

T24gMTIvMTEvMjAyNCBhdCAxMToyNToyNSBHTVQsIFNreUxha2UgSHVhbmcgKOm7g+WVn+a+pCkg
PFNreUxha2UuSHVhbmdAbWVkaWF0ZWsuY29tPiB3cm90ZToKCj4gT24gVHVlLCAyMDI0LTExLTEy
IGF0IDExOjQ4ICswMTAwLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+PiBFeHRlcm5hbCBlbWFpbCA6
IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bnRpbAo+PiB5
b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRoZSBjb250ZW50Lgo+PiAKPj4gCj4+IEhp
IFNreSwKPj4gCj4+IE9uIDEyLzExLzIwMjQgYXQgMTA6MDg6MzEgR01ULCBTa3lMYWtlIEh1YW5n
ICjpu4PllZ/mvqQpIDwKPj4gU2t5TGFrZS5IdWFuZ0BtZWRpYXRlay5jb20+IHdyb3RlOgo+PiAK
Pj4gPiBIaSBNaXF1ZWwvTWFydGluLAo+PiA+IEFib3V0IHRoaXMgZHJpdmVyLCBpbmNsdWRpbmcg
RjM1U1FBMDAxRy9GMzVTUUEwMDJHIHBhcnRzLCBJJ20KPj4gPiBjb25jZXJuZWQKPj4gPiB0aGF0
IHRoZSBkcml2ZXIgd2lsbCBhbHdheXMgdXNlIDMySCBmb3IgdXBkYXRlX2NhY2hlIG9wZXJhdGlv
bnMsCj4+ID4gd2hpY2gKPj4gPiBtZWFucyBpdCdzIG5vdCBjb21waXRhYmxlIHdpdGggdGhvc2Ug
U1BJIGNvbnRyb2xsZXIgd2hvIGNhbid0Cj4+ID4gdHJhbnNtaXQKPj4gPiAyMDQ4IGJ5dGVzICht
b3N0IHNtYWxsLWRlbnNpdHkgU1BJLU5BTkQncyBwYWdlIHNpemUgbm93YWRheXMpIGF0Cj4+ID4g
b25lCj4+ID4gdGltZS4KPj4gPiAKPj4gPiBUaGUgZm9sbG93aW5nIGNvbnRyb2xsZXIncyBkcml2
ZXIgc2VlbXMgdGhhdCB0aGV5IGNhbid0IHRyYW5zbWl0Cj4+ID4gMjA0OAo+PiA+IGJ5dGVzIGlu
IG9uZSB0cmFuc21pc3Npb246Cj4+ID4gLSBzcGktYW1kLmM6IDY0IGJ5dGVzIChBTURfU1BJX01B
WF9EQVRBKQo+PiA+IC0gc3BpLWFtbG9naWMtc3BpZmMtYTEuYzogNTEyIGJ5dGVzIChTUElGQ19B
MV9CVUZGRVJfU0laRSkKPj4gPiAtIHNwaS1mc2wtcXNwaS5jOiAxS0IKPj4gPiAtIHNwaS1oaXNp
LXNmYy12M3h4LmM6IDY0KjYgYnl0ZXMKPj4gPiAtIHNwaS1pbnRlbC5jOiA2NCBieXRlcyAoSU5U
RUxfU1BJX0ZJRk9fU1opCj4+ID4gLSBzcGktbWljcm9jaGlwLWNvcmUtcXNwaS5jOiAyNTYgYnl0
ZXNjIChNQVhfREFUQV9DTURfTEVOKQo+PiA+IC0gc3BpLW54cC1mc3BpLmM6IFRYOjFLQiwgUlg6
IDUxMkIgaW4gRklGTyBtb2RlCj4+ID4gLSBzcGktd3BjbS1maXUuYzogNEIKPj4gCj4+IEkgYmVs
aWV2ZSBtb3N0IG9mIHRoZXNlIGRyaXZlcnMgYXJlIHN0aWxsIGFibGUgdG8gc2VuZCBvbmUgcGFn
ZSBvZgo+PiBkYXRhCj4+IHdpdGhvdXQgdG9nZ2xpbmcgdGhlIENTICh3aGljaCBpcyB3aGF0IGFj
dHVhbGx5IG1hdHRlcnMsIEkgYmVsaWV2ZSkuCj4+IElmCj4+IHRoZXkgd2VyZSBicm9rZW4sIHRo
ZXkgd291bGQgYmUgYnJva2VuIHdpdGggYWxsIHNwaSBtZW1vcnkgZGV2aWNlcywKPj4gbm90Cj4+
IG9ubHkgRm9yZXNlZSdzLgo+PiAKPiBIaSBNaXF1ZWwsCj4gSSB0aGluayBpdCdzIG5vdCBhYm91
dCB0b2dnbGluZyB0aGUgQ1M/Cj4KPiBJZiBhIFNQSSBjb250cm9sbGVyIHRyaWVzIHRvIGV4ZWN1
dGUgd3JpdGUgcGFnZSBhbmQgaXQncyBjYXBhYmxlIHRvCj4gc2VuZCBvbmx5IDFLQiBpbiBvbmUg
dHJhbnNtaXNzaW9uLCBpdCBzaG91bGQgdHJhbnNtaXQgZGF0YSBpbiB0d28KPiBzdGVwczogMXN0
IDM0SCAocmFuZG9tIHByb2dyYW0gbG9hZCB4NCkgYW5kIDJuZCAzNEguIEhvd2V2ZXIsIHdoZW4K
PiBGMzVTUUEwMDJHIGV4ZWN1dGVzIDJuZCAzNEggY29tbWFuZCwgaXQgbmVlZHMgdG8gZXhlY3V0
ZSAzMkggZmlyc3QsIGFuZAo+IGl0IHdpbGwgY2xlYXIgZGF0YSB0cmFuc21pdHRlZCBieSAxc3Qg
MzRIIGluIE5BTkQgZmxhc2gncyBjYWNoZS4gVGhpcwo+IHdpbGwgY2F1c2UgZGF0YSBjb3JydXB0
aW9uLiBPdGhlciBTUEktTkFORHMgZG9lc24ndCBuZWVkIHRvIGV4ZWN1dGUgMzJICj4gYmVmb3Jl
IDM0SC4KCklzIGl0IHJlYWxseSB3aGF0IGhhcHBlbnM/IEknZCBpbnN0ZWFkIGV4cGVjdCB0aGUg
c3BpIGNvbnRyb2xsZXIgdG8Kc2VuZDoKLSAzNGgKLSAxayBkYXRhCi0gMWsgZGF0YQouLi4KCldo
eSBzaG91bGQgd2UgcmVwZWF0IHRoZSBjb21tYW5kIHdoaWxlIHdlIGFyZSBpbiB0aGUgSS9PIHBo
YXNlPwoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
