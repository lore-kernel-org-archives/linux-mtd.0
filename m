Return-Path: <SRS0=tMSz=TG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	FROM_EXCESS_BASE64,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FB1AC04AAA
	for <linux-mtd@archiver.kernel.org>; Mon,  6 May 2019 08:54:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2197620830
	for <linux-mtd@archiver.kernel.org>; Mon,  6 May 2019 08:54:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FLMF3JNC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oZ6M3wyn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2197620830
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wzOWGE0BESn9EZeQQtwaVEdZaE8pfFjrComkVDEqQlc=; b=FLMF3JNC+GxAHx
	GIyGCUYtx/2MLmDAANJG4LBeEI+hdfX7Zr4Xc4Qwq4hLCg3tmDbrOZIzUB1fLcvKzyWIh0vcn8VAs
	NUhJVo7GhFZA+rVkipPESmd38HL2LaEyxAvcdjR9kJCPDjQzMghOsYr2UWPzCaqB9w4EfW6xoks4n
	x5ET0oS04aPx8xEz+6IFvqRGllR/E+yd1NGGr7cWde+DuqN3tKeOjTylMZJsaz5T6MyNrYERuCS5C
	49ZOivax74GPEGSyoFknxYUUbErGybwWnPz5BIAAILpipwfolmbje3NlmV6O/J8MqtvMmVyEOnk3C
	8+azZBAh66UCxdS7DZ8A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hNZOM-0001OM-GT; Mon, 06 May 2019 08:54:34 +0000
Received: from mail-it1-x143.google.com ([2607:f8b0:4864:20::143])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hNZOI-0001Ns-5J
 for linux-mtd@lists.infradead.org; Mon, 06 May 2019 08:54:31 +0000
Received: by mail-it1-x143.google.com with SMTP id t200so18712425itf.4
 for <linux-mtd@lists.infradead.org>; Mon, 06 May 2019 01:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Fe4mFJl5n6jtBYBT+KKtoB2nqH7ZGLM89cX2qnin67g=;
 b=oZ6M3wyn2g3fjqcn9fdXZ3cOIr+CHM7/vfKeVEvNjwO5iYcUOl/21JrEWzgUuuypTI
 K4CvtsGPpx1P4CNrTHhqQnhmRH0mBtZ945R7O7GA7TCtq9CS9Unat5710t3nuVCapsZb
 pTPA81ZkiAxcA0wxN596DVo+DY7HVppt9aQfAk5Pc07QC/NLpEkjg+PEc3qYyiRjdEkZ
 BSkvFaJZsZzig7r3owYK7rvN3qdlt2fFxlgZb6B7GFmWZtNHLk0Sm8F0R9BbWI+nVN6K
 qFdiPiutOLLa3HAdAqEw5GowX5EqDdWGst4HGfM5lMgNEOlO4l8TKvfRBmnP/hrYpUCQ
 MVaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Fe4mFJl5n6jtBYBT+KKtoB2nqH7ZGLM89cX2qnin67g=;
 b=h3MxAhCLy9mLbYajMFoNxXbtjTBHi/LvmlxwrF7cqZwGyihmgIsnA7F6LkAcJiZvwL
 IvQFE5jDV5xJu7gOj4eZT26hEIv9wjHvmH64w8IwSs9rgaGzFpXuwNoKIvmN+AGt3AMA
 bQlU/Dr/JtzbwhJp4hxPAjJmN6IeRqbkoP1h2HBKzmu6zW2Td+2ltMoz/BCAWCvx2N9b
 8sQB2YolZOGW61MxBaMF2CeyANufM+sIZX+jO3DcEbPhTAK/NrVw22HVsODMV+9EkEHm
 WyPMCM17JwNc2JwakpE8C9HU/EC4Jh8r5EYw1r9CMH3crI6UTFMfQlRSr4lpngXhR9bW
 cqIg==
