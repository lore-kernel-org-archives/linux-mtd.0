Return-Path: <SRS0=VZvC=73=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60C44C433E0
	for <linux-mtd@archiver.kernel.org>; Sun, 14 Jun 2020 08:53:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 32A47206D7
	for <linux-mtd@archiver.kernel.org>; Sun, 14 Jun 2020 08:53:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="usw63cMb";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k1x2oowR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 32A47206D7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hHv23lxHNr/ptWxbthybfSkHTZVGOmU4Cs1VzKrX35k=; b=usw63cMbSC07oG
	+jRM/XlFExQfNMkvqQB3rZtDS3gPEYphdHXPjHjlGohFm2eIxL6BRf31PHnycrGvcWXl+/KBkOKdQ
	vSJxbkvd2hx03rSlQmtsIjqaOc9qcdJtruY9mynC/P0cGWHTIayjLgGphfeTLP9UJl2cA3H1xTlhg
	zAmbTT2RHYuIwj/DTpw026SbSqWX/uHilfl3zloO/wu6I6HmHwLzL/gXUzN4XuLqgHc0nhNxTxJpW
	aUBk0ScMNnIcHLInySA8UfDuuvYNFfysn58GsNgBmYGt8znKG70qHqbbWFGz5QvoeH2RJh8w9bF7z
	dgk7l81TpKal2ZdXDLZw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jkOOD-0007K9-9p; Sun, 14 Jun 2020 08:53:17 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jkOOA-0007JN-A4
 for linux-mtd@lists.infradead.org; Sun, 14 Jun 2020 08:53:16 +0000
Received: by mail-wr1-x443.google.com with SMTP id r7so14070071wro.1
 for <linux-mtd@lists.infradead.org>; Sun, 14 Jun 2020 01:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=b3VS3PUglWU05RRagqbS4YBCgN8jvE9wxE1b+IXwJg8=;
 b=k1x2oowRu/p8CYe184hdaKdH+WgpxyUJ+jcROT3XOzPxfk63JicjMP0IKR7jvEyDAw
 Sxd5owQsw6RlmbM3iPX3sSjx8esbZCIHtyF2ogc95RQ59bQlh7gnnLgmpi2GmzBdZEYC
 FH6UaRk6pgJGIEaTAV5EeFUGYkdygxAaCzRTypJOs9WFFMal2nQp5dofFTBwncbNNssJ
 hTvnGpfAxTDSdJR+rdutMx+YbXIy7br3FJwdq2jwAPVjUJptN2+9Q4TfWZcf+i6tJtVp
 J5G1q8tIRGXWd2aO5tgrKVFmv+KC9ZfnNaLdkFKMriKWZ4U24jOiXKe6OMrttXyexFbV
 8OBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=b3VS3PUglWU05RRagqbS4YBCgN8jvE9wxE1b+IXwJg8=;
 b=KFNfUQuk4X5T9420wCCuH+tn03Abdf13Zc/85tgF6ZbnmqvGU+KmLVJJYmmMLRPd9f
 qbyngnSqvufwg26/CkCAM7WWTab+O2eXO5QTdSvL+aTk554XPNderg2snFrUCW7xDqif
 mCY4GL8X9eM9mHhBk71O3YUvM30Tl5RNR+jjl8qVEiiB9HeJEGPPGsedMApuG8obTqzg
 FE0F5XDaje2vOrUW1/GZrg9xu6ORQzXbjjxafd/OaLRKoCSZAChXWgS3vqyVPcMuNxrI
 62GaproI5eUYWpF6mDLHITv3+eDu9oOcGst+8+uRmxJXpjBlwLSl8NdyQPszcBGWZHmD
 NpiQ==
X-Gm-Message-State: AOAM532ZLGsVdt4H0StVYXshTmEolaLY1DhRGa7mOcYgmdDVcu3y3ubV
 zcuPeXpmpfd4RzUepVVrRqI=
X-Google-Smtp-Source: ABdhPJwag0K1c4bIfKfdV5Sosa1eJtMO6AXiUBSa7TKSTvQPQAtg9gRn6k313b/GxQynhhh9WGndBA==
X-Received: by 2002:a5d:4701:: with SMTP id y1mr23136233wrq.310.1592124790802; 
 Sun, 14 Jun 2020 01:53:10 -0700 (PDT)
