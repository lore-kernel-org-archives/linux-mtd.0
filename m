Return-Path: <SRS0=Ud6c=HD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37371C433DB
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Feb 2021 14:33:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A6FCB64E50
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Feb 2021 14:33:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A6FCB64E50
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GFPofTu7xgGAyBy1UM881aPMnIvfxLK8DVnGAjmk2WI=; b=yG1NfeEBhEFe5z9IC/EPFXRs/
	TJ4J9ct7upjlNDUXiwQpzjzqKuVOOGdVpbQpWaLr4/jjTD67IJ0ngeTnlHmPiWBma+M8jDs4qozZL
	f2k8HFAYQ/zXYQbFY9oamf1rItPbBKtBKxMriXbYi7Mg9IBtK7swX0LFOaISv6EYwClhgD+cI4hhz
	8h1zud976EiQ6+MEGHBFY30VyxiBm1dy6AEZiTAsq5UKzBvUeNWCWjfWAse8eN47nXfYOAtEniFqq
	9Bmew7NrRrLQNgGRsruwKAFibgtcrYAwb52x2IIZsb+eEH4BHVI+UjlJMKr8dz+ZeawfB3ALTNrbX
	Vc6LxpJzw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6aFZ-0006Tq-VY; Mon, 01 Feb 2021 14:32:22 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6aFX-0006TE-D2
 for linux-mtd@lists.infradead.org; Mon, 01 Feb 2021 14:32:20 +0000
Received: by mail-wr1-x42a.google.com with SMTP id q7so16773341wre.13
 for <linux-mtd@lists.infradead.org>; Mon, 01 Feb 2021 06:32:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=rMd+rqW8Sk9SGI3yBHArjGtB5dDJwADVC5uCYmu2aRc=;
 b=ZWKlyaZSn0O0FNOBBMKqo9l9oyxZv1KeNojV9A0We4I6LKGLctSVtFaWBApUET0iDj
 2K3evkCVzLKijL81nfdp3UgoSwbkT8HrA1XwlL5J+zQr2/1gyw3dB0TO5ueXDnZgC/ry
 4MgqaSFdbO+66c+o0PSjJoDmD/d58cjBFuCbg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=rMd+rqW8Sk9SGI3yBHArjGtB5dDJwADVC5uCYmu2aRc=;
 b=TsmYEVAV+eEWccjxBp+uMVdcuBNd+vRhSeZ73LJJUzlbQ0KINlZ+W2niKg3BqxuJMO
 2/NqC35rgI0Ud6ad/oCKOJ0ycoyYxvnigM3ieVx/lNDcl7qPbaXNxRBt610NbpxRs0k4
 8P++CC1BkzIAAf7SEMVTPmKEbapisHTn3ewNLC4bVWgLbxanQIdBC3eD88ax8eXorMPN
 UuaP6WQigbsBUvGEkIYdLFIlwKwbk2esNaltGXSDvpvM03WDrAJbmVzDtdCWCnIHXXVf
 OILp0AsuOeidd8lxdWhyS2HYg4gR3TalawnPufZu0YEhFCywGhNCIklxY6qm+ZRaBq7r
 eCzg==
X-Gm-Message-State: AOAM531tWEzn7gPwZuCp88hanpXXnsyGX/acORkVP5szEqYRI/0ibKi3
 FSrPTGUOOwdolX+6lNh26fXLtRvJtL+RckFs4SyIS7wuzXE=
X-Google-Smtp-Source: ABdhPJybzGMq5jk1c2ci1mTJl0isaii20ms+4sNkpmTBa4LdJ02T0f716jZxBKpVF/UImw8limGpwlIRaxgDGfp5QcQ=
X-Received: by 2002:adf:eccc:: with SMTP id s12mr12225495wro.383.1612189935714; 
 Mon, 01 Feb 2021 06:32:15 -0800 (PST)
MIME-Version: 1.0
References: <89ae32a0-9b19-4735-90eb-4ffa22aad704@kernel.org>
 <20190730103822.7576645d@xps13>
 <0a6afd79-d5ca-24da-a62c-11146a3522f6@kernel.org>
 <20190731082823.6284f5a9@collabora.com>
 <e47b1de2-501a-9a1f-e980-48d2c396811a@kernel.org>
 <20190802145109.00c4a4eb@collabora.com>
 <b739696d-bb1d-bb04-cd45-3019712e29ad@kernel.org>
 <20190808183651.7c0962e7@collabora.com>
 <694cb2ac-68e6-72b1-3d55-e405b176a17f@kernel.org>
 <20190809082356.0cf60555@collabora.com>
 <ce7157e2-a8d0-7204-4003-8a711acb65b8@kernel.org>
 <20190809093235.09d89e20@collabora.com>
 <c5af9334-f679-6fc9-4d2a-1366a295598a@kernel.org>
 <20190809155934.40c43f29@collabora.com>
 <00b31833-69ba-42c5-57c9-37fa1f70efc5@kernel.org>
 <20190812093129.75888dad@collabora.com>
 <a47792dc-b19f-8af3-8748-5a21fb63271e@kernel.org>
 <CAOf5uwmPzCU8WFRQ1tQBdN7OVGZZ9SvdAG0YqVAyxmA1zwtUhg@mail.gmail.com>
 <2e9e1f1c-ee57-425d-1791-70c66de52637@kernel.org>
 <CAOf5uwm93+ARf=_BckjMar1tpeBs6YHeUwORj5cyhFfvu5fNWQ@mail.gmail.com>
 <20210201151335.210af8ca@xps13>
