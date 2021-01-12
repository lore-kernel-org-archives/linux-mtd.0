Return-Path: <SRS0=hgS/=GP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5483AC433DB
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Jan 2021 17:22:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 02F9D23120
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Jan 2021 17:22:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 02F9D23120
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RGm68xEShvH3xzdqMUEoD6ZhSylxi+peqNQN3Pq+2YE=; b=EdgzKZK2/KJEcmL/2tCzNn9Xv
	8yMToRhX2oDeEUJ7RxSoNGT5gpP8bd7z5rnbkuDLY2g0l7vB5afcPZcDGGaAzEOtSAlxrcXREmEwo
	lQftnmhC9GeEFRSknSjUzk4utaqlvlaBYt24bn6rq7WVBkNbiasHnuETugfAX9xDp1Llhw4dGiDbj
	rpnp3V99qCCa6KM3OCSH4Px/Fd4LFg94uawLacOG1f4h1M2dg+1zU8HA2TmPSP261/dyI675/M/2t
	qi4+woYf76Y5cTVys6Q7cq+iI08kO0HJVgNewcWgGAMufDiA9ASQgvgh+r6tGvUK0hByCvJWMvXep
	h7bnEpbvA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzNLV-0003ge-9g; Tue, 12 Jan 2021 17:20:41 +0000
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzNLR-0003fC-S7
 for linux-mtd@lists.infradead.org; Tue, 12 Jan 2021 17:20:38 +0000
Received: by mail-io1-xd34.google.com with SMTP id r9so5646207ioo.7
 for <linux-mtd@lists.infradead.org>; Tue, 12 Jan 2021 09:20:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=1gfzBScHK4ppxTYZQnMKSRmvMf71cdXIkGxKft+Zol4=;
 b=P2umRsPvNMdUor/dIFoZyAzStHTOJ81n4kC9nheUcW3KEvif+dazDiPM7NYVuLANn0
 tshXBYpDQldNOC6nPQ1iLsa5yHi5kOpKGevD6lRU+x8hlQc1gt7y2Ow3Hxi6gDeEEf5q
 eicuHazzI75eGxoz+fY31Tf+36Uz0IIg2h+IhdhzC13+40Nn1nsRLJxkVGePVd49v2cg
 BZFfR3ZF8THpxC59f3HnHu6/iktrp6oM+DepSLHMXMVH6f3LDbmTDrcRDVtTssUAzPAY
 GT8DsoAwoY6hZxA/RUxY8uH/pCGwCABqQWCxpKYQ7gKylkPenrqFIN2DL9B8Q4iOdzfW
 axUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=1gfzBScHK4ppxTYZQnMKSRmvMf71cdXIkGxKft+Zol4=;
 b=Ak9qhzV84E0KAUJbGrMVlg25m+u+iRxIhOW+TPRsSOzwWYIceOrcvjmaGmu7PBVv5y
 bLHgVOjriEeGEsFV3sHDtZnXUicpcqI33ednXDv8HbYuDdd5Lz6NYThiksrcraus7Ckj
 lNiO9aBQzy/3VxX64HH/q+CUqdvYga019WmKo0Cd4uhLzNHxs06pbJ+BW1pycAPe05Cw
 ui1FoQbGcEafbNvtc/lueVfUdJSuDupKjfXd2+iieLv0S2qteAVa5WsxcMgJdAlBt2M9
 ypFYfWWKTgLNDblfNosf2XtDDCFomXxI99r6OZAl9tx3vqo/H2arD+H3PH96+evdLSky
 YbMQ==
X-Gm-Message-State: AOAM530HnTfmjSl3QPE2NeF99GCy+i1SPwLi/8P399l0NloR9BU0ob0Y
 u8zZR1aFqHjDsMlIQ7RHZcHdKspsyyzP+igBnzo=
X-Google-Smtp-Source: ABdhPJwRcgFmXHfdTSfe7+1cuCCTbqMTJYQyLyBSLzbeJXsqM8wZ7Rvxax4UejPRb+IyoAoheFCjb5C9xLlpKm1Qz3c=
X-Received: by 2002:a5d:8483:: with SMTP id t3mr4132412iom.35.1610472035859;
 Tue, 12 Jan 2021 09:20:35 -0800 (PST)
