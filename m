Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B217D58068
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Nov 2024 11:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KHZzzoTiptP3MjdxPnQjx7BjZZRCghAtuGDyRNfMFXI=; b=2PkPY1xXkWl3ch
	3Ne+/rzhWsRMbLCmFJGuj4zoYRZpddiF5B50IObXL+vdUHML3yYfgvNzZL4t+RiS4ZcPm/lGCbRE5
	ZDLbg1fUZVfG27/NIV5MXwfkdHWmKsq5iwmmQPb2NyvyM3lbhN7DDAJPO+QdO5npRez8XCIMumkxQ
	v9qL1AcO6R8/hkncdopm9aujonoWeR4K1c4ND/vZfkyDaxLlBGX21HUIXPgdj9KdWu0YGFFrr1yHH
	mVHQhfq+De9V7M705GhfXbBSF1nIxgsTvZy+uY6sIDmGfx1hFSsOE4i7qyMvZ0KDuR3MoKCjkTPV5
	s9hQEKdboh76pvKUzgmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFXa5-00000007vqR-3D8G;
	Mon, 25 Nov 2024 11:48:41 +0000
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFXa3-00000007vpv-2EAR
	for linux-mtd@lists.infradead.org;
	Mon, 25 Nov 2024 11:48:40 +0000
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-6eeee645605so22397457b3.2
        for <linux-mtd@lists.infradead.org>; Mon, 25 Nov 2024 03:48:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1732535318; x=1733140118; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=476juWLLXH68WdEd6CCvoohOL74hVP8YdxJenm7T9uk=;
        b=mmQrDzFkeJZMQwn9sbimvIuxWvZxInVMQtsjZ3EK9CZ0LWXL6seSqZizgNN59CCEM5
         qDHTDlcvqazer7YxoIVbbqqYyo6u/9Cq5JV6PHy/MUJb0axZ+NnTlyvYjKuHoAKQvmMO
         /FS7on5lOkGsHImk5BhHYyp+AtaZluyS5gKJrL01dJJnNwf932MzH3z41am06R5m7gDz
         hXm0Yq4I5DX7ti1pwdynVWnkonPsIfnzAhuhRWP6F8/Fkfa8akf7fA4Yu3Lz0BxnA3X+
         2Ecme6a4J9rMrTM8nrQyqXCZr1qYOBDfFJzwcYjaz1QgxhSU7BWHaxk+ipZJ70xzPGqu
         4sGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732535318; x=1733140118;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=476juWLLXH68WdEd6CCvoohOL74hVP8YdxJenm7T9uk=;
        b=NAXEu1L7sWGdEnXN5LagGNkkaRVXuEq8TRcZn3I0+YjLLsMEJF44T+bmM14+sryKbu
         IThwZu6Qk7KCbolQjxraFR/vZE4Kbo5Zzkh9z/tyDVq+IbN0NQQm4js39RatItTxmZGS
         AcmlZYBmeia6gmVul4VenXUqJKrvmMLixxIaOe5WHCmKtL7n8Zes4+j7TT1F0KsubBIX
         oBqOLYy/j0gjLEDnKqbrBzZ5YjKhOqkz7yiPnEZGTilELKMnLvUGhmx5+UlXeCj5NNEF
         CtQBuErqGSyakXgRqRCahLDDct+JV0RGx9rnK7hwyGTWLwbWNGjZhRg8q9DeYv5ikQHg
         w85Q==
X-Forwarded-Encrypted: i=1; AJvYcCXijVAtkZneUtEISoEq8gFlAUSNW5P+BXzrrQgZy4rbVbGi3q7Abwz7CKDpwNQRhfO6JDf/AdqYuvg=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0sTRxpOwee78idD/vB4ipm4Hy0M/sUN7a+2ln/wUtHGF74RCK
	CN/tdfagE/kzdW1y25vq9O/gj9xJ/DZK3iQAHEZGQKd7bsnAZoWTI4+lsO5izaC4uJGB7pUjZ08
	Xly5pr0lbLgpMKoZoXE1Jxa28i24=
X-Gm-Gg: ASbGncvuXLwO5/CBM/pkJJCPeDqGVxjNZoZJ96zCIfFCe/0WqC9jIyAeog3N1XT89uT
	NS9Wgw71JEDXcS6DhkJsyqXbVfkZfZPt8
X-Google-Smtp-Source: AGHT+IGYP2SKdODKsnDK/PfBnKLbQWqO3MML2UPkyylWYXOgHgp7Wt8KYifNK0fRtunrvJy8VyVVbVwzaUlM3QnofG0=
X-Received: by 2002:a05:6902:2084:b0:e38:ea81:d01e with SMTP id
 3f1490d57ef6-e38f8aca119mr9503432276.8.1732535317875; Mon, 25 Nov 2024
 03:48:37 -0800 (PST)
