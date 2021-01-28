Return-Path: <SRS0=HmSd=G7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0960EC433E6
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Jan 2021 10:31:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A570564DD6
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Jan 2021 10:31:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A570564DD6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=50XKM88XtDsKRyaJi7ThI1yWz4Se0Nm+xKJ9zcSMNgc=; b=LNTCm0MZoHPB/KYLuZonTK1Mo
	0SSzkDz8dcW/FcBiXprlSrgfWv2Q7X8HNB6RQtfDIGNtizw2Ut5zGAAwVbvUJ+nBIr4BmBZY6H1Z2
	EoawM4LLY41j3BwAOImRRk0CnW2DN+3xuW73/FwlDehNAv2QqRNDyLdbvWYVpdBEShWU36E4eHxks
	LUhWSCtCZgCa2AUatOx9Xj6YF3SoYMyXSQR/4X9VPyrjq5X0KK/s+QCrq20r6y1qyeW6wAvmCjca8
	piY8ZX2j/bI00hc9nIayEPr+Ksz0g+yKWIeURSLQmQtoHY7TprpsK4BvGP7KBdjGK72nDw1Aib6Wl
	PEyK3IYsg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l54ZQ-0002zg-It; Thu, 28 Jan 2021 10:30:36 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l54ZO-0002yO-DT
 for linux-mtd@lists.infradead.org; Thu, 28 Jan 2021 10:30:35 +0000
Received: from xps13 (lfbn-tou-1-972-150.w86-210.abo.wanadoo.fr
 [86.210.203.150]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 9520110000F;
 Thu, 28 Jan 2021 10:30:27 +0000 (UTC)
Date: Thu, 28 Jan 2021 11:30:26 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH 0/8] MUSE: Userspace backed MTD v3
Message-ID: <20210128113026.094b07b0@xps13>
In-Reply-To: <20210124232007.21639-1-richard@nod.at>
References: <20210124232007.21639-1-richard@nod.at>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210128_053034_669444_2B4BA7B9 
X-CRM114-Status: GOOD (  14.74  )
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
Cc: vigneshr@ti.com, miklos@szeredi.hu, fuse-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, boris.brezillon@collabora.com,
 linux-mtd@lists.infradead.org, rminnich@google.com, sven@narfation.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgUmljaGFyZCwKClJpY2hhcmQgV2VpbmJlcmdlciA8cmljaGFyZEBub2QuYXQ+IHdyb3RlIG9u
IE1vbiwgMjUgSmFuIDIwMjEgMDA6MTk6NTkKKzAxMDA6Cgo+IEknbSBoYXBweSB0byBhbm5vdW5j
ZSB0aGUgZmlyc3Qgbm9uLVJGQyB2ZXJzaW9uIG9mIHRoaXMgcGF0Y2ggc2V0Lgo+IE92ZXIgdGhl
IHhtYXMgaG9saWRheXMgSSBmb3VuZCBzb21lIHRpbWUgdG8gZXhwZXJpbWVudCB3aXRoIHZhcmlv
dXMgdXNlcnNwYWNlCj4gaW1wbGVtZW50YXRpb25zIG9mIE1URHMgYW5kIGdhdmUgdGhlIGtlcm5l
bCBzaWRlIG1vcmUgZmluZS10dW5pbmcuCj4gCj4gUmF0aW9uYWxlOgo+IC0tLS0tLS0tLS0KPiAK
PiBXaGVuIHdvcmtpbmcgd2l0aCBmbGFzaCBkZXZpY2VzIGEgY29tbW9uIHRhc2sgaXMgZW11bGF0
aW5nIHRoZW0gdG8gcnVuIHZhcmlvdXMKPiB0ZXN0cyBvciBpbnNwZWN0IGR1bXBzIGZyb20gcmVh
bCBoYXJkd2FyZS4gVG8gYWNoaWV2ZSB0aGF0IHdlIGhhdmUgcGxlbnR5IG9mCj4gZW11bGF0b3Jz
IGluIHRoZSBNVEQgc3Vic3lzdGVtOiBtdGRyYW0sIGJsb2NrMm10ZCwgbmFuZHNpbS4KPiAKPiBF
YWNoIG9mIHRoZW0gaW1wbGVtZW50cyBhbiBhZC1ob2MgTVREIGFuZCBoYXZlIHZhcmlvdXMgZHJh
d2JhY2tzLgo+IE92ZXIgdGhlIGxhc3QgeWVhcnMgc29tZSBkZXZlbG9wZXJzIHRyaWVkIHRvIGV4
dGVuZCB0aGVtIGJ1dCB0aGVzZSBhdHRlbXB0cwo+IG9mdGVuIGdvdCByZWplY3RlZCBiZWNhdXNl
IHRoZXkgYWRkZWQganVzdCBtb3JlIGFkaG9jIGZlYXR1cmUgaW5zdGVhZCBvZgo+IGFkZHJlc3Np
bmcgb3ZlcmFsbCBwcm9ibGVtcy4KPiAKPiBNVVNFIGlzIGEgbm92ZWwgYXBwcm9hY2ggdG8gYWRk
cmVzcyB0aGUgbmVlZCBvZiBhZHZhbmNlZCBNVEQgZW11bGF0b3JzLgo+IEFkdmFuY2VkIG1lYW5z
IGluIHRoaXMgY29udGV4dCBzdXBwb3J0aW5nIGRpZmZlcmVudCAodmVuZG9yIHNwZWNpZmljKSBp
bWFnZQo+IGZvcm1hdHMsIGRpZmZlcmVudCB3YXlzIGZvciBmYXVsdCBpbmplY3Rpb24gKGZ1enpp
bmcpIGFuZCByZWNvZGluZy9yZXBsYXlpbmcKPiBJT3MgdG8gZW11bGF0ZSBwb3dlciBjdXRzLgo+
IAo+IFRoZSBjb3JlIGdvYWwgb2YgTVVTRSBpcyBoYXZpbmcgdGhlIGNvbXBsZXhpdHkgb24gdGhl
IHVzZXJzcGFjZSBzaWRlIGFuZAo+IG9ubHkgYSBzbWFsbCBNVEQgZHJpdmVyIGluIGtlcm5lbHNw
YWNlLgo+IFdoaWxlIHBsYXlpbmcgd2l0aCBkaWZmZXJlbnQgYXBwcm9hY2hlcyBJIHJlYWxpemVk
IHRoYXQgRlVTRSBvZmZlcnMgZXZlcnl0aGluZwo+IHdlIG5lZWQuIFNvIE1VU0UgaXMgYSBsaXR0
bGUgbGlrZSBDVVNFIGV4Y2VwdCB0aGF0IGl0IGRvZXMgbm90IGltcGxlbWVudCBhCj4gYmFyZSBj
aGFyYWN0ZXIgZGV2aWNlIGJ1dCBhbiBNVEQuCgpJIGNhbid0IHRlbGwgaWYgeW91ciBNVVNFIGlt
cGxlbWVudGF0aW9uIGlzIHJpZ2h0IGJ1dCBpdCBsb29rcyBmaW5lCm9uIHRoZSBNVEQgc2lkZS4K
ClRoaXMgaXMgZm9sbG93aW5nIHRoZSByaWdodCBwYXRoLCBJIGxvb2sgZm9yd2FyZCB0byBtZXJn
aW5nIGl0IHNvb24hCgpUaGFua3MgZm9yIHlvdXIgY29udHJpYnV0aW9uLApNaXF1w6hsCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
