Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3396AD41D44
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Nov 2024 02:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=srDq1aNgCO82XLvBRN0/wPsSNENCEjCF9F6VKnO99YA=; b=lljUzSj/0dYbj2
	ANzfHazKjiuqPvQniKpx0FkYGeFI3w+PqOGsC40L2kro2rMQxv6Sdo2sAH4ead8q62TdSgKL4GzY+
	r06VOa8i7nfGBnf8B4z8LQewsP0JnWD2T0t/RErLATO/+axVE1KTjmOcQrsuyXJVneaAFC7NtUmQj
	/Kk39dq7MWYcIq26g/oSvaHY3V6v6lbDaMRQFAkW/flALPCL/2zWQ8aMwzDWpr3QTAnDIsGdVwBiy
	IXcxMrpNmgg6V3Vycfq8JvrunXsd9aH9hhIwEIzYsCo0lyucsPc2m4CUbK9aRY+PikEjjrccLxS8m
	k4JYLn9y8Yis/okOUKNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAgsZ-0000000205q-08S6;
	Tue, 12 Nov 2024 02:43:43 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAgsV-0000000205S-44mC
	for linux-mtd@lists.infradead.org;
	Tue, 12 Nov 2024 02:43:41 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-2e2bd347124so4014433a91.1
        for <linux-mtd@lists.infradead.org>; Mon, 11 Nov 2024 18:43:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731379418; x=1731984218; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=58HKZs6IxMCCiB8RgB9LRVMDoMM+3vjsIIgnWANOYyM=;
        b=hH0khUrgxG1DzAQI7mFYkhohWh2fzqLxv7bPzBLVaPknmxnpMBEz5Z7sKQ6ZR2pAOm
         P4GTgNZtqCANeCJXeBuKr9S6GLjGwEqcj5yTVJztfHp++dC1CeTcyLLtqgMjMTzW79NN
         oBsNkGwxS2m74jMcFb+iEStVGPYtdn2xRGaOD9DuQXj7jmhZ+rrEtQigqbW258IRzZ+v
         +uFEmf1a4rbUhJjm44VjKuIbgt7uliOWgpVHJn9Nm661NKLcYX6wPE19vmWuigus33IQ
         9NoE/nVDBDMoIZbA+MhuyJ2NIg0iFjPIVqTaja/yGuKPSlpC19V2ggU884OhjF2/zUXe
         ee1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731379418; x=1731984218;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=58HKZs6IxMCCiB8RgB9LRVMDoMM+3vjsIIgnWANOYyM=;
        b=BcZ3FHKK0xXj6hYl+f5YYm1jOtaGIpGRwWw5fD5Q8ZfskL4fCwYZV4F0agDINII767
         P37KMjioLVWc3gOjuD548hrqRxxqm1jQ+aq1gdPO/m7lPVBEeA69kKY1m6bm1PTcisT/
         cFv3bbBRto/0bYfzau4kBcVsR31+WVGPAMpuBwcqHXdoEHem3qxfr+/r9Rr7Gye5A++r
         +x4OtPF8XeGZq4e+6qxpqPzXb9ynIkxuWKljCu+EYqqgAaFQPMlC95Il5MlwH/qpnvf7
         sVzvpUIdrQh8MoahJAIswK3a4MgO5vEy6wf7VJZb2ySjNbgPZCaiQpQb1gllhE0VsSJa
         XuGA==
X-Forwarded-Encrypted: i=1; AJvYcCXX4zsfOm23zjpoK0hJdRM7NhHskGjjsl00cVl1oQHFw8mR15+ezRDheyhy2V747LORQWTeZ9LLFYo=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx530+WzPUrVpsbk4N3H0G/x8TYKXu4rUgpzrnGy9rnEwPuBjHa
	rJksiFFjMLhQrfen6csPmjHgncxXhN9duIrX+YQsiM2JlaqjFUJ7XAK97Gsxv6kEkH4DZDXwk25
	tMfoTibz0SBktDaIwdvXJFYZV290=
X-Google-Smtp-Source: AGHT+IEJVZUzY8qyAjbOnvu/DUz+noMenYc+uIjGnwh3b4ux21PGoCUxqQJ7eZp0LAfSNcpJFSdlgF5nbzfNL0A6nrA=
X-Received: by 2002:a17:90b:2b45:b0:2e2:b3f8:b549 with SMTP id
 98e67ed59e1d1-2e9b178155bmr18298969a91.23.1731379418504; Mon, 11 Nov 2024
 18:43:38 -0800 (PST)
