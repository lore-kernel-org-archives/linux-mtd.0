Return-Path: <SRS0=9jYX=DY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B8D0C433DF
	for <linux-mtd@archiver.kernel.org>; Sat, 17 Oct 2020 18:18:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E73732073A
	for <linux-mtd@archiver.kernel.org>; Sat, 17 Oct 2020 18:18:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Pr7TsAoH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E73732073A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dieBc7/Vqf51F0RA2TNN3WaUQn7rLPrq8Bz3iOmjl48=; b=Pr7TsAoHc48x0aT/I18n4WdC2
	xUh70QNm3qMp9jCyfgx6qXfQXXkFoZKcE7Cv4w8q2kORJ6LXoQrwkH5b9s82OG7ENgEVcWGkQ5rGz
	68kIhQgXW+s6E484vTTvDgGffjz9k6Hq7HWqC5cTkkEkGcSKugYbLhqHme7e01Er3A4Fvrw3EAZGX
	P9q2M1aaNT0OAxd9euz4T5TUXC3TO0c/g6istooQUiD7JwhKhOhxKURpZKx/PAGWcNsio1DbSS6nZ
	cY5MQUbtZZsSOysnn/iJbW8BuIQqhgz4KpOOwAfRk2fj4ixYWvQTGisUfJL78jAFDOLYoTPtTUYqP
	d3GAv3aGw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kTqlo-00025g-1X; Sat, 17 Oct 2020 18:17:32 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kTqlk-00024v-7Q
 for linux-mtd@lists.infradead.org; Sat, 17 Oct 2020 18:17:30 +0000
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id EF4F2100005;
 Sat, 17 Oct 2020 18:17:19 +0000 (UTC)
Date: Sat, 17 Oct 2020 20:17:18 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] mtd: rawnand: mxc: Move the ECC engine initialization
 to the right place
Message-ID: <20201017201718.6b7f9b96@xps13>
In-Reply-To: <CAOMZO5A8Y1=o6e3+BvBUVYpBUjhvdVG4eQm4fTan3+cZVTvG1A@mail.gmail.com>
References: <20201016074942.29650-1-miquel.raynal@bootlin.com>
 <20201016135351.GL13710@pengutronix.de>
 <20201016190149.55a3d62f@xps13>
 <CAOMZO5B4kC5ooE2Pmp4XaHq2xD51JSH35nF7_Ge8-xzp4piqKg@mail.gmail.com>
 <20201016230556.6693e69f@xps13>
 <CAOMZO5A8Y1=o6e3+BvBUVYpBUjhvdVG4eQm4fTan3+cZVTvG1A@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201017_141728_373166_A04B41A6 
X-CRM114-Status: GOOD (  17.65  )
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
Cc: Han Xu <xhnjupt@gmail.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgRmFiaW8sCgpGYWJpbyBFc3RldmFtIDxmZXN0ZXZhbUBnbWFpbC5jb20+IHdyb3RlIG9uIEZy
aSwgMTYgT2N0IDIwMjAgMTg6MzI6MzMKLTAzMDA6Cgo+IEhpIE1pcXVlbCwKPiAKPiBPbiBGcmks
IE9jdCAxNiwgMjAyMCBhdCA2OjA2IFBNIE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9v
dGxpbi5jb20+IHdyb3RlOgo+IAo+ID4gTmljZSBjYXRjaCEgQnV0IEkgZG9uJ3QgZ2V0IHdoeSBo
b3N0LT5wZGF0YS5od19lY2Mgd291bGQgbm90IGJlCj4gPiBhY2Nlc3NpYmxlIGZyb20gdGhlIGF0
dGFjaCBob29rLiBob3N0LT5wZGF0YSBpcyBwb3B1bGF0ZWQgaW4gdGhlIHByb2JlCj4gPiBmdW5j
dGlvbiwgd2F5IGJlZm9yZSBuYW5kX3NjYW4oKSwgd2hlcmUgLT5hdHRhY2goKSBpcyBjYWxsZWQu
IFNvIGZvciBtZQo+ID4gaG9zdC0+cGRhdGEuaHdfZWNjIHNob3VsZCBiZSBhY2Nlc3NpYmxlIGZy
b20gLT5hdHRhY2goKS4gIAo+IAo+IFllcywgbm93IEkgdW5kZXJzdGFuZCBpdC4gcGRhdGEgaXMg
b25seSBwb3B1bGF0ZWQgZm9yIG5vbi1kdCBwbGF0Zm9ybXMuCj4gCj4gT24gNS4xMC1yYzEgdGhl
IG5vbi1kdCBpbXggdXNlcnMgYXJlIGdvbmUsIHNvIHdlIGNhbiBnZXQgcmlkIG9mIHBkYXRhCj4g
b24gYSBzZXBhcmF0ZSBwYXRjaC4KCk5pY2UhCgo+IAo+ID4gPiBJbnN0ZWFkIG9mIHVzaW5nIHBk
YXRhLCB3ZSBjYW4gcmV0cmlldmUgdGhlICJuYW5kLWVjYy1tb2RlIiBzdHJpbmcKPiA+ID4gZnJv
bSB0aGUgZGV2aWNlIHRyZWUuICAKPiA+Cj4gPiBQbGVhc2UgZG9uJ3QgZG8gdGhhdCEgVGhlIERU
IHBhcnNpbmcgc2hvdWxkIGJlIGNlbnRyYWxpemVkIGluIHRoZSBjb3JlLgo+ID4KPiA+IEhvd2V2
ZXIsIGlmIHlvdSBkb24ndCBuZWVkIHRoaXMgcGRhdGEgZW50cnkgeW91IGNhbiBnZXQgcmlkIG9m
IGl0Cj4gPiBlbnRpcmVseS4gSW4gdGhlb3J5LCBpZiB0aGUgdXNlciBzZXQgdGhlIG5hbmQtZWNj
LW1vZGUgcHJvcGVydHksIHRoZW4KPiA+IGNoaXAtPmVjYy5lbmdpbmVfdHlwZSBzaG91bGQgYWxy
ZWFkeSBiZSBzZXQgdG8gdGhlIGFwcHJvcHJpYXRlIHZhbHVlCj4gPiB3aGVuIGVudGVyaW5nIC0+
YXR0YWNoKCkuIENhbiB5b3UgcGxlYXNlIGNoZWNrIGl0cyB2YWx1ZT8gSXQgc2hvdWxkCj4gPiBo
YXZlIGJlZW4gdXBkYXRlZCBieSByYXduYW5kX2R0X2luaXQoKS4gIAo+IAo+IFlvdSBhcmUgcmln
aHQuIEkgaGF2ZSBzZW50IGEgdjIsIHdoaWNoIGxldHMgdGhlIGNvcmUgZGV0ZXJtaW5lIHRoZSBl
bmdpbmUgdHlwZS4KClRoZSBwYXRjaCBsb29rcyBnb29kIHRvIG1lIQoKVGhhbmtzLApNaXF1w6hs
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
