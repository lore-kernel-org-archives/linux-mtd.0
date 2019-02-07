Return-Path: <SRS0=ZMJ0=QO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7831CC282C2
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Feb 2019 10:48:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4314B21872
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Feb 2019 10:48:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KuFrKIwV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="BWDwkpes"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4314B21872
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RNrX3jkJA2HOOgOJ5MudtKMaFILUNw0pdYz4xpahIZE=; b=KuFrKIwVkcPf9b
	Zpwr1TXrj2d9UbMKagRjCaS4ikZFnBXjm+zglTayuSlX8Ow7VIKvGdwzgOefDI4vqeUx+scY8eFHF
	coYGfbH2JK9OqKFhn6gjJFs7JHyUVpN2cUInOFu7wCWPUB94h4B1sVRkfxDQ942YS0PISr0MpfGkL
	SrRPMeI04bBNvDWZX0bWCOOykBZdq9ZxX1GOv8wTeaVp3NJ6AGdeUoYJsbizSWmx3SRqMUNt9AgGj
	micGRn0tnFZqj4Khwtr9mI9cPusEuZVWn/aH4S81NG3gCRpgAtyskQmDwfCkb6n2gFFJVhN+qBW40
	vzR2/VjPTkw3Ojxa/FJQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1grhDq-0003aY-KM; Thu, 07 Feb 2019 10:47:58 +0000
Received: from conssluserg-03.nifty.com ([210.131.2.82])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1grhDn-0003a1-N9
 for linux-mtd@lists.infradead.org; Thu, 07 Feb 2019 10:47:57 +0000
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com
 [209.85.217.47]) (authenticated)
 by conssluserg-03.nifty.com with ESMTP id x17AlV5i001496
 for <linux-mtd@lists.infradead.org>; Thu, 7 Feb 2019 19:47:32 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com x17AlV5i001496
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1549536452;
 bh=a2aQCf6e/pUnLAtj49zQo5bkjXwLnat9d9gPY5wUf8Q=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=BWDwkpesDBLq4J9825dVQvbzQ81NlpqQ3apdx0Txm7+z7xnIFeI0lWIopNMmEK9cp
 KnCVAQgbaU52G7e2/AV62MX63U9rSmz+Zv6/asR5fJpqpQ2serVxzjvNreYrbjCl8v
 8NzzFs46US3njx3Y0bPkhDLb9InAL+Qk8+mjlJwftLDVD/2CZlnCvSpEk3lyMXpo0K
 V6Y14x2fCzq4hcUnVHeRbA+03kB7g/OcnskD1REskaoD14hHbA9Dh8ixVt/yIM/MRS
 x64oJLwGwLsGkJG0NIqBu4xsym/cJIcnbK7mhhpsc7lEzdr3G3Xur8a1ujjGm5U13P
 /ZyZIIcuvacCA==
X-Nifty-SrcIP: [209.85.217.47]
Received: by mail-vs1-f47.google.com with SMTP id t13so976433vsk.3
 for <linux-mtd@lists.infradead.org>; Thu, 07 Feb 2019 02:47:32 -0800 (PST)
X-Gm-Message-State: AHQUAuZLPm4RX7WJiTTm4kIjMz4UK55L7Odu2jDJjG7iMMrwVgXddsYn
 AmMx3joKFd/SzipeS8uwL0Tpkas4K5b2X9N23Dw=
X-Google-Smtp-Source: AHgI3IYuFgv5h28FgTK86AZ8dE+Yn/nyTZDPvR37FvR0IDjHeSc1koRWapyaYEuOfmhrffkLIAzIRvEfKfCJnKvO5LY=
X-Received: by 2002:a67:485:: with SMTP id 127mr6529702vse.54.1549536450853;
 Thu, 07 Feb 2019 02:47:30 -0800 (PST)
MIME-Version: 1.0
References: <1549533476-3742-1-git-send-email-yamada.masahiro@socionext.com>
 <20190207111606.6b72dc34@xps13>
In-Reply-To: <20190207111606.6b72dc34@xps13>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 7 Feb 2019 19:46:54 +0900
X-Gmail-Original-Message-ID: <CAK7LNASEvAUeJsBcp4eh+XW+gaVp921SU-d1m-DEs+Hs+YA8TA@mail.gmail.com>
Message-ID: <CAK7LNASEvAUeJsBcp4eh+XW+gaVp921SU-d1m-DEs+Hs+YA8TA@mail.gmail.com>
Subject: Re: [PATCH] mtd: rawnand: call onfi_fill_data_interface() once again
 after nand_detect
