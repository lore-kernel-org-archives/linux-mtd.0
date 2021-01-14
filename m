Return-Path: <SRS0=+zBv=GR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80DB8C433DB
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Jan 2021 15:44:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0868623B27
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Jan 2021 15:44:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0868623B27
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gtn/crkku7+z8dMJx8bE0AVbluT9Tbf/2h5xWpNI6LM=; b=0Tm/GvwzaaugUR+iYT3S2saPB
	SXvG2+oiLZdkf7p7HCyC1NnbSm8p79LIvYhUMJbHseuXGnt2D3puNZDsYfZpRzZ18SlwCfm4+xNjS
	AysON7QnFbl41iC7Bcg/4oxaaHDfS1Slhlqb0XTQ4VsSH0WYmVjT5Zy35En8Jq1OBOGZk9lRueOOQ
	E5tbZj5BHNerO/kdSOi9rH3VdCYyFAIDcHnbqgJ2F9vCCmkjPm72rQhPCknksINeFhE+pJWT/8REP
	2Absh/4ATSWnjhUO2sCEhbXR3qjcB6Jli6czBLDP4i36fw5plFpO96wzx9iUaV2Y2soqoizlIIalO
	+u2x9j23w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l04lj-0003Xe-Kc; Thu, 14 Jan 2021 15:42:39 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l04lc-0003Wb-G0
 for linux-mtd@lists.infradead.org; Thu, 14 Jan 2021 15:42:33 +0000
