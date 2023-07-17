Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65CD6EB64DC
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Jul 2023 05:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qTpOj9Mmi0faUp2E9PaADtBxl5+CX+Rh5Ip+rzoZL6Q=; b=yOMfabRS1+SlQs
	QhBhGpgCfwVWqYWtYUtuBEZIGAU/0/zi64YeN86iYeWIjWE/5asH9IEzzBoedjNP3zelV+pjW3GYF
	tYp3ARk6gH/X4Upxc/2cjNdQ1TP0V3MeUkXwWTqL8JPUHlRvxz4lCR1LD1jQtqIL36/PLigU2Ekg+
	JV4PNwzERYz2K1RsKr2RIPf5GvYTb61GPlfyaf6RgHM4hQwXs2L5GcKNjlPzmAvK9kqdctLfNWzcO
	PloP55PQ9YJtAMEFcXEdduDqsJ/kvmgQ/hmQ1zxtQSCM61wXakE9sJcuaGj6fefEnPlwniHdKBUte
	aD1sCZl6P66KKbeOak6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLGrw-002c1v-0K;
	Mon, 17 Jul 2023 05:34:01 +0000
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLGrq-002bxF-33
	for linux-mtd@lists.infradead.org;
	Mon, 17 Jul 2023 05:33:56 +0000
Received: by mail-qk1-x736.google.com with SMTP id af79cd13be357-76714caf466so395085385a.1
        for <linux-mtd@lists.infradead.org>; Sun, 16 Jul 2023 22:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689572031; x=1692164031;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ft5zgUvboArK9yHQVjefLoZOhiw8ntcdZaGG3HTtq8U=;
        b=dizHv+gzFY6xwqmaIAYrWHncllkWvTDD2VXP0P1ta3c0iDi6xHUYkyMtVg6BrnrlNo
         zpYHkJ5/vD4xYQEu6deq0BUrUtix0OSeJGbcqOB3RgC5l4WNzn2CLymXD1H8NTLk5/tG
         ndESprEtmvupPOvstIOsMneOMNoJkQ74Q2YQjpkwCV7kIlvx6jiMhkaj8IFpL5/L+fIg
         a+p1Ju+y5/jnFyRxR385PUxd6JerAu71V85Vg1+mONCJTzk6+M+7zBh90cFHn6XJfw/H
         FoV0f88ntzsVOLH5av061NNbLpBZBSqhABl3yonublrVBSCoFC48bwUPreTaOrBc/JCX
         Q7yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689572031; x=1692164031;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ft5zgUvboArK9yHQVjefLoZOhiw8ntcdZaGG3HTtq8U=;
        b=FA6gm2lCErQQUemp2XICYXpvZGvG6qbBxuCAC7IBabDThnsDCM8IuqwiNWIjK8zndg
         NY6ZatsIj8LZspqeZGhA1Z7F7viE15iPiieJr7tyBFs9yR3tszCE5vxLaFtDe3bydXQm
         BVsxgn5L/ghk7cemhf9qErz45vE9tnVwACHJZ53Vds7UdvHARdXwzK3VNd0Sa/d/PA5o
         x5Fr5K84/27+6hGkXDIdWnTnmefwgXPhY8OYAn03ZfVSGcPm57nqW6KMsHCHl9kTOHZr
         /FpcZKmhfFYiJmdc8PFPfzderuSXMLYn80F+QlmELfB4I8J1HWzOaQGYTD+bpTKVxHSa
         Uiuw==
X-Gm-Message-State: ABy/qLZtgEvGginLptFQu6TqVtC/kq/3SE5aEzMwYAtxScOHRZf81r+Q
	Y+88WwVQ/ZxzCIWDafrY6GKSFE0IBRG+UeEETQUW5njXov+ThVbR
X-Google-Smtp-Source: APBJJlFcs+27un2X7av8YUUSwCLAyDwB/5Asd1F/0DoIKiD7Y1vHxd6aLGKXXZhsf2AUdYR4FGrI2BjsenJ74lt55Y8=
X-Received: by 2002:ae9:de01:0:b0:767:dc5e:b744 with SMTP id
 s1-20020ae9de01000000b00767dc5eb744mr12890443qkf.11.1689572030674; Sun, 16
 Jul 2023 22:33:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230112093637.987838-1-miquel.raynal@bootlin.com>
 <20230112093637.987838-4-miquel.raynal@bootlin.com> <yw1xfs6j4k6q.fsf@mansr.com>
 <20230716174917.3a9ca7a7@xps-13>