MIME-Version: 1.0
References: <20200929230124.31491-1-miquel.raynal@bootlin.com>
 <20200929230124.31491-5-miquel.raynal@bootlin.com>
 <CAHCN7xLHAd8B_OgR2_vPFZZJ95mwNGR29dmqFeKhhSU9_y_imA@mail.gmail.com>
 <20210111112027.7cbda0ba@xps13> <20210112153534.5ba93cde@xps13>
 <CAHCN7xJCn8TD+T8pi5P=QMU=uZJ_LN1_wOEQON-noagf2H9+nw@mail.gmail.com>
In-Reply-To: <CAHCN7xJCn8TD+T8pi5P=QMU=uZJ_LN1_wOEQON-noagf2H9+nw@mail.gmail.com>
From: Adam Ford <aford173@gmail.com>
Date: Tue, 12 Jan 2021 11:20:24 -0600
Message-ID: <CAHCN7xL-uzvKqBiYq6R3=-8wNT-V9DZX5ca2ZQ9Y_Wahh0_rAA@mail.gmail.com>
Subject: Re: [PATCH 04/20] mtd: nand: ecc-bch: Stop exporting the private
 structure
To: Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210112_122037_955413_89FB90B2 
X-CRM114-Status: GOOD (  28.94  )
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

T24gVHVlLCBKYW4gMTIsIDIwMjEgYXQgMTA6MDEgQU0gQWRhbSBGb3JkIDxhZm9yZDE3M0BnbWFp
bC5jb20+IHdyb3RlOgo+Cj4gT24gVHVlLCBKYW4gMTIsIDIwMjEgYXQgODozNSBBTSBNaXF1ZWwg
UmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiB3cm90ZToKPiA+Cj4gPiBIaSBBZGFt
LAo+ID4KPiA+IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+IHdyb3Rl
IG9uIE1vbiwgMTEgSmFuIDIwMjEKPiA+IDExOjIwOjI3ICswMTAwOgo+ID4KPiA+ID4gSGkgQWRh
bSwKPiA+ID4KPiA+ID4gQWRhbSBGb3JkIDxhZm9yZDE3M0BnbWFpbC5jb20+IHdyb3RlIG9uIFNh
dCwgOSBKYW4gMjAyMSAwODo0Njo0NCAtMDYwMDoKPiA+ID4KPiA+ID4gPiBPbiBUdWUsIFNlcCAy
OSwgMjAyMCBhdCA2OjA5IFBNIE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5j
b20+IHdyb3RlOgo+ID4gPiA+ID4KPiA+ID4gPiA+IFRoZSBOQU5EIEJDSCBjb250cm9sIHN0cnVj
dHVyZSBoYXMgbm90aGluZyB0byBkbyBvdXRzaWRlIG9mIHRoaXMKPiA+ID4gPiA+IGRyaXZlciwg
YWxsIHVzZXJzIG9mIHRoZSBuYW5kX2JjaF9pbml0L2ZyZWUoKSBmdW5jdGlvbnMganVzdCBzYXZl
IGl0Cj4gPiA+ID4gPiB0byBjaGlwLT5lY2MucHJpdiBzbyBkbyBpdCBpbiB0aGlzIGRyaXZlciBk
aXJlY3RseSBhbmQgcmV0dXJuIGEKPiA+ID4gPiA+IHJlZ3VsYXIgZXJyb3IgY29kZSBpbnN0ZWFk
Lgo+ID4gPiA+ID4KPiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IE1pcXVlbCBSYXluYWwgPG1pcXVl
bC5yYXluYWxAYm9vdGxpbi5jb20+Cj4gPiA+ID4gPiAtLS0KPiA+ID4gPgo+ID4gPiA+IFN0YXJ0
aW5nIHdpdGggdGhpcyBjb21taXQ6ICAzYzBmZTM2YWJlYmUsIHRoZSBrZXJuZWwgZWl0aGVyIGRv
ZXNuJ3QKPiA+ID4gPiBidWlsZCBvciByZXR1cm5zIGVycm9ycyBvbiBzb21lIG9tYXAycGx1cyBk
ZXZpY2VzIHdpdGggdGhlIGZvbGxvd2luZwo+ID4gPiA+IGVycm9yOgo+ID4gPiA+Cj4gPiA+ID4g
ICAgIG5hbmQ6IGRldmljZSBmb3VuZCwgTWFudWZhY3R1cmVyIElEOiAweDJjLCBDaGlwIElEOiAw
eGJjCj4gPiA+ID4gICAgIG5hbmQ6IE1pY3JvbiBNVDI5RjRHMTZBQkJEQTNXCj4gPiA+ID4gICAg
IG5hbmQ6IDUxMiBNaUIsIFNMQywgZXJhc2Ugc2l6ZTogMTI4IEtpQiwgcGFnZSBzaXplOiAyMDQ4
LCBPT0Igc2l6ZTogNjQKPiA+ID4gPiAgICAgbmFuZDogdXNpbmcgT01BUF9FQ0NfQkNIOF9DT0RF
X0hXX0RFVEVDVElPTl9TVwo+ID4gPiA+ICAgICBJbnZhbGlkIEVDQyBsYXlvdXQKPiA+ID4gPiAg
ICAgb21hcDItbmFuZCAzMDAwMDAwMC5uYW5kOiB1bmFibGUgdG8gdXNlIEJDSCBsaWJyYXJ5Cj4g
PiA+ID4gICAgIG9tYXAyLW5hbmQ6IHByb2JlIG9mIDMwMDAwMDAwLm5hbmQgZmFpbGVkIHdpdGgg
ZXJyb3IgLTIyCj4gPiA+ID4gICAgIDg8LS0tIGN1dCBoZXJlIC0tLQo+ID4gPiA+Cj4gPiA+ID4g
VGhlcmUgYXJlIGZldyBjb21taXRzIHVzaW5nIGdpdCBiaXNlY3QgdGhhdCBoYXZlIGJ1aWxkIGVy
cm9ycywgc28gaXQKPiA+ID4gPiB3YXNuJ3QgcG9zc2libGUgZm9yIG1lIHRvIGRldGVybWluZSB0
aGUgZXhhY3QgY29tbWl0IHRoYXQgYnJva2UgdGhlCj4gPiA+ID4gRUNDLiAgSWYgdGhlIGJ1aWxk
IGZhaWxlZCwgSSBtYXJrZWQgaXQgYXMgJ2JhZCcgdG8gZ2l0IGJpc2VjdC4KPiA+ID4KPiA+ID4g
SSBhbSBzb3JyeSB0byBoZWFyIHRoYXQsIEkgcmVndWxhcmx5IHJlYmFzZSB3aXRoIGEgbWFrZSBy
dW4gYmV0d2VlbiBlYWNoCj4gPiA+IHBpY2sgYW5kIHB1c2ggbXkgYnJhbmNoZXMgdG8gYSAwLWRh
eSByZXBvc2l0b3J5IHRvIGhhdmUgcm9ib3RzIGNoZWNrCj4gPiA+IGZvciBzdWNoIGVycm9ycywg
YnV0IHNvbWV0aW1lcyBJIGZhaWwuCj4gPiA+Cj4gPiA+ID4gTmV3ZXIgY29tbWl0cyBoYXZlIHJl
bWVkaWVkIHRoZSBidWlsZCBpc3N1ZSwgYnV0IHRoZSBJbnZhbGlkIEVDQwo+ID4gPiA+IGxheW91
dCBlcnJvciBzdGlsbCBleGlzdHMgYXMgb2YgNS4xMS1SQzIuCj4gPiA+Cj4gPiA+IE9rIHNvIGxl
dCdzIGZvY3VzIG9uIHRoZXNlLgo+ID4gPgo+ID4gPiA+IERvIHlvdSBoYXZlIGFueSBzdWdnZXN0
aW9ucyBvbiB3aGF0IEkgY2FuIGRvIHRvIHJlbWVkeSB0aGlzPyAgSSBhbQo+ID4gPiA+IHdpbGxp
bmcgdG8gdHJ5IGFuZCB0ZXN0Lgo+ID4gPgo+ID4gPiBHbGFkIHRvIGhlYXIgdGhhdC4KPiA+ID4K
PiA+ID4gQ2FuIHlvdSBzaGFyZSB0aGUgTkFORCBjb250cm9sbGVyIERUIG5vZGUgeW91IGFyZSB1
c2luZz8KPiA+ID4KPiA+ID4gQWxzbywgY2FuIHlvdSBwbGVhc2UgYWRkIGEgZmV3IHByaW50aydz
IGxpa2UgYmVsb3cgYW5kIGdpdmUgbWUgdGhlCj4gPiA+IG91dHB1dD8KPiA+Cj4gPiBXaWxsIHlv
dSBoYXZlIHRoZSB0aW1lIHRvIGNoZWNrIHRoZXNlIHNvb24/IEkgYW0gcmVhZHkgdG8gaGVscCBh
bmQKPiA+IHdvdWxkIGxpa2UgdG8gZml4IGl0IGFzYXAuCj4KPiBTb3JyeSBmb3IgdGhlIGRlbGF5
LCBJIGhhdmUgdG8gc3BsaXQgbXkgdGltZSB3aXRoIDMgZGlmZmVyZW50Cj4gcHJvamVjdHMuICBJ
IGFtIGhvcGluZyB0byBnZXQgeW91IGRhdGEgbGF0ZXIgdG9kYXkuCj4KTWlxdWVsLAoKSGVyZSBp
cyB0aGUgZHVtcCBmcm9tIG15IGJvb3Qgc2VxdWVuY2U6CgpbICAgIDIuNjI5MDg5XSBvbWFwMi1u
YW5kIDMwMDAwMDAwLm5hbmQ6IEdQSU8gbG9va3VwIGZvciBjb25zdW1lciByYgpbICAgIDIuNjM1
MjUzXSBvbWFwMi1uYW5kIDMwMDAwMDAwLm5hbmQ6IHVzaW5nIGRldmljZSB0cmVlIGZvciBHUElP
IGxvb2t1cApbICAgIDIuNjQyMTUwXSBvZl9nZXRfbmFtZWRfZ3Bpb2RfZmxhZ3M6IHBhcnNlZCAn
cmItZ3Bpb3MnIHByb3BlcnR5IG9mIG5vZGUgJy9vKQpbICAgIDIuNjUzOTAwXSBncGlvIGdwaW9j
aGlwNjogUGVyc2lzdGVuY2Ugbm90IHN1cHBvcnRlZCBmb3IgR1BJTyAwClsgICAgMi42NjAzMzld
IG5hbmQ6IGRldmljZSBmb3VuZCwgTWFudWZhY3R1cmVyIElEOiAweDJjLCBDaGlwIElEOiAweGJj
ClsgICAgMi42NjY5MDBdIG5hbmQ6IE1pY3JvbiBNVDI5RjRHMTZBQkJEQTNXClsgICAgMi42NzA5
NTldIG5hbmQ6IDUxMiBNaUIsIFNMQywgZXJhc2Ugc2l6ZTogMTI4IEtpQiwgcGFnZSBzaXplOiAy
MDQ4LCBPT0Igc2k0ClsgICAgMi42Nzg3MTBdIG5hbmQ6IHVzaW5nIE9NQVBfRUNDX0JDSDhfQ09E
RV9IV19ERVRFQ1RJT05fU1cKWyAgICAyLjY4NDIzNF0gd3JpdGVzaXplIDIwNDgsIHN0ZXBfc2l6
ZSA1MTIsIG5zdGVwcyA0ClsgICAgMi42ODkzMDBdIHN0cmVuZ3RoIDgsIHN0ZXAgc2l6ZSA1MTIs
IGNvZGVfc2l6ZSAxMwpbICAgIDIuNjk2ODA3XSBjb3VudCBlY2NieXRlcyAwClsgICAgMi42OTk3
MDddIEludmFsaWQgRUNDIGxheW91dApbICAgIDIuNzAyNzg5XSBvbWFwMi1uYW5kIDMwMDAwMDAw
Lm5hbmQ6IHVuYWJsZSB0byB1c2UgQkNIIGxpYnJhcnkKWyAgICAyLjcwOTAxNF0gb21hcDItbmFu
ZDogcHJvYmUgb2YgMzAwMDAwMDAubmFuZCBmYWlsZWQgd2l0aCBlcnJvciAtMjIKWyAgICAyLjcy
MjY1Nl0gODwtLS0gY3V0IGhlcmUgLS0tCgpMZXQgbWUga25vdyBpZi93aGF0IGVsc2UgeW91IHdh
bnQgbWUgdG8gdHJ5LgoKYWRhbQoKPiBhZGFtCj4gPgo+ID4gQ2hlZXJzLAo+ID4gTWlxdcOobAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
