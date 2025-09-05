Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FD3FCA0FED
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Sep 2025 18:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OqSnqEnRyc/gr4onBANhoAxVIiM1QAQGAQfxMn0cYgY=; b=xAHy0eMO1pgcg6
	IyCFHu984B4OjURDR+SdY0xqNMMvuNQKN+RkXNYK5hxZu+IKVZBAoVoqNvXQ6NQ362HgKrDqv7zJj
	TY3URi6yr0vDTr2j+7w6nf0R87KXfbsI9/qpVjSefjZClQd5MjtfNyvoVzqDjhPtSilFXOtNTuJO8
	9c+7qopVJ1uLd3di6hvpzcOZHvV20PkonDcQpHQeRtAbzqtl82A2g4I7iw0fOuDD+6bUKkHP7P5Bk
	L6kANsY2LrhDEBhtS7ZFqdaBcaZBd4VYoVlRX759hRrdpZvrtNNazlIs97DXD9xw3HRmQt/Nhy5Ak
	lssxPxmZ4RuLpwerm9Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uub1a-00000003kAQ-3ZSF;
	Fri, 05 Sep 2025 18:19:02 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuX82-00000002C3X-3xEn
	for linux-mtd@lists.infradead.org;
	Fri, 05 Sep 2025 14:09:29 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 837311A0DD7;
	Fri,  5 Sep 2025 14:09:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5C8BF6060B;
	Fri,  5 Sep 2025 14:09:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7281C102F1C9E;
	Fri,  5 Sep 2025 16:09:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1757081359; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=yI09fP41lf9Q4jwENZ62/pXTkYZu2l4FuzKZ2cUvw8U=;
	b=TLpy5jkdnGeRb90/2Ct4Kpw35yI5HnazkuvIH0eJqeNp5JnZi8bja3sT7rXLjsab/BqWoI
	8OYOQ270phJ4AuHH6S/CyDVhqDmmAK9Q7ihSW33+emtEmzH8/pqIgMqgHwCRE1pNFPfTgF
	a7iHy8s92BEiwcSsJflOqXJiDxWvzdFr8J81/2RApJ6Qb3i69WQdzYuOffipWJpCRWDX2p
	/7JKl9eUxpvad+MWY7vZN+8C3AvgfKG9P/un7Qzqc5OgCbniVUn+xyG/rhHsy38FKgrRC8
	x+xvtkKXEUuPbiRDQVOYYpEHT09tZnbIgZjwvNaHIj2KAQtYTx5WRuFxlJzwKg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Cheng Ming Lin <linchengming884@gmail.com>
Cc: vigneshr@ti.com,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  richard@nod.at,  alvinzhou@mxic.com.tw,
  leoyu@mxic.com.tw,  Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: Re: [PATCH 2/2] mtd: spi-nand: macronix: Add randomizer support
