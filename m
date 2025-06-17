Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC17DC71157
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Jun 2025 14:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WP3hDoGPwEfjj5ZVcDGcfXgVXJknC9G8W7VD9G/i1k4=; b=yrgtIZjRvPpugD
	24SmM0YuQ9kekBQxtzE831MKlldM9cE78YyFpXEu3/qeLDNPtPaKwXa6FDeURlvbtH0eoZ6ZPwTz4
	94sGAT2FgqnCDIGow7QxDIMdhK7YERuEynVi86eWKfuqHiPwgKZ5M0xJaPDU4XaEjbXJ5giamAQPv
	OmfJWuVxqDG1wdw5Zovk0kfK9NpUCaBB3jBJdSjWTijVsB/K3cRDp7vZOXXGxWtXYKtoO4A3t1voD
	08ckcn+gxbo/Y1RX9iYxUyT8dChGAr9favobLAMaOdgyE20xZZYQ5i2LFjsic3nbSCUkUhzfgztSC
	Zci1xwYa6zSO6nuMU6Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRXaW-00000007csP-16ud;
	Tue, 17 Jun 2025 14:47:00 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRWT0-00000007NO4-3CrL
	for linux-mtd@lists.infradead.org;
	Tue, 17 Jun 2025 13:35:12 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 77B7F43880;
	Tue, 17 Jun 2025 13:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750167306;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yLmfEfFwWuvcdkeMnDhZ0mmYvsc1Vg6bk1r+MSU1Hzo=;
	b=jcunNBOzUhr/UWJRLgLp8DpcHU4XjOjesxzdl4ZyET6FeRtyAR4OmLkAMWSnpgGXYR+nds
	KbbP0gd+w+qJC0w3WC4pnuCjjtLF6wBe/KIDc5EDYWEBdiUpA2PTuVisQIH+1lYR3Wh0u/
	kW71mkQZss2k7L+Y39GWFI8Oo6JJdlg5zawg53W78f2YBchY0siyHWLU7HuiaEKswIn3Ks
	Ow9t3roHFxb517F4jQcfZonDDD3SAPD9Nsz2W2ij9JYOlDLvaEtp/BV9an7WCa9qd/S7R7
	5G2K0f9obatKOEsdgYnowz0paR8xpOEmt56zDO03DNi9+ZAzSJIOwsXpIMDs/g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Richard Weinberger <richard@nod.at>,  Michael Walle <mwalle@kernel.org>,
  Vignesh Raghavendra <vigneshr@ti.com>,  Tudor Ambarus
 <tudor.ambarus@linaro.org>,  pratyush <pratyush@kernel.org>,  linux-mtd
 <linux-mtd@lists.infradead.org>,  Alexander Usyskin
 <alexander.usyskin@intel.com>
Subject: Re: [PATCH] Revert "mtd: core: always create master device"
In-Reply-To: <deb4072f-f6b3-4d7c-b19b-109570183aa9@roeck-us.net> (Guenter
	Roeck's message of "Mon, 16 Jun 2025 09:49:55 -0700")
References: <20250613180722.1268159-1-miquel.raynal@bootlin.com>
	<b16dbc82976e2454afb6aa53ea97bd0f@kernel.org>
	<1923752382.134392168.1750062114160.JavaMail.zimbra@nod.at>
	<deb4072f-f6b3-4d7c-b19b-109570183aa9@roeck-us.net>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Tue, 17 Jun 2025 15:35:04 +0200
Message-ID: <87plf2mqyf.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdefudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefujghffgffkfggtgfgsehtqhertddtreejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepffeghfejtdefieeguddukedujeektdeihfelleeuieeuveehkedvleduheeivdefnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepkedprhgtphhtthhopehlihhnuhigsehrohgvtghkqdhushdrnhgvthdprhgtphhtthhopehrihgthhgrrhgusehnohgurdgrthdprhgtphhtthhopehmfigrlhhlvgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopehtuhguohhrrdgrmhgsrghruhhssehlihhnrghrohdrohhrghdprhgtphhtthhopehprhgrthihuhhshheskhgvrhhnvghlrdhor
 hhgpdhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopegrlhgvgigrnhguvghrrdhushihshhkihhnsehinhhtvghlrdgtohhm
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_063510_941935_A9350B51 
X-CRM114-Status: UNSURE (   8.57  )
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

SGksCgpPbiAxNi8wNi8yMDI1IGF0IDA5OjQ5OjU1IC0wNywgR3VlbnRlciBSb2VjayA8bGludXhA
cm9lY2stdXMubmV0PiB3cm90ZToKCj4gT24gNi8xNi8yNSAwMToyMSwgUmljaGFyZCBXZWluYmVy
Z2VyIHdyb3RlOgo+PiAtLS0tLSBVcnNwcsO8bmdsaWNoZSBNYWlsIC0tLS0tCj4+PiBWb246ICJN
aWNoYWVsIFdhbGxlIiA8bXdhbGxlQGtlcm5lbC5vcmc+Cj4+Pj4gVGhpcyByZXZlcnRzIGNvbW1p
dCAwYWE3YjM5MGZjNDBhODcxMjY3YTIzMjhiYmJlZmNhOGIzN2FkMzA3Lgo+Pj4+Cj4+Pj4gU2ln
bmVkLW9mZi1ieTogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4KPj4+
Cj4+PiBTaG91bGQgdGhpcyBoYXZlIGEgRml4ZXMgdGFnPwo+PiBTaW5jZSB3ZSdyZSBpbiB0aGUg
c2FtZSByZWxlYXNlIGN5Y2xlIG5vIGJhY2stcG9ydGluZyBpcyBuZWVkZWQuCj4+IAo+Cj4gVGhp
cyBhcHBsaWVzIHRvIFN0YWJsZTogdGFncywgYnV0IG5vdCB0byBGaXhlczouIEEgcGF0Y2ggZml4
aW5nIGEKPiBwcmV2aW91cyBwYXRjaCBmcm9tIHRoZSBzYW1lIHJlbGVhc2UgY3ljbGUgc2hvdWxk
IHN0aWxsIGJlIHRhZ2dlZAo+IHdpdGggRml4ZXM6LgoKQWxsIHJpZ2h0LCBJJ2xsIGFkZCB0aGUg
Rml4ZXMgYW5kIHNlbmQgYSB2Mi4KCkluIHRoZSBtZWFuIHRpbWUsIGFueSBhY2sncyB0byBwcm92
aWRlIGZvbGtzPyBJJ2QgbGlrZSB0byBtZXJnZSBpdCB0aGlzCndlZWsgYW5kIGF2b2lkIG90aGVy
IGJ1ZyByZXBvcnRzLgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
