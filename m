Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FEBFD2ECFD
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Jan 2026 01:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cfEL7nF4jQJ7BjQtOnF/pFFlG8Ioy+jKbOG1cN7B/mo=; b=Vi6sTWXDwDMh/U
	uF4frWAt2OELwvMrnjMqr6VOt037jyN5p9qSrJxSgbnEu9oOZTco7P/ekzGDTBRsnbZoIagDMb31R
	NsfY1FcMHc0B/LaZNw99zXWH9VEedlBKHnT+tC5zUNfMg3qR9sEnYa/koJJF3RxXYKSPNzsC9cV5l
	ZcSB54VOhZt5+VLD/UPn48VjvwYK1bowR6NB2hYZGYjTe6D25mRw+tAl5WrAdRzn2RmibEyBox9K9
	IGZsMRG2gHtPomYcK7qwZBndWExleJ/1BJMYJbe1M/4tgbYr5cI5KNACsZdJk8a/s89ISfXS1HPzP
	thvJZs9Y2FC76KErc/RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi0x7-000000034Qj-0PPw;
	Tue, 20 Jan 2026 01:54:41 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi0x4-000000034QZ-45zb
	for linux-mtd@lists.infradead.org;
	Tue, 20 Jan 2026 01:54:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2156560151
	for <linux-mtd@lists.infradead.org>; Tue, 20 Jan 2026 01:54:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEB75C2BCB1
	for <linux-mtd@lists.infradead.org>; Tue, 20 Jan 2026 01:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768874077;
	bh=0CpFIUoNQxzCsEqiOC9Tot7+YhNBK8bbLQBjNBE+Whg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=HDR9AA/SAsTWh7Cp/LvXHK4oavlJ+NI2i/YstM0RgVZoOFydeI+PJ1iSiQJbqUCuA
	 rQRqzo6JCQNXjFwdYgV+2+hfNNdbUmkdASFtL+eAOdBJvpHRayguyP1fpEz+bm8w36
	 RTNsgNJ/8ruW64htmDg5zRZ2QimUk0D/LLQ/0rMFT6MfdakRBK/YCp6mkCB0nAbsTl
	 nOgBIQ9z1a82Z6cwHfmXIVHUt4bY041IyfHpxUrVpOKZ+WZTuyJ0QKJeM90iU/f1rw
	 UomvZ/XFtUyjgf+1xYzHhgKzx1fvtjWZWF4fdt2lzAwuzw7TMCvxWqMn/I1OLjlvgm
	 MdViyXwDbXDGA==
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-64b83949fdaso7530067a12.2
        for <linux-mtd@lists.infradead.org>; Mon, 19 Jan 2026 17:54:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUmBCD3O3/U6ji8GCSabAA2CWq95xK0tElIKRnee4RngRxhmvl0f+vLzasz0vaZqx8pg+mY5D38DEM=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5NgvXhTxkZA41+An3xHUDV6omx2GOTGiV9Xq5Vmps4VsW5Bvt
	Z20YSaoS1qxaUG8+Wu6SUle8ewcRAxzo0OIxiGSctc64+fzF026rI/lSoDs65fXpwDoqw9t/GM/
	2dASRqKaUHVUT8GIwbLPDbN6pWWBvag==
X-Received: by 2002:a05:6402:2348:b0:64b:7307:9b00 with SMTP id
 4fb4d7f45d1cf-657ff2a6953mr281430a12.5.1768874076364; Mon, 19 Jan 2026
 17:54:36 -0800 (PST)
