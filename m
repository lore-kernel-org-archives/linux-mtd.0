Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D2D3C54EE9
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Sep 2022 14:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6oGa+o9HAq+iQt/d6LxKXcVUsiMHIb8NCKicZ54iFJk=; b=MEZhkJaRSI/AeI
	Eg/xNu4xv07s6eCxlCWgmR41hve9tEAwnox4EdnfdgztHXy8tFyDLsG0RGY50l1sR5L9pjL+w3uip
	ockKYGcrVcGyV01mmsGghhX8GsfNZ7OpPOIGCiAfHP/h0gers+b2+mzhZOngLejFgcZriFFPaNRJS
	gQ6hdfICqm1KprxPXsG73CRGqG3eRzTheaOvtXOvubcqGU/ggCVp11Uq3dHNj3TysViJm2FsviWq6
	VGpAi73YketY4rhQoc8oFFDM0aJDthqg+Mn1v1tP1psV0OOnCqFY4nsNvPn2W9c0B/KJpwAuzxmtz
	tBevbI4QNXmzab582i2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaHxA-00C975-FS; Mon, 19 Sep 2022 14:40:56 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaHx7-00C93g-9R
	for linux-mtd@lists.infradead.org; Mon, 19 Sep 2022 14:40:55 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 9133924000A;
	Mon, 19 Sep 2022 14:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1663598446;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5Di3uybgKz4AkAsKWCSByYItw3ITbnFZ5I4YGZNU/5Q=;
	b=j/gZkF6FRjmjqrpTsEzUMRQQNmClzex9cNd314SFIzaepJRg19B9fos5Z4ILzwTqT9PgHS
	EiSCB8tKHYHPoWxeC6vif80K6MxBwcyn3PSsxuTDxaTYOLRloCumDh2xdGewqlmkziKHlr
	UGWwyAs/o71i2H4//Y2zhL0Q+7iOkTv14w33Tl/D25Z/xdSCbXzy2gbh2cu6i4rj1ryJI/
	a1PPoZotBVaT6VIv9ZuT29v+R4DZphbmFqmpjhtj1ef76Q3+FAgBxoEYGP/lSlSd+SXpWO
	VmbzSnwcy+2sarvNYx5EetZWStOppuvKJm68bsVNNiYGbtlpDH5VhtACAOqgkg==
Date: Mon, 19 Sep 2022 16:40:41 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, Brian Norris
 <computersforpeace@gmail.com>, Kamal Dasu <kdasu.kdev@gmail.com>, Broadcom
 internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Roger
 Quadros <rogerq@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Cai
 Huoqing <cai.huoqing@linux.dev>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, Colin Ian King <colin.king@intel.com>, open
 list <linux-kernel@vger.kernel.org>, William Zhang
 <william.zhang@broadcom.com>
Subject: Re: [PATCH 0/2] mtd: rawnand: brcmnand: Glue driver Kconfig entries
Message-ID: <20220919164041.682775b3@xps-13>
In-Reply-To: <6008ef46-ccdb-ea01-f9fb-4f8fceed2d29@gmail.com>
References: <20220711222323.4048197-1-f.fainelli@gmail.com>
	<6008ef46-ccdb-ea01-f9fb-4f8fceed2d29@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220919_074053_521217_136A5F55 
X-CRM114-Status: GOOD (  14.24  )
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

SGkgRmxvcmlhbiwKCmYuZmFpbmVsbGlAZ21haWwuY29tIHdyb3RlIG9uIFRodSwgNCBBdWcgMjAy
MiAxMDo1NToyMSAtMDcwMDoKCj4gT24gNy8xMS8yMiAxNToyMywgRmxvcmlhbiBGYWluZWxsaSB3
cm90ZToKPiA+IEhpIGFsbCwKPiA+IAo+ID4gVGhpcyBwYXRjaCBzZXJpZXMgYWxsb3dzIGZvciBh
IGZpbmVyIGNvbnRyb2wgb3ZlciB0aGUgQlJDTU5BTkQgZHJpdmVyCj4gPiBnbHVlIGRyaXZlciBz
ZWxlY3Rpb24gc3VjaCB0aGF0IGl0IGRlZmF1bHRzIHRvIHRoZSB2YXJpb3VzIHBsYXRmb3Jtcwo+
ID4gZW5hYmxlZCBpbiB0aGUgY29uZmlndXJhdGlvbiBmaWxlLiAgCj4gCj4gTWlxdWVsIGFyZSB5
b3UgYWJsZSB0byByZXZpZXcgYW5kIGFwcGx5IHRob3NlIHBhdGNoZXMgaWYgc2F0aXNmYWN0b3J5
PyBUaGFua3MhCgpTb3JyeSBmb3IgdGhlIGh1Z2UgZGVsYXksIEknbSBub3cgdHJ5aW5nIHRvIGNh
dGNoIHVwIG9uIGFsbCBteSB3b3JrCmxlZnQgc2luY2UgZW5kIG9mIEp1bmUsIHRoZSBzZXJpZXMg
bG9va3Mgb2sgYXQgYSBmaXJzdCBnbGFuY2UgYW5kCnJlY2VpdmVkIG5vIGNvbW1lbnRzIHNvIEkn
bGwgYXBwbHkgaXQgc29vbi4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1h
aWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW10ZC8K