MIME-Version: 1.0
References: <20241107093016.151448-1-linchengming884@gmail.com> <437e9c87-fbae-4402-858c-ce6de0a992c7@linaro.org>
In-Reply-To: <437e9c87-fbae-4402-858c-ce6de0a992c7@linaro.org>
From: Cheng Ming Lin <linchengming884@gmail.com>
Date: Tue, 12 Nov 2024 10:42:48 +0800
Message-ID: <CAAyq3Sb-dmmF8YsOdTYxZqX8Wn4d=WiAXkS4bHp5FLn3S+ouXg@mail.gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: core: replace dummy buswidth from addr to data
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: pratyush@kernel.org, mwalle@kernel.org, miquel.raynal@bootlin.com, 
	richard@nod.at, vigneshr@ti.com, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, alvinzhou@mxic.com.tw, leoyu@mxic.com.tw, 
	Cheng Ming Lin <chengminglin@mxic.com.tw>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_184340_034971_930E594C 
X-CRM114-Status: GOOD (  26.40  )
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

SGkgVHVkb3IsCgpUdWRvciBBbWJhcnVzIDx0dWRvci5hbWJhcnVzQGxpbmFyby5vcmc+IOaWvCAy
MDI05bm0MTHmnIgxMeaXpSDpgLHkuIAg5LiL5Y2INjoxOOWvq+mBk++8mgo+Cj4KPgo+IE9uIDEx
LzcvMjQgOTozMCBBTSwgQ2hlbmcgTWluZyBMaW4gd3JvdGU6Cj4gPiBGcm9tOiBDaGVuZyBNaW5n
IExpbiA8Y2hlbmdtaW5nbGluQG14aWMuY29tLnR3Pgo+ID4KPiA+IFRoZSBkZWZhdWx0IGR1bW15
IGN5Y2xlIGZvciBNYWNyb25peCBTUEkgTk9SIGZsYXNoIGluIE9jdGFsIE91dHB1dAo+ID4gUmVh
ZCBNb2RlKDEtMS04KSBpcyAyMC4KPiA+Cj4gPiBDdXJyZW50bHksIHRoZSBkdW1teSBidXN3aWR0
aCBpcyBzZXQgYWNjb3JkaW5nIHRvIHRoZSBhZGRyZXNzIGJ1cyB3aWR0aC4KPiA+IEluIHRoZSAx
LTEtOCBtb2RlLCB0aGlzIG1lYW5zIHRoZSBkdW1teSBidXN3aWR0aCBpcyAxLiBXaGVuIGNvbnZl
cnRpbmcKPiA+IGR1bW15IGN5Y2xlcyB0byBieXRlcywgdGhpcyByZXN1bHRzIGluIDIwIHggMSAv
IDggPSAyIGJ5dGVzLCBjYXVzaW5nIHRoZQo+ID4gaG9zdCB0byByZWFkIGRhdGEgNCBjeWNsZXMg
dG9vIGVhcmx5Lgo+ID4KPiA+IFNpbmNlIHRoZSBwcm90b2NvbCBkYXRhIGJ1c3dpZHRoIGlzIGFs
d2F5cyBncmVhdGVyIHRoYW4gb3IgZXF1YWwgdG8gdGhlCj4gPiBhZGRyZXNzIGJ1c3dpZHRoLiBT
ZXR0aW5nIHRoZSBkdW1teSBidXN3aWR0aCB0byBtYXRjaCB0aGUgZGF0YSBidXN3aWR0aAo+ID4g
aW5jcmVhc2VzIHRoZSBsaWtlbGlob29kIHRoYXQgdGhlIGR1bW15IGN5Y2xlLXRvLWJ5dGUgY29u
dmVyc2lvbiB3aWxsIGJlCj4gPiBkaXZpc2libGUsIHByZXZlbnRpbmcgdGhlIGhvc3QgZnJvbSBy
ZWFkaW5nIGRhdGEgcHJlbWF0dXJlbHkuCj4KPiBUaGlzIGlzIHN0aWxsIHZlcnkgd3JvbmcgYW5k
IHRoZSBgZml4YCBpcyB3b3JraW5nIGp1c3QgYnkgY2hhbmNlLgo+IENvbnNpZGVyIHdoYXQgaGFw
cGVucyB3aGVuIG9uZSByZXF1aXJlcyAxMCBkdW1teSBjeWNsZXMuIEJUVywgZG9lcyB0aGlzCj4g
Zml4IGEgcmVhbCBwcm9ibGVtLCBvciBpdCdzIGp1c3QgYSB0aGVvcmV0aWNhbCBmaXg/CgpJbiAx
LTEtOCBtb2RlLCBzZXR0aW5nIHRoZSBkdW1teSBidXN3aWR0aCB0byBtYXRjaCB0aGUgZGF0YQpi
dXN3aWR0aCBlbnN1cmVzIGEgZHVtbXkgYnVzd2lkdGggb2YgOCwgd2hpY2ggY2FuIGFjY29tbW9k
YXRlCmFsbCB0eXBlcyBvZiBkdW1teSBjeWNsZXMuCgpUaGlzIHBhdGNoIHJlc29sdmVzIGEgc2ln
bmlmaWNhbnQgaXNzdWUgaW4gMS0xLTggbW9kZSwgYXMgZGVzY3JpYmVkIGFib3ZlLgoKPgo+IEkg
ZG9uJ3QgbGlrZSB0aGF0IHdlJ3JlIGNoYXNpbmcgb3VyIHRhaWxzIGhlcmUuIFRoZSBmaXggaXMg
dG8gcGFzcwo+IGRpcmVjdGx5IGN5Y2xlcyBpbnN0ZWFkIG9mIGJ5dGVzIGFuZCB1cGRhdGUgTVRE
IGFuZCBTUEkgdG8gdXNlIGN5Y2xlcy4gSQo+IGhhZCBhbiBhdHRlbXB0IHRvIGZpeCB0aGlzIGlu
IHRoZSBwYXN0LCBidXQgSSBjYW4ndCBhbGxvY2F0ZSB0aW1lIHRvCj4gcmVzcGluLiBBcmUgeW91
IGludGVyZXN0ZWQgaW4gdGFraW5nIG92ZXIgYW5kIGZpeGluZyBNVEQgYW5kIFNQST8KPgoKSSB1
bmRlcnN0YW5kIHlvdXIgY29uY2VybnMgYW5kIGFncmVlIHdpdGggeW91ciBhcHByb2FjaC4gSG93
ZXZlciwKdGhpcyBmaXggbWF5IHJlcXVpcmUgc29tZSB0aW1lIHRvIGltcGxlbWVudCwgYW5kIHdl
J3JlIGN1cnJlbnRseSBmYWNpbmcKdGhpcyBpc3N1ZSB3aXRoIGEgcHJlc3NpbmcgbmVlZCBmb3Ig
cmVzb2x1dGlvbi4gSWYgSSBjYW4gYWxsb2NhdGUgdGltZSBpbgp0aGUgbmVhciBmZWF0dXJlLCBJ
J2QgYmUgaW50ZXJlc3RlZCBpbiB0YWtpbmcgb24gdGhlIHdvcmsgdG8gYWRkcmVzcyB0aGlzCmZv
ciBib3RoIE1URCBhbmQgU1BJLgoKPiA+IFNpZ25lZC1vZmYtYnk6IENoZW5nIE1pbmcgTGluIDxj
aGVuZ21pbmdsaW5AbXhpYy5jb20udHc+Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL210ZC9zcGktbm9y
L2NvcmUuYyB8IDIgKy0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVs
ZXRpb24oLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMg
Yi9kcml2ZXJzL210ZC9zcGktbm9yL2NvcmUuYwo+ID4gaW5kZXggZjljMTg5ZWQ3MzUzLi5jN2Fj
ZWFhOGE0M2YgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL210ZC9zcGktbm9yL2NvcmUuYwo+ID4g
KysrIGIvZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMKPiA+IEBAIC04OSw3ICs4OSw3IEBAIHZv
aWQgc3BpX25vcl9zcGltZW1fc2V0dXBfb3AoY29uc3Qgc3RydWN0IHNwaV9ub3IgKm5vciwKPiA+
ICAgICAgICAgICAgICAgb3AtPmFkZHIuYnVzd2lkdGggPSBzcGlfbm9yX2dldF9wcm90b2NvbF9h
ZGRyX25iaXRzKHByb3RvKTsKPiA+Cj4gPiAgICAgICBpZiAob3AtPmR1bW15Lm5ieXRlcykKPiA+
IC0gICAgICAgICAgICAgb3AtPmR1bW15LmJ1c3dpZHRoID0gc3BpX25vcl9nZXRfcHJvdG9jb2xf
YWRkcl9uYml0cyhwcm90byk7Cj4gPiArICAgICAgICAgICAgIG9wLT5kdW1teS5idXN3aWR0aCA9
IHNwaV9ub3JfZ2V0X3Byb3RvY29sX2RhdGFfbmJpdHMocHJvdG8pOwo+ID4KPiA+ICAgICAgIGlm
IChvcC0+ZGF0YS5uYnl0ZXMpCj4gPiAgICAgICAgICAgICAgIG9wLT5kYXRhLmJ1c3dpZHRoID0g
c3BpX25vcl9nZXRfcHJvdG9jb2xfZGF0YV9uYml0cyhwcm90byk7CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