MIME-Version: 1.0
References: <20260108-dt-mtd-partitions-v1-0-124a53ce6279@kernel.org> <87tswhswsp.fsf@bootlin.com>
In-Reply-To: <87tswhswsp.fsf@bootlin.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 19 Jan 2026 19:54:24 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJ7_yKRTCOrxcq0QDy_MRMCRMQqhH=TKiBs=nubqNN9HA@mail.gmail.com>
X-Gm-Features: AZwV_QjPR6v0rtDsZSDoolTLomCXXNQMjCA8Bg08oauq1HlF9vmo2OSFeFzVJj0
Message-ID: <CAL_JsqJ7_yKRTCOrxcq0QDy_MRMCRMQqhH=TKiBs=nubqNN9HA@mail.gmail.com>
Subject: Re: [PATCH 00/10] dt-bindings: mtd: Partition binding fixes and restructuring
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Brian Norris <computersforpeace@gmail.com>, Kamal Dasu <kdasu.kdev@gmail.com>, 
	William Zhang <william.zhang@broadcom.com>, Nick Terrell <terrelln@fb.com>, 
	David Sterba <dsterba@suse.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Simon Glass <sjg@chromium.org>, Linus Walleij <linusw@kernel.org>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Marcus Folkesson <marcus.folkesson@gmail.com>, 
	Tony Lindgren <tony@atomide.com>, Roger Quadros <rogerq@kernel.org>, Hauke Mehrtens <hauke@hauke-m.de>, 
	linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org
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

T24gTW9uLCBKYW4gMTksIDIwMjYgYXQgNDo0OOKAr0FNIE1pcXVlbCBSYXluYWwgPG1pcXVlbC5y
YXluYWxAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gSGVsbG8gUm9iLAo+Cj4gT24gMDgvMDEvMjAy
NiBhdCAxMTo1MzowOSAtMDYsICJSb2IgSGVycmluZyAoQXJtKSIgPHJvYmhAa2VybmVsLm9yZz4g
d3JvdGU6Cj4KPiA+IFRoZSBwYXJ0aXRpb24gYmluZGluZ3MgZmFpbCB0byByZXN0cmljdCB1bmRl
ZmluZWQgcHJvcGVydGllcy4gVGhpcyBpcwo+ID4gcHJpbWFyaWx5IG9uIGZpeGVkLXBhcnRpdGlv
bnMgd2hpY2ggY2FuIGJlIG5lc3RlZCBhbmQgcGFydGl0aW9uIG5vZGVzCj4gPiB3aXRob3V0IGEg
Y29tcGF0aWJsZSBzdHJpbmcuIFRoaXMgc2VyaWVzIGZpeGVzIHRob3NlIGlzc3VlcyBhbmQgdGhl
bgo+ID4gc2V2ZXJhbCBwcm9ibGVtcyBleHBvc2VkIGJ5IHJlc3RyaWN0aW5nIHVuZGVmaW5lZCBw
cm9wZXJ0aWVzLiBBcyBwYXJ0IG9mCj4gPiB0aGlzLCB0aGUgc2NoZW1hIHN0cnVjdHVyZSBpcyBy
ZXdvcmtlZCB0byBmb2xsb3cgbW9yZSBjb252ZW50aW9uYWwKPiA+IHN0cnVjdHVyZSBvZiBhcHBs
eWluZyBzY2hlbWFzIGJ5IGNvbXBhdGlibGUgYW5kIGEgc2NoZW1hIG9ubHkgY2hlY2tzIDEKPiA+
IGxldmVsIG9mIG5vZGVzICh1bmxlc3MgcG9zc2libGUgY2hpbGQgbm9kZXMgYXJlIGZpeGVkKS4K
Pgo+IFRoZSBzZXJpZXMgZG9lcyBub3QgYXBwbHkgY2xlYW5seSwgSSB0cmllZCBtdGQvbmV4dCBh
bmQgdGhlbgo+IHY2LjE5LXJjMS4gQ2FuIHlvdSBwbGVhc2UgcmViYXNlIGl0IGFuZCBmaXggdGhl
IGNvbmZsaWN0cyAoYXQgbGVhc3QgMgo+IHBhdGNoZXMgZmFpbCwgYW5kIHRoZW4gSSBzdG9wcGVk
KT8KCkkgcmViYXNlZCBvbiBtdGQvbmV4dCBhbmQgc2VudCB2Mi4gSSBvbmx5IHNhdyBvbmUgY29u
ZmxpY3QgdGhvdWdoLCBhbmQKdGhhdCB3YXMgd2l0aCBzZWFtYS55YW1sLiBUaGF0J3MgZ29pbmcg
dG8gY29uZmxpY3Qgd2l0aCBMaW51cycgdHJlZSwKYnV0IHRoZSByZXNvbHV0aW9uIGlzIHRha2Ug
dGhlIGRlbGV0ZWQgZmlsZS4KClJvYgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