In-Reply-To: <20230716174917.3a9ca7a7@xps-13>
From: Alexander Shiyan <eagle.alexander923@gmail.com>
Date: Mon, 17 Jul 2023 08:33:39 +0300
Message-ID: <CAP1tNvTjqkgz0ZNjNWO1=dkELPZ63_1TzPB+V_Bf5PCUUghsVw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] mtd: rawnand: Support for sequential cache reads
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: =?UTF-8?B?TcOlbnMgUnVsbGfDpXJk?= <mans@mansr.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Tudor Ambarus <Tudor.Ambarus@microchip.com>, Pratyush Yadav <pratyush@kernel.org>, 
	Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org, 
	Julien Su <juliensu@mxic.com.tw>, Jaime Liao <jaimeliao@mxic.com.tw>, 
	Alvin Zhou <alvinzhou@mxic.com.tw>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	JaimeLiao <jaimeliao.tw@gmail.com>, Domenico Punzo <dpunzo@micron.com>, 
	Bean Huo <beanhuo@micron.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230716_223355_075722_15DEDB22 
X-CRM114-Status: GOOD (  47.48  )
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

SGVsbG8uCgpXZSBhcmUgdXNpbmcgR1BJTyBmb3Igd2FpdHJkeS4gSG93ZXZlciwgZXZlbiB3aGVu
IHN3aXRjaGluZyB0byBzb2Z0CmltcGxlbWVudGF0aW9uLAp0aGUgc3lzdGVtIHN0aWxsIGJlaGF2
ZXMgaW5jb3JyZWN0bHkuCldlIGFyZSB1c2luZyBwcmVmZXRjaC1kbWEgbW9kZSBmb3IgeGZlci4g
Q2hhbmdpbmcgdG8gdGhlIGRlZmF1bHQgaW1wbGVtZW50YXRpb24KZG9lcyBub3QgcmVzdWx0IGlu
IGFueSBpbXByb3ZlbWVudHMuCgpCb3RoIHBhdGNoZXMgZG9uJ3QgaGVscCA6KAoK0LLRgSwgMTYg
0LjRjtC7LiAyMDIz4oCv0LMuINCyIDE4OjQ5LCBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFs
QGJvb3RsaW4uY29tPjoKPgo+IEhlbGxvIGFsbCwKPgo+IFNvIGhlcmUgaXMgYSBzdW1tYXJ5IG9m
IHRoZSBzaXR1YXRpb246Cj4gLSB3ZSBoYXZlIHR3byBidWcgcmVwb3J0cyByZWdhcmRpbmcgdGhl
IHVzZSBvZiBzZXF1ZW50aWFsIHBhZ2UgcmVhZHMKPiAtIGJvdGggYXJlIG9uIFRJIE9NQVAgcGxh
dGZvcm1zOiBBTTMzWFggYW5kIEFNMzUxNy4gSSBiZWxpZXZlIGJvdGggYXJlCj4gICB1c2luZyB0
aGUgc2FtZSBvbWFwMi5jIGRyaXZlcgo+IC0gdGhleSB1c2UgYSBNaWNyb24gYW5kIGEgU2Ftc3Vu
ZyBOQU5EIGNoaXAKPgo+IEFsbCB0aGVzZSBpbmZvcm1hdGlvbiBnaXZlcyBtZSB0aGUgaGludCB0
aGF0IGl0IGlzIHJlbGF0ZWQgdG8gdGhlCj4gY29udHJvbGxlciBkcml2ZXIgd2hpY2ggZG9lcyBz
b21ldGhpbmcgc2lsbHkgZHVyaW5nIHRoZSBleGVjX29wIHBoYXNlLgo+Cj4gQWxleGFuZGVyIGFu
ZCBNw6VucywgY2FuIHlvdSBwbGVhc2UgdGVsbCBtZToKPiAtIEFyZSB5b3UgdXNpbmcgYSBncGlv
IGZvciB0aGUgd2FpdHJkeSB0aGluZyBvciBkbyB5b3UgbGV2ZXJhZ2UKPiAgIG5hbmRfc29mdF93
YWl0cmR5KCk/IElmIHlvdSBhcmUgdXNpbmcgdGhlIGdwaW8sIGNhbiB5b3UgYm90aCB0cnkgd2l0
aAo+ICAgdGhlIHNvZnQgaW1wbGVtZW50YXRpb24gYW5kIHNlZSBpZiBpdCBjaGFuZ2VzIHNvbWV0
aGluZz8KPiAtIEFyZSB5b3UgdXNpbmcgYW55IFBPTEwgb3IgRE1BIHByZWZldGNoIG1vZGU/IENh
biB5b3UgcGxlYXNlIGZvcmNlIHRoZQo+ICAgZGVmYXVsdCBpbiBhbmQgb3V0IGhlbHBlcnMgYnkg
dXNpbmcgb25seSBvbWFwX25hbmRfZGF0YV9pbigpIGFuZAo+ICAgb21hcF9uYW5kX2RhdGFfb3V0
KCkgdG8gc2VlIGlmIGl0IGNoYW5nZXMgc29tZXRoaW5nPwo+Cj4gSSBiZWxpZXZlIHRoZXJlIGlz
IHNvbWV0aGluZyB3cm9uZyBpbiB0aGUgdGltaW5ncywgd2hpbGUgcHJvcGVybHkKPiBpbXBsZW1l
bnRlZCBpbiB0aGVvcnkgdGhlcmUgbWlnaHQgYmUgc29tZSBjYXNlcyB3aGVyZSB3ZSBtaXNzIGEg
YmFycmllcgo+IG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuIEkgd291bGQgbGlrZSB0byB0cnkgdGhl
IGZvbGxvd2luZyB0d28gaGFja3MsCj4gYW5kIHNlZSBpZiB3ZSBjYW4gZmluZCB3aGF0IGlzIHRo
ZSB0aW1pbmcgdGhhdCBpcyBub3Qgb2JzZXJ2ZWQsIGRlc3BpdGUKPiB0aGUgbGFjayBvZiBwcm9i
aW5nLiBUaGUgZmlyc3Qgb25lIGlzIGEgcmVhbCBoYWNrLCB0aGUgc2Vjb25kIG9uZSBtaWdodAo+
IGFjdHVhbGx5IGxvb2sgbGlrZSBhIHJlYWwgZml4LiBQbGVhc2UgbGV0IG1lIGtub3csIGJvdGgg
b2YgeW91LCBpZiB5b3UKPiBzZWUgZGlmZmVyZW50IGJlaGF2aW9ycy4KPgo+ICoqKiBIQUNLICMx
ICoqKgo+Cj4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvb21hcDIuYwo+ICsrKyBiL2RyaXZl
cnMvbXRkL25hbmQvcmF3L29tYXAyLmMKPiBAQCAtMjExMyw2ICsyMTEzLDkgQEAgc3RhdGljIGlu
dCBvbWFwX25hbmRfZXhlY19pbnN0cihzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwLAo+ICAgICAgICAg
Y2FzZSBOQU5EX09QX0NNRF9JTlNUUjoKPiAgICAgICAgICAgICAgICAgaW93cml0ZTgoaW5zdHIt
PmN0eC5jbWQub3Bjb2RlLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICBpbmZvLT5yZWcuZ3Bt
Y19uYW5kX2NvbW1hbmQpOwo+ICsgICAgICAgICAgICAgICBpZiAoaW5zdHItPmN0eC5jbWQub3Bj
b2RlID09IE5BTkRfQ01EX1JFQURDQUNIRVNFUSB8fAo+ICsgICAgICAgICAgICAgICAgICAgaW5z
dHItPmN0eC5jbWQub3Bjb2RlID09IE5BTkRfQ01EX1JFQURDQUNIRUVORCkKPiArICAgICAgICAg
ICAgICAgICAgICAgICB1ZGVsYXkoNTApOwo+ICAgICAgICAgICAgICAgICBicmVhazsKPgo+ICAg
ICAgICAgY2FzZSBOQU5EX09QX0FERFJfSU5TVFI6Cj4KPiAqKiogSEFDSyAjMiAqKioKPgo+IC0t
LSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L29tYXAyLmMKPiArKysgYi9kcml2ZXJzL210ZC9uYW5k
L3Jhdy9vbWFwMi5jCj4gQEAgLTIxNDMsOCArMjE0NiwxMCBAQCBzdGF0aWMgaW50IG9tYXBfbmFu
ZF9leGVjX2luc3RyKHN0cnVjdCBuYW5kX2NoaXAgKmNoaXAsCj4gICAgICAgICAgICAgICAgIGJy
ZWFrOwo+ICAgICAgICAgfQo+Cj4gLSAgICAgICBpZiAoaW5zdHItPmRlbGF5X25zKQo+ICsgICAg
ICAgaWYgKGluc3RyLT5kZWxheV9ucykgewo+ICsgICAgICAgICAgICAgICBtYigpOwo+ICAgICAg
ICAgICAgICAgICBuZGVsYXkoaW5zdHItPmRlbGF5X25zKTsKPiArICAgICAgIH0KPgo+ICAgICAg
ICAgcmV0dXJuIDA7Cj4gIH0KPgo+IFRoYW5rcyBhIGxvdCEKPiBNaXF1w6hsCj4KPiBtYW5zQG1h
bnNyLmNvbSB3cm90ZSBvbiBUaHUsIDIyIEp1biAyMDIzIDE1OjU5OjI1KzAxMDA6Cj4KPiA+IE1p
cXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+IHdyaXRlczoKPiA+Cj4gPiA+
IEZyb206IEphaW1lTGlhbyA8amFpbWVsaWFvLnR3QGdtYWlsLmNvbT4KPiA+ID4KPiA+ID4gQWRk
IHN1cHBvcnQgZm9yIHNlcXVlbnRpYWwgY2FjaGUgcmVhZHMgZm9yIGNvbnRyb2xsZXJzIHVzaW5n
IHRoZSBnZW5lcmljCj4gPiA+IGNvcmUgaGVscGVycyBmb3IgdGhlaXIgZmFzdCByZWFkL3dyaXRl
IGhlbHBlcnMuCj4gPiA+Cj4gPiA+IFNlcXVlbnRpYWwgcmVhZHMgbWF5IHJlZHVjZSB0aGUgb3Zl
cmhlYWQgd2hlbiBhY2Nlc3NpbmcgcGh5c2ljYWxseQo+ID4gPiBjb250aW51b3VzIGRhdGEgYnkg
bG9hZGluZyBpbiBjYWNoZSB0aGUgbmV4dCBwYWdlIHdoaWxlIHRoZSBwcmV2aW91cwo+ID4gPiBw
YWdlIGdldHMgc2VudCBvdXQgb24gdGhlIE5BTkQgYnVzLgo+ID4gPgo+ID4gPiBUaGUgT05GSSBz
cGVjaWZpY2F0aW9uIHByb3ZpZGVzIHRoZSBmb2xsb3dpbmcgYWRkaXRpb25hbCBjb21tYW5kcyB0
bwo+ID4gPiBoYW5kbGUgc2VxdWVudGlhbCBjYWNoZWQgcmVhZHM6Cj4gPiA+Cj4gPiA+ICogMHgz
MSAtIFJFQUQgQ0FDSEUgU0VRVUVOVElBTDoKPiA+ID4gICBSZXF1aXJlcyB0aGUgTkFORCBjaGlw
IHRvIGxvYWQgdGhlIG5leHQgcGFnZSBpbnRvIGNhY2hlIHdoaWxlIGtlZXBpbmcKPiA+ID4gICB0
aGUgY3VycmVudCBjYWNoZSBhdmFpbGFibGUgZm9yIGhvc3QgcmVhZHMuCj4gPiA+ICogMHgzRiAt
IFJFQUQgQ0FDSEUgRU5EOgo+ID4gPiAgIFRlbGxzIHRoZSBOQU5EIGNoaXAgdGhpcyBpcyB0aGUg
ZW5kIG9mIHRoZSBzZXF1ZW50aWFsIGNhY2hlIHJlYWQsIHRoZQo+ID4gPiAgIGN1cnJlbnQgY2Fj
aGUgc2hhbGwgcmVtYWluIGFjY2Vzc2libGUgZm9yIHRoZSBob3N0IGJ1dCBubyBtb3JlCj4gPiA+
ICAgaW50ZXJuYWwgY2FjaGUgbG9hZGluZyBvcGVyYXRpb24gaXMgcmVxdWlyZWQuCj4gPiA+Cj4g
PiA+IE9uIHRoZSBidXMsIGEgbXVsdGkgcGFnZSByZWFkIG9wZXJhdGlvbiBpcyBjdXJyZW50bHkg
aGFuZGxlZCBsaWtlIHRoaXM6Cj4gPiA+Cj4gPiA+ICAgICAwMCAtLSBBRERSMSAtLSAzMCAtLSBX
QUlUX1JEWSAodFIrdFJSKSAtLSBEQVRBMV9JTgo+ID4gPiAgICAgMDAgLS0gQUREUjIgLS0gMzAg
LS0gV0FJVF9SRFkgKHRSK3RSUikgLS0gREFUQTJfSU4KPiA+ID4gICAgIDAwIC0tIEFERFIzIC0t
IDMwIC0tIFdBSVRfUkRZICh0Uit0UlIpIC0tIERBVEEzX0lOCj4gPiA+Cj4gPiA+IFNlcXVlbnRp
YWwgY2FjaGVkIHJlYWRzIG1heSBpbnN0ZWFkIGJlIGFjaGlldmVkIHdpdGg6Cj4gPiA+Cj4gPiA+
ICAgICAwMCAtLSBBRERSMSAtLSAzMCAtLSBXQUlUX1JEWSAodFIpIC0tIFwKPiA+ID4gICAgICAg
ICAgICAgICAgICAgIDMxIC0tIFdBSVRfUkRZICh0UkNCU1krdFJSKSAtLSBEQVRBMV9JTiBcCj4g
PiA+ICAgICAgICAgICAgICAgICAgICAzMSAtLSBXQUlUX1JEWSAodFJDQlNZK3RSUikgLS0gREFU
QTJfSU4gXAo+ID4gPiAgICAgICAgICAgICAgICAgICAgM0YgLS0gV0FJVF9SRFkgKHRSQ0JTWSt0
UlIpIC0tIERBVEEzX0lOCj4gPiA+Cj4gPiA+IEJlbG93IGFyZSB0aGUgcmVhZCBzcGVlZCB0ZXN0
IHJlc3VsdHMgd2l0aCByZWd1bGFyIHJlYWRzIGFuZAo+ID4gPiBzZXF1ZW50aWFsIGNhY2hlZCBy
ZWFkcywgb24gTlhQIGkuTVg2IFZBUi1TT00tU09MTyBpbiBtYXBwaW5nIG1vZGUgd2l0aAo+ID4g
PiBhIE5BTkQgY2hpcCBjaGFyYWN0ZXJpemVkIHdpdGggdGhlIGZvbGxvd2luZyB0aW1pbmdzOgo+
ID4gPiAqIHRSOiAyMCDCtXMKPiA+ID4gKiB0UkNCU1k6IDUgwrVzCj4gPiA+ICogdFJSOiAyMCBu
cwo+ID4gPiBhbmQgdGhlIGZvbGxvd2luZyBnZW9tZXRyeToKPiA+ID4gKiBkZXZpY2Ugc2l6ZTog
MiBNaUIKPiA+ID4gKiBlcmFzZWJsb2NrIHNpemU6IDEyOCBraUIKPiA+ID4gKiBwYWdlIHNpemU6
IDIga2lCCj4gPiA+Cj4gPiA+ID09PT09PT09PT09PT0gTm9ybWFsIHJlYWQgQCAzM01IeiA9PT09
PT09PT09PT09PT09PQo+ID4gPiBtdGRfc3BlZWR0ZXN0OiBlcmFzZWJsb2NrIHJlYWQgc3BlZWQg
aXMgMTU2MzMgS2lCL3MKPiA+ID4gbXRkX3NwZWVkdGVzdDogcGFnZSByZWFkIHNwZWVkIGlzIDE1
NTE1IEtpQi9zCj4gPiA+IG10ZF9zcGVlZHRlc3Q6IDIgcGFnZSByZWFkIHNwZWVkIGlzIDE1Mzk4
IEtpQi9zCj4gPiA+ID09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PQo+ID4gPgo+ID4gPiA9PT09PT09PT0gU2VxdWVudGlhbCBjYWNoZSByZWFkIEAgMzNN
SHogPT09PT09PT09PT0KPiA+ID4gbXRkX3NwZWVkdGVzdDogZXJhc2VibG9jayByZWFkIHNwZWVk
IGlzIDE4Mjg1IEtpQi9zCj4gPiA+IG10ZF9zcGVlZHRlc3Q6IHBhZ2UgcmVhZCBzcGVlZCBpcyAx
NTg3NSBLaUIvcwo+ID4gPiBtdGRfc3BlZWR0ZXN0OiAyIHBhZ2UgcmVhZCBzcGVlZCBpcyAxNjI1
MyBLaUIvcwo+ID4gPiA9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT0KPiA+ID4KPiA+ID4gV2Ugb2JzZXJ2ZSBhbiBvdmVyYWxsIHNwZWVkIGltcHJvdmVt
ZW50IG9mIGFib3V0IDUlIHdoZW4gcmVhZGluZwo+ID4gPiAyIHBhZ2VzLCB1cCB0byAxNSUgd2hl
biByZWFkaW5nIGFuIGVudGlyZSBibG9jay4gVGhpcyBpcyBkdWUgdG8gdGhlCj4gPiA+IH4xNHVz
IGdhaW4gb24gZWFjaCBhZGRpdGlvbmFsIHBhZ2UgcmVhZCAodFIgLSAodFJDQlNZICsgdFJSKSku
Cj4gPiA+Cj4gPiA+IENvLWRldmVsb3BlZC1ieTogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5h
bEBib290bGluLmNvbT4KPiA+ID4gU2lnbmVkLW9mZi1ieTogTWlxdWVsIFJheW5hbCA8bWlxdWVs
LnJheW5hbEBib290bGluLmNvbT4KPiA+ID4gU2lnbmVkLW9mZi1ieTogSmFpbWVMaWFvIDxqYWlt
ZWxpYW8udHdAZ21haWwuY29tPgo+ID4gPiAtLS0KPiA+ID4gIGRyaXZlcnMvbXRkL25hbmQvcmF3
L25hbmRfYmFzZS5jIHwgMTE5ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0KPiA+ID4g
IGluY2x1ZGUvbGludXgvbXRkL3Jhd25hbmQuaCAgICAgIHwgICA5ICsrKwo+ID4gPiAgMiBmaWxl
cyBjaGFuZ2VkLCAxMjQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPiA+Cj4gPiBUaGlz
IGNoYW5nZSBicm9rZSBzb21ldGhpbmcgb24gYSBUSSBBTTM1MTcgYmFzZWQgc3lzdGVtLiAgV2hh
dCBJJ20KPiA+IG5vdGljaW5nIGlzIHRoYXQgdGhlIHUtYm9vdCBmd19zZXRlbnYgdG9vbCBpcyBm
YWlsaW5nIGR1ZSB0byB0aGUKPiA+IE1FTUdFVEJBREJMT0NLIGlvY3RsIHJlcG9ydGluZyBzb21l
IGJsb2NrcyBhcyBiYWQgd2hlbiB0aGV5IGFyZSBub3QuCj4gPiBFdmVyeXRoaW5nIGVsc2UgaXMs
IHNvbWVob3csIHdvcmtpbmcgZmluZS4gIFJldmVydGluZyB0aGlzIGNvbW1pdCBmaXhlcwo+ID4g
aXQsIHRob3VnaCBJIGRvbid0IGtub3cgd2h5LiAgSSdtIHNlZWluZyB0aGUgc2FtZSBiZWhhdmlv
dXIgb24gbXVsdGlwbGUKPiA+IGRldmljZXMsIHNvIEkgZG91YnQgdGhlcmUgaXMgYSBwcm9ibGVt
IHdpdGggdGhlIGZsYXNoIG1lbW9yeS4KPiA+Cj4gPiBJcyB0aGVyZSBhbnl0aGluZyBJIGNhbiB0
ZXN0IHRvIGdldCBtb3JlIGluZm9ybWF0aW9uPwo+ID4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWls
aW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tdGQvCg==
