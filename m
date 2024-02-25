Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35777C47DD9
	for <linux-mtd@archiver.kernel.org>; Sun, 25 Feb 2024 17:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:From:To:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TFoC/eeqcXD7jOe/AsSq/igZ4U5kTVhY5FUnASolg5A=; b=ApoCrG0U0RBwYj
	ODzoYwWcMrqv43qaassARIwmneHGPOWPI4A56dFYEyPm2f8qSWDS6o3dlC4AwsmOXg3l8pFwKbdK6
	NFNqU3CaBusPJyBKuA89Q0AwgmdkKBGfZJjGPTkZIVHGcNZorj/gOJH9joATnwVP0FkgKQppEkzS9
	/lWInzHuARx9qRNjqnZEfjf+8dZvo4KOT4LhP5d/9i8/kFNxaUWjtz+nJA+fdrsznjtDK8JVNDDGM
	FxhBa2yoqFEU6ut+syJxmuCGtDMV/jNK6dSH8M1FpO6mg1YpPvFgvdq+Ha6FvcDYBzwlHzNCA7kuz
	98IQYsX1250le6ZBWbXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reIQ6-0000000FQ09-1HjX;
	Sun, 25 Feb 2024 17:36:10 +0000
Received: from mail-4322.protonmail.ch ([185.70.43.22])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reIQ3-0000000FPzh-3Fq7
	for linux-mtd@lists.infradead.org;
	Sun, 25 Feb 2024 17:36:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1708882562; x=1709141762;
	bh=4lhzB69Iuo/Z5wWUbCxtDG7+U02BeKBwQXu94Rz2GIE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=ckuTE90Qbek7pBioZbbkC4yupNCWVCg+l681yf8ZG7EaCekoSF6o9t0bGmDmodiqo
	 PWBvUXUxZ+TuidO+5syld+5p/217N9QNqnWpHqlZP1QhLOZW7AJXOWvnx571J0wpsv
	 8tBSrXxJyasYNuah1513j+TEzms/bpFv3T8WfW3H1YcW7rLbz60NjabO9ld9mmUK7K
	 pNGqNU3WMP2RvwkeOv65G2wEG5BDYabUl2vOnM5hPMdlk2nBEqrI8A05CZqTIIbBUO
	 8J5zdVbb1d5c+Armpd/QknubgxBXzUee9M+VijGZbmksJYpvM1J0z6hFqJJib2Jh3w
	 0yg9um4rItQtQ==
Date: Sun, 25 Feb 2024 17:35:43 +0000
To: Miquel Raynal <miquel.raynal@bootlin.com>
From: Michael Pratt <mcpratt@pm.me>
Cc: devicetree@vger.kernel.org, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, saravanak@google.com, abel.vesa@linaro.org, alexander.stein@ew.tq-group.com, andriy.shevchenko@linux.intel.com, bigunclemax@gmail.com, brgl@bgdev.pl, colin.foster@in-advantage.com, djrscally@gmail.com, dmitry.baryshkov@linaro.org, festevam@gmail.com, fido_max@inbox.ru, frowand.list@gmail.com, geert@linux-m68k.org, heikki.krogerus@linux.intel.com, kernel@pengutronix.de, linus.walleij@linaro.org, linux@roeck-us.net, luca.weiss@fairphone.com, magnus.damm@gmail.com, martin.kepplinger@puri.sm, rafal@milecki.pl, ansuelsmth@gmail.com, richard@nod.at, sakari.ailus@linux.intel.com, sudeep.holla@arm.com, tglx@linutronix.de, tony@atomide.com, vigneshr@ti.com, dianders@chromium.org, jpb@kernel.org, rafael@kernel.org
Subject: Re: [PATCH v1 4/4] mtd: mtdpart: Allow fwnode links to NVMEM compatible fwnodes
Message-ID: <vNvsSK54-CaXTGbXYWK5uzLwvW8tGEOBE4h9drvazsF0GMNS7GpS6uFn_3OsLEZEu-jdZ5hYg7-43lbYaxqtNYuK9tMcmVuc5_7i77kyb2Q=@pm.me>
In-Reply-To: <20240205161129.1889a943@xps-13>
References: <20240123014517.5787-1-mcpratt@pm.me> <20240123014517.5787-5-mcpratt@pm.me> <20240205161129.1889a943@xps-13>
Feedback-ID: 27397442:user:proton
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240225_093607_991994_67C46A92 
X-CRM114-Status: GOOD (  12.03  )
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

