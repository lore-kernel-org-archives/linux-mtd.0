Return-Path: <SRS0=hi6L=6S=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCF14C3A5A9
	for <linux-mtd@archiver.kernel.org>; Mon,  4 May 2020 16:35:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B824206D9
	for <linux-mtd@archiver.kernel.org>; Mon,  4 May 2020 16:35:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CILT//08";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Xsb4T5Vg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B824206D9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KVJ7o6rZO+WoeJVzJ5r+xDjXcHlor9PpEvMpW3X/iS8=; b=CILT//08kP5l2e
	ZBWAGZhH3B8aHhWajfxM/M6lPLhA4iH1CZXmsHMRAxnnj+vXERmlKKAIQKFMtzcZcSMG5mrYW/Fo6
	8AxomfyiSRW0FRjtCWkIy1VThjKoje5tfJuDd3fzM7z9eihlrxutGS9M67V3yGCTd4bW51qC6u7VX
	+jsmRrufjVkEYasqR2DtAFK0+hp7M8sTxi+6qPCCGnWUCFnilhhGd1aavgOYMywKiep00unDjD5wA
	4bUkt13jDLd628+vAoNJXLgAtisjiiyVCTeM7uv4UN8STsB0NjETGxF2IQn+nMZX0yx1zqyfeOxIQ
	M62dXsIxx1wbA29uXIaQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jVe3l-0007iw-Rz; Mon, 04 May 2020 16:35:13 +0000
Received: from mail-qt1-x841.google.com ([2607:f8b0:4864:20::841])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jVe3g-0006ee-B1
 for linux-mtd@lists.infradead.org; Mon, 04 May 2020 16:35:10 +0000
Received: by mail-qt1-x841.google.com with SMTP id s30so27092qth.2
 for <linux-mtd@lists.infradead.org>; Mon, 04 May 2020 09:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=mfvNPUHsylSLdyFyleGNF5746IgU/y3mmh0Slxh+wTM=;
 b=Xsb4T5VgtMQLGWX3F/cDrG9t3i0r0rjhkezld4oUtVFdk1QnH1pqWGHPs5S01jMzvJ
 QvqWviNjPLdjCIypcFDPeaaAv+GYbV24AVTqcJ9WA3da3j1aee/7NFOwKkswTkfd7Fqk
 anoqRL5WM1EQEPF4evLqQwhMB3F9rYjicFxdpXLIXoiF8sHL+L3sY0i1u1yDKcJdmCv+
 nxLuEzDIDgoXD6UTx2gEti4OmiWmJ3YZL2myBk2u3hgVm+ANEtbmt73KmPYdffMXQG2h
 Yd1gM7SV9R5mFvTGCGIzacrrM4xU6xphgAvI+axh5AuJCFCoO9YnR/X7iLljX3koJ6A7
 GO4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=mfvNPUHsylSLdyFyleGNF5746IgU/y3mmh0Slxh+wTM=;
 b=iB1LcNerasAaMzS1nLVjYbpF4Z2a+y70xecQMQxy/o1VApDXO3cS7DFWWSAr1SFUCH
 qXXRytIpzWUxbgWjtC+1hotJrBeCcnNvjiOlzJyKy/RS2JybA3ZMsHg6A7LqrgNKyGE3
 qE67UtPV3mA3nJcqxoemmL3TfKwsSRrVtzvzE0ymDhU4VLfHo89e0vdwS5c72UYUHYFT
 yHZKAnCgGNZtyqLlAlkK9jn36rQfektRyqFn6imwhMe1ujqxQxHLT7vn+GVkrUAaiSxr
 KswJn1y669Ib8nCICPxtTi4KwgXC+9Z4HrWi4+QAAjPdS+QcDYDl/BbAWCM46KLzRber
 k7mw==
X-Gm-Message-State: AGi0PuYPx7l9TJAl/wWRFkV9C6gQ06oV0DeqdbKI2t+pfM+V6SmgKN9N
 VE8rBYbK0qFgnr1VC0CDcY8t6ChoHsQIzKkl2kes1A==
X-Google-Smtp-Source: APiQypIPrjHFxrEDsof6fzXph63xN2TSccsZRZzgBqFNaVBCWbIwnPkS0KLpqgFY12nHSz+nQ0Idpj/BD5OthsK1Y5k=
X-Received: by 2002:ac8:5209:: with SMTP id r9mr17396851qtn.57.1588610106440; 
 Mon, 04 May 2020 09:35:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200501100729.1237040-1-boris.brezillon@collabora.com>
In-Reply-To: <20200501100729.1237040-1-boris.brezillon@collabora.com>
From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date: Mon, 4 May 2020 18:34:55 +0200
Message-ID: <CAMpxmJXmPcwo6uomrrwbcFe9gkhxvYVw0Y6o1n5uSGBwPKd5_A@mail.gmail.com>
Subject: Re: [PATCH 0/5] mtd: rawnand: davinci: Convert to exec_op()
To: Boris Brezillon <boris.brezillon@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200504_093508_452429_6987ED61 
X-CRM114-Status: GOOD (  13.52  )
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
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, Sekhar Nori <nsekhar@ti.com>,
 "open list:MEMORY TECHNOLOGY..." <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

