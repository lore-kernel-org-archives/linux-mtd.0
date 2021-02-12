Return-Path: <SRS0=iZ7+=HO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54D75C433DB
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Feb 2021 14:51:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C4A90601FD
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Feb 2021 14:51:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C4A90601FD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hQKOiPPN9yQDmrUvZzLLNfk5RaGoNJ8gt3N8S/B2XBg=; b=Gbn2WFfHgk0kw3/AO+szi7gYe
	KRYmlUpS+j7zR4IgvP+FAgKVKqlZ3C4Uo8oa4DVjLLg0XJ6pN56S2FvGCnW5BzgZBgbL4UFYW5gPY
	Md2IXZonmona6PT+oGIBdlATXuP00e8h8EQJKllEUZ/RWQT776k6J5Ikg5jvM+ab646w7AiLfYzlz
	I6YIs3BFWVf7XDCvnBlzcH/rWMdiMQRn7lk7pjmuCLH0CAKoNa0BOmRJYhg6EouKj/djG1i8SsELr
	0ytZK8yX/CCCxahQFJbHxaOpEGZIquKrI01wBZgfls3dXT0o4RdbUQuUmHPJW3EFfJ3j2hQJY9SHv
	qFSweFrxQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lAZmK-0007vD-A2; Fri, 12 Feb 2021 14:50:40 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lAZmH-0007tF-2o
 for linux-mtd@lists.infradead.org; Fri, 12 Feb 2021 14:50:38 +0000
X-Originating-IP: 90.89.99.36
Received: from xps13 (lfbn-tou-1-1536-36.w90-89.abo.wanadoo.fr [90.89.99.36])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id B10384000E;
 Fri, 12 Feb 2021 14:50:32 +0000 (UTC)
Date: Fri, 12 Feb 2021 15:50:31 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: Re: [PATCH] mtd: physmap: physmap-bt1-rom: Fix unintentional stack
 access
Message-ID: <20210212155031.08ad8742@xps13>
In-Reply-To: <d4f2385d-bd4f-1af8-60c9-48657d046d5f@embeddedor.com>
References: <20210212104022.GA242669@embeddedor>
 <20210212151216.31a09ad1@xps13>
 <d4f2385d-bd4f-1af8-60c9-48657d046d5f@embeddedor.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210212_095037_292441_DCD052D0 
X-CRM114-Status: GOOD (  18.24  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-kernel@vger.kernel.org,
 Serge Semin <Sergey.Semin@baikalelectronics.ru>, linux-mtd@lists.infradead.org,
 linux-hardening@vger.kernel.org, Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgR3VzdGF2bywKCiJHdXN0YXZvIEEuIFIuIFNpbHZhIiA8Z3VzdGF2b0BlbWJlZGRlZG9yLmNv
bT4gd3JvdGUgb24gRnJpLCAxMiBGZWIKMjAyMSAwODo0NTozMyAtMDYwMDoKCj4gT24gMi8xMi8y
MSAwODoxMiwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiA+IEhpIEd1c3Rhdm8sCj4gPiAKPiA+ICJH
dXN0YXZvIEEuIFIuIFNpbHZhIiA8Z3VzdGF2b2Fyc0BrZXJuZWwub3JnPiB3cm90ZSBvbiBGcmks
IDEyIEZlYiAyMDIxCj4gPiAwNDo0MDoyMiAtMDYwMDoKPiA+ICAgCj4gPj4gQ2FzdCAmZGF0YSB0
byAoY2hhciAqKSBpbiBvcmRlciB0byBhdm9pZCB1bmludGVudGlvbmFsbHkgYWNjZXNzaW5nCj4g
Pj4gdGhlIHN0YWNrLgo+ID4+Cj4gPj4gTm90aWNlIHRoYXQgZGF0YSBpcyBvZiB0eXBlIHUzMiwg
c28gYW55IGluY3JlbWVudCB0byAmZGF0YQo+ID4+IHdpbGwgYmUgaW4gdGhlIG9yZGVyIG9mIDQt
Ynl0ZSBjaHVua3MsIGFuZCB0aGlzIHBpZWNlIG9mIGNvZGUKPiA+PiBpcyBhY3R1YWxseSBpbnRl
bmRlZCB0byBiZSBhIGJ5dGUgb2Zmc2V0LiAgCj4gPiAKPiA+IEkgZG9uJ3QgaGF2ZSB0aGUgc2Ft
ZSByZWFkaW5nLiBJIGRvbid0IHNheSB0aGF0IENvdmVyaXR5IHJlcG9ydCBpcwo+ID4gd3Jvbmcs
IGJ1dCBsZXQncyBkaXNjdXNzIHRoaXMgYSBiaXQgZnVydGhlci4KPiA+IAo+ID4gR2l2ZW4gdGhh
dCAmZGF0YSBpcyBvZiB0eXBlIHUzMiAqLCB5b3Ugc2F5IHRoYXQgIiZkYXRhICsgc2hpZnQiCj4g
PiBwcm9kdWNlcyBpbmNyZW1lbnRzIG9mIDQtYnl0ZXMsIGllLiB3ZSB3b3VsZCBhY2Nlc3MgIiZk
YXRhICsgNCAqCj4gPiBzaGlmdCI/IEJlY2F1c2UgSSBkb24ndCB0aGluayB0aGlzIGlzIHRoZSBj
YXNlIChhZ2FpbiwgSSBtYXkgYmUgd3JvbmcpLiAgCj4gCj4gWWVwOyB0aGlzIGlzIHBvaW50ZXIg
YXJpdGhtZXRpYy4gSWYgeW91IGhhdmUgYW4gb2JqZWN0IHB0ciBvZiB0eXBlIHUzMiAqOgo+IAo+
IHUzMiAqcHRyOwo+IAo+IGFuZCBsZXQncyBzYXkgaXQgcG9pbnRzIHRvIGFkZHJlc3MgMTAwLiBJ
ZiB5b3UgaW5jcmVtZW50IGl0IGJ5IG9uZToKPiAKPiBwdHIrKwo+IAo+IHB0ciB3aWxsIG5vdyBw
b2ludCB0byBhZGRyZXNzIDEwNCwgbm90IHRvIDEwMS4KPiAKPiBOb3csIGlmIGluc3RlYWQsIHlv
dSBmaXJzdCBjYXN0IHB0ciB0byAnY2hhciAqJyBhbmQgaW5jcmVtZW50IGl0IGJ5IDEsCj4gdGhl
biBpdCB3aWxsIHBvaW50IHRvIGFkZHJlc3MgMTAxLgoKWWVwLCBJIGdvdCBjb25mdXNlZCB3aXRo
IHRoZSBwcm9wZXIgYWRkaXRpb24gY29tcGFyZWQgdG8gZGVyZWZlcmVuY2luZy4KClBhdGNoIGxv
b2tzIGxlZ2l0aW1hdGUuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWls
aW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tdGQvCg==
