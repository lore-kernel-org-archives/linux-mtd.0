Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F0AFC77B7C
	for <linux-mtd@archiver.kernel.org>; Thu, 11 May 2023 09:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UZxF0zfabd7PeMkcjrOGk3joO/xVET3TEbAaT7ba8MU=; b=AWnEQNTrWynRHC
	0STZy91Czv+5h++LgQEoHm8akwjXrnWVs9WjNB4HL7YBTN8Yl7mlzuFGFLGk/YL+kZL4a6HWVjfOe
	z8ycvLgACZjAD2FE0ArYYowtpOXcqwa5wCLVRWfjveILoq/9n8ZL3SNKSYO/16x0guFi+GSyS+4Wc
	430+YlaT5g0d0kj9pKCWjkonFBZYKpDtVj85tO5YGFO4u4I46ecOp4CvRwyS8bBg6/dD9P1M0xUz4
	9ortKWz0nI00ShXtaZoX+dqQqoCTinb8N8PS4ZDlZiEZ+140ok4o7ubgkiW/gtL1kERDJNAGx4CIL
	1U4OOWGlbedWBGIpF3zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1px2Lb-008JE8-1M;
	Thu, 11 May 2023 09:12:27 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1px2LX-008JC5-03;
	Thu, 11 May 2023 09:12:25 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 4EB26C0004;
	Thu, 11 May 2023 09:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1683796327;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Nss7dH7T+paiRt3nEU8NU0gQW75uq2v425aqsSrMiiA=;
	b=m912lnVEwAcCzug2GrZ8xIY9q+MzmHGukys6fv/CQV5bP8ZcJq7B4Gv5k4Dwz9WiOUi83C
	tk58nTtXWUVR1BdFj8BdHiytLa1fELT5dzHGQuhmpnh97WGQzqqQMcrsmAirx4MJdJGpUr
	WGxloaueA74CRgKRL60w0xacH0uwcgDYwtVfWVBmKqIqIwjtQnTuRt+vsvsxuc4fzLP75I
	Mcd4O1U+/guz51EaPu/OpbKuKifZtVpuasHyeKltiTOC7Gq3e71028ZZbPZoYZpd1OwPsg
	vZ/Ajz1KOxNuIvqZy25GjryVMFdnrte51s8DwbPPfjNhZrbcUP82vGvaKjD+iw==
Date: Thu, 11 May 2023 11:12:04 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Arseniy Krasnov <avkrasnov@sberdevices.ru>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Liang Yang
 <liang.yang@amlogic.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Jianxin Pan <jianxin.pan@amlogic.com>, Yixun Lan <yixun.lan@amlogic.com>,
 <oxffffaa@gmail.com>, <kernel@sberdevices.ru>,
 <linux-mtd@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 6/6] mtd: rawnand: meson: rename node for chip select
Message-ID: <20230511111204.0b0b3d70@xps-13>
In-Reply-To: <6918ed54-3929-4832-1e93-6eb55b75c82b@sberdevices.ru>
References: <20230510110835.26115-1-AVKrasnov@sberdevices.ru>
	<20230510110835.26115-7-AVKrasnov@sberdevices.ru>
	<CAFBinCAbTuNGEG13f71F8vhN3yGce+kkYJ7PHMpZbh8DzSapJg@mail.gmail.com>
	<20230510225359.061c2df6@xps-13>
	<6918ed54-3929-4832-1e93-6eb55b75c82b@sberdevices.ru>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_021223_375267_43754349 
X-CRM114-Status: GOOD (  24.67  )
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

