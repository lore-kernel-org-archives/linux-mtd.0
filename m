Return-Path: <SRS0=kpjk=74=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8340EC433E0
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Jun 2020 15:11:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 543672063A
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Jun 2020 15:11:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qXfJQmoV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C5ACjIi/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 543672063A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+ZCWbQRnfFnS1fmi3Ev9PDJgygghB7YcFsF/MNKfjo4=; b=qXfJQmoV2RgcqV
	OaIfLmMyOGTXlJDsw8pu2jqCCoi4xqPtYKulTDsCLbluYodzhLvcQPIETGcgOHLSkwI/iOH+K73ph
	h6eOE/UEKuEW34DNMF8mbif8QNhfPkJuEPHvxRkpeO/xbjHk6QXnlAMkbTdQB60D+oQ/v4mMNW6y0
	txayBrT0tPFSHnfPoyTk/2SwyYn9S584fHRb6mX4bmWK58Awc7eAtJQzxeXBy9OX1zofFA/hZYo/K
	Jm4TZZMAji06JYnuOWHie8SAgjpdGxWHqzcNXHW+RVDT00XHjISYg+3gt3SV4vMqX8qgvsM6Ib9CR
	EIfFDuEO7R6zrG3qSD4w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jkqlX-0006tj-N6; Mon, 15 Jun 2020 15:11:15 +0000
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jkqlU-0006tB-Ls
 for linux-mtd@lists.infradead.org; Mon, 15 Jun 2020 15:11:14 +0000
Received: by mail-io1-xd43.google.com with SMTP id u13so627612iol.10
 for <linux-mtd@lists.infradead.org>; Mon, 15 Jun 2020 08:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=PieIGvQlj3E4NH14G199DoG6j5Cbq8FJrA0WPNTIlWg=;
 b=C5ACjIi/TkkOTzIVo/MR1GdGIhWnkkF+rEO579iDy7hjEpvc3EJ7rhU0mjVUXUHyeh
 HesF59K2qmTzk3x7jr3DDKlMfRs4I932YCIGBecS8OEtFy5sGxpUmcEqVUN4f+eL2LtZ
 852bNCHCsW6/JOQM+9wjVUCPUHJHffLQ5tC8bmZGBUaGn1Qi6TvRZmf1yKEZOQM1wfWj
 y3bKqqkBKkAYUxJpaLpzr39pTVGM+qyGJzlVMLv9hvAG3Pz4JuTpu3ayYVezhTi5g6Wo
 4CjDeC2/827S3CYrax7W+dVLXvIw4T3Wt9T8K+un5poarzjISI+NfA/0wGodAXnV79+r
 5TaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=PieIGvQlj3E4NH14G199DoG6j5Cbq8FJrA0WPNTIlWg=;
 b=RjK+szoNNrZERMfI3e3YHvWWTMC6KS5dbe11oPweLvHECylb12pYk3G/hEFZE2Wczh
 IXDtUdnVcPFY7gw0NFjLSNDYIFYTOGkoF02eWc43eOjE5KeRDjW2Zj6o/U9Y3dxePTf1
 7jpHYPBadgznEOZ5oqKqEdrhjYh3/UrA1SfBMiEG4GLoL39EFs1n2PE1SLNyWlZLVHJd
 pIAQrIec5F/EZaLwKOaGS4P6x5rlrpcMYypErQhOtVgb97OR+ZYe6aOEBeSVyWjD4ewn
 nwikpbs2S9M51Nw1eC1FOKJO1wZG1/TMq1OwLM+YXXKAEcGppe+gS2RhD3EGwARmoeHa
 jaxw==
X-Gm-Message-State: AOAM532e9Qbw3aR159lIES9VL3m6qeol6otIzvMIZfylW8hrUwnoyiiz
 mYCiTuQqm1UeohiHM4uYlVOdiOMmyxyhTsJRu2s=