X-Gm-Message-State: APjAAAU5e5+edXqJVTE/DqaFgXk0smbcZxx31jFhf1q6t0FXmGnvZkQt
 UIOCZ54NKeeHEt+6dOfZcA9txwPUo+3qHJUb+DI=
X-Google-Smtp-Source: APXvYqysEyIWk4jqOEfYWTtG8lYAgvgsn7835Ujkb3jzXPg5MUCWU9lNZS0Oq+5PPcU0BQIfbiqJFp7gNoudweukGAE=
X-Received: by 2002:a24:3508:: with SMTP id k8mr3269371ita.127.1557132868737; 
 Mon, 06 May 2019 01:54:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190430142823.28044-1-xoxyuxu@gmail.com>
 <CAFLxGvzMU02By_GUAKwdXUY6Wa33G2FBxwTxg2QQ=1qrf39TOw@mail.gmail.com>
In-Reply-To: <CAFLxGvzMU02By_GUAKwdXUY6Wa33G2FBxwTxg2QQ=1qrf39TOw@mail.gmail.com>
From: =?UTF-8?B?44GJ44KF44GF?= <xoxyuxu@gmail.com>
Date: Mon, 6 May 2019 17:54:31 +0900
Message-ID: <CAEGFndB13wDq6ajdUqJo=ne4XjKMif9oJ1NqJ1wSeVtLm3DKeQ@mail.gmail.com>
Subject: Re: [PATCH] ubifs: wbuf->offs must be aligned to max_write_size
To: Richard Weinberger <richard.weinberger@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190506_015430_209560_60E6D6ED 
X-CRM114-Status: GOOD (  20.48  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

VGhhbmtzIGZvciB5b3VyIHJlcGx5IQoKSSBhbSBzb3JyeSBmb3IgdGhlIHBhdGNoIHRoYXQgaXMg
aGFyZCB0byB1bmRlcnN0YW5kLgpUaGlzIGlzIG15IGZpcnN0IHBhdGNoIHBvc3QuIEkgd2lsbCBk
byBteSBiZXN0IHRvIGNvbnZleSBteSBpbnRlbnRpb25zLgoKMjAxOeW5tDXmnIg25pelKOaciCkg
NzowOCBSaWNoYXJkIFdlaW5iZXJnZXIgPHJpY2hhcmQud2VpbmJlcmdlckBnbWFpbC5jb20+Ogo+
Cj4gT24gVHVlLCBBcHIgMzAsIDIwMTkgYXQgNDoyOSBQTSBZdWljaGkgTmFrYWkgPHhveHl1eHVA
Z21haWwuY29tPiB3cm90ZToKPiA+Cj4gPiBVQklGUyBoYXMgYSBqb3VybmFsIHJlY292ZXJ5IGZ1
bmN0aW9uLgo+ID4gSXQgaXMgdXNlZnVsIGZvciBkZXZpY2VzIHRoYXQgZXhwZXJpZW5jZSBhIHBv
d2VyIGZhaWx1cmUuCj4gPgo+ID4gQW5kIGFzIHBlciBjb21tZW50IG9mIHViaWZzX3didWZfc3lu
Y19ub2xvY2soKSwgd2J1ZiBpcyBvcHRpbWl6ZWQgZm9yCj4gPiBwZXJmb3JtYW5jZSBieSB3cml0
aW5nIGFsaWduZWQgbWF4X3dyaXRlX3NpemUuCj4gPgo+ID4gSW4gZm9sbG93aW5nIGVudmlyb25t
ZW50LCBjaGVja2luZyBvZmZzZXQgaXMgbm90IGFsaWduZWQgdG8gbWF4X3dyaXRlX2J1ZmZlci4K
PiA+Cj4gPiAtIFVzaW5nIGEgU1BJLU5PUiBkZXZpY2Ugd2l0aCBhIHdyaXRlIGJ1ZmZlciBzaXpl
IG92ZXIgMjU2IGJ5dGVzCj4gPiAgIEZvciBleGFtcGxlOiBNaWNyb24gTVQyOEVXMDFHQUJBLCBp
dHMgd3JpdGUgYnVmZmVyIGlzIDUxMiB3b3Jkcwo+ID4gLSBMRUIgaGVkYWVyIHNpemUgaXMgNjQg
Ynl0ZXMKPiA+IC0gVUJJIGhlYWRlciBzaXplIGlzIDY0IGJ5dGVzCj4KPiBUaGVyZSBhcmUgbm8g
c3VjaCB0aGluZ3MgYXJlIExFQiBvciBVQkkgaGVhZGVyLgo+IERvIHlvdSBtZWFuIFVCSSBFQyB1
bmQgVUJJIFZJRCBoZWFkZXJzPwoKSSBtaXNzZWQgd3JpdGluZyBhIGNvcnJlY3Qgd29yZC4uClll
cywgVUJJIEVDIGhlYWRlciBhbmQgVUJJIFZJRCBoZWFkZXIgYXJlIGJvdGggNjRieXRlcyBpbiBv
dXIgZW52aXJvbm1lbnQuCgo+IFdoYXQgaXMgYy0+bGViX3N0YXJ0IGluIHlvdXIgY2FzZT8KCkl0
IGlzIDEyOCBCeXRlcyB3aGVyZSA2NCs2NC4KVGhlcmUgaXMgbm8gcGFkZGluZyAvIGFsaWdubWVu
dCAgYmVjYXVzZSBOT1ItRmxhc2guIChtaW4uIElPIHNpemUgaXMgMS4pCgpGb2xsb3dpbmcgQVND
SUkgYXJ0IGlzIGFuIGVyYXNlIGJsb2NrLCB0aWNrKCspIGlzIHdyaXRlciBidWZmZXIgYm91bmRh
cnkuCnwtLS0tLS0tLS0tLS0rLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLSstLS0tLS0tLS0tLS0r
LS0tLS0tLS0tLS0tfAp8PC0+fCAgICAgOyBFQyBoZWFkZXIKfCAgIHw8LT58IDsgVklEIGhlYWRl
cgp8PC0tLS0tPnwgOyBjLT5sZWJfc3RhcnQgOiBMRUIgc3RhcnQgb2Zmc2V0IGZyb20gYW4gZXJh
c2UgYmxvY2sKICAgICAgICB8PC0tLSstLS0tLS0tLS0tLS0rLS0tLS0tLS0tLS0tKy0tLS0tLS0t
LS0tLSstLS0tLS0tLS0tLT58IDsKTEVCKGMtPmxlYl9zaXplKQoKd2J1ZiB0YWtlcyBpbnRvIGFj
Y291bnQgbWF4IHdyaXRlIHNpemUgYm91bmRzLCBzbyByZWZlcmVuY2VzIGxlYl9zdGFydC4KVGhp
cyBpbXBsZW1lbnRhdGlvbiBjYW4gYmUgZm91bmQgYXMgZm9sbG93czoKLS0tLQpGSUxFOiBmcy91
Ymlmcy9pby5jCmludCB1Ymlmc193YnVmX2luaXQoc3RydWN0IHViaWZzX2luZm8gKmMsIHN0cnVj
dCB1Ymlmc193YnVmICp3YnVmKQovKgogKiBJZiB0aGUgTEVCIHN0YXJ0cyBhdCB0aGUgbWF4LiB3
cml0ZSBzaXplIGFsaWduZWQgYWRkcmVzcywgdGhlbgogKiB3cml0ZS1idWZmZXIgc2l6ZSBoYXMg
dG8gYmUgc2V0IHRvIEBjLT5tYXhfd3JpdGVfc2l6ZS4gT3RoZXJ3aXNlLAogKiBzZXQgaXQgdG8g
c29tZXRoaW5nIHNtYWxsZXIgc28gdGhhdCBpdCBlbmRzIGF0IHRoZSBjbG9zZXN0IG1heC4KICog
d3JpdGUgc2l6ZSBib3VuZGFyeS4KICovCnNpemUgPSBjLT5tYXhfd3JpdGVfc2l6ZSAtIChjLT5s
ZWJfc3RhcnQgJSBjLT5tYXhfd3JpdGVfc2l6ZSk7Ci0tLS0KCkN1cnJlbnRseSwgaXNfbGFzdF93
cml0ZSgpIHJvdW5kcyB1cCAnb2Zmc2V0JyB0byBjLT5tYXhfd3JpdGVfc2l6ZS4KQnV0IHRoZSBv
ZmZzZXQgaXMgc3RhcnQgZnJvbSBjLT5sZWJfc3RhcnQuCkl0IGlzIE5PVCBhbGlnbmVkIHdyaXRl
IGJ1ZmZlciBpbiBvdXIgY2FzZSAoc2hvd24gYXMgYWJvdmUgQUEpLgoKSSB0aGluayB0aGF0IHRo
ZSBpbXBsZW1lbnRhdGlvbiBvZiByb3VuZC11cCBpcyBmb3Igd3JpdGUgYnVmZmVyIGJvdW5kYXJ5
CgpNeSB1bmRlcnN0YW5kaW5nIGlzLi4uClRoZSByZWFzb24gdGhlIGltcGxlbWVudGF0aW9uIHJv
dW5kcyB1cCB0byBhIHdyaXRlIGJ1ZmZlciBib3VuZGFyeSBpcyB0aGF0CnRoZSBlZmZlY3RzIG9m
IE5PUiBGbGFzaCB3cml0ZXMgYXJlIGNvbnNpZGVyZWQgdG8gZmFsbCBvbiBhIGJ1ZmZlciBib3Vu
ZGFyeS4KCgo+ID4gU28gaWYgd3JpdGUgYnVmZmVyIGNvbW1hbmQgbWFrZSBhIGNycnVwdCBkYXRh
IGluIGEgYmxvY2ssCj4gPiBpc19sYXN0X3dyaXRlKCkgYW5kIG5vX21vcmVfbm9kZXMoKSBjYW4g
bm90IGNoZWNrIGNvcnJlY3RseS4KPiA+Cj4gPiBUaGlzIHBhdGNoIGFkanVzdHMgd2J1ZiB3cml0
ZXMgdG8gbWF4X3dyaXRlX3NpemUsIHRha2luZyBpbnRvIGFjY291bnQKPiA+IGxlYl9zdGFydC4g
VGhlIHJlY292ZXJ5IHByb2Nlc3MgYWxzbyBjaGVja3MgdGhlIGRhdGEgYXQgdGhlIGNvcnJlY3Rl
ZAo+ID4gYWxpZ25tZW50IHBvc2l0aW9uLgo+Cj4gSSBoYXZlIGEgaGFyZCB0aW1lIHVuZGVyc3Rh
bmRpbmcgeW91ciBwYXRjaC4KPiBBcmUgeW91IGZhY2luZyBhIGZhaWx1cmU/IElmIHNvLCBwbGVh
c2Ugc2hhcmUgaXQuCgpZZXMuCkJ1dCB0aGUgZGF0YSBjYW4gbm90IGJlIHNlbnQgYmVjYXVzZSBp
dCB3YXMgZm91bmQgaW4gb3VyIGNvbXBhbnkuCkFzIEkgd29yayBmb3IgdHJhZGl0aW9uYWwgSmFw
YW5lc2UgY29tcGFueSwgdGhlIGRhdGEgY2FuIG5vdCBzZW5kLgpJbiBvdXIgY2FzZSwgYSBqb3Vy
bmFsIExFQiBoYXMgYSBicm9rZW4gZGF0YSBpbiBsYXN0IGVtcHR5IGFyZWEuCkl0IHNob3VsZCB0
cmVhdCBhcyBwYWRkaW5nIGRhdGEsIEkgdGhpbmsuCkFuZCBzdWJzZXF1ZW50IG5vZGVzIHdlcmUg
bm90IGJyb2tlbi4KU28gd2Ugd2FudCB0byByZWNvdmVyIHN1YnNlcXVlbnQgbm9kZXMsIHRvby4K
QWx0aG91Z2ggaXQgaXMgbm90IHRoZSBlbmQgb2YgdGhlIGpvdXJuYWwgZGF0YSwgSSBkbyBub3Qg
a25vdyB3aHkgdGhlCmRhdGEgaXMgYnJva2VuLgoKVGhlIHBhZGRpbmcgZGF0YSB3aGljaCBpcyAw
eEZGcyBpbiB0aGUgcGFkZGluZyBhcmVhIGlzIGNoZWNrZWQgaW4KaXNfbGFzdF93cml0ZSgpLgpU
aGUgY3VycmVudCBpbXBsZW1lbnRhdGlvbiBkb2VzIG5vdCBjb25zaWRlciBsZWJfc3RhcnQsIHNv
IGl0IHN0YXJ0cyBjaGVja2luZwpmcm9tIGFuIG9mZnNldCBkaWZmZXJlbnQgZnJvbSB0aGUgdHJ1
ZSBtYXggd3JpdGUgYnVmZmVyIGJvdW5kYXJ5LgoKU28gdGhlIGxhc3QgYnJva2VuIGRhdGEgaW4g
YSB3cml0ZSBidWZmZXIgYm91bmRhcnkgaXMgbm90IHNraXBwZWQsIHNvCnViaWZzX3JlY292ZXJf
bGViKCkgZGV0ZWN0cyBhcyBhIGNycnVwdGVkLgoKClJlcHJvZHVjZSBzY2VuYXJpbzoKMS4gc3lz
dGVtIGlzIGJvb3RpbmcgdXAKMi4gVUJJIGF0dGFjaGVkIG10ZHgKMy4gVUJJIGNhbiBnZXQgc29t
ZSB2b2x1bWUKNC4gVUJJRlMgdHJpZXMgdG8gbW91bnQgdGhlIHViaSBwYXJ0aXRpb24KNS4gSXRz
IGZsYWcgaW5kaWNhdGUgJ25lZWQgcmVjb3ZlcnknLiBTbyBVQklGUyBleGVjdXRlcyByZWNvdmVy
eQpzZXF1ZW5jZSBieSBjYWxsaW5nCiAgICB1Ymlmc19yZXBsYXlfam91cm5hbCgpIGZyb20gbW91
bnRfdWJpZnMoKSB3aGljaCBpcyBjYWxsZWQgZnJvbQptb3VudGluZyB3aXRoIFVCSUZTLgoKY2Fs
bCB0cmFjZSBpcyBhcyBmb2xsb3dzOgptb3VudF91YmlmcygpCi0+IHViaWZzX3JlcGxheV9qb3Vy
bmFsKCkKIC0+IHJlcGxheV9idWRzKCkKICAtPiByZXBsYXlfYnVkKCkKICAgLT4gdWJpZnNfcmVj
b3Zlcl9sZWIoKQogICAgLT4gdWJpZnNfc2Nhbl9hX25vZGUoKQogICAgLT4gaXNfbGFzdF93cml0
ZSgpCgpUaGUgYWJvdmUgZGVzY3JpcHRpb24gaXMgZm9yIGlzX2xhc3Rfd3JpdGUoKS4gT3RoZXJz
IGFyZSBhbHNvIHNhbWUuCgpGb3IgTkFORCwgbWF4X3dyaXRlX3NpemUgYW5kIHNpemUgb2YgaGVh
ZGVycyBhcmUKYy0+bWluX2lvX3NpemUocGVyaGFwcyBhIHNlY3RvciBzaXplKS4KU28gdGhpcyBt
b2RpZmljYXRpb24gaXMgbm90IGVmZmVjdGVkLgoKPiAtLQo+IFRoYW5rcywKPiAvL3JpY2hhcmQK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