To: Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190207_024755_990740_D4D4E3B0 
X-CRM114-Status: GOOD (  25.14  )
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
Cc: Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBGZWIgNywgMjAxOSBhdCA3OjE2IFBNIE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXlu
YWxAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gSGkgTWFzYWhpcm8sCj4KPiBNYXNhaGlybyBZYW1h
ZGEgPHlhbWFkYS5tYXNhaGlyb0Bzb2Npb25leHQuY29tPiB3cm90ZSBvbiBUaHUsICA3IEZlYgo+
IDIwMTkgMTg6NTc6NTYgKzA5MDA6Cj4KPiA+IG5hbmRfc2Nhbl9pZGVudCgpIGNhbGxzIG9uZmlf
ZmlsbF9kYXRhX2ludGVyZmFjZSgpIGF0IGl0cyBlbnRyeQo+ID4gdG8gc2V0IHVwIHRoZSBpbml0
aWFsIHRpbWluZyBwYXJhbWV0ZXJzLgo+ID4KPiA+IFRoZSB0aW1pbmcgcGFyYW1ldGVycyBhcmUg
bmVlZGVkIG5vdCBvbmx5IGZvciAtPnNldHVwX2RhdGFfaW50ZXJmYWNlKCksCj4gPiBidXQgYWxz
byBmb3IgZ2l2aW5nIHRoZSBjb3JyZWN0IGRlbGF5IHRvIE5BTkRfT1BfV0FJVF9SRFksIGZvciBl
eGFtcGxlLgo+ID4KPiA+IElmIHRoZSBkcml2ZXIgc2V0cyB0aGUgTkFORF9LRUVQX1RJTUlOR1Mg
ZmxhZywgb3IgZG9lcyBub3Qgc3VwcG9ydAo+ID4gLT5zZXR1cF9kYXRhX2ludGVyZmFjZSgpIGhv
b2ssIHRob3NlIHBhcmFtZXRlcnMgd2lsbCBuZXZlciB1cGRhdGVkLgo+Cj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXiBiZQoKV2ls
bCBmaXggKGlmIHYyIGlzIHdlbGNvbWUpCgoKPiA+Cj4gPiBCZWZvcmUgbmFuZF9kZXRlY3QoKSwg
d2UgbmV2ZXIga25vdyB3aGV0aGVyIHRoZSBjaGlwIGlzIE9ORmkgb3Igbm90Lgo+ID4gU28sIG9u
ZmlfZmlsbF9kYXRhX2ludGVyZmFjZSgpIGhhcyB0byBhc3N1bWUgdGhlIHdvcnN0IGNhc2UsIGku
ZS4KPiA+IG5vbi1PTkZpLgo+Cj4gcy9PTkZpL09ORkkvPwoKV2lsbCBmaXguCgpMb29rcyBsaWtl
IEkgd2FzIG1pc3VuZGVyc3RhbmRpbmcKbWF5YmUgYmVjYXVzZSB0aGUgbGV0dGVyICdJJyBpbiB0
aGUgbG9nbwooaHR0cDovL3d3dy5vbmZpLm9yZy8pCmxvb2tzIGxpa2UgYSBsb3dlcmNhc2UuLi4K
CgoKCj4KPiA+Cj4gPiBBZnRlciBuYW5kX2RldGVjdCgpLCBpZiB0aGUgY2hpcCB0dXJucyBvdXQg
dG8gYmUgT05GaS1jb21wbGlhbnQsCj4gPiB3ZSBjYW4gb3B0aW1pemUgdFBST0dfbWF4LCB0QkVS
U19tYXgsIGV0Yy4KPiA+Cj4gPiBDYWxsIG9uZmlfZmlsbF9kYXRhX2ludGVyZmFjZSgpIG9uY2Ug
YWdhaW4uCj4KPiBTb3JyeSBidXQgSSBkb24ndCBnZXQgd2h5IHRoaXMgaXMgbmVlZGVkIGFzIHRo
ZXJlIGlzIHRoZSBzYW1lIGNhbGwgYXQKPiB0aGUgdG9wIG9mIHRoaXMgZnVuY3Rpb24uIENhbiB5
b3UgYmUgbW9yZSBzcGVjaWZpYyBvbiB3aGVyZS93aGVuIHRoZQo+IG1pc3NpbmcgY2FsbCBwcm9k
dWNlcyBhIGZhaWx1cmU/CgoKb25maV9maWxsX2RhdGFfaW50ZXJmYWNlKCkgc2V0cyBkaWZmZXJl
bnQgdmFsdWVzCmZvciB0UFJPR19tYXgsIHRCRVJfbWF4LCB0Ul9tYXgsIHRDQ1NfbWluCmRlcGVu
ZGluZyBvbiB3aGV0aGVyIHRoZSBjaGlwIGlzIE9ORkkgb3Igbm90LgoKRm9yIHRoZSBmaXJzdCBj
YWxsLCBvbmZpX2ZpbGxfZGF0YV9pbnRlcmZhY2UoKQpjaG9vc2VzIHRoZSBlbHNlLXBhcnQgc2lu
Y2Ugd2UgbmV2ZXIga25vdwp0aGUgY2hpcCBzcGVjaWZpY2F0aW9uIGF0IHRoaXMgcG9pbnQuCgpJ
ZiB3ZSBjYWxsIG9uZmlfZmlsbF9kYXRhX2ludGVyZmFjZSgpIG9uY2UgYWdhaW4KYWZ0ZXIgbmFu
ZF9kZXRlY3QoKSwgaXQgbWF5IGNob29zZSB0aGUgaWYtcGFydC4KCgpJZiBhIGRyaXZlciBzdXBw
b3J0cyAtPnNldHVwX2RhdGFfaW50ZXJmYWNlKCksCm5hbmRfaW5pdF9kYXRhX2ludGVyZmFjZSgp
IHdpbGwgc2V0IHRoZSBvcHRpbWFsCnRpbWluZyBwYXJhbWV0ZXJzIGFueXdheS4KCkJ1dCwgaWYg
YSBkcml2ZXIgZG9lcyBub3Qgc3VwcG9ydCAtPnNldHVwX2RhdGFfaW50ZXJmYWNlKCksCml0IHdp
bGwgbm90IGhhcHBlbiBzaW5jZSBuYW5kX2hhc19zZXR1cF9kYXRhX2lmYWNlKCkgcmV0dXJucyBm
YWxzZS4KCgoKCgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IE1hc2FoaXJvIFlhbWFkYSA8eWFtYWRh
Lm1hc2FoaXJvQHNvY2lvbmV4dC5jb20+Cj4gPiAtLS0KPiA+Cj4gPiAgZHJpdmVycy9tdGQvbmFu
ZC9yYXcvbmFuZF9iYXNlLmMgfCAzICsrKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlv
bnMoKykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9iYXNl
LmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX2Jhc2UuYwo+ID4gaW5kZXggOWIzZDdmZi4u
MzVlNTQzYyAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfYmFzZS5j
Cj4gPiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX2Jhc2UuYwo+ID4gQEAgLTUwNDAs
NiArNTA0MCw5IEBAIHN0YXRpYyBpbnQgbmFuZF9zY2FuX2lkZW50KHN0cnVjdCBuYW5kX2NoaXAg
KmNoaXAsIHVuc2lnbmVkIGludCBtYXhjaGlwcywKPiA+Cj4gPiAgICAgICBuYW5kX2Rlc2VsZWN0
X3RhcmdldChjaGlwKTsKPiA+Cj4gPiArICAgICAvKiBJZiB0aGUgY2hpcCB0dXJucyBvdXQgT05G
aSwgd2UgY2FuIG9wdGltaXplIHRpbWluZyBwYXJhbWV0ZXJzLiAqLwo+ID4gKyAgICAgb25maV9m
aWxsX2RhdGFfaW50ZXJmYWNlKGNoaXAsIE5BTkRfU0RSX0lGQUNFLCAwKTsKPiA+ICsKPiA+ICAg
ICAgIC8qIENoZWNrIGZvciBhIGNoaXAgYXJyYXkgKi8KPiA+ICAgICAgIGZvciAoaSA9IDE7IGkg
PCBtYXhjaGlwczsgaSsrKSB7Cj4gPiAgICAgICAgICAgICAgIHU4IGlkWzJdOwo+Cj4KPiBUaGFu
a3MsCj4gTWlxdcOobAoKCgotLSAKQmVzdCBSZWdhcmRzCk1hc2FoaXJvIFlhbWFkYQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1U
RCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
