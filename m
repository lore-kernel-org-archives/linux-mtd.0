Return-Path: <SRS0=MuW7=32=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B9F7C2D0B1
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Feb 2020 13:46:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E46D21741
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Feb 2020 13:46:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="axFxH/sy";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KZdlGDul"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E46D21741
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rFdr/L4XuRnsZ2r83HVuKjBWDUBzYavvE1+vfuB+pcU=; b=axFxH/syTiO1YN
	OcDFqO+jwa4aKNplFyeASF3ZUtAJZOWteRg66br6Is6/nH7E9sJcNqT5AvariHjB67mq57mRdrYhh
	J09UogTUi4VXj1IS3rHRDo7/0Mlo0eW9mhsu28IugP4HypDeMThkydkq65JK8gA1no76erzIOOIq9
	1w+b8B4kCCcWm0gNgFpQ8B3K6jUd8uAVeg+dEojiwuq26b2hGxO8iw71mrwGH0XlXaeFuMvnUlklc
	JDfTzbRgx3lAAfREGG+ZffPMHL5xMNX1Tj0A5EqltzEglpMXaKVTER6vY6h92T4N4csOmfnzcwcGP
	MeRJMBQe5Zjv9tdEiUCw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1izhUJ-0002uW-Rv; Thu, 06 Feb 2020 13:46:35 +0000
Received: from mail-yb1-xb41.google.com ([2607:f8b0:4864:20::b41])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1izhUG-0002tL-Gy
 for linux-mtd@lists.infradead.org; Thu, 06 Feb 2020 13:46:34 +0000
Received: by mail-yb1-xb41.google.com with SMTP id f21so927400ybg.11
 for <linux-mtd@lists.infradead.org>; Thu, 06 Feb 2020 05:46:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=vx+BJomqjjLZwFBq/3yZmtks2Ppwxdg8nj7WT/hyPgw=;
 b=KZdlGDulGPdnwd8HYZWzlLd2l924UCgWK8utQbSK1xTIeW0jBagjuFF4ORiggCPdf2
 x7hlEzqqTEutQYY1v7U9kGye8tK/MQy+4cK+pVzPPwUXW6+H7lnklZENllR8SOd4HJUq
 y2q0F+DMozAUeTzf8hlloDJk6neVHvZfBMnrkXVrXxIMAzrYSfTs0QsSDzf34WmCDBIY
 fIuhs/Mwdmu+uvU5CDqU9APKmTCkg3iZzbPP6XqP3jl0gqu4ukpRUhjSDgUdzZXoscvq
 669jiLzhEUFYHBjfOoCt+JzHYA6b4JWMnoXwgTgK/YmDLn2gfgZQ2qlCL4NDw2mdq7KE
 c1hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=vx+BJomqjjLZwFBq/3yZmtks2Ppwxdg8nj7WT/hyPgw=;
 b=FvbzocuGgeI7qtCNBbLlxEYgTfb7qqnmot1BnuEMNl9BjeoyAFgmJJoHs1ynCHLlSn
 6sDVGYg6UZpgvCY5NvMOyG9tZphnX3bUsXGxRGPpMJuMLlJ9+cico1wnksrzdoaX5oiV
 3O3MIFpjWYudQeqKy5lxUKPm2pkJ2lSFhR0dQsq7DeKh+EJxXU0NOsK/t+y9E4kSrTG4
 CVgBKkWT09E87IlUyysVVEctI/tlB8LUV4NmldfSKOYh7AaY/DUYDBnQVQnqAWIjOK4e
 JqA4Jbw2UcJls7m7qg0ylavsh4PygQMcITEoCVI2Br9YQ3MmDIxJgOz8GXHPHj9TKLNl
 LfQg==
X-Gm-Message-State: APjAAAV1nHZzeZTUrnt9kP5Ga2Pz+CFtnPHphC+tOXTUGYRTrUihFTT/
 r6hmGIFkVlw6LOwWr30+ypQcFvk2olMn/2e6wws=
X-Google-Smtp-Source: APXvYqwXTnzBDuzXX/hkV9vPB+zpnFvKXpieC0sT5G8eBEvEOWbST++KmHGXRrf34QaMI0SQikzXK2HYHJAwhwVC8+k=
X-Received: by 2002:a25:dc0e:: with SMTP id y14mr2969699ybe.455.1580996791302; 
 Thu, 06 Feb 2020 05:46:31 -0800 (PST)
MIME-Version: 1.0
References: <20191126212511.1218-1-brunompena@gmail.com>
 <449b471c-3604-ffab-b75a-47ed119a5ba8@gmail.com>
 <CADwgkMU9W3Ue8ckAPKNvOE-hgR45wNrqLxzhjWwD9RJaBPL9WA@mail.gmail.com>
In-Reply-To: <CADwgkMU9W3Ue8ckAPKNvOE-hgR45wNrqLxzhjWwD9RJaBPL9WA@mail.gmail.com>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Date: Thu, 6 Feb 2020 14:46:20 +0100
Message-ID: <CACna6rz6C6+-z1LMf-rY=TO5p7bJU1ucfXZnuVQwefVfNjk6Qg@mail.gmail.com>
Subject: Re: [PATCH] mtd: core: allow mask_flags to be set for
 mtd_add_partition