MIME-Version: 1.0
References: <20241125104011.36552-1-cgoettsche@seltendoof.de>
 <20241125104011.36552-5-cgoettsche@seltendoof.de> <1045101183.70157813.1732534258584.JavaMail.zimbra@nod.at>
In-Reply-To: <1045101183.70157813.1732534258584.JavaMail.zimbra@nod.at>
From: =?UTF-8?Q?Christian_G=C3=B6ttsche?= <cgzones@googlemail.com>
Date: Mon, 25 Nov 2024 12:48:27 +0100
Message-ID: <CAJ2a_Dd_sz2LYEEJJhiJE=JP81V4AvET=jgSyRe73eF-YjeXhg@mail.gmail.com>
Subject: Re: [PATCH 06/11] ubifs: reorder capability check last
To: Richard Weinberger <richard@nod.at>
Cc: LSM <linux-security-module@vger.kernel.org>, 
	Boris Brezillon <boris.brezillon@collabora.com>, Steven Price <steven.price@arm.com>, 
	Liviu Dudau <liviu.dudau@arm.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	chengzhihao1 <chengzhihao1@huawei.com>, "Serge E. Hallyn" <serge@hallyn.com>, 
	Julia Lawall <Julia.Lawall@inria.fr>, Nicolas Palix <nicolas.palix@imag.fr>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	DRI mailing list <dri-devel@lists.freedesktop.org>, linux-mtd <linux-mtd@lists.infradead.org>, 
	cocci <cocci@inria.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_034839_584340_9DFA7690 
X-CRM114-Status: GOOD (  26.50  )
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