X-Google-Smtp-Source: ABdhPJyGZp1m2WH/mUKvQLav5aU64ZZQSf6FLyDvOTrzG/Kwrk07DtR62ay+1BrYrXVAVd0GUPueWWq1zwjLP2PL750=
X-Received: by 2002:a02:6a1a:: with SMTP id l26mr21977264jac.66.1592233871265; 
 Mon, 15 Jun 2020 08:11:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200611054454.2547-1-kdasu.kdev@gmail.com>
 <20200611054454.2547-2-kdasu.kdev@gmail.com>
 <20200611092707.75da8c6a@xps13>
 <CAC=U0a3RXScu12LkU+hCv_5Lp_he92ExRFSgqLkwx40D6Xtrag@mail.gmail.com>
 <20200612090728.043b6baf@xps13>
 <CAC=U0a1oLPs_=SgUTxYPxiW8JpQXOpz-RbL2KrgzDjutt1v0mQ@mail.gmail.com>
 <20200615091923.0c3c7aa7@xps13>
In-Reply-To: <20200615091923.0c3c7aa7@xps13>
From: Kamal Dasu <kdasu.kdev@gmail.com>
Date: Mon, 15 Jun 2020 11:11:00 -0400
Message-ID: <CAC=U0a14R-ZFtwcjESLn67tOfM=DPtdm_Ljuu6Y6Xyx6mRS-Lw@mail.gmail.com>
Subject: Re: [PATCH 2/2] mtd: rawnand: brcmnand: Ecc error handling on EDU
 transfers
