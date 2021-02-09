Return-Path: <SRS0=FWsg=HL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AF5BC433E0
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Feb 2021 14:27:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1DEBB64E56
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Feb 2021 14:27:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1DEBB64E56
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=szeredi.hu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bBIhN2vlnB8D6byaFuHgavsJySd/ZjYrS1sTdn8aj5k=; b=1ih4KXx9co9a5uwWcXJcNDrQh
	zAd9Qkp6ELZ5RMRxITDnT749Bkfs6JSyIjEUQhCft6pIfjHOd9NX5bO6H8zjqaar4e0Wxy0yWHHsK
	RSMEbmcAojFHmU9SnEMvgZ1piMCmFn5gZ4Ji5oF0Kn8rmJXBj4ooAJd89649SFULyEIS7P2uzL8Xi
	J5/mThWvUARudYJCYTDmF3Bkp8O/z3wWEhWd3qyyL0R8pRNbwSIx/wXU4wiJ30YfpXXUnd/uDsP6D
	wyQHwpbWIs+fJEl2uZ+Q2HrIVIFTJQYxL9BKs0GYWI4BHyQWNtWQuef3hJuFQjh6qg/gNJQgLzNzf
	AvBc7sOZw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9TyU-0007KJ-4B; Tue, 09 Feb 2021 14:26:42 +0000
Received: from mail-ua1-x929.google.com ([2607:f8b0:4864:20::929])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9TyS-0007Jk-51
 for linux-mtd@lists.infradead.org; Tue, 09 Feb 2021 14:26:41 +0000
Received: by mail-ua1-x929.google.com with SMTP id 67so5889492uao.1
 for <linux-mtd@lists.infradead.org>; Tue, 09 Feb 2021 06:26:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=szeredi.hu; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=mc9ajK/ExIHzpPYfk2i4tM1eLLMKQGhgH9O5R8zyOqU=;
 b=ouVVqh2U1belsgV04Y2GTHvzxh79luVJ3l8YALSNgGm61/eOOU2lsLpx068nDGY+H2
 5vLtmWhUNeK3M5Zd1ICUI+4vVz3lc+1iI4Dbh0jwR7BUTHChQcb5bWLTDAtiHNReOgG3
 XnDn+d0opgj17dtKIW0wVlbRBnVcsM5kpZZUk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=mc9ajK/ExIHzpPYfk2i4tM1eLLMKQGhgH9O5R8zyOqU=;
 b=D8avodyb3XrN5cirpXaQm28qC2tnch4smOiVxZOiMVMuzSDp4s0RmxvpaTX2wwm2ff
 KsHOF74XwwO7+9UJeEZeCgR8Bd6jdskdQwx3G18ox6LyKvH4Qd6DnQrAlncxY4TJU8fx
 93u3gJwDgbwRIsW3t+6vTx6W3nDU76vSVmrt5ixctbHiVS6X5uarcx7YnFnAr8Xd7jWe
 YTL+xlWB6pjT1L9INGQ6R5jmPGsOoraHLPm9s4hhTq42uKuiQ5nDY8y+I44z4sJuJRDI
 hyvVqxusODl4HETKpE3eIP3wgCdsCIcOTkkQNApd45HAIwOZqYhQZA+zi/mHSlaqWc0N
 Qqgw==
X-Gm-Message-State: AOAM531flv2wC+b0yEOut212/hszpt4ixGptF/hPYLAA1q0vl+2gKPBW
 QJLtwTeNKWPVAPiu2zQn55bjhGCFuuOtceBF0oZarA==
X-Google-Smtp-Source: ABdhPJy4aJHucfQgRXcSfDHbkiZDQs6NDFbWHQh0a37F5qLXYBPdb60JYI8BizBvkqD7MN8sIvwQyZuq60ynD6iUVg4=
X-Received: by 2002:ab0:6f0d:: with SMTP id r13mr13099908uah.8.1612880795818; 
 Tue, 09 Feb 2021 06:26:35 -0800 (PST)
