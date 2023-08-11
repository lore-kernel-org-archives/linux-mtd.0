Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AA9AC0015E
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Aug 2023 05:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lfp/B3VQh9+e3pdRJ6jIGPfqlU1ouoEr8P7+5cTxWyg=; b=rsZBiQSxk8dd9A
	ZT55X3FyWzdK7UVatY/Aq5pMeu5cuDTeT40yzaGozlX9quIyoSc2k/4MTgG2lib5O2l3RWdvoREyh
	NsMnd0Zs66Z3QqaHUjqTYHJIpoRaNrFpByjnWjsWgn9Pcb8dJmrjInarDQNysGCsVq3XZyYj0+Yn3
	NPNb47aDAVQHAeXKhTTYV/CLUtmEyztUCRKbUoDAAVNZpvZGJOIsUvTmjSyomKZN3QI08Cx2+tRnK
	AaxxA8c5keuiUEzuQXNzC7qdfoutkUkpnEG5/5ATYYaRu7dxej3ery45MyU3MZFXj4wtWIFDB24M4
	26ta03/ODK4hI3GJ7HUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUL50-009XyO-07;
	Fri, 11 Aug 2023 05:52:58 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUL4x-009Xwj-08
	for linux-mtd@lists.infradead.org;
	Fri, 11 Aug 2023 05:52:56 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 66996FF802;
	Fri, 11 Aug 2023 05:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1691733169;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6wSXUIypajoc4S0icVGjYQbDkDjBI1P9MywNlVtj23I=;
	b=PmmYRmeUu0kh+eimWRkM6WMlJvlNOipCNG+n3GBPb5YwukvyWEAmLAPDBLizhVxjvisxoa
	SgCcyu08SXk2ayEah/u83t3aKss5aEwR+wQsdT56z8WYSOYuG8euVJAgie68icjQdfkG6E
	DVko1i6FxzjezmGMRB2ryt20WYJ6Pjr6llIXGWUZ0idHlNqCE2O0ZyHWkZsYQorgLFhn75
	eSGcnBFKFeqeCN1eExhb0dlpcPSSAeruDS1LuKkwd7wnKIL186u82VnL93HOIAoUeEVjE+
	/2m/ph35i5PJjIzyYjH0srrpEd3V/mMh0kpyahIl9WRQDbjhYziYkvcqfeGiBQ==
Date: Fri, 11 Aug 2023 07:52:44 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org, Christoph Hellwig <hch@infradead.org>,
 Stephan Wurm <stephan.wurm@a-eberle.de>, Vignesh Raghavendra
 <vigneshr@ti.com>, Oliver Neukum <oliver@neukum.org>, Ali Akcaagac
 <aliakc@web.de>, Jamie Lenehan <lenehan@twibble.org>, "James E.J.
 Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen"
 <martin.petersen@oracle.com>, Ezequiel Garcia
 <ezequiel@vanguardiasur.com.ar>, linux-kernel@vger.kernel.org,
 linux-scsi@vger.kernel.org
Subject: Re: [PATCH 0/7] Fix UBI Block wrt. highmem
Message-ID: <20230811075244.11c23eba@xps-13>
In-Reply-To: <20230810160019.16977-1-richard@nod.at>
References: <20230810160019.16977-1-richard@nod.at>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_225255_231391_A525A8B6 
X-CRM114-Status: GOOD (  11.26  )
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

SGkgUmljaGFyZCwKCnJpY2hhcmRAbm9kLmF0IHdyb3RlIG9uIFRodSwgMTAgQXVnIDIwMjMgMTg6
MDA6MTEgKzAyMDA6Cgo+IFBhdGNoIDEgY2hhbmdlcyBVQklibG9jayB0byB1c2UgYSBjb3B5IG9m
IHNjc2lfa21hcF9hdG9taWNfc2coKQo+IGZvciBzZyBsaXN0IHByb2Nlc3NpbmcuIFRoaXMgcGF0
Y2ggaXMgbWVhbnQgZm9yIGJhY2twb3J0aW5nIHRvIHN0YWJsZS4KPiBJdCBtYWtlcyB1c2Ugb2Yg
a21hcF9hdG9taWMoKSBhbmQgYSBib3VuY2UgYnVmZmVyIGJlY2F1c2UgTVREL1VCSSBJTwo+IGNh
biBzbGVlcC4KPiAKPiBQYXRjaGVzIDIgdG8gNyBtb3ZlIHNjc2lfa21hcF9hdG9taWNfc2coKSBp
bnRvIGxpYi9zY2F0dGVybGlzdC5jLAo+IGNvbnZlcnQgaXQgdG8ga21hcF9sb2NhbCgpLCBjb252
ZXJ0IGFsbCB1c2VycyB0byBpdCBhbmQgcmVtb3ZlIHRoZQo+IGJvdW5jZSBidWZmZXIgZnJvbSBV
QklibG9jayBhZ2Fpbi4KCkJvdGggdGhlIGlkZWEgYW5kIHRoZSBpbXBsZW1lbnRhdGlvbiBsb29r
IG5pY2UsIEkgZG9uJ3QgZmVlbCBza2lsbGVkCmVub3VnaCBmb3Igc2VuZGluZyBSZXZpZXdlZC1i
eSBoZXJlLCBidXQgaXQgc2VlbXMgb2theSBhdCBhIGZpcnN0CmdsYW5jZS4KCldlbGwgZG9uZSBS
aWNoYXJkIDotKQoKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