cHQuLCAxIG1haiAyMDIwIG8gMTI6MDcgQm9yaXMgQnJlemlsbG9uCjxib3Jpcy5icmV6aWxsb25A
Y29sbGFib3JhLmNvbT4gbmFwaXNhxYIoYSk6Cj4KPiBIZWxsbywKPgo+IEEgYml0IG9mIGNvbnRl
eHQgdG8gZXhwbGFpbiB0aGUgbW90aXZhdGlvbiBiZWhpbmQgdGhvc2UgY29udmVyc2lvbnMKPiBJ
J3ZlIGJlZW4gc2VuZGluZyBmb3IgdGhlIGxhc3QgY291cGxlIG9mIHdlZWtzLiBUaGUgcmF3IE5B
TkQgc3Vic3lzdGVtCj4gY2FycmllcyBhIGxvdCBvZiBoaXN0b3J5IHdoaWNoIG1ha2VzIGFueSBy
ZXdvcmsgbm90IG9ubHkgcGFpbmZ1bCwgYnV0Cj4gYWxzbyBzdWJqZWN0IHRvIHJlZ3Jlc3Npb25z
IHdoaWNoIHdlIG9ubHkgZGV0ZWN0IHdoZW4gc29tZW9uZSBkYXJlcyB0bwo+IHVwZGF0ZSBpdHMg
a2VybmVsIG9uIG9uZSBvZiB0aG9zZSBhbmNpZW50IEhXLiBXaGlsZSBjYXJyeWluZyBkcml2ZXJz
Cj4gZm9yIG9sZCBIVyBpcyBub3QgYSBwcm9ibGVtIHBlciBzZSwgY2FycnlpbmcgYW5jaWVudCBh
bmQgdW5tYWludGFpbmVkCj4gZHJpdmVycyB0aGF0IGFyZSBub3QgY29udmVydGVkIHRvIG5ldyBB
UElzIGlzIGEgbWFpbnRlbmFuY2UgYnVyZGVuLAo+IGhlbmNlIHRoaXMgbWFzc2l2ZSBjb252ZXJz
aW9uIGF0dGVtcHQgSSdtIGNvbmR1Y3RpbmcgaGVyZS4KPgo+IFNvIGhlcmUgaXMgYSBzZXJpZXMg
Y29udmVydGluZyB0aGUgRGF2aW5jaSBOQU5EIGNvbnRyb2xsZXIgZHJpdmVyIHRvCj4gZXhlY19v
cCgpLCBwbHVzIGEgYnVuY2ggb2YgbWlub3IgaW1wcm92ZW1lbnRzIGRvbmUgYWxvbmcgdGhlIHdh
eS4KPgo+IFJlZ2FyZHMsCj4KPiBCb3Jpcwo+Cj4gQm9yaXMgQnJlemlsbG9uICg1KToKPiAgIG10
ZDogcmF3bmFuZDogZGF2aW5jaTogSW5oZXJpdCBmcm9tIG5hbmRfY29udHJvbGxlcgo+ICAgbXRk
OiByYXduYW5kOiBkYXZpbmNpOiBTdG9wIHVzaW5nIG5hbmRfY2hpcC5sZWdhY3kuSU9fQUREUl97
UixXfQo+ICAgbXRkOiByYXduYW5kOiBkYXZpbmNpOiBJbXBsZW1lbnQgZXhlY19vcCgpCj4gICBt
dGQ6IHJhd25hbmQ6IGRhdmluY2k6IEdldCByaWQgb2YgdGhlIGxlZ2FjeSBpbnRlcmZhY2UgaW1w
bGVtZW50YXRpb24KPiAgIG10ZDogcmF3bmFuZDogZGF2aW5jaTogQ2hhbmdlIHRoZSB7cmVhZCx3
cml0ZX1fYnVmIHByb3RvdHlwZXMKPgo+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9kYXZpbmNpX25h
bmQuYyB8IDE2MSArKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2Vk
LCA4NSBpbnNlcnRpb25zKCspLCA3NiBkZWxldGlvbnMoLSkKPgo+IC0tCj4gMi4yNS4zCj4KCkhp
IEJvcmlzLAoKVGhhbmtzIGZvciBkb2luZyB0aGlzLiBVbmZvcnR1bmF0ZWx5IHRoaXMgYnJlYWtz
IE5BTkQgb24gZGE4NTAtbGNkawp3aXRoIHRoZSBmb2xsb3dpbmcgZXJyb3IgbWVzc2FnZToKCiAg
ICBuYW5kOiBObyBOQU5EIGRldmljZSBmb3VuZAoKSSdtIHN1cGVyIGJ1c3kgdGhpcyB3ZWVrIGFu
ZCBzbyBJIGRvbid0IGhhdmUgdGhlIHRpbWUgdG8gaW52ZXN0aWdhdGUKZnVydGhlciwgSSBjYW4g
Z2V0IGJhY2sgdG8gaXQgbmV4dCB3ZWVrIGhvcGVmdWxseS4KCkJhcnQKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vz
c2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tdGQvCg==