X-Originating-IP: 86.201.233.230
Received: from xps13 (lfbn-tou-1-151-230.w86-201.abo.wanadoo.fr
 [86.201.233.230]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 95C22C0005;
 Thu, 14 Jan 2021 15:42:25 +0000 (UTC)
Date: Thu, 14 Jan 2021 16:42:24 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Adam Ford <aford173@gmail.com>
Subject: Re: [PATCH 04/20] mtd: nand: ecc-bch: Stop exporting the private
 structure
Message-ID: <20210114164224.5d21c170@xps13>
In-Reply-To: <CAHCN7xL-uzvKqBiYq6R3=-8wNT-V9DZX5ca2ZQ9Y_Wahh0_rAA@mail.gmail.com>
References: <20200929230124.31491-1-miquel.raynal@bootlin.com>
 <20200929230124.31491-5-miquel.raynal@bootlin.com>
 <CAHCN7xLHAd8B_OgR2_vPFZZJ95mwNGR29dmqFeKhhSU9_y_imA@mail.gmail.com>
 <20210111112027.7cbda0ba@xps13> <20210112153534.5ba93cde@xps13>
 <CAHCN7xJCn8TD+T8pi5P=QMU=uZJ_LN1_wOEQON-noagf2H9+nw@mail.gmail.com>
 <CAHCN7xL-uzvKqBiYq6R3=-8wNT-V9DZX5ca2ZQ9Y_Wahh0_rAA@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210114_104232_722210_43087441 
X-CRM114-Status: GOOD (  30.14  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, Julien Su <juliensu@mxic.com.tw>,
 Richard Weinberger <richard@nod.at>, ycllin@mxic.com.tw,
 linux-mtd@lists.infradead.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Linux-OMAP <linux-omap@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgQWRhbSwKCkFkYW0gRm9yZCA8YWZvcmQxNzNAZ21haWwuY29tPiB3cm90ZSBvbiBUdWUsIDEy
IEphbiAyMDIxIDExOjIwOjI0IC0wNjAwOgoKPiBPbiBUdWUsIEphbiAxMiwgMjAyMSBhdCAxMDow
MSBBTSBBZGFtIEZvcmQgPGFmb3JkMTczQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24gVHVl
LCBKYW4gMTIsIDIwMjEgYXQgODozNSBBTSBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJv
b3RsaW4uY29tPiB3cm90ZTogIAo+ID4gPgo+ID4gPiBIaSBBZGFtLAo+ID4gPgo+ID4gPiBNaXF1
ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiB3cm90ZSBvbiBNb24sIDExIEph
biAyMDIxCj4gPiA+IDExOjIwOjI3ICswMTAwOgo+ID4gPiAgCj4gPiA+ID4gSGkgQWRhbSwKPiA+
ID4gPgo+ID4gPiA+IEFkYW0gRm9yZCA8YWZvcmQxNzNAZ21haWwuY29tPiB3cm90ZSBvbiBTYXQs
IDkgSmFuIDIwMjEgMDg6NDY6NDQgLTA2MDA6Cj4gPiA+ID4gIAo+ID4gPiA+ID4gT24gVHVlLCBT
ZXAgMjksIDIwMjAgYXQgNjowOSBQTSBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3Rs
aW4uY29tPiB3cm90ZTogIAo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBUaGUgTkFORCBCQ0ggY29u
dHJvbCBzdHJ1Y3R1cmUgaGFzIG5vdGhpbmcgdG8gZG8gb3V0c2lkZSBvZiB0aGlzCj4gPiA+ID4g
PiA+IGRyaXZlciwgYWxsIHVzZXJzIG9mIHRoZSBuYW5kX2JjaF9pbml0L2ZyZWUoKSBmdW5jdGlv
bnMganVzdCBzYXZlIGl0Cj4gPiA+ID4gPiA+IHRvIGNoaXAtPmVjYy5wcml2IHNvIGRvIGl0IGlu
IHRoaXMgZHJpdmVyIGRpcmVjdGx5IGFuZCByZXR1cm4gYQo+ID4gPiA+ID4gPiByZWd1bGFyIGVy
cm9yIGNvZGUgaW5zdGVhZC4KPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTog
TWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4KPiA+ID4gPiA+ID4gLS0t
ICAKPiA+ID4gPiA+Cj4gPiA+ID4gPiBTdGFydGluZyB3aXRoIHRoaXMgY29tbWl0OiAgM2MwZmUz
NmFiZWJlLCB0aGUga2VybmVsIGVpdGhlciBkb2Vzbid0Cj4gPiA+ID4gPiBidWlsZCBvciByZXR1
cm5zIGVycm9ycyBvbiBzb21lIG9tYXAycGx1cyBkZXZpY2VzIHdpdGggdGhlIGZvbGxvd2luZwo+
ID4gPiA+ID4gZXJyb3I6Cj4gPiA+ID4gPgo+ID4gPiA+ID4gICAgIG5hbmQ6IGRldmljZSBmb3Vu
ZCwgTWFudWZhY3R1cmVyIElEOiAweDJjLCBDaGlwIElEOiAweGJjCj4gPiA+ID4gPiAgICAgbmFu
ZDogTWljcm9uIE1UMjlGNEcxNkFCQkRBM1cKPiA+ID4gPiA+ICAgICBuYW5kOiA1MTIgTWlCLCBT
TEMsIGVyYXNlIHNpemU6IDEyOCBLaUIsIHBhZ2Ugc2l6ZTogMjA0OCwgT09CIHNpemU6IDY0Cj4g
PiA+ID4gPiAgICAgbmFuZDogdXNpbmcgT01BUF9FQ0NfQkNIOF9DT0RFX0hXX0RFVEVDVElPTl9T
Vwo+ID4gPiA+ID4gICAgIEludmFsaWQgRUNDIGxheW91dAo+ID4gPiA+ID4gICAgIG9tYXAyLW5h
bmQgMzAwMDAwMDAubmFuZDogdW5hYmxlIHRvIHVzZSBCQ0ggbGlicmFyeQo+ID4gPiA+ID4gICAg
IG9tYXAyLW5hbmQ6IHByb2JlIG9mIDMwMDAwMDAwLm5hbmQgZmFpbGVkIHdpdGggZXJyb3IgLTIy
Cj4gPiA+ID4gPiAgICAgODwtLS0gY3V0IGhlcmUgLS0tCj4gPiA+ID4gPgo+ID4gPiA+ID4gVGhl
cmUgYXJlIGZldyBjb21taXRzIHVzaW5nIGdpdCBiaXNlY3QgdGhhdCBoYXZlIGJ1aWxkIGVycm9y
cywgc28gaXQKPiA+ID4gPiA+IHdhc24ndCBwb3NzaWJsZSBmb3IgbWUgdG8gZGV0ZXJtaW5lIHRo
ZSBleGFjdCBjb21taXQgdGhhdCBicm9rZSB0aGUKPiA+ID4gPiA+IEVDQy4gIElmIHRoZSBidWls
ZCBmYWlsZWQsIEkgbWFya2VkIGl0IGFzICdiYWQnIHRvIGdpdCBiaXNlY3QuICAKPiA+ID4gPgo+
ID4gPiA+IEkgYW0gc29ycnkgdG8gaGVhciB0aGF0LCBJIHJlZ3VsYXJseSByZWJhc2Ugd2l0aCBh
IG1ha2UgcnVuIGJldHdlZW4gZWFjaAo+ID4gPiA+IHBpY2sgYW5kIHB1c2ggbXkgYnJhbmNoZXMg
dG8gYSAwLWRheSByZXBvc2l0b3J5IHRvIGhhdmUgcm9ib3RzIGNoZWNrCj4gPiA+ID4gZm9yIHN1
Y2ggZXJyb3JzLCBidXQgc29tZXRpbWVzIEkgZmFpbC4KPiA+ID4gPiAgCj4gPiA+ID4gPiBOZXdl
ciBjb21taXRzIGhhdmUgcmVtZWRpZWQgdGhlIGJ1aWxkIGlzc3VlLCBidXQgdGhlIEludmFsaWQg
RUNDCj4gPiA+ID4gPiBsYXlvdXQgZXJyb3Igc3RpbGwgZXhpc3RzIGFzIG9mIDUuMTEtUkMyLiAg
Cj4gPiA+ID4KPiA+ID4gPiBPayBzbyBsZXQncyBmb2N1cyBvbiB0aGVzZS4KPiA+ID4gPiAgCj4g
PiA+ID4gPiBEbyB5b3UgaGF2ZSBhbnkgc3VnZ2VzdGlvbnMgb24gd2hhdCBJIGNhbiBkbyB0byBy
ZW1lZHkgdGhpcz8gIEkgYW0KPiA+ID4gPiA+IHdpbGxpbmcgdG8gdHJ5IGFuZCB0ZXN0LiAgCj4g
PiA+ID4KPiA+ID4gPiBHbGFkIHRvIGhlYXIgdGhhdC4KPiA+ID4gPgo+ID4gPiA+IENhbiB5b3Ug
c2hhcmUgdGhlIE5BTkQgY29udHJvbGxlciBEVCBub2RlIHlvdSBhcmUgdXNpbmc/Cj4gPiA+ID4K
PiA+ID4gPiBBbHNvLCBjYW4geW91IHBsZWFzZSBhZGQgYSBmZXcgcHJpbnRrJ3MgbGlrZSBiZWxv
dyBhbmQgZ2l2ZSBtZSB0aGUKPiA+ID4gPiBvdXRwdXQ/ICAKPiA+ID4KPiA+ID4gV2lsbCB5b3Ug
aGF2ZSB0aGUgdGltZSB0byBjaGVjayB0aGVzZSBzb29uPyBJIGFtIHJlYWR5IHRvIGhlbHAgYW5k
Cj4gPiA+IHdvdWxkIGxpa2UgdG8gZml4IGl0IGFzYXAuICAKPiA+Cj4gPiBTb3JyeSBmb3IgdGhl
IGRlbGF5LCBJIGhhdmUgdG8gc3BsaXQgbXkgdGltZSB3aXRoIDMgZGlmZmVyZW50Cj4gPiBwcm9q
ZWN0cy4gIEkgYW0gaG9waW5nIHRvIGdldCB5b3UgZGF0YSBsYXRlciB0b2RheS4KPiA+ICAKPiBN
aXF1ZWwsCj4gCj4gSGVyZSBpcyB0aGUgZHVtcCBmcm9tIG15IGJvb3Qgc2VxdWVuY2U6Cj4gCj4g
WyAgICAyLjYyOTA4OV0gb21hcDItbmFuZCAzMDAwMDAwMC5uYW5kOiBHUElPIGxvb2t1cCBmb3Ig
Y29uc3VtZXIgcmIKPiBbICAgIDIuNjM1MjUzXSBvbWFwMi1uYW5kIDMwMDAwMDAwLm5hbmQ6IHVz
aW5nIGRldmljZSB0cmVlIGZvciBHUElPIGxvb2t1cAo+IFsgICAgMi42NDIxNTBdIG9mX2dldF9u
YW1lZF9ncGlvZF9mbGFnczogcGFyc2VkICdyYi1ncGlvcycgcHJvcGVydHkgb2Ygbm9kZSAnL28p
Cj4gWyAgICAyLjY1MzkwMF0gZ3BpbyBncGlvY2hpcDY6IFBlcnNpc3RlbmNlIG5vdCBzdXBwb3J0
ZWQgZm9yIEdQSU8gMAo+IFsgICAgMi42NjAzMzldIG5hbmQ6IGRldmljZSBmb3VuZCwgTWFudWZh
Y3R1cmVyIElEOiAweDJjLCBDaGlwIElEOiAweGJjCj4gWyAgICAyLjY2NjkwMF0gbmFuZDogTWlj
cm9uIE1UMjlGNEcxNkFCQkRBM1cKPiBbICAgIDIuNjcwOTU5XSBuYW5kOiA1MTIgTWlCLCBTTEMs
IGVyYXNlIHNpemU6IDEyOCBLaUIsIHBhZ2Ugc2l6ZTogMjA0OCwgT09CIHNpNAo+IFsgICAgMi42
Nzg3MTBdIG5hbmQ6IHVzaW5nIE9NQVBfRUNDX0JDSDhfQ09ERV9IV19ERVRFQ1RJT05fU1cKPiBb
ICAgIDIuNjg0MjM0XSB3cml0ZXNpemUgMjA0OCwgc3RlcF9zaXplIDUxMiwgbnN0ZXBzIDQKPiBb
ICAgIDIuNjg5MzAwXSBzdHJlbmd0aCA4LCBzdGVwIHNpemUgNTEyLCBjb2RlX3NpemUgMTMKClVu
dGlsIGhlcmUsIGV2ZXJ5dGhpbmcgbG9va3MgZmluZS4KCj4gWyAgICAyLjY5NjgwN10gY291bnQg
ZWNjYnl0ZXMgMAoKVGhpcyBpcyB0aGUgY2F1c2Ugb2YgdGhlIGVycm9yLCB0aGUgTVREIE9PQiBs
YXlvdXQgcmVwb3J0cyBub3QgRUNDIGJ5dGUuCgpDYW4geW91IHBsZWFzZSBjaGVjayB0aGF0IHdl
IGVmZmVjdGl2ZWx5IGNhbGwgdGhlIGxhcmdlIHBhZ2UgaGVscGVycwooaW4gcGFydGljdWxhciBu
YW5kX29vYmxheW91dF9lY2NfbHAoKSkgLiBJIGJldCB0aGlzIGZ1bmN0aW9uIHJldHVybnMKLUVS
QU5HRSBvbiBpdHMgZmlyc3QgY2FsbCwgd2hpY2ggcmVkdWNlcyB0aGUgZWNjYnl0ZXMgdmFyaWFi
bGUgYWJvdmUgdG8KemVyby4KCldoYXQgaXMgc3RyYW5nZSBpcyB0aGF0LCB0aGUgb25seSByZWFz
b24gdGhpcyB3b3VsZCBoYXBwZW4gKHRvIG15IGV5ZXMpCmlzIG5hbmQtPmVjYy5jdHgudG90YWwg
YmVpbmcgMC4gQ2FuIHlvdSBwbGVhc2UgY2hlY2sgaXRzIGVmZmVjdGl2ZQp2YWx1ZT8KCkkgZG8g
bm90IHNlZSB0aGUgaW1tZWRpYXRlIHJlYXNvbiBiZWNhdXNlIG5hbmQtPmVjYy5jdHgudG90YWwg
aXMgc2V0IHRvCm5zdGVwcyAoNCkgKiBjb2RlX3NpemUgKDEzKSByaWdodCBiZWZvcmUgY2FsbGlu
ZwptdGRfb29ibGF5b3V0X2NvdW50X2VjY2J5dGVzKCkuCgpDYW4geW91IHBsZWFzZSB2ZXJpZnkg
bXkgc2F5aW5ncyBhbmQgcGVyaGFwcyB0YWNrbGUgdGhlIHJvb3QgY2F1c2Ugb2YKdGhpcyBpc3N1
ZT8gUGxlYXNlIGRvIG5vdCBoZXNpdGF0ZSB0byBhc2sgcXVlc3Rpb25zLCBJJ2xsIGRvIG15IGJl
c3QgdG8KaGVscCBiZWNhdXNlIHRoaXMgaXMgYSBjcml0aWNhbCBzZWN0aW9uIHRoYXQgaXMgbm90
IG9ubHkgYnJlYWtpbmcKT01BUCBib2FyZHMsIHVuZm9ydHVuYXRlbHkuCgpUaGFua3MsCk1pcXXD
qGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