T24gTW9uLCAyNSBOb3YgMjAyNCBhdCAxMjozMSwgUmljaGFyZCBXZWluYmVyZ2VyIDxyaWNoYXJk
QG5vZC5hdD4gd3JvdGU6Cj4KPiAtLS0tLSBVcnNwcsO8bmdsaWNoZSBNYWlsIC0tLS0tCj4gPiBW
b246ICJDaHJpc3RpYW4gR8O2dHRzY2hlIiA8Y2dvZXR0c2NoZUBzZWx0ZW5kb29mLmRlPgo+ID4g
Y2FwYWJsZSgpIGNhbGxzIHJlZmVyIHRvIGVuYWJsZWQgTFNNcyB3aGV0aGVyIHRvIHBlcm1pdCBv
ciBkZW55IHRoZQo+ID4gcmVxdWVzdC4gIFRoaXMgaXMgcmVsZXZhbnQgaW4gY29ubmVjdGlvbiB3
aXRoIFNFTGludXgsIHdoZXJlIGEKPiA+IGNhcGFiaWxpdHkgY2hlY2sgcmVzdWx0cyBpbiBhIHBv
bGljeSBkZWNpc2lvbiBhbmQgYnkgZGVmYXVsdCBhIGRlbmlhbAo+ID4gbWVzc2FnZSBvbiBpbnN1
ZmZpY2llbnQgcGVybWlzc2lvbiBpcyBpc3N1ZWQuCj4gPiBJdCBjYW4gbGVhZCB0byB0aHJlZSB1
bmRlc2lyZWQgY2FzZXM6Cj4gPiAgMS4gQSBkZW5pYWwgbWVzc2FnZSBpcyBnZW5lcmF0ZWQsIGV2
ZW4gaW4gY2FzZSB0aGUgb3BlcmF0aW9uIHdhcyBhbgo+ID4gICAgIHVucHJpdmlsZWdlZCBvbmUg
YW5kIHRodXMgdGhlIHN5c2NhbGwgc3VjY2VlZGVkLCBjcmVhdGluZyBub2lzZS4KPiA+ICAyLiBU
byBhdm9pZCB0aGUgbm9pc2UgZnJvbSAxLiB0aGUgcG9saWN5IHdyaXRlciBhZGRzIGEgcnVsZSB0
byBpZ25vcmUKPiA+ICAgICB0aG9zZSBkZW5pYWwgbWVzc2FnZXMsIGhpZGluZyBmdXR1cmUgc3lz
Y2FsbHMsIHdoZXJlIHRoZSB0YXNrCj4gPiAgICAgcGVyZm9ybXMgYW4gYWN0dWFsIHByaXZpbGVn
ZWQgb3BlcmF0aW9uLCBsZWFkaW5nIHRvIGhpZGRlbiBsaW1pdGVkCj4gPiAgICAgZnVuY3Rpb25h
bGl0eSBvZiB0aGF0IHRhc2suCj4gPiAgMy4gVG8gYXZvaWQgdGhlIG5vaXNlIGZyb20gMS4gdGhl
IHBvbGljeSB3cml0ZXIgYWRkcyBhIHJ1bGUgdG8gcGVybWl0Cj4gPiAgICAgdGhlIHRhc2sgdGhl
IHJlcXVlc3RlZCBjYXBhYmlsaXR5LCB3aGlsZSBpdCBkb2VzIG5vdCBuZWVkIGl0LAo+ID4gICAg
IHZpb2xhdGluZyB0aGUgcHJpbmNpcGxlIG9mIGxlYXN0IHByaXZpbGVnZS4KPiA+Cj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gR8O2dHRzY2hlIDxjZ3pvbmVzQGdvb2dsZW1haWwuY29tPgo+
ID4gLS0tCj4gPiBkcml2ZXJzL2dwdS9kcm0vcGFudGhvci9wYW50aG9yX2Rydi5jIHwgMiArLQo+
Cj4gVGhpcyBjaGFuZ2UgaXMgdW5yZWxhdGVkLCBwbGVhc2UgcmVtb3ZlIGl0LgoKU29ycnksIHNv
bWVob3cgdGhlc2UgdHdvIGNoYW5nZXMgZ290IGVycm9uZW91c2x5IGNvbWJpbmVkIGluIGEgc2lu
Z2xlIHBhdGNoLgpJJ2xsIHNlbmQgYSB2MiB3aXRoIHRoZW0gc3BsaXQgaW50byBzZXBhcmF0ZSBv
bmVzLgoKPgo+ID4gZnMvdWJpZnMvYnVkZ2V0LmMgICAgICAgICAgICAgICAgICAgICB8IDUgKysr
LS0KPiA+IDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+
Cj4gWy4uLl0KPgo+ID4gZGlmZiAtLWdpdCBhL2ZzL3ViaWZzL2J1ZGdldC5jIGIvZnMvdWJpZnMv
YnVkZ2V0LmMKPiA+IGluZGV4IGQ3NmViN2IzOWY1Ni4uNjEzN2FlYWRlYzNmIDEwMDY0NAo+ID4g
LS0tIGEvZnMvdWJpZnMvYnVkZ2V0LmMKPiA+ICsrKyBiL2ZzL3ViaWZzL2J1ZGdldC5jCj4gPiBA
QCAtMjU2LDggKzI1Niw5IEBAIGxvbmcgbG9uZyB1Ymlmc19jYWxjX2F2YWlsYWJsZShjb25zdCBz
dHJ1Y3QgdWJpZnNfaW5mbyAqYywKPiA+IGludCBtaW5faWR4X2xlYnMpCj4gPiAgKi8KPiA+IHN0
YXRpYyBpbnQgY2FuX3VzZV9ycChzdHJ1Y3QgdWJpZnNfaW5mbyAqYykKPiA+IHsKPiA+IC0gICAg
IGlmICh1aWRfZXEoY3VycmVudF9mc3VpZCgpLCBjLT5ycF91aWQpIHx8IGNhcGFibGUoQ0FQX1NZ
U19SRVNPVVJDRSkgfHwKPiA+IC0gICAgICAgICAoIWdpZF9lcShjLT5ycF9naWQsIEdMT0JBTF9S
T09UX0dJRCkgJiYgaW5fZ3JvdXBfcChjLT5ycF9naWQpKSkKPiA+ICsgICAgIGlmICh1aWRfZXEo
Y3VycmVudF9mc3VpZCgpLCBjLT5ycF91aWQpIHx8Cj4gPiArICAgICAgICAgKCFnaWRfZXEoYy0+
cnBfZ2lkLCBHTE9CQUxfUk9PVF9HSUQpICYmIGluX2dyb3VwX3AoYy0+cnBfZ2lkKSkgfHwKPiA+
ICsgICAgICAgICBjYXBhYmxlKENBUF9TWVNfUkVTT1VSQ0UpKQo+ID4gICAgICAgICAgICAgICBy
ZXR1cm4gMTsKPiA+ICAgICAgIHJldHVybiAwOwo+ID4gfQo+Cj4gVGhlIFVCSUZTIHBhcnQgbG9v
a3Mgb2s6Cj4KPiBBY2tlZC1ieTogUmljaGFyZCBXZWluYmVyZ2VyIDxyaWNoYXJkQG5vZC5hdD4K
Pgo+IFNpbmNlIEkgd2FzIG5vdCBDQydlZCB0byB0aGUgd2hvbGUgc2VyaWVzLCBJIG1pc3MgYSBs
b3Qgb2YgY29udGV4dC4KClRoZSBzZXJpZXMgY29uc2lzdHMgb2Ygc2ltaWxhciBwYXRjaGVzIHRv
IG90aGVyIHN1YnN5c3RlbXMgYW5kIGEKY29jY2luZWxsZSBzY3JpcHQgYWRkaXRpb24uClNlZSBo
dHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1zZWN1cml0eS1tb2R1bGUvMjAyNDExMjUxMDQw
MTEuMzY1NTItMTEtY2dvZXR0c2NoZUBzZWx0ZW5kb29mLmRlLyN0Cgo+IFdpbGwgdGhpcyBzZXJp
ZXMgbWVyZ2VkIGFzIGEgd2hvbGU/IEJ5IHdob20/Cj4KPiBUaGFua3MsCj4gLy9yaWNoYXJkCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