To: Bruno Pena <brunompena@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200206_054632_585298_9B0A1BF1 
X-CRM114-Status: GOOD (  19.15  )
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
Cc: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gV2VkLCA1IEZlYiAyMDIwIGF0IDE4OjM1LCBCcnVubyBQZW5hIDxicnVub21wZW5hQGdtYWls
LmNvbT4gd3JvdGU6Cj4gQSBwb3NzaWJsZSB1c2UgY2FzZSBpcyBtZW50aW9uZWQgb24gdGhlIGRl
c2NyaXB0aW9uICJtYXNrIGNlcnRhaW4KPiBmbGFncyBmb3IgbmV3IHBhcnRpdGlvbnMgKGUuZy4g
dG8gbWFrZSB0aGVtIHJlYWQtb25seSkiIC0gSSBiZWxpZXZlCj4gdGhpcyBhbnN3ZXJzIHlvdXIg
IndoeT8iIHF1ZXN0aW9uLgo+IEFzIGZvciB5b3VyIGNvbW1lbnQgYWJvdXQgdXNlZnVsbmVzcywg
eW91IGFyZSB2ZXJ5IHdlbGwgYXdhcmUgdGhpcwo+IGNvbWVzIGZyb20gdGhlIE9wZW5XcnQgcHVs
bCByZXF1ZXN0IDI1MzUgWzFdIHdoZXJlIHRoaXMgbmV3IGFyZ3VtZW50Cj4gaXMgdXNlZC4KPiBU
aGUgb25seSByZWFzb24gd2h5IHRoZSBmdWxsIHBhdGNoIHdhcyBub3Qgc2VudCBoZXJlIGlzIGJl
Y2F1c2UgaXQKPiBkZXBlbmRzIG9uIE9wZW5XcnQgc3BlY2lmaWMgY29kZSBbMl0gWzNdIHRoYXQg
aXMgeWV0IHRvIGJlIG1lcmdlZCBvbgo+IHRoZSBrZXJuZWwuCj4gRm9yIHRoaXMgcmVhc29uIC0g
YW5kIGFzIHJlcXVlc3RlZCBvbiBPcGVuV3J0IC0gSSBkZWNpZGVkIHRvIHN1Ym1pdCBhbgo+IGVu
YWJsZXIgcGF0Y2ggZm9yIHRoZSBrZXJuZWwgZXhwb3J0ZWQgQVBJIG10ZF9hZGRfcGFydGl0aW9u
LgoKVGhlIHByb2JsZW0gd2l0aCB0aGlzIHBhdGNoIGlzIGl0IGFkZHMgImEgcG9zc2libGUiIHVz
ZSBjYXNlIGFuZCBub3QgYQpyZWFsIG9uZS4gSXQgZGVzY3JpYmVzIGFiaWxpdHkgdG8gIm1hc2sg
Y2VydGFpbiBmbGFncyIgYnV0IGl0IGRvZXNuJ3QKZXhwbGFpbiB3aHkvd2hlbiBpdCBzaG91bGQg
YmUgbmVlZGVkLiBZb3UgbW9zdCBsaWtlbHkgY2FuJ3QgZG8gdGhhdCBhcwp0aGVyZSBpc24ndCBh
bnkgKmluLWtlcm5lbCogbmVlZCBmb3IgdGhhdC4KCkFzIG11Y2ggYXMgSSBsb3ZlIHVwc3RyZWFt
aW5nIE9wZW5XcnQgZG93bnN0cmVhbSBwYXRjaGVzIEkgdGhpbmsgdGhpcwpjaGFuZ2Ugc2hvdWxk
IGJlIHJlamVjdGVkLiBLZXJuZWwgbXVzdG4ndCBjYXJlIGFib3V0IHByb3ZpZGluZwpyZXF1aXJl
ZCBBUEkgZm9yIGFsbCBkb3duc3RyZWFtIGNoYW5nZXMgb2YgdmFyaW91cyBwcm9qZWN0cy4gSWYg
dGhlcmUKaXMgc29tZSBkb3duc3RyZWFtIGNvZGUgdGhhdCBuZWVkcyBhIG5ldyBmdW5jdGlvbiBh
cmd1bWVudCB5b3Ugc2hvdWxkCnVwc3RyZWFtIGJvdGguIEZyb20ga2VybmVsIHBlcnNwZWN0aXZl
IHRoZXJlIGlzIG5vIG5lZWQgZm9yIHRoaXMKY2hhbmdlIGFzIGl0IGFkZHMgdW51c2VkIGNvZGUu
CgotLSAKUmFmYcWCCgpPbiBXZWQsIDUgRmViIDIwMjAgYXQgMTg6MzUsIEJydW5vIFBlbmEgPGJy
dW5vbXBlbmFAZ21haWwuY29tPiB3cm90ZToKPgo+IEhpIFJhZmHFgiwKPgo+IEEgcG9zc2libGUg
dXNlIGNhc2UgaXMgbWVudGlvbmVkIG9uIHRoZSBkZXNjcmlwdGlvbiAibWFzayBjZXJ0YWluCj4g
ZmxhZ3MgZm9yIG5ldyBwYXJ0aXRpb25zIChlLmcuIHRvIG1ha2UgdGhlbSByZWFkLW9ubHkpIiAt
IEkgYmVsaWV2ZQo+IHRoaXMgYW5zd2VycyB5b3VyICJ3aHk/IiBxdWVzdGlvbi4KPiBBcyBmb3Ig
eW91ciBjb21tZW50IGFib3V0IHVzZWZ1bG5lc3MsIHlvdSBhcmUgdmVyeSB3ZWxsIGF3YXJlIHRo
aXMKPiBjb21lcyBmcm9tIHRoZSBPcGVuV3J0IHB1bGwgcmVxdWVzdCAyNTM1IFsxXSB3aGVyZSB0
aGlzIG5ldyBhcmd1bWVudAo+IGlzIHVzZWQuCj4gVGhlIG9ubHkgcmVhc29uIHdoeSB0aGUgZnVs
bCBwYXRjaCB3YXMgbm90IHNlbnQgaGVyZSBpcyBiZWNhdXNlIGl0Cj4gZGVwZW5kcyBvbiBPcGVu
V3J0IHNwZWNpZmljIGNvZGUgWzJdIFszXSB0aGF0IGlzIHlldCB0byBiZSBtZXJnZWQgb24KPiB0
aGUga2VybmVsLgo+IEZvciB0aGlzIHJlYXNvbiAtIGFuZCBhcyByZXF1ZXN0ZWQgb24gT3Blbldy
dCAtIEkgZGVjaWRlZCB0byBzdWJtaXQgYW4KPiBlbmFibGVyIHBhdGNoIGZvciB0aGUga2VybmVs
IGV4cG9ydGVkIEFQSSBtdGRfYWRkX3BhcnRpdGlvbi4KPgo+IFsxXSBodHRwczovL2dpdGh1Yi5j
b20vb3BlbndydC9vcGVud3J0L3B1bGwvMjUzNQo+IFsyXSBodHRwczovL2dpdGh1Yi5jb20vb3Bl
bndydC9vcGVud3J0L2Jsb2IvbWFzdGVyL3RhcmdldC9saW51eC9nZW5lcmljL3BlbmRpbmctNC4x
NC80MDEtbXRkLWFkZC1zdXBwb3J0LWZvci1kaWZmZXJlbnQtcGFydGl0aW9uLXBhcnNlci10eXBl
cy5wYXRjaAo+IFszXSBodHRwczovL2dpdGh1Yi5jb20vb3BlbndydC9vcGVud3J0L2Jsb2IvbWFz
dGVyL3RhcmdldC9saW51eC9nZW5lcmljL3BlbmRpbmctNC4xOS80MDEtbXRkLWFkZC1zdXBwb3J0
LWZvci1kaWZmZXJlbnQtcGFydGl0aW9uLXBhcnNlci10eXBlcy5wYXRjaAo+Cj4gQmVzdCByZWdh
cmRzLAo+IEJydW5vIFBlbmEKPgo+Cj4gT24gV2VkLCBGZWIgNSwgMjAyMCBhdCA5OjMxIEFNIFJh
ZmHFgiBNacWCZWNraSA8emFqZWM1QGdtYWlsLmNvbT4gd3JvdGU6Cj4gPgo+ID4gSGksCj4gPgo+
ID4gT24gMjYuMTEuMjAxOSAyMjoyNSwgQnJ1bm8gUGVuYSB3cm90ZToKPiA+ID4gVGhpcyBwYXRj
aHMgbWFrZXMgaXQgcG9zc2libGUgdG8gbWFzayBjZXJ0YWluIGZsYWdzIGZvciBuZXcgcGFydGl0
aW9ucyAoZS5nLiB0byBtYWtlIHRoZW0gcmVhZC1vbmx5KS4KPiA+ID4gVGhlIGNoYW5nZSBjb25z
aXN0cyBpbiB0aGUgYWRkaXRpb24gb2YgYSBuZXcgYXJndW1lbnQgIm1hc2tfZmxhZ3MiIHRvICJt
dGRfYWRkX3BhcnRpdGlvbiIgdGhhdCBpcyBwYXNzZWQgb24gdG8gdGhlICJhbGxvY2F0ZV9wYXJ0
aXRpb24iLgo+ID4KPiA+IFlvdXIgZGVzY3JpcHRpb24gYW5zd2VycyAid2hhdD8iIGJ1dCBub3Qg
IndoeT8iLgo+ID4KPiA+IFRoaXMgcGF0Y2ggYWRkcyBhIG5ldyBmdW5jdGlvbiBhcmd1bWVudCB0
aGF0IGlzIG5ldmVyIHVzZWQuIFRoaXMgc2VlbXMKPiA+IHF1aXRlIHBvaW50bGVzcy4KPgo+IF9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IExp
bnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdAo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwoKCgotLSAKUmFmYcWCCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRp
c2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbXRkLwo=
