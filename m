Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC1E6CCA48B
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Oct 2026 08:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=16qfs++grVUBsIaYBlXKtp0utV7wLagElfCH6jkaZ/Y=; b=Q8b1gvqIs1PVyy
	s5b37souN+C8DTcLPMrzgvb/XSHu3409a1a6K49uKpM50ii/5iYzqTDTDMA0Sen1T87/rXMGsoFWs
	8KxY8OUOKI1IsHL2NKdM0EPeFE3XfP+/7DSOguM/8HfCpfCsBPohjekhH2PsgozmM+6Zm4rUquMXw
	h5dJm1yeSikS2EQx8FDEvif8P2xsVgb8D+a2fu6eLiQBbTTibZQxJZGwZ+tAu55yY3F0C+U4+U2PX
	Nrn4FWt90u1f/NgrKC6NdS7knwWb1QpOclsCc0FlxcYp4IUoXnLIzELQrFfsAIdmUN8qvV3VWh6EA
	scdPgwuuWm3JL85Yk1Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHdjV-00000002NwV-2sMT;
	Fri, 16 Oct 2026 08:56:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHdjT-00000002NwA-3HGq
	for linux-mtd@bombadil.infradead.org;
	Fri, 16 Oct 2026 08:56:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ZT/sWpmVZ48A0UV1NDljoImwkaY+rB5RM0fdLed9wk8=; b=E9yuvp9F6CQgR4jB9LOdcEy4LM
	nL5TAUZHh48eYhARTG3dEZ12Wjibm1keE0dLaZzdIYZwgVXHdL0SRtgW/NotWkm3XTtWJ0wvtMU7E
	9j3Qyr0NDbf7DjQ2zPS/GViQr9zB63RVl9tY7/1isUkKgiXlWVo4xzu3Bcyq42sQmTjfUc+X6hzd1
	O/xlW4HIShPXrDF0YrEs66DHPhG92Zc6W6DCPWYeoNDIKKb09HqS4aIACFjo5qXoNcOOzavMl29xW
	xOYtjxWcClwxtPTokUXbMAkoLUr2wNFBgGQ/xdBLY4YUajbCsWUpNtPCReQZVKsfKV7O+4zmlvkU9
	wWLQdj9Q==;
Received: from smtpout-04.galae.net ([185.171.202.116])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHdjJ-00000001Hnm-15x6
	for linux-mtd@lists.infradead.org;
	Fri, 16 Oct 2026 08:56:06 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id E4DE5C6220F;
	Fri, 16 Oct 2026 08:56:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 29A726075D;
	Fri, 16 Oct 2026 08:55:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DB4AD10328B9B;
	Fri, 16 Oct 2026 10:55:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792140952; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ZT/sWpmVZ48A0UV1NDljoImwkaY+rB5RM0fdLed9wk8=;
	b=BEtx/5etcejUtTY5MTUNcRWY/zuaQF4HOE5w+eoWKzFGhMri+rIsxGQ35KauvM5TCdNPVN
	/x/Dl3eKK8stSz3LgVTC9F7xZpXMorpV0A7D8sI9WkcdYFJwoi1nAo0hWB4LJwudLVXZ6c
	gSm1jgBmzRa+kGJBBrtctfPA0ZNOaHRYfcXMqoikgSqNWwHTwzq1EnD6WPTEYKy8Hd14tk
	EgXMwfRxsvSkABA9bKuQovl5JNXQCHTOqyYseDyQ9WGAum5Dc47hfqOBB+lltQuqTzjxrP
	Uts1BaA7t8hXpzD8qenXED+qUsaBUeuzHkWC/3mtvQwnbi+F4xspo7mx9muBXw==