MIME-Version: 1.0
References: <20210124232007.21639-1-richard@nod.at>
In-Reply-To: <20210124232007.21639-1-richard@nod.at>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Tue, 9 Feb 2021 15:26:25 +0100
Message-ID: <CAJfpegvN2KdMj_7T-OF1PAs8xZiU3f4233AvigaXwwRAsgQEjw@mail.gmail.com>
Subject: Re: [PATCH 0/8] MUSE: Userspace backed MTD v3
To: Richard Weinberger <richard@nod.at>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210209_092640_325062_54653314 
X-CRM114-Status: GOOD (  17.58  )
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
 fuse-devel <fuse-devel@lists.sourceforge.net>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@collabora.com>, linux-mtd@lists.infradead.org,
 Ron Minnich <rminnich@google.com>, sven@narfation.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBKYW4gMjUsIDIwMjEgYXQgMTI6MjEgQU0gUmljaGFyZCBXZWluYmVyZ2VyIDxyaWNo
YXJkQG5vZC5hdD4gd3JvdGU6Cj4KPiBJJ20gaGFwcHkgdG8gYW5ub3VuY2UgdGhlIGZpcnN0IG5v
bi1SRkMgdmVyc2lvbiBvZiB0aGlzIHBhdGNoIHNldC4KPiBPdmVyIHRoZSB4bWFzIGhvbGlkYXlz
IEkgZm91bmQgc29tZSB0aW1lIHRvIGV4cGVyaW1lbnQgd2l0aCB2YXJpb3VzIHVzZXJzcGFjZQo+
IGltcGxlbWVudGF0aW9ucyBvZiBNVERzIGFuZCBnYXZlIHRoZSBrZXJuZWwgc2lkZSBtb3JlIGZp
bmUtdHVuaW5nLgo+Cj4gUmF0aW9uYWxlOgo+IC0tLS0tLS0tLS0KPgo+IFdoZW4gd29ya2luZyB3
aXRoIGZsYXNoIGRldmljZXMgYSBjb21tb24gdGFzayBpcyBlbXVsYXRpbmcgdGhlbSB0byBydW4g
dmFyaW91cwo+IHRlc3RzIG9yIGluc3BlY3QgZHVtcHMgZnJvbSByZWFsIGhhcmR3YXJlLiBUbyBh
Y2hpZXZlIHRoYXQgd2UgaGF2ZSBwbGVudHkgb2YKPiBlbXVsYXRvcnMgaW4gdGhlIE1URCBzdWJz
eXN0ZW06IG10ZHJhbSwgYmxvY2sybXRkLCBuYW5kc2ltLgo+Cj4gRWFjaCBvZiB0aGVtIGltcGxl
bWVudHMgYW4gYWQtaG9jIE1URCBhbmQgaGF2ZSB2YXJpb3VzIGRyYXdiYWNrcy4KPiBPdmVyIHRo
ZSBsYXN0IHllYXJzIHNvbWUgZGV2ZWxvcGVycyB0cmllZCB0byBleHRlbmQgdGhlbSBidXQgdGhl
c2UgYXR0ZW1wdHMKPiBvZnRlbiBnb3QgcmVqZWN0ZWQgYmVjYXVzZSB0aGV5IGFkZGVkIGp1c3Qg
bW9yZSBhZGhvYyBmZWF0dXJlIGluc3RlYWQgb2YKPiBhZGRyZXNzaW5nIG92ZXJhbGwgcHJvYmxl
bXMuCj4KPiBNVVNFIGlzIGEgbm92ZWwgYXBwcm9hY2ggdG8gYWRkcmVzcyB0aGUgbmVlZCBvZiBh
ZHZhbmNlZCBNVEQgZW11bGF0b3JzLgo+IEFkdmFuY2VkIG1lYW5zIGluIHRoaXMgY29udGV4dCBz
dXBwb3J0aW5nIGRpZmZlcmVudCAodmVuZG9yIHNwZWNpZmljKSBpbWFnZQo+IGZvcm1hdHMsIGRp
ZmZlcmVudCB3YXlzIGZvciBmYXVsdCBpbmplY3Rpb24gKGZ1enppbmcpIGFuZCByZWNvZGluZy9y
ZXBsYXlpbmcKPiBJT3MgdG8gZW11bGF0ZSBwb3dlciBjdXRzLgo+Cj4gVGhlIGNvcmUgZ29hbCBv
ZiBNVVNFIGlzIGhhdmluZyB0aGUgY29tcGxleGl0eSBvbiB0aGUgdXNlcnNwYWNlIHNpZGUgYW5k
Cj4gb25seSBhIHNtYWxsIE1URCBkcml2ZXIgaW4ga2VybmVsc3BhY2UuCj4gV2hpbGUgcGxheWlu
ZyB3aXRoIGRpZmZlcmVudCBhcHByb2FjaGVzIEkgcmVhbGl6ZWQgdGhhdCBGVVNFIG9mZmVycyBl
dmVyeXRoaW5nCj4gd2UgbmVlZC4gU28gTVVTRSBpcyBhIGxpdHRsZSBsaWtlIENVU0UgZXhjZXB0
IHRoYXQgaXQgZG9lcyBub3QgaW1wbGVtZW50IGEKPiBiYXJlIGNoYXJhY3RlciBkZXZpY2UgYnV0
IGFuIE1URC4KCkxvb2tzIGZpbmUuCgpJIGRvIHdvbmRlciBpZiBNVVNFIHNob3VsZCBnbyB0byBk
cml2ZXJzL210ZC8gaW5zdGVhZC4gICBMb25nIHRlcm0KZ29hbCB3b3VsZCBiZSBtb3ZlIENVU0Ug
dG8gZHJpdmVycy9jaGFyIGFuZCBtb3ZlIHRoZSB0cmFuc3BvcnQgcGFydCBvZgpmdXNlIGludG8g
bmV0L2Z1c2UgbGVhdmluZyBvbmx5IHRoZSBhY3R1YWwgZmlsZXN5c3RlbXMgKGZ1c2UgYW5kCnZp
cnRpb2ZzKSB1bmRlciBmcy8uCgpCdXQgZm9yIG5vdyBqdXN0IG1vdmluZyB0aGUgbWluaW1hbCBp
bnRlcmZhY2UgbmVlZGVkIGZvciBNVVNFIGludG8gYQpzZXBhcmF0ZSBoZWFkZXIgKDxuZXQvZnVz
ZS5oPikgd291bGQgd29yaywgSSBndWVzcy4KCkRvIHlvdSB0aGluayB0aGF0IHdvdWxkIG1ha2Ug
c2Vuc2U/Cgo+Cj4gTm90ZXM6Cj4gLS0tLS0tCj4KPiAtIE9PQiBzdXBwb3J0IGlzIGN1cnJlbnRs
eSBsaW1pdGVkLiBDdXJyZW50bHkgTVVTRSBoYXMgbm8gc3VwcG9ydCBmb3IgcHJvY2Vzc2luZwo+
ICAgaW4tIGFuZCBvdXQtYmFuZCBpbiB0aGUgc2FtZSBNVEQgb3BlcmF0aW9uLiBJdCBpcyBnb29k
IGVub3VnaCB0byBtYWtlIEpGRlMyCj4gICBoYXBweS4gVGhpcyBsaW1pdGF0aW9uIGlzIGJlY2F1
c2UgRlVTRSBoYXMgbm8gc3VwcG9ydCBtb3JlIHRoYW4gb25lIHZhcmlhYmxlCj4gICBsZW5ndGgg
YnVmZmVyIGluIGEgRlVTRSByZXF1ZXN0Lgo+ICAgQXQgbGVhc3QgSSBkaWRu4oCZdCBmaW5kIGEg
Z29vZCB3YXkgdG8gcGFzcyBtb3JlIHRoYW4gb25lIGJ1ZmZlciB0byBhIHJlcXVlc3QuCj4gICBN
YXliZSBGVVNFIGZvbGtzIGNhbiBjb3JyZWN0IG1lLiA6LSkKCklmIHlvdSBsb29rIGF0IGZ1c2Vf
ZG9faW9jdGwoKSBpdCBkb2VzIHZhcmlhYmxlIGxlbmd0aCBpbnB1dCBhbmQKb3V0cHV0IGF0IHRo
ZSBzYW1lIHRpbWUuICBJIGd1ZXNzIHlvdSBuZWVkIHNvbWV0aGluZyBzaW1pbGFyIHRvIHRoYXQu
CgpUaGFua3MsCk1pa2xvcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
