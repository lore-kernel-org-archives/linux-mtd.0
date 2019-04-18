Return-Path: <SRS0=tAZV=SU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70EEAC10F0E
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Apr 2019 16:23:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 416E2206B6
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Apr 2019 16:23:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kYTvWt78"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 416E2206B6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5PLhaAA1jF3onrOi3Gq9+6QBAQ6h8J63As0pdyBAlGI=; b=kYTvWt78XVWuCv
	Gpa3IWaEXPotlGF7QwY4P7+PoT2l6JCOa0fgAlfjnUkQb4KoEoCNAyRehvnK2ZwpHDm41VkRrBwBq
	gn1szFa9gRWg7dG6WzidXjsrq/I0RXPBiu4fCnMeOIkMS2qCmJXzue2vZ9rlX8ZLJ0ffV1WEutmkf
	t/YdRxgR9E+Z/KHyhAmM7UAa5XLElxe1dc3zZ6LPdKO54/hvjDwZbjtHqsBjqY2UuAcwVWmriXeVV
	H9EBw39PPRerCLOa898hcwN3rzDcwTU+HbTdoXC+aUSysHDN/M0JzgA6Ee/w8BHF8lW/BS6wnFOXT
	FDrf8gopLCtCc4buNxpA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hH9oy-0001y0-Sl; Thu, 18 Apr 2019 16:23:32 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hH9oY-0001T8-6y; Thu, 18 Apr 2019 16:23:13 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 823B51C0007;
 Thu, 18 Apr 2019 16:23:00 +0000 (UTC)
Date: Thu, 18 Apr 2019 18:22:59 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH 0/4] meson-nand: small code improvements
Message-ID: <20190418182259.479bbeb3@xps13>
In-Reply-To: <20190411220056.19109-1-martin.blumenstingl@googlemail.com>
References: <20190411220056.19109-1-martin.blumenstingl@googlemail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190418_092306_855624_38503F8A 
X-CRM114-Status: GOOD (  14.41  )
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
Cc: jianxin.pan@amlogic.com, bbrezillon@kernel.org, richard@nod.at,
 linux-kernel@vger.kernel.org, marek.vasut@gmail.com, liang.yang@amlogic.com,
 linux-mtd@lists.infradead.org, linux-amlogic@lists.infradead.org,
 computersforpeace@gmail.com, dwmw2@infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWFydGluLAoKTWFydGluIEJsdW1lbnN0aW5nbCA8bWFydGluLmJsdW1lbnN0aW5nbEBnb29n
bGVtYWlsLmNvbT4gd3JvdGUgb24gRnJpLAoxMiBBcHIgMjAxOSAwMDowMDo1MiArMDIwMDoKCj4g
VGhpcyBzZXJpZXMgY29tZXMgd2l0aCBmb3VyIHNtYWxsIGltcHJvdmVtZW50cyBmb3IgdGhlIG1l
c29uLW5hbmQKPiBkcml2ZXI6Cj4gKiB0aGUgZmlyc3QgcGF0Y2hlcyBhcmUgcmVwbGFjaW5nIG9w
ZW4tY29kZWQgbG9naWMgd2l0aCBleGlzdGluZwo+ICAgdXRpbGl0aWVzIC8gaGVscGVycwo+ICog
dGhlIHRoaXJkIHBhdGNoIGRyb3BzIHNvbWUgdW5uZWNlc3NhcnkgY2FzdGluZyBhZnRlciBjaGFu
Z2luZwo+ICAgdGhlIHR5cGUgb2YgdGhlIGluZm8gYnVmZmVyIHBhcmFtZXRlciBmcm9tICJ1OCAq
IiB0byAidm9pZCAqIgo+ICogdGhlIGZvdXJ0aCBwYXRjaCBhZGp1c3RzIHRoZSB1c2FnZSBvZiBp
bml0X2NvbXBsZXRpb24gd2l0aCB3aGF0IHRoZQo+ICAgZG9jdW1lbnRhdGlvbiBzdWdnZXN0cwo+
IAo+IEkgaGF2ZSB0ZXN0ZWQgdGhlc2UgcGF0Y2hlcyBhcyBiZXN0IGFzIEkgY291bGQgb24gbXkg
TWVzb244bTIgYm9hcmQKPiB1c2luZyBleHBlcmltZW50YWwgcGF0Y2hlcyBvbiB0b3Agb2YgdGhp
cyBzZXJpZXMgd2hpY2ggYWRkIHN1cHBvcnQgZm9yCj4gdGhpcyBvbGRlciBTb0MgdG8gdGhlIG1l
c29uLW5hbmQgZHJpdmVyLgo+IAo+IExpYW5nLCBjYW4geW91IHBsZWFzZSB0ZXN0IHRoaXMgc2Vy
aWVzIG9uIEdYTCBhbmQvb3IgQVhHIHNvIEkgZG9uJ3QKPiBicmVhayB0aGUgTkZDIGRyaXZlciBv
biB0aGVzZSBuZXdlciBTb0NzPyBBbGwgb2YgbXkgR1hML0dYTSBib2FyZHMKPiBoYXZlIGVNTUMg
aW5zdGVhZCBvZiByYXcgTkFORCwgc28gSSBjYW5ub3QgdGVzdCBpdCBvbiB0aGVzZSBuZXdlciBT
b0NzCj4gbXlzZWxmLgo+IAo+IFRoaXMgc2VyaWVzIGlzIG1lYW50IHRvIGJlIGFwcGxpZWQgdG8g
dGhlIG5hbmQvbmV4dCB0cmVlLgo+IAo+IAo+IE1hcnRpbiBCbHVtZW5zdGluZ2wgKDQpOgo+ICAg
bXRkOiByYXduYW5kOiBtZXNvbjogdXNlIHN0cnVjdF9zaXplIG1hY3JvCj4gICBtdGQ6IHJhd25h
bmQ6IG1lc29uOiB1c2Ugb2ZfcHJvcGVydHlfY291bnRfZWxlbXNfb2Zfc2l6ZSBoZWxwZXIKPiAg
IG10ZDogcmF3bmFuZDogbWVzb246IHVzZSBhIHZvaWQgcG9pbnRlciBmb3IgbWVzb25fbmZjX2Rt
YV9idWZmZXJfc2V0dXAKPiAgIG10ZDogcmF3bmFuZDogbWVzb246IG9ubHkgaW5pdGlhbGl6ZSB0
aGUgUkIgY29tcGxldGlvbiBvbmNlCj4gCj4gIGRyaXZlcnMvbXRkL25hbmQvcmF3L21lc29uX25h
bmQuYyB8IDIxICsrKysrKysrKy0tLS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgOSBpbnNl
cnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkKPiAKClNlcmllcyBhcHBsaWVkIHRvIApodHRwczov
L2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9tdGQvbGludXguZ2l0IApi
cmFuY2ggbmFuZC9uZXh0LgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