To: Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200615_081112_717289_E663B97C 
X-CRM114-Status: GOOD (  28.65  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBKdW4gMTUsIDIwMjAgYXQgMzoxOSBBTSBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5
bmFsQGJvb3RsaW4uY29tPiB3cm90ZToKPgo+IEhpIEthbWFsLAo+Cj4gS2FtYWwgRGFzdSA8a2Rh
c3Uua2RldkBnbWFpbC5jb20+IHdyb3RlIG9uIEZyaSwgMTIgSnVuIDIwMjAgMTI6MzQ6MjIKPiAt
MDQwMDoKPgo+ID4gT24gRnJpLCBKdW4gMTIsIDIwMjAgYXQgMzowNyBBTSBNaXF1ZWwgUmF5bmFs
IDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiB3cm90ZToKPiA+ID4KPiA+ID4gSGkgS2FtYWws
Cj4gPiA+Cj4gPiA+IEthbWFsIERhc3UgPGtkYXN1LmtkZXZAZ21haWwuY29tPiB3cm90ZSBvbiBU
aHUsIDExIEp1biAyMDIwIDEyOjA0OjI5Cj4gPiA+IC0wNDAwOgo+ID4gPgo+ID4gPiA+IE9uIFRo
dSwgSnVuIDExLCAyMDIwIGF0IDM6MjcgQU0gTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBi
b290bGluLmNvbT4gd3JvdGU6Cj4gPiA+ID4gPgo+ID4gPiA+ID4gSGkgS2FtYWwsCj4gPiA+ID4g
Pgo+ID4gPiA+ID4gS2FtYWwgRGFzdSA8a2Rhc3Uua2RldkBnbWFpbC5jb20+IHdyb3RlIG9uIFRo
dSwgMTEgSnVuIDIwMjAgMDE6NDQ6NTQKPiA+ID4gPiA+IC0wNDAwOgo+ID4gPiA+ID4KPiA+ID4g
PiA+ID4gSW1wbGVtZW50ZWQgRUNDIGNvcnJlY3RhYmxlIGFuZCB1bmNvcnJlY3RhYmxlIGVycm9y
IGhhbmRsaW5nIGZvciBFRFUKPiA+ID4gPiA+Cj4gPiA+ID4gPiBJbXBsZW1lbnQ/Cj4gPiA+ID4g
Pgo+ID4gPiA+ID4gPiByZWFkcy4gSWYgRUNDIGNvcnJlY3RhYmxlIGJpdGZsaXBzIGFyZSBlbmNv
dW50ZXJlZCAgb24gRURVIHRyYW5zZmVyLAo+ID4gPiA+ID4KPiA+ID4gPiA+IGV4dHJhIHNwYWNl
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeCj4gPiA+ID4gPgo+ID4g
PiA+ID4gPiByZWFkIHBhZ2UgYWdhaW4gdXNpbmcgcGlvLCBUaGlzIGlzIG5lZWRlZCBkdWUgdG8g
YSBjb250cm9sbGVyIGxtaXRhdGlvbgo+ID4gPiA+ID4KPiA+ID4gPiA+IHMvcGlvL1BJTy8KPiA+
ID4gPiA+Cj4gPiA+ID4gPiA+IHdoZXJlIHJlYWQgYW5kIGNvcnJlY3RlZCBkYXRhIGlzIG5vdCB0
cmFuc2ZlcnJlZCB0byB0aGUgRE1BIGJ1ZmZlciBvbiBFQ0MKPiA+ID4gPiA+ID4gZXJyb3JzLiBU
aGlzIGhvbGRzIHRydWUgZm9yIEVDQyBjb3JyZWN0YWJsZSBlcnJvcnMgYmV5b25kIHNldCB0aHJl
c2hvbGQuCj4gPiA+ID4gPgo+ID4gPiA+ID4gZXJyb3IuCj4gPiA+ID4gPgo+ID4gPiA+ID4gTm90
IHN1cmUgd2hhdCB0aGUgbGFzdCBzZW50ZW5jZSBtZWFucz8KPiA+ID4gPiA+Cj4gPiA+ID4KPiA+
ID4gPiBOQU5EIGNvbnRyb2xsZXIgYWxsb3dzIGZvciBzZXR0aW5nIGEgY29ycmVjdGFibGUgIEVD
QyB0aHJlc2hvbGQgbnVtYmVyCj4gPiA+ID4gb2YgYml0cyBiZXlvbmQgd2hpY2ggaXQgd2lsbCBh
Y3R1YWxseSByZXBvcnQgdGhlIGVycm9yIHRvIHRoZSBkcml2ZXIuCj4gPiA+ID4gZS5nLiBmb3Ig
QkNILTQgdGhlIHRocmVzaG9sZCBpcyAzLCBzbyAzLWJpdCBhbmQgNC1iaXQgZXJyb3JzIHdpbGwK
PiA+ID4gPiBnZW5lcmF0ZSBjb3JyZWN0YWJsZSBFQ0MgaW50ZXJydXB0IGhvd2V2ZXIgMS1iaXQg
YW5kIDItYml0IGVycm9ycyB3aWxsCj4gPiA+ID4gYmUgY29ycmVjdGVkIHNpbGVudGx5Lgo+ID4g
PiA+IEZyb20gdGhlIGFib3ZlIGV4YW1wbGUgRURVIGhhcmR3YXJlIHdpbGwgbm90IHRyYW5zZmVy
IGNvcnJlY3RlZCBkYXRhCj4gPiA+ID4gdG8gdGhlIERNQSBidWZmZXIgZm9yIDMtYml0IGFuZCA0
LWJpdCBlcnJvcnMgdGhhdCBnZXQgcmVwb3J0ZWQuIFNvCj4gPiA+ID4gb25jZSB3ZSBkZXRlY3QK
PiA+ID4gPiB0aGUgZXJyb3IgZHVpbmcgRURVIHdlIHJlYWQgdGhlIHBhZ2UgYWdhaW4gdXNpbmcg
cGlvLgo+ID4gPgo+ID4gPiBPayBJIHNlZSB3aGF0IHlvdSBtZWFuLCBjYW4ndCB5b3UgZmFrZSB0
aGUgdGhyZXNob2xkIGluc3RlYWQ/IFRoZSBOQU5ECj4gPiA+IGNvbnRyb2xsZXIgaW4gTGludXgg
aXMgbm90IHN1cHBvc2VkIHRvIGhhbmRsZSB0aGlzIHRocmVzaG9sZCwgdGhlIE5BTkQKPiA+ID4g
Y29yZSBpcyBpbiBjaGFyZ2UuIFNvIHdoYXQgdGhlIGNvbnRyb2xsZXIgZHJpdmVyIHNob3VsZCBk
byBpcyBqdXN0Ogo+ID4gPiBpbmNyZWFzZSB0aGUgbnVtYmVyIG9mIGJpdGZsaXBzICsgcmV0dXJu
IHRoZSBtYXhpbXVtIG51bWJlciBvciBiaXRmbGlwCj4gPiA+IG9yIGluY3JlYXNlIHRoZSBmYWls
dXJlIGNvdW50ZXIuIElzIHRoaXMgYWxyZWFkeSB0aGUgY2FzZT8KPiA+ID4KPiA+IC8qIHRocmVz
aG9sZCA9IGNlaWwoQkNILWxldmVsICogMC43NSkgKi8KPiA+IGJyY21uYW5kX3dyX2NvcnJfdGhy
ZXNoKGhvc3QsIERJVl9ST1VORF9VUChjaGlwLT5lY2Muc3RyZW5ndGggKiAzLCA0KSk7Cj4gPiBU
aGlzIGhvdyB0aGUgdGhyZXNob2xkIGlzIHNldCwgYWxsIGl0IG1lYW5zIGlzIHRoYXQgZm9yIGhp
Z2ggQkNICj4gPiBsZXZlbHMgZG9uJ3QgaW50ZXJydXB0IG9uIGxvdyBudW1iZXIgKGxlc3MgdGhh
biB0aHJlc2hvbGQpIG9mCj4gPiBiaXRfZmxpcHMuIFllcyB0aGUgY29udHJvbGxlciBkcml2ZXIg
b25seSBpbmNyZW1lbnRzIGNvcnJlY3RhYmxlIEVDQwo+ID4gY291bnQuIEJ1dCBkdWUgdGhlIEVE
VSBkZXNpZ24gYW4gRURVIG9wZXJhdGlvbiBpcyBkaXNydXB0ZWQgd2hlbiB0aGUKPiA+IGNvbnRy
b2xsZXIgaW50ZXJydXB0cyBvbiBjb3JyZWN0YWJsZSBFQ0MgZXJyb3JzIGR1cmluZyBzdWJwYWdl
IEVDQwo+ID4gY2FsY3VsYXRpb25zLiBIZW5jZSB0aGUgZHJpdmVyIG5lZWRzIHRvIHJlYWQgdGhl
IHBhZ2UgYWdhaW4gd2l0aCBQSU8KPiA+IHRvIHRyYW5zZmVyIGNvcnJlY3RlZCBkYXRhLgo+Cj4g
SUlVQywgeW91IGFyZSBkb2luZyB0aGUgam9iIHR3aWNlOiB5b3Ugc2hvdWxkIGp1c3QgcmV0dXJu
IGEgbnVtYmVyIG9mCj4gYml0ZmxpcHMgb3IgYW4gZXJyb3IgdG8gdGhlIE5BTkQgY29yZS4gU28g
dGhhdCdzIHdoeSBJJ20gdGVsbGluZyB0aGF0Cj4geW91IHNob3VsZCBnZXQgcmlkIG9mIHRoaXMg
dGhyZXNob2xkLiBJdCB3b3VsZCBhdm9pZCB0aGUgbmVlZCBmb3IgdGhlCj4gUElPIHRyYW5zZmVy
IHRvby4KCkkgdGhpbmsgeW91IGFyZSByZWFkaW5nIHNvbWUgc3RhdGVtZW50cyBpbiBpc29sYXRp
b24gdGhhdCBwcm9iYWJseSBhcmUKY2F1c2luZyBzb21lIGNvbmZ1c2lvbi4KRURVIGRlc2lnbiBo
YXMgYSBmbGF3IGluIGNhc2Ugb2YgcmVwb3J0ZWQgIEVDQyBlcnJvciBpbnRlcnJ1cHQgaW4gdGhh
dApjb3JyZWN0ZWQgZGF0YSBpcyBub3QgdHJhbnNmZXJyZWQgdG8gdGhlIERNQSBidWZmZXIuIFRo
ZSBQSU8gaXMgbmVlZGVkCnRvIHJlYWQgY29ycmVjdGVkIGRhdGEgaW50byB0aGUgTkFORCBkYXRh
IGJ1ZmZlciBhbmQgb25seSBmb3IgdGhlCnJlcG9ydGVkIGVycm9ycy4gU28gdGhlcmUgaXMgbm8g
bmVlZCB0byBjaGFuZ2UgdGhlIHRocmVzaG9sZApjYWxjdWxhdGlvbiBsb2dpYywgaWYgd2UgZ2V0
IHJpZCBvZiB0aGUgdGhyZXNob2xkIHRoZW4gd2Ugd2lsbCBoYXZlIHRvCmRvIHRoZSBQSU8gcmVh
ZCBvbiBhbnkgY29ycmVjdGFibGUgYml0IGVycm9yIGlmIGl0IG9jY3VycyBkdXJpbmcgRURVCnJl
YWRzLgoKPgo+IFlvdSBhbHNvIHNheSB0aGF0IHRoZSBjb250cm9sbGVyICJvbmx5IGluY3JlbWVu
dHMgY29ycmVjdGFibGUgRUNDCj4gY291bnQiLCB3aGF0IGRvIHlvdSBtZWFuIGV4YWN0bHk/CgpN
YXliZSB0aGF0IHN0YXRlbWVudCB3YXMgYSBiaXQgbWlzbGVhZGluZy4gVG8gYmUgY2xlYXIgd2hl
biBhbiBFQ0MKZXJyb3IgaXMgcmVwb3J0ZWQgdGhlIGNvbnRyb2xsZXIgZ2l2ZXMgdGhlIGJpdF9m
bGlwcyBjb3VudCAgYXMgd2VsbCBhcwp1cGRhdGVzIHRoZSBFQ0MgZXJyb3IgYWRkcmVzcyBSZWdp
c3RlciBhbmQgZWNjIGVycm9yIHN0YXR1cyByZWdpc3RlcnMuClRoaXMgbG9naWMgd29ya3MgYXMg
ZXhwZWN0ZWQgaW4gdGhlIGhhcmR3YXJlLgoKPlRoZSBjb250cm9sbGVyIGRvZXMgbm90IHJlcG9y
dCBlcnJvcnMKPiB3aGVuIHRoZSBudW1iZXIgb2YgYml0ZmxpcHMgaGFwcGVucyB0byBiZSBhYm92
ZSB0aGUgQkNIIHRocmVzaG9sZD8gVGhpcwo+IHdvdWxkIGJlIHRoZSBvbmx5IGNhc2Ugd2hlcmUg
d2hhdCBpcyBjdXJyZW50bHkgZG9uZSB3b3VsZCBiZSBhY3R1YWxseQo+IG5lZWRlZCB0aG91Z2gu
CgogSXQncyB0aGUgb3RoZXIgd2F5LiBUaGUgY29udHJvbGxlciBvbmx5IHJlcG9ydHMgYml0IGVy
cm9ycyBiZXlvbmQKPj10aHJlc2hvbGQgdmFsdWUsIHdpbGwgbm90IHJlcG9ydCBvdGhlcndpc2Ug
YW5kIHNpbGVudGx5IGNvcnJlY3QgdGhlCmRhdGEuIFRoZXJlIGlzIG5vIHByb2JsZW0gaW4gIGNh
c2VzIHdoZXJlIGVycm9zIGFyZSBjb3JyZWN0ZWQKc2lsZW50bHkuIE5vdyBFQ0MgKHVuKWNvcnJl
Y3RhYmxlIG9uIEVEVSByZWFkcyBhcmUgZGV0ZWN0ZWQgYnkgc2ltcGx5CnJlYWRpbmcgYmFjayB0
aGUgRUNDIEVycm9yIGFkZHJlc3MgcmVnaXN0ZXIuIEFuZCBpbiBjYXNlIG9mIHJlcG9ydGVkCnVu
Y29ycmVjdGFibGUgRUNDIGVycm9ycyBhcmUgdHJlYXRlZCBhcyB1c3VhbC4gIEFuZCBmb3IgcmVw
b3J0ZWQKY29ycmVjdGFibGUgRUNDIGVycm9ycyB3ZSBuZWVkIHRvIHJlYWQgdGhlIHBhZ2UgYWdh
aW4gdXNpbmcgUElPIHNvCnRoYXQgdGhlIGNvcnJlY3RlZCBkYXRhIGlzIHByb3Blcmx5IHRyYW5z
ZmVycmVkLiBBbGwgdGhpcyBhcHBsaWVzIHRvCkVEVSB0cmFuc2ZlciBvbmx5LgoKPgo+IFRoYW5r
cywKPiBNaXF1w6hsCgpLYW1hbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