Message-ID: <d6490c5d09075a152909c2be00c2a6f23256c61d.camel@bootlin.com>
Subject: Re: [PATCH v3 6/7] spi: cadence-xspi: Add support for panic writes
From: Paul Cercueil <paul.cercueil@bootlin.com>
To: Mark Brown <broonie@kernel.org>
Cc: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>,
  Takahiro Kuwano <takahiro.kuwano@infineon.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger	 <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Thomas Petazzoni	
 <thomas.petazzoni@bootlin.com>, Kees Cook <kees@kernel.org>, Tony Luck	
 <tony.luck@intel.com>, "Guilherme G . Piccoli" <gpiccoli@igalia.com>, 
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-spi@vger.kernel.org, Bharat Bhushan <bbhushan2@marvell.com>, Sunil
 Kovvuri Goutham <sgoutham@marvell.com>, Tanmay Jagdale <tanmay@marvell.com>
Date: Fri, 16 Oct 2026 10:55:43 +0200
In-Reply-To: <f6008943-c4cb-43ae-a791-31965f374ffd@sirena.org.uk>
References: <20261014154301.157755-1-paul.cercueil@bootlin.com>
	 <20261014154301.157755-7-paul.cercueil@bootlin.com>
	 <f6008943-c4cb-43ae-a791-31965f374ffd@sirena.org.uk>
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_095605_057728_BE87C660 
X-CRM114-Status: GOOD (  13.91  )
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

SGkgTWFyaywKCkxlIGpldWRpIDE1IG9jdG9icmUgMjAyNiDDoCAxMzowOSArMDEwMCwgTWFyayBC
cm93biBhIMOpY3JpdMKgOgo+IE9uIFdlZCwgT2N0IDE0LCAyMDI2IGF0IDA1OjQzOjAwUE0gKzAy
MDAsIFBhdWwgQ2VyY3VlaWwgd3JvdGU6Cj4gPiBGcm9tOiBUYW5tYXkgSmFnZGFsZSA8dGFubWF5
QG1hcnZlbGwuY29tPgo+ID4gCj4gPiBBZHZlcnRpc2Ugc3VwcG9ydCBmb3IgcGFuaWMgd3JpdGVz
LiBXaGVuIGEgbWVtb3J5IG9wIGlzIHJlY2VpdmVkIHdpdGgKPiA+IHRoZSAncGFuaWMnIGZsYWcg
c2V0LCB0aGUgZHJpdmVyIHdpbGwgdGhlbiB3b3JrIHdpdGhvdXQgcmVseWluZyBvbgo+ID4gaW50
ZXJydXB0cyBhbmQgd2l0aG91dCBzbGVlcGluZy4KPiAKPiBXZSBjaGVjayBkZXZpY2UgcHJvcGVy
dGllcyBpbiBjZG5zX3hzcGlfc3VwcG9ydHNfb3AoKSBpZiB0aGUga2VybmVsIGlzCj4gYnVpbHQg
d2l0aCBBQ1BJIHN1cHBvcnQsIHRoYXQgZW5kcyB1cCB1c2luZyBvZl9maW5kX3Byb3BlcnR5KCkg
d2hpY2gKPiB0YWtlcyB0aGUgZGV2dHJlZSBsb2NrIHdoaWNoIG1lYW5zIHRoZXJlJ3MgYSBwb3Nz
aWJpbGl0eSB0aGF0IHdlIG1pZ2h0Cj4gZGVhZGxvY2sgKGVnLCBpZiB3ZSB0b29rIGEgTk1JIG9y
IHRoZSBDUFUgZmVsbCBvdmVyIGF0IHRoZSB3cm9uZwo+IG1vbWVudCkuwqAgVGhpcyBpcyBwcm9i
YWJseSB0aGluIGVub3VnaCBpdCdzIG5vdCB3b3J0aCBzdG9wcGluZyB0aGUKPiBlbnRpcmUgc2Vy
aWVzIG92ZXIsIGl0IGNvdWxkIGJlIGZpeGVkIGluY3JlbWVudGFsbHkgYnkgc3RvcmluZyB0aGUK
PiB2YWx1ZXMgZHVyaW5nIHByb2JlLgoKQUNLLgoKSSBoYXZlIGFuIGV4dHJhIHNldCBvZiBjbGVh
bnVwcyBpbiBteSBxdWV1ZSBmb3Igc3BpLWNhZGVuY2UteHNwaSBzbyBJJ2xsIGNoYW5nZQppdCB0
aGVyZS4KCkNoZWVycywKLVBhdWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