In-Reply-To: <20210201151335.210af8ca@xps13>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Mon, 1 Feb 2021 15:32:04 +0100
Message-ID: <CAOf5uwkivHhMX_mPJymBZxQge_wc4K1p_1S3gsQYHPV40aaj3w@mail.gmail.com>
Subject: Re: GPMI iMX6ull timeout on DMA
To: Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210201_093219_548296_A063B92C 
X-CRM114-Status: GOOD (  21.83  )
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
Cc: linux-mtd@lists.infradead.org, Sascha Hauer <s.hauer@pengutronix.de>,
 Greg Ungerer <gerg@kernel.org>, Boris Brezillon <bbrezillon@kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkKCk9uIE1vbiwgRmViIDEsIDIwMjEgYXQgMzoxMyBQTSBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwu
cmF5bmFsQGJvb3RsaW4uY29tPiB3cm90ZToKPgo+IEhpIE1pY2hhZWwsCj4KPiBNaWNoYWVsIE5h
enphcmVubyBUcmltYXJjaGkgPG1pY2hhZWxAYW1hcnVsYXNvbHV0aW9ucy5jb20+IHdyb3RlIG9u
Cj4gU2F0LCAzMCBKYW4gMjAyMSAxMDo0MToyOSArMDEwMDoKPgo+ID4gSGkgTWlxdWVsCj4gPgo+
ID4gY29tbWl0IGY4ZTZhZDE0Mzg4MDY3ZjkxYjI2ZDA0NDE4NWQ5NTYyM2ZiYzk1MzUKPiA+IEF1
dGhvcjogTWljaGFlbCBUcmltYXJjaGkgPG1pY2hhZWxAYW1hcnVsYXNvbHV0aW9ucy5jb20+Cj4g
PiBEYXRlOiAgIEZyaSBKYW4gMjkgMDg6NDY6NTMgMjAyMSArMDEwMAo+ID4KPiA+ICAgICBtdGQ6
IG5hbmQ6IENhbGN1bGF0ZSB0aGUgY2xvY2sgYmVmb3JlIGVuYWJsZSBpdAo+ID4KPiA+ICAgICBT
aWduZWQtb2ZmLWJ5OiBNaWNoYWVsIFRyaW1hcmNoaSA8bWljaGFlbEBhbWFydWxhc29sdXRpb25z
LmNvbT4KPiA+ICAgICBDaGFuZ2UtSWQ6IEk3OWIwZGEzOWRlMGE5YjMyZWEwYjAwMmZhMjAwZDdm
NDRkNGY4Y2U3Cj4gPgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L2dwbWkt
bmFuZC9ncG1pLWxpYi5jCj4gPiBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2dwbWktbmFuZC9ncG1p
LWxpYi5jCj4gPiBpbmRleCAzMjJhMDA4MjkwZTUuLjBiY2E1MmIzYmM4ZiAxMDA2NDQKPiA+IC0t
LSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L2dwbWktbmFuZC9ncG1pLWxpYi5jCj4gPiArKysgYi9k
cml2ZXJzL210ZC9uYW5kL3Jhdy9ncG1pLW5hbmQvZ3BtaS1saWIuYwo+ID4gQEAgLTM3Nyw2ICsz
NzcsNyBAQCBzdGF0aWMgdm9pZCBncG1pX25mY19jb21wdXRlX3RpbWluZ3Moc3RydWN0Cj4gPiBn
cG1pX25hbmRfZGF0YSAqdGhpcywKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBjb25zdCBzdHJ1Y3QgbmFuZF9zZHJfdGltaW5ncyAqc2RyKQo+ID4gIHsKPiA+ICAgICAg
ICAgc3RydWN0IGdwbWlfbmZjX2hhcmR3YXJlX3RpbWluZyAqaHcgPSAmdGhpcy0+aHc7Cj4gPiAr
ICAgICAgIHN0cnVjdCByZXNvdXJjZXMgKnIgPSAmdGhpcy0+cmVzb3VyY2VzOwo+ID4gICAgICAg
ICB1bnNpZ25lZCBpbnQgZGxsX3RocmVzaG9sZF9wcyA9IHRoaXMtPmRldmRhdGEtPm1heF9jaGFp
bl9kZWxheTsKPiA+ICAgICAgICAgdW5zaWduZWQgaW50IHBlcmlvZF9wcywgcmVmZXJlbmNlX3Bl
cmlvZF9wczsKPiA+ICAgICAgICAgdW5zaWduZWQgaW50IGRhdGFfc2V0dXBfY3ljbGVzLCBkYXRh
X2hvbGRfY3ljbGVzLCBhZGRyX3NldHVwX2N5Y2xlczsKPiA+IEBAIC00NDAsNiArNDQxLDggQEAg
c3RhdGljIHZvaWQgZ3BtaV9uZmNfY29tcHV0ZV90aW1pbmdzKHN0cnVjdAo+ID4gZ3BtaV9uYW5k
X2RhdGEgKnRoaXMsCj4gPiAgICAgICAgICAgICAgICAgaHctPmN0cmwxbiB8PSBCRl9HUE1JX0NU
UkwxX1JETl9ERUxBWShzYW1wbGVfZGVsYXlfZmFjdG9yKSB8Cj4gPiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBCTV9HUE1JX0NUUkwxX0RMTF9FTkFCTEUgfAo+ID4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgKHVzZV9oYWxmX3BlcmlvZCA/IEJNX0dQTUlfQ1RSTDFfSEFMRl9Q
RVJJT0QgOiAwKTsKPiA+ICsKPiA+ICsgICAgICAgY2xrX3NldF9yYXRlKHItPmNsb2NrWzBdLCBo
dy0+Y2xrX3JhdGUpOwo+ID4gIH0KPiA+Cj4gPiAgdm9pZCBncG1pX25mY19hcHBseV90aW1pbmdz
KHN0cnVjdCBncG1pX25hbmRfZGF0YSAqdGhpcykKPiA+IEBAIC00NDksOCArNDUyLDYgQEAgdm9p
ZCBncG1pX25mY19hcHBseV90aW1pbmdzKHN0cnVjdCBncG1pX25hbmRfZGF0YSAqdGhpcykKPiA+
ICAgICAgICAgdm9pZCBfX2lvbWVtICpncG1pX3JlZ3MgPSByLT5ncG1pX3JlZ3M7Cj4gPiAgICAg
ICAgIHVuc2lnbmVkIGludCBkbGxfd2FpdF90aW1lX3VzOwo+ID4KPiA+IC0gICAgICAgY2xrX3Nl
dF9yYXRlKHItPmNsb2NrWzBdLCBody0+Y2xrX3JhdGUpOwo+ID4gLQo+ID4gICAgICAgICB3cml0
ZWwoaHctPnRpbWluZzAsIGdwbWlfcmVncyArIEhXX0dQTUlfVElNSU5HMCk7Cj4gPiAgICAgICAg
IHdyaXRlbChody0+dGltaW5nMSwgZ3BtaV9yZWdzICsgSFdfR1BNSV9USU1JTkcxKTsKPiA+Cj4g
PiBSaWdodCBub3cgSSBoYXZlIHRoaXMgY2hhbmdlIGFwcGxpZWQgYW5kIHNlZW1zIGZpbmUuIFRo
YXQgaXMgdGhlIG9ubHkKPiA+IGRpZmZlcmVuY2UgSSBnZXQuIENsb2NrIGlzIGFwcGx5IGEgYml0
IGVhcmxpZXIgdGhhdCB3aGVuIGlzIGVuYWJsZWQKPiA+IGl0Lgo+Cj4gVGhpcyBpcyB2ZXJ5IGlu
dGVyZXN0aW5nLiBTbyB0aGlzIHdvdWxkIG1lYW4gdGhlIGlzc3VlIHlvdSBhcmUKPiBleHBlcmll
bmNpbmcgY29tZXMgZnJvbSB0aGUgY2xvY2sgZHJpdmVyIHdoaWNoIGtpbmQgb2YgcmV0dXJucyB0
b28KPiBlYXJseSBmcm9tIGNsa19zZXRfcmF0ZSgpPyBDb3VsZCB5b3UgcmVwb3J0IHRoaXMgdG8g
dGhlIGNsayBNTC9OWFAgY2xrCj4gbWFpbnRhaW5lcnMgYW5kIGtlZXAgdXMgaW4gY29weT8gSWYg
aXQgaXMgYXMgZ2xvYmFsIGFzIGl0IHNvdW5kcywgd2UKPiBtaWdodCBub3QgYmUgdGhlIG9ubHkg
b25lcyBhZmZlY3RlZC4KPgoKVGhlIGlteDI4IGlzIGJyb2tlbiB0b28sIHNvIGl0J3MgYSBnZW5l
cmFsIHByb2JsZW0uIEkgbmVlZCB0byB0cmFjZSBpdCBkb3duCkkgaGF2ZSBhIHJldmVydGluZyBm
b3IgbHRzIGJ1dCBpdFxzIG5vdCB0aGUgd2F5IHRvIGdvCgpNaWNoYWVsCgo+IFRoYW5rcywKPiBN
aXF1w6hsCgoKCi0tIApNaWNoYWVsIE5henphcmVubyBUcmltYXJjaGkKQW1hcnVsYSBTb2x1dGlv
bnMgQlYKQ09PIENvLUZvdW5kZXIKQ3J1cXVpdXNrYWRlIDQ3IEFtc3RlcmRhbSAxMDE4IEFNIE5M
ClQuICszMSgwKTg1MTExOTE3MgpNLiArMzkoMCkzNDc5MTMyMTcwCltgYXNdIGh0dHBzOi8vd3d3
LmFtYXJ1bGFzb2x1dGlvbnMuY29tCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