In-Reply-To: <CAAyq3Saj5cmHAb3NPd=ZzJEvYD873s2CFKOyoxMrKk6Tj6yakg@mail.gmail.com>
	(Cheng Ming Lin's message of "Fri, 5 Sep 2025 09:14:40 +0800")
References: <20250808095503.906244-1-linchengming884@gmail.com>
	<20250808095503.906244-3-linchengming884@gmail.com>
	<87zfca9kur.fsf@bootlin.com>
	<CAAyq3SZbPpVX_LyoYaHYhA3ZNeb0NYWQ4KC6-+uubB1GGCqZag@mail.gmail.com>
	<87y0rhyq12.fsf@bootlin.com>
	<CAAyq3Saj5cmHAb3NPd=ZzJEvYD873s2CFKOyoxMrKk6Tj6yakg@mail.gmail.com>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Fri, 05 Sep 2025 16:08:58 +0200
Message-ID: <874ithm1ol.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_070927_117511_B2F437ED 
X-CRM114-Status: GOOD (  21.75  )
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

SGVsbG8sCgpPbiAwNS8wOS8yMDI1IGF0IDA5OjE0OjQwICswOCwgQ2hlbmcgTWluZyBMaW4gPGxp
bmNoZW5nbWluZzg4NEBnbWFpbC5jb20+IHdyb3RlOgoKPiBIaSBNaXF1ZWwsCj4KPiBNaXF1ZWwg
UmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiDmlrwgMjAyNeW5tDjmnIgxOOaXpSDp
gLHkuIAg5LiL5Y2INDo0N+Wvq+mBk++8mgo+Pgo+PiBIaSBDaGFuZyBNaW5nLAo+Pgo+PiBPbiAx
MS8wOC8yMDI1IGF0IDExOjAxOjI1ICswOCwgQ2hlbmcgTWluZyBMaW4gPGxpbmNoZW5nbWluZzg4
NEBnbWFpbC5jb20+IHdyb3RlOgo+Pgo+PiA+IEhpIE1pcXVlbCwKPj4gPgo+PiA+IE1pcXVlbCBS
YXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+IOaWvCAyMDI15bm0OOaciDjml6Ug6YCx
5LqUIOS4i+WNiDY6MTnlr6vpgZPvvJoKPj4gPj4KPj4gPj4gT24gMDgvMDgvMjAyNSBhdCAxNzo1
NTowMyArMDgsIENoZW5nIE1pbmcgTGluIDxsaW5jaGVuZ21pbmc4ODRAZ21haWwuY29tPiB3cm90
ZToKPj4gPj4KPj4gPj4gPiBGcm9tOiBDaGVuZyBNaW5nIExpbiA8Y2hlbmdtaW5nbGluQG14aWMu
Y29tLnR3Pgo+PiA+PiA+Cj4+ID4+ID4gRW5hYmxlIHJhbmRvbWl6ZXIgZnVuY3Rpb24gYnkgc3Bl
Y2lmaWMgZmxvd2NoYXJ0IHRvIHNldCB0aGUgZGVmYXVsdCB2YWx1ZQo+PiA+PiA+IG9mIFJBTkRF
TiB0byAxLgo+PiA+PiA+Cj4+ID4+ID4gUmFuZG9taXplciBpbnRyb2R1Y2VzIHR3byBuZXcgRFQg
cHJvcGVydGllcyBmb3IgY2hpbGQgbm9kZXMgdG8gY29uZmlndXJlCj4+ID4+ID4gdGhlIHJhbmRv
bWl6ZXIgZnVuY3Rpb25hbGl0eSBhbmQgY292ZXJhZ2Ugb3B0aW9ucy4KPj4gPj4gPiAgLSBteGlj
LGVuYWJsZS1yYW5kb21pemVyLW90cDogU3BlY2lmeSB3aGV0aGVyIHRvIGFjdGl2YXRlIHRoZSBy
YW5kb21pemVyCj4+ID4+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZlYXR1cmUu
Cj4+ID4+ID4gIC0gbXhpYyxyYW5kb3B0OiBEZWZpbmUgdGhlIHJhbmRvbWl6ZXIgYXJlYSBwZXIg
cGFnZS4KPj4gPj4KPj4gPj4gQ2FuIHdlIGNyZWF0ZSBhIGdsb2JhbCBOQU5EIERUIHByb3BlcnR5
IGZvciB0aGF0PyBFbmFibGluZyBhIHJhbmRvbWl6ZXIKPj4gPj4gaXMgcXVpdGUgYSBnZW5lcmlj
IHN0ZXAuCj4+ID4+Cj4+ID4+ID4gVGhlIHBlbmFsdHkgb2YgcmFuZG9taXplciBhcmUgc3VicGFn
ZSBhY2Nlc3NlcyBwcm9oaWJpdGVkIGFuZCBtb3JlIHRpbWUKPj4gPj4gPiBwZXJpb2QgaXMgbmVl
ZGVkIGluIHByb2dyYW0gb3BlcmF0aW9uIGFuZCBlbnRlcmluZyBkZWVwIHBvd2VyLWRvd24gbW9k
ZS4KPj4gPj4gPiBpLmUuLCB0UFJPRyAzMjB1cyB0byAzNjB1cyAocmFuZG9taXplciBlbmFibGVk
KS4KPj4gPj4KPj4gPj4gRG8geW91IHdhbnQgdG8gc2hhcmUgd2hhdCBpcyB0aGUgYWRkZWQgdmFs
dWUgaW4gdGVybXMgb2YgbGlmZXRpbWUgdG8KPj4gPj4gZW5hYmxlIHRoZSByYW5kb21pemVyLCBn
aXZlbiB0aGUgZHJhd2JhY2tzIHdoaWNoIGFyZSBzaWduaWZpY2FudD8KPj4gPgo+PiA+IFRoZSBy
YW5kb21pemVyIG1haW5seSB0YXJnZXRzIGV4dHJlbWVseSB1bmJhbGFuY2VkIGRhdGEgcGF0dGVy
bnMsCj4+ID4gd2hpY2ggbWlnaHQgcG90ZW50aWFsbHkgbGVhZCB0byBkYXRhIGVycm9ycy4KPj4g
Pgo+PiA+IFBsZWFzZSByZWZlciB0byB0aGUgYXR0YWNoZWQgZG9jdW1lbnQ6Cj4+ID4gaHR0cHM6
Ly93d3cubXhpYy5jb20udHcvTGlzdHMvQXBwbGljYXRpb25Ob3RlL0F0dGFjaG1lbnRzLzIxNTEv
QU4xMDUxVjEtVGhlJTIwSW50cm9kdWN0aW9uJTIwb2YlMjBSYW5kb21pemVyJTIwRmVhdHVyZSUy
MG9uJTIwTVgzMHhGeEcyOEFEX01YMzV4RnhHMjRBRC5wZGYKPj4KPj4gVGhhbmtzIGZvciB0aGUg
bGluaywgaXQgbWF5IGJlIHBvaW50ZWQgd2l0aCBhICJMaW5rOiIgdGFnIGluIHlvdXIgY29tbWl0
Cj4+IHRvIGZ1cnRoZXIganVzdGlmeSB0aGlzIGFkZGl0aW9uLiBIb3dldmVyIGl0IGlzIHNwYXJz
ZSBvbiBkZXRhaWxzLiBJCj4+IHdvdWxkIGJlIGludGVyZXN0ZWQgYnkgbW9yZSBkZXRhaWxzLCBz
dWNoIGFzICJob3cgbWFueSAwcz8gaG93IG1hbnkKPj4gYml0ZmxpcHM/IGhvdyBvZnRlbi9saWtl
bHk/Igo+Cj4gVGhhbmsgeW91IGZvciB5b3VyIGZlZWRiYWNrLiBVbmZvcnR1bmF0ZWx5IHdlIGRv
IG5vdCBoYXZlIG51bWVyaWNhbAo+IGRhdGEgc3VjaCBhcyBleGFjdCBudW1iZXJzIG9mICcwJ3Ms
IGJpdGZsaXAgcmF0ZXMsIG9yIG9jY3VycmVuY2UKPiBwcm9iYWJpbGl0aWVzIHRvIHNoYXJlLiBJ
bnN0ZWFkLCBJIHdvdWxkIGxpa2UgdG8gcmVmZXIgdG8gdGhlIEpFREVDCj4gSkVTRDIyLUExMTdF
IHF1YWxpZmljYXRpb24gc3RhbmRhcmQsIHdoaWNoIHByb3ZpZGVzIGd1aWRhbmNlIG9uCj4gcmV0
ZW50aW9uIGFuZCBlbmR1cmFuY2UgdGVzdGluZy4KPgo+IEFjY29yZGluZyB0byB0aGlzIGRvY3Vt
ZW50LCB0aGVyZSBpcyBubyBzaW5nbGUgZGF0YSBwYXR0ZXJuIHRoYXQKPiByZXByZXNlbnRzIGEg
dW5pdmVyc2FsIHdvcnN0LWNhc2UgYWNyb3NzIGFsbCBmYWlsdXJlIG1lY2hhbmlzbXMuCj4gRGlm
ZmVyZW50IG1lY2hhbmlzbXMgbWF5IHN0cmVzcyBwcm9ncmFtbWVkIGNlbGxzLCBlcmFzZWQgY2Vs
bHMsIG9yCj4gY2VsbHMgaW5mbHVlbmNlZCBieSBhZGphY2VudCBzdGF0ZXMsIGFuZCB0aHVzIHNw
ZWNpZmljIHBhdHRlcm5zIHN1Y2gKPiBhcyBmdWxseSBwcm9ncmFtbWVkLCBjaGVja2VyYm9hcmQs
IG9yIG1vc3RseSBlcmFzZWQgYXJlIGVhY2ggb25seQo+IHdvcnN0LWNhc2UgZm9yIGNlcnRhaW4g
ZGVzaWducyBvciBwcm9jZXNzZXMuCj4KPiBHaXZlbiB0aGF0IG5vIGZpeGVkIHBhdHRlcm4gY2Fu
IGNvdmVyIGFsbCBjYXNlcywgdGhlIHVzZSBvZiBhCj4gcmFuZG9taXplZCBkYXRhIHBhdHRlcm4g
aXMgY29uc2lkZXJlZCBhIHByYWN0aWNhbCBtaXRpZ2F0aW9uCj4gc3RyYXRlZ3kuIEEgcmFuZG9t
aXplciBkaXN0cmlidXRlcyBzdHJlc3MgbW9yZSBldmVubHkgYWNyb3NzIHRoZQo+IGRldmljZSBi
eSBzY3JhbWJsaW5nIGluY29taW5nIGRhdGEgYmVmb3JlIHN0b3JhZ2UgYW5kIHJlc3RvcmluZyBp
dAo+IG9uIHJlYWQuIFRoaXMgaGVscHMgcmVkdWNlIHBhdHRlcm4tZGVwZW5kZW50IGRlZ3JhZGF0
aW9uIGFuZCBjYW4KPiB0aGVyZWZvcmUgaW1wcm92ZSBsb25nLXRlcm0gZmxhc2ggcmVsaWFiaWxp
dHkuCgpUaGFua3MgZm9yIHRoZSBkZXRhaWxzLiBJIGd1ZXNzIHlvdSBjYW4gYWRkIGEgYml0IG9m
IHRoZW0gdG8geW91ciBjb21taXQKbG9nIGFzIHdlbGwuIEknbGwgd2VsY29tZSBhIHYyIHdpdGgg
dGhlIHByZXZpb3VzIGNvbW1lbnRzIGFkZHJlc3NlZCEKClRoYW5rcywKTWlxdcOobAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1U
RCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