Received: from macbook-pro-alvaro-eth.lan
 (168.red-88-20-188.staticip.rima-tde.net. [88.20.188.168])
 by smtp.gmail.com with ESMTPSA id a81sm18162266wmd.25.2020.06.14.01.53.09
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 14 Jun 2020 01:53:10 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH] mtd: rawnand: brcmnand: force raw OOB writes
From: =?utf-8?Q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>
In-Reply-To: <CAC=U0a0=7UHY2fH+2HS5hbxThe9rYvqTKggFJP4mm-5ib52dtA@mail.gmail.com>
Date: Sun, 14 Jun 2020 10:53:09 +0200
Message-Id: <F9D394A3-43EC-4E61-B4CA-C113C4516FB1@gmail.com>
References: <20200605170720.2478262-1-noltari@gmail.com>
 <CAC=U0a3xa9k76mxsiVKDyXsuvboZAyMkXT-S3-6oVZKjnWkeHA@mail.gmail.com>
 <05C962F2-7D3B-4103-91DD-8D31C439D521@gmail.com>
 <CAC=U0a0=7UHY2fH+2HS5hbxThe9rYvqTKggFJP4mm-5ib52dtA@mail.gmail.com>
To: Kamal Dasu <kdasu.kdev@gmail.com>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200614_015314_353439_7E620BC2 
X-CRM114-Status: GOOD (  22.46  )
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
Cc: "R, Vignesh" <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgS2FtYWwsCgo+IEVsIDEzIGp1biAyMDIwLCBhIGxhcyAxNzoxNiwgS2FtYWwgRGFzdSA8a2Rh
c3Uua2RldkBnbWFpbC5jb20+IGVzY3JpYmnDszoKPiAKPiBBbHZhcm8sCj4gCj4gCj4gT24gU2F0
LCBKdW4gMTMsIDIwMjAgYXQgNTowMSBBTSDDgWx2YXJvIEZlcm7DoW5kZXogUm9qYXMKPiA8bm9s
dGFyaUBnbWFpbC5jb20+IHdyb3RlOgo+PiAKPj4gSGkgS2FtYWwsCj4+IAo+Pj4gRWwgMTIganVu
IDIwMjAsIGEgbGFzIDIwOjQ3LCBLYW1hbCBEYXN1IDxrZGFzdS5rZGV2QGdtYWlsLmNvbT4gZXNj
cmliacOzOgo+Pj4gCj4+PiBPbiBGcmksIEp1biA1LCAyMDIwIGF0IDE6MDcgUE0gw4FsdmFybyBG
ZXJuw6FuZGV6IFJvamFzIDxub2x0YXJpQGdtYWlsLmNvbT4gd3JvdGU6Cj4+Pj4gCj4+Pj4gTVRE
X09QU19BVVRPX09PQiBpcyB3cml0dGluZyBPT0Igd2l0aCBFQ0MgZW5hYmxlZCwgd2hpY2ggY2hh
bmdlcyBhbGwgRUNDIGJ5dGVzCj4+Pj4gZnJvbSBhbiBlcmFzZWQgcGFnZSB0byAweDAwIHdoZW4g
SkZGUzIgY2xlYW5tYXJrZXJzIGFyZSBhZGRlZCB3aXRoIG10ZC11dGlscy4KPj4+PiAgICAgICAg
fCBCQkkgfCAgIEpGRlMyICAgfCAgIEVDQyAgIHwgICBKRkZTMiAgIHwgU3BhcmUgIHwKPj4+PiAw
MDAwMDgwMCAgZmYgZmYgMTkgODUgMjAgMDMgMDAgMDAgIDAwIDAwIDAwIDAwIDA4IGZmIGZmIGZm
Cj4+Pj4gCj4+Pj4gSG93ZXZlciwgaWYgT09CIGlzIHdyaXR0ZW4gd2l0aCBFQ0MgZGlzYWJsZWQs
IHRoZSBKRkZTMiBjbGVhbm1hcmtlcnMgYXJlCj4+Pj4gY29ycmVjdGx5IHdyaXR0ZW4gd2l0aG91
dCBjaGFuZ2luZyB0aGUgRUNDIGJ5dGVzOgo+Pj4+ICAgICAgICB8IEJCSSB8ICAgSkZGUzIgICB8
ICAgRUNDICAgfCAgIEpGRlMyICAgfCBTcGFyZSAgfAo+Pj4+IDAwMDAwODAwICBmZiBmZiAxOSA4
NSAyMCAwMyBmZiBmZiAgZmYgMDAgMDAgMDAgMDggZmYgZmYgZmYKPj4+IAo+Pj4gQm90aCBicmNt
YW5kX3dyaXRlX29vYl9yYXcoKSBhbmQgYnJjbW5hbmRfd3JpdGVfb29iKCkgdXNlCj4+PiBicmNt
bmFuZF93cml0ZSgpIHRoYXQgdXNlcyBQUk9HUkFNX1BBR0UgY21kLCBtZWFucyBhbHNvIHByb2dy
YW1zIGRhdGEKPj4+IGFyZWFzIGFuZCBFQ0Mgd2hlbiBlbmFibGVkICBpcyBhbHdheXMgY2FsY3Vs
YXRlZCBvbiBEQVRBK09PQi4gIHNpbmNlCj4+IAo+PiBBcmUgeW91IHN1cmUgYWJvdXQgdGhhdD8g
SSB0aGluayB0aGF0IEhXIEVDQyBpcyBvbmx5IGNhbGN1bGF0ZWQgZm9yIERBVEEsIG5vdCBmb3Ig
T09CLgo+PiBUaGUgZmFjdCB0aGF0IHdl4oCZcmUgbm90IHdyaXRpbmcgYW55IERBVEEgc2VlbXMg
dG8gYmUgdGhlIHByb2JsZW0gdGhhdCBpcyBjaGFuZ2luZyBhbGwgRUNDIGJ5dGVzIHRvIDB4MDAu
Cj4+IAo+IAo+IE9ubHkgdHJ1ZSBmb3IgMS1iaXQgaGFtbWluZyBjb2RlIG9uIGVhcmx5IGNvbnRy
b2xsZXIgdmVyc2lvbnMuICBGb3IKPiBCQ0ggYWxnb3JpdGhtcyBib3RoIGRhdGErb29iIGFyZSBj
b3ZlcmVkLiBBbmQgdGhlIGNvbnRyb2xsZXIgZHJpdmVyCj4gaW50ZW50aW9uYWxseSBkb2VzIG5v
dCBpbXBsZW1lbnQgYSBzcGFyZSBhcmVhIHByb2dyYW0gY21kLCBldmVuIGZvcgo+IE9PQiB3cml0
ZXMuIEFsc28gQlJDTU5BTkRfQUNDX0NPTlRST0xfUEFSVElBTF9QQUdFPTAgKHdoZW4gcHJlc2Vu
dCkKPiBkb2VzIG5vdCBhbGxvdyBmb3Igc3BhcmUgYXJlYXMgb25seSB3cml0ZXMuCj4gCj4+PiBp
biBib3RoIGNhc2VzIHdlIG9ubHkgd2FudCB0byBtb2RpZnkgT09CLCBkYXRhIGlzIGFsd2F5cyBh
c3N1bWVkIHRvIGJlCj4+PiAweGZmcyAobWVhbnMgZXJhc2VkIHN0YXRlKS4gU28gYXMgZmFyIGFz
IHRoaXMgYXBpIGFsd2F5cyBpcyB1c2VkIG9uCj4+PiB0aGUgZXJhc2VkIHBhZ2UgaXQgc2hvdWxk
IGJlIGdvb2QuIEFyZSB0aGUgc3ViLXBhZ2VzL29vYiBhcmVhcyByZWFkIGJ5Cj4+PiBqZmZzMiAg
YWxzbyByZWFkIHdpdGhvdXQgZWNjIGVuYWJsZWQ/LiBKdXN0IHdhbnQgdG8gYmUgc3VyZSB0aGF0
IGl0Cj4+PiBkb2VzIG5vdCBicmVhayBhbnkgb3RoZXIgdXRpbGl0aWVzIGxpa2UgbmFuZHdyaXRl
Lgo+PiAKPj4gTm8sIHN1Yi1wYWdlcy9vb2IgYXJlYXMgcmVhZCBieSBKRkZTMiB3aXRoIEVDQyBl
bmFibGVkLgo+PiBJIGRvbuKAmXQgdGhpbmsgdGhpcyBicmVha3MgYW55dGhpbmcgYXQgYWxsLCBz
aW5jZSBJIHRlc3RlZCBuYW5kd3JpdGUgd2l0aCBPT0IgZW5hYmxlZCBhbmQgZXZlcnl0aGluZyB3
YXMgd3JpdHRlbiBwZXJmZWN0bHkuCj4+IAo+IAo+IEdvaW5nIGJ5IHRoZSBjb21taXQgbWVzc2Fn
ZSB5b3UgYXJlIGFzc3VtaW5nIDEtYml0IGhhbW1pbmcgIGNvZGUsIHRoYXQKPiBpcyB0aGUgb25s
eSBleGNlcHRpb24gb24gZWFybHkgdmVyc2lvbiBjb250cm9sbGVycyB3aGVyZSBvbmx5IGRhdGEg
d2FzCj4gY292ZXJlZCBmb3IgZWNjIGNhbGN1bGF0aW9ucyB3aGVuIGVuYWJsZWQuCj4gV2hpY2gg
dmVyc2lvbiBvZiB0aGUgY29udHJvbGxlciBhcmUgeW91IHVzaW5nICA/LiBEaWQgeW91IHRlc3Qg
d2l0aAo+IEJDSC00IG9yIGFueSBCQ0ggPy4KCkFsbCBteSBkZXZpY2VzIHVzZSBoYW1taW5nIEVD
QywgZXZlbiB0aGUgb25lcyB3aXRoIGNvbnRyb2xsZXIgdmVyc2lvbiB2NC4wIChCQ002MzI2OCks
IHdoaWNoIHNob3VsZCBhbHNvIHN1cHBvcnQgQkNILgpUaGVyZWZvcmUgSSBuZWVkIHRvIHN0aWNr
IHdpdGggaGFtbWluZyBFQ0MgaWYgSSB3YW50IHRoZSBib290bG9hZGVyIHRvIGJlIGFibGUgdG8g
Ym9vdCB0aGUga2VybmVsLgoKSG93ZXZlciwgSSBzaG91bGQgZ2V0IGEgbmV3IGRldmljZSB3aXRo
IEJDSCBpbiBhIGZldyBkYXlzLgpJ4oCZbGwgZG8gbW9yZSB0ZXN0cyBvbmNlIEkgZ2V0IGl0LCBi
dXQgaWYgQkNIIGFsc28gY292ZXJzIE9PQiwgdGhlbiB3ZSBjb3VsZCBjb25kaXRpb25hbGx5IGZv
cmNlIHdyaXRlX29vYiB0byBSQVcgb25seSBpZiBoYW1taW5nIGlzIGNvbmZpZ3VyZWQuCgo+IAo+
PiBCVFcsIEkgdHJpZWQgYW5vdGhlciBhcHByb2FjaCB0aGF0IGZvcmNlZCBNVERfT1BTX0FVVE9f
T09CIHRvIGJlIHdyaXR0ZW4gYXMgcmF3IE9PQiwgYnV0IGl0IHdhcyByZWplY3RlZDoKPj4gaHR0
cDovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvbGludXgtbXRkL3BhdGNoLzIwMjAwNTA0
MDk0MjUzLjI3NDExMDktMS1ub2x0YXJpQGdtYWlsLmNvbS8KPj4gaHR0cHM6Ly9sa21sLm9yZy9s
a21sLzIwMjAvNS80LzIxNQo+PiAKPiAKPiBBcmUgdGhlcmUgYW55IG90aGVyIHVzZSBjYXNlcyBv
dGhlciB0aGFuIGpmZnMyIHdoZXJlIG9ubHkgb29iIG5lZWRzIHRvCj4gYmUgbW9kaWZpZWQgPy4g
QnV0IHN1cmVseSBpbnRlbnRpb25hbGx5IGRpc2FibGluZyBlY2MgaW5zdGVhZCBvZgo+IGZvcmNp
bmcgaXQgaXMgdGhlIHdheSwgYnV0IEkgYW0gbm90IHN1cmUgaXQgd2lsbCBzdGlsbCB3b3JrIGZv
ciBvdGhlcgo+IEJDSCBhbGdvcml0aG1zIHRob3VnaCB3aGVyZSBib3RoIGRhdGEgYW5kIG9vYiBh
cmUgY292ZXJlZC4KCknigJlsbCB0ZXN0IHRoaXMgYW5kIHJlcG9ydCBiYWNrIG9uY2UgSSBnZXQg
bXkgbmV3IGRldmljZS4KCj4gCj4+PiAKPj4+PiAKPj4+PiBTaWduZWQtb2ZmLWJ5OiDDgWx2YXJv
IEZlcm7DoW5kZXogUm9qYXMgPG5vbHRhcmlAZ21haWwuY29tPgo+Pj4+IC0tLQo+Pj4+IGRyaXZl
cnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2JyY21uYW5kLmMgfCA5ICstLS0tLS0tLQo+Pj4+IDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgOCBkZWxldGlvbnMoLSkKPj4+PiAKPj4+PiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQuYyBiL2Ry
aXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2JyY21uYW5kLmMKPj4+PiBpbmRleCA4ZjlmZmI0
NmEwOWYuLjU2NjI4MTc3MDg0MSAxMDA2NDQKPj4+PiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jh
dy9icmNtbmFuZC9icmNtbmFuZC5jCj4+Pj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJj
bW5hbmQvYnJjbW5hbmQuYwo+Pj4+IEBAIC0yMjc5LDEzICsyMjc5LDYgQEAgc3RhdGljIGludCBi
cmNtbmFuZF93cml0ZV9wYWdlX3JhdyhzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwLCBjb25zdCB1aW50
OF90ICpidWYsCj4+Pj4gICAgICAgcmV0dXJuIG5hbmRfcHJvZ19wYWdlX2VuZF9vcChjaGlwKTsK
Pj4+PiB9Cj4+Pj4gCj4+Pj4gLXN0YXRpYyBpbnQgYnJjbW5hbmRfd3JpdGVfb29iKHN0cnVjdCBu
YW5kX2NoaXAgKmNoaXAsIGludCBwYWdlKQo+Pj4+IC17Cj4+Pj4gLSAgICAgICByZXR1cm4gYnJj
bW5hbmRfd3JpdGUobmFuZF90b19tdGQoY2hpcCksIGNoaXAsCj4+Pj4gLSAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgKHU2NClwYWdlIDw8IGNoaXAtPnBhZ2Vfc2hpZnQsIE5VTEwsCj4+Pj4g
LSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY2hpcC0+b29iX3BvaSk7Cj4+Pj4gLX0KPj4+
PiAtCj4+Pj4gc3RhdGljIGludCBicmNtbmFuZF93cml0ZV9vb2JfcmF3KHN0cnVjdCBuYW5kX2No
aXAgKmNoaXAsIGludCBwYWdlKQo+Pj4+IHsKPj4+PiAgICAgICBzdHJ1Y3QgbXRkX2luZm8gKm10
ZCA9IG5hbmRfdG9fbXRkKGNoaXApOwo+Pj4+IEBAIC0yNjQyLDcgKzI2MzUsNyBAQCBzdGF0aWMg
aW50IGJyY21uYW5kX2luaXRfY3Moc3RydWN0IGJyY21uYW5kX2hvc3QgKmhvc3QsIHN0cnVjdCBk
ZXZpY2Vfbm9kZSAqZG4pCj4+Pj4gICAgICAgY2hpcC0+ZWNjLndyaXRlX29vYl9yYXcgPSBicmNt
bmFuZF93cml0ZV9vb2JfcmF3Owo+Pj4+ICAgICAgIGNoaXAtPmVjYy5yZWFkX29vYl9yYXcgPSBi
cmNtbmFuZF9yZWFkX29vYl9yYXc7Cj4+Pj4gICAgICAgY2hpcC0+ZWNjLnJlYWRfb29iID0gYnJj
bW5hbmRfcmVhZF9vb2I7Cj4+Pj4gLSAgICAgICBjaGlwLT5lY2Mud3JpdGVfb29iID0gYnJjbW5h
bmRfd3JpdGVfb29iOwo+Pj4+ICsgICAgICAgY2hpcC0+ZWNjLndyaXRlX29vYiA9IGJyY21uYW5k
X3dyaXRlX29vYl9yYXc7Cj4+Pj4gCj4+Pj4gICAgICAgY2hpcC0+Y29udHJvbGxlciA9ICZjdHJs
LT5jb250cm9sbGVyOwo+Pj4+IAo+Pj4+IC0tCj4+Pj4gMi4yNi4yCj4+Pj4gCj4+IAo+PiBCZXN0
IHJlZ2FyZHMsCj4+IMOBbHZhcm8uCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