SGkgQXJzZW5peSwKCmF2a3Jhc25vdkBzYmVyZGV2aWNlcy5ydSB3cm90ZSBvbiBUaHUsIDExIE1h
eSAyMDIzIDExOjU5OjA3ICswMzAwOgoKPiBPbiAxMC4wNS4yMDIzIDIzOjUzLCBNaXF1ZWwgUmF5
bmFsIHdyb3RlOgo+IAo+IEhlbGxvIE1hcnRpbiwgTWlxdWVsCj4gCj4gPiBIaSBNYXJ0aW4gJiBB
cnNlbml5LAo+ID4gCj4gPiBtYXJ0aW4uYmx1bWVuc3RpbmdsQGdvb2dsZW1haWwuY29tIHdyb3Rl
IG9uIFdlZCwgMTAgTWF5IDIwMjMgMjI6NDA6MzcKPiA+ICswMjAwOgo+ID4gICAKPiA+PiBIZWxs
byBBcnNlbml5LAo+ID4+Cj4gPj4gT24gV2VkLCBNYXkgMTAsIDIwMjMgYXQgMToxM+KAr1BNIEFy
c2VuaXkgS3Jhc25vdgo+ID4+IDxBVktyYXNub3ZAc2JlcmRldmljZXMucnU+IHdyb3RlOiAgCj4g
Pj4+Cj4gPj4+IFRoaXMgcmVuYW1lcyBub2RlIHdpdGggdmFsdWVzIGZvciBjaGlwIHNlbGVjdCBm
cm9tICJyZWciIHRvICJjcyIuIEl0IGlzCj4gPj4+IG5lZWRlZCBiZWNhdXNlIHdoZW4gT1RQIGFj
Y2VzcyBpcyBlbmFibGVkIG9uIHRoZSBhdHRhY2hlZCBzdG9yYWdlLCBNVEQKPiA+Pj4gc3Vic3lz
dGVtIHJlZ2lzdGVycyB0aGlzIHN0b3JhZ2UgaW4gdGhlIE5WTUVNIHN1YnN5c3RlbS4gTlZNRU0g
aW4gdHVybgo+ID4+PiB0cmllcyB0byB1c2UgInJlZyIgbm9kZSBpbiBpdHMgb3duIG1hbm5lciwg
c3VwcG9zZXMgdGhhdCBpdCBoYXMgYW5vdGhlcgo+ID4+PiBsYXlvdXQuIEFsbCBvZiB0aGlzIGxl
YWRzIHRvIGRldmljZSBpbml0aWFsaXphdGlvbiBmYWlsdXJlLiAgICAKPiA+PiBJbiBnZW5lcmFs
OiBpZiB3ZSBjaGFuZ2UgdGhlIGRldmljZS10cmVlIGludGVyZmFjZSAoaW4gdGhpcyBjYXNlOgo+
ID4+IHJlcGxhY2luZyBhICJyZWciIHdpdGggYSAiY3MiIHByb3BlcnR5KSB0aGUgZHQtYmluZGlu
Z3MgaGF2ZSB0byBiZQo+ID4+IHVwZGF0ZWQgYXMgd2VsbC4gIAo+ID4gCj4gPiBUcnVlLCBhbmQg
SSB3b3VsZCBhZGQsIGJpbmRpbmdzIHNob3VsZCBub3QgYmUgYnJva2VuLiAgCj4gCj4gSSBzZWUs
IHRoYXQncyB0cnVlLiBUaGF0IGlzIGJhZCB3YXkgdG8gY2hhbmdlIGJpbmRpbmdzLgo+IAo+ID4g
ICAKPiA+PiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL25hbmQtY29udHJv
bGxlci55YW1sIGFuZAo+ID4+IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQv
YW1sb2dpYyxtZXNvbi1uYW5kLnlhbWwgc2hvdwo+ID4+IHRoYXQgdGhlIGNoaXAgc2VsZWN0IG9m
IGEgTkFORCBjaGlwIGlzIHNwZWNpZmllZCB3aXRoIGEgInJlZyIKPiA+PiBwcm9wZXJ0eS4gIAo+
ID4gCj4gPiBBbGwgTkFORCBjb250cm9sbGVyIGJpbmRpbmcgZXhwZWN0IHRoZSBjaGlwLXNlbGVj
dCB0byBiZSBpbiB0aGUKPiA+ICdyZWcnIHByb3BlcnR5LCB2ZXJ5IG11Y2ggbGlrZSBhIHNwaSBk
ZXZpY2Ugd291bGQgdXNlIHJlZyB0byBzdG9yZSB0aGUKPiA+IGNzIGFzIHdlbGw6IHRoZSByZWcg
cHJvcGVydHkgdGVsbHMgeW91IGhvdyB5b3UgYWRkcmVzcyB0aGUgZGV2aWNlLgo+ID4gCj4gPiBJ
IGFsc28gZnVsbHkgYWdyZWUgd2l0aCBNYXJ0aW4ncyBjb21tZW50cyBiZWxvdy4gQ2hhbmdpbmcg
cmVnIGlzIGxpa2VseQo+ID4gYSB3cm9uZyBhcHByb2FjaCA6KQo+ID4gICAKPiA+PiBBbHNvIHRo
ZSBjb2RlIGhhcyB0byBiZSBiYWNrd2FyZHMgY29tcGF0aWJsZSB3aXRoIG9sZCAuZHRicy4KPiA+
PiAgCj4gPj4+IEV4YW1wbGU6Cj4gPj4+Cj4gPj4+IFsuLi5dIG52bWVtIG10ZDAtdXNlci1vdHA6
IG52bWVtOiBpbnZhbGlkIHJlZyBvbiAvc29jL2J1c0BmZmUwMDAwMC8uLi4KPiA+Pj4gWy4uLl0g
bXRkIG10ZDA6IEZhaWxlZCB0byByZWdpc3RlciBPVFAgTlZNRU0gZGV2aWNlCj4gPj4+IFsuLi5d
IG1lc29uLW5hbmQgZmZlMDc4MDAubmZjOiBmYWlsZWQgdG8gcmVnaXN0ZXIgTVREIGRldmljZTog
LTIyCj4gPj4+IFsuLi5dIG1lc29uLW5hbmQgZmZlMDc4MDAubmZjOiBmYWlsZWQgdG8gaW5pdCBO
QU5EIGNoaXBzCj4gPj4+IFsuLi5dIG1lc29uLW5hbmQ6IHByb2JlIG9mIGZmZTA3ODAwLm5mYyBm
YWlsZWQgd2l0aCBlcnJvciAtMjIgICAgCj4gPj4gVGhpcyBpcyBvZGQgLSBjYW4geW91IHBsZWFz
ZSBzaGFyZSB5b3VyIGRlZmluaXRpb24gb2YgdGhlICZuZmMgbm9kZT8gIAo+IAo+IFN1cmUsIGhl
cmUgaXQgaXM6Cj4gCj4gbXRkX25hbmQ6IG5mY0A3ODAwIHsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgCj4gCWNvbXBhdGlibGUgPSAiYW1sb2dpYyxtZXNvbi1heGctbmZjIjsKPiAJLi4uCj4g
CW5hbmRAMCB7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKPiAgICAgICAgIAlyZWcg
PSA8MD47Cj4gICAgICAgICB9Owo+IH0KPiAKPiBJIGNoZWNrZWQsIHRoYXQgJ25hbmRfc2V0X2Zs
YXNoX25vZGUoKScgaXMgY2FsbGVkIHdpdGggJ25hbmRAMCcgYW5kIGkgc3VwcG9zZQo+IHRoYXQg
aXQgaXMgY29ycmVjdCAoYXMgWW91IG1lbnRpb25lZCBiZWxvdykuIEJ1dCwgJ252bWVtX2FkZF9j
ZWxsc19mcm9tX29mKCknIGlzIGNhbGxlZAo+IHdpdGggcGFyZW50OiAnbmZjQDc4MDAnLCB0aGVu
IGl0IGl0ZXJhdGVzIG92ZXIgaXRzIGNoaWxkcywgZS5nLiAnbmFuZEAwJyBhbmQgdGh1cyBpIGdl
dCBzdWNoCj4gc2l0dWF0aW9uLiBJIGd1ZXNzLCB0aGF0ICdudm1lbV9hZGRfY2VsbHNfZnJvbV9v
ZigpJyBtdXN0IGJlIGNhbGxlZCB3aXRoICduYW5kQDAnID8KCldlIHJlY2VudGx5IGhhZCBpc3N1
ZXMgd2l0aCBudm1lbSBwYXJzaW5nLCBidXQgSSBiZWxpZXZlIGEgbWFpbmxpbmUKa2VybmVsIHNo
b3VsZCBub3cgYmUgcGVyZmVjdGx5IHdvcmtpbmcgb24gdGhpcyByZWdhcmQuIFdoYXQgdmVyc2lv
biBvZgp0aGUgTGludXgga2VybmVsIGFyZSB5b3UgdXNpbmc/CgpUaGFua3MsCk1pcXXDqGwKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