SGkgTWlxdWVsLAoKU29ycnkgZm9yIHRoZSB3YWl0IGluIHJlcGx5aW5nLgoKCk9uIE1vbmRheSwg
RmVicnVhcnkgNXRoLCAyMDI0IGF0IDEwOjExLCBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFs
QGJvb3RsaW4uY29tPiB3cm90ZToKIAo+IAo+IEhpIE1pY2hhZWwsCj4gCj4gbWNwcmF0dEBwbS5t
ZSB3cm90ZSBvbiBUdWUsIDIzIEphbiAyMDI0IDAxOjQ3OjIxICswMDAwOgo+IAo+ID4gVGhpcyBy
ZXZlcnRzIGNvbW1pdCBmYjQyMzc4ZGNjN2YyNDdkZjU2ZjBlY2RkZmRhZTg1NDg3NDk1ZmJjCj4g
PiAoIm10ZDogbXRkcGFydDogRG9uJ3QgY3JlYXRlIHBsYXRmb3JtIGRldmljZSB0aGF0J2xsIG5l
dmVyIHByb2JlIikuCj4gPiAKPiA+IFRoYXQgY29tbWl0IGlzIGEgbWFudWFsIG5hbWVkIGV4Y2Vw
dGlvbiBpbiBvcmRlciB0byBhdm9pZCBmd19kZXZsaW5rIGxpbmtzCj4gPiB0byBhbiAibnZtZW0t
Y2VsbHMiIGNvbXBhdGlibGUgbm9kZSB3aGljaCBpcyBhIGRlc2NlbmRhbnQgb2YgdGhlIGZ3bm9k
ZQo+ID4gdGhhdCByZXByZXNlbnRzIHRoZSByZWFsIHN1cHBsaWVyIGRldmljZSB0aGF0IHByb2Jl
cy4KPiA+IAo+ID4gVGhlIGNvbW1pdCBkb2VzIG5vdCB3b3JrIGZvciBuZXdlciBjYXNlcywgbGlr
ZSB0aGUgImZpeGVkLWxheW91dCIKPiAKPiAKPiBEbyB5b3UgaGF2ZSBwbGFucyBmb3IgaXQ/IEJl
Y2F1c2UgaXQgaXMgdGhlIG1vZGVybiBkZXNjcmlwdGlvbiB0aGF0IGlzCj4gbm93IGV4cGVjdGVk
LCBzbyBJIGRvbid0IGZlZWwgY29udmluY2VkIGJ5IGFsbCB0aGlzIHdvcmsgKHdoaWNoIGlzCj4g
bmV2ZXJ0aGVsZXNzIGNvbnNpZGVyYWJsZSkgaWYgZml4ZWQtbGF5b3V0cyBhcmUgc3RpbGwgYnJv
a2VuPwo+IAoKClNvcnJ5IGZvciB0aGUgbWlzdW5kZXJzdGFuZGluZywgSSB3YXMgcmVmZXJyaW5n
IHRvIHRoZSBhbHJlYWR5IGV4aXN0aW5nIGNvbW1pdApjaXRlZCBpbiB0aGUgbWVzc2FnZSB3aGVu
IHNheWluZyAiVGhlIGNvbW1pdCBkb2VzIG5vdCB3b3JrIGZvciBuZXdlciBjYXNlcy4uLiIKd2hp
Y2ggaXMgd2h5IHJldmVydGluZyBpdCBpbiB0aGlzIHBhdGNoIGlzIHBhcnQgb2YgdGhlIHNlcmll
cy4gSSdsbCByZXdvcmQgaXQuCgo+IAo+IAo+IFRoYW5rcywKPiBNaXF1w6hsCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRp
c2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbXRkLwo=
