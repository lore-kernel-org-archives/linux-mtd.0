Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D44EC48BC4
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Feb 2024 10:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EfhDCbg1LciW0XBmBFSrcdLgf5dUlhWRNuHxIImNboQ=; b=Duqd0S0LZSEOPz
	E1A47ajl8eWCXaa4nEDjUZZ/93w26ySdNdA1MKcpZDII0zENAfLWuyBcXlRS6+vemj077k7rYdT9p
	ZYoyfXZf4aHfM4HU3fPaMBqyLHRinkp+H+yKOCtbp7Y349T08Av8JIFHbzvmhRVn+88c2CnTpyd9Z
	Yvl/Dg5fs4CYjSTzF6m8j1bVtqYSa0zkL1XRj0CzSpOQ2O8NBbxMFZlMBS1Y2DnxQAxY26UuWb6Ob
	HiwwOhMpbz6g2Mme0nakUboECChXC7Eo8bNQngJX8EfKirnLHMluo0bPfCOTWBI04c38l4JtEB4nd
	I4cabTxaZMxGzG6oLTUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcMxb-0000000EA6h-2HuN;
	Tue, 20 Feb 2024 10:02:47 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcMxY-0000000EA56-1bxu;
	Tue, 20 Feb 2024 10:02:45 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 23B52240017;
	Tue, 20 Feb 2024 10:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708423362;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OU8FMr7Q5q2x3lDpUCklLjs9s35Cm98PgP/aUqTmDSw=;
	b=QR84FJtAoqfBzPObWL3qzfo5RmdLOqnU0X8j02M9dG16ASIlBlB0uv6CRu8zV3hvvuA/2w
	hwzdBpEa95NN9JSsW49P/L9Znlnl85g2fgyJBzmf9cmXW3jNjV3N0umh3AJSg9SP3eHx+6
	NcZFCdPiN9Z85r+no0G+AYgqTUfGhNiO8wS+p8az6/wnxWYZHQrD+dkkAVRP989rS7yfTj
	4zapQkQ1Mcru5SlEoc5yKGfqeDZA8PZfSTIcyCuUy2POUYNohGr9V10LqvWKWZAAr5LQ7o
	q/AuuzuJcHFRpXjMlmN9i5fBzyGTGChry9WLNAO3mdKZThkiMO2K53oEb8e+/w==
Date: Tue, 20 Feb 2024 11:02:40 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: William Zhang <william.zhang@broadcom.com>
Cc: Linux MTD List <linux-mtd@lists.infradead.org>, Linux ARM List
 <linux-arm-kernel@lists.infradead.org>, Broadcom Kernel List
 <bcm-kernel-feedback-list@broadcom.com>, f.fainelli@gmail.com,
 kursad.oney@broadcom.com, joel.peshkin@broadcom.com,
 anand.gore@broadcom.com, dregan@mail.com, kamal.dasu@broadcom.com,
 tomer.yacoby@broadcom.com, dan.beygelman@broadcom.com, David Regan
 <dregan@broadcom.com>, Dan Carpenter <dan.carpenter@linaro.org>,
 linux-kernel@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>, Brian
 Norris <computersforpeace@gmail.com>, Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH v5 11/12] mtd: rawnand: brcmnand: exec_op helper
 functions return type fixes
Message-ID: <20240220110240.1ad5b995@xps-13>
In-Reply-To: <20240207202257.271784-12-william.zhang@broadcom.com>
References: <20240207202257.271784-1-william.zhang@broadcom.com>
	<20240207202257.271784-12-william.zhang@broadcom.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240220_020244_577342_8C0FE87D 
X-CRM114-Status: UNSURE (   7.92  )
X-CRM114-Notice: Please train this message.
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

CndpbGxpYW0uemhhbmdAYnJvYWRjb20uY29tIHdyb3RlIG9uIFdlZCwgIDcgRmViIDIwMjQgMTI6
MjI6NTYgLTA4MDA6Cgo+IEZyb206IERhdmlkIFJlZ2FuIDxkcmVnYW5AYnJvYWRjb20uY29tPgo+
IAo+IGZpeCByZXR1cm4gdHlwZSBmb3IgZXhlY19vcCByZXNldCBhbmQgc3RhdHVzIGRldGVjdCBo
ZWxwZXIgZnVuY3Rpb25zCj4gCj4gUmVwb3J0ZWQtYnk6IERhbiBDYXJwZW50ZXIgPGRhbi5jYXJw
ZW50ZXJAbGluYXJvLm9yZz4KPiBDbG9zZXM6IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL3Bp
cGVybWFpbC9saW51eC1tdGQvMjAyMy1EZWNlbWJlci8xMDI0MjMuaHRtbAo+IEZpeGVzOiAzYzgy
NjBjZTc2NjMgKCJtdGQ6IHJhd25hbmQ6IGJyY21uYW5kOiBleGVjX29wIGltcGxlbWVudGF0aW9u
IikKPiBTaWduZWQtb2ZmLWJ5OiBEYXZpZCBSZWdhbiA8ZHJlZ2FuQGJyb2FkY29tLmNvbT4KPiBT
aWduZWQtb2ZmLWJ5OiBXaWxsaWFtIFpoYW5nIDx3aWxsaWFtLnpoYW5nQGJyb2FkY29tLmNvbT4K
PiBSZXZpZXdlZC1ieTogV2lsbGlhbSBaaGFuZyA8d2lsbGlhbS56aGFuZ0Bicm9hZGNvbS5jb20+
CgpCeSB0aGUgd2F5LCBhIENjOiBzdGFibGUgdGFnIG1pZ2h0IGJlIHVzZWZ1bCBhcyBvdGhlcndp
c2UgeW91IG1heSBsZWFrCmFuIGVycm9yIGNvZGUgaW4gYSBzdGF0dXMgdmFsdWUgKHdoaWNoIGlz
IGEgYnVnKS4gQW5kIG1vdmUgdGhpcyBwYXRjaApmaXJzdCBpbiB5b3VyIHNlcmllcyBzbyB3ZSdy
ZSBzdXJlIGl0IGRvZXMgbm90IGNvbmZsaWN0IHdpdGggYW55IG9mIHRoZQpvdGhlciBwYXRjaGVz
IGFuZCBjYW4gYmUgYmFja3BvcnRlZCBtb3JlIGVhc2lseS4KClRoYW5rcywKTWlxdcOobAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
