Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 427A6C43458
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Jun 2026 14:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n9oXKNiLY20JjNNvGjtuT8cq7jTOcfsHjqqywmmZmlM=; b=eh1X9+jVrT9c9/
	5V8N1dc2XcSzTCzit+fYerH7HR7Brb9Sr8Suwu/adfG924Wh0o+IBltiVsYLGrljx0Qs8RByoXzIw
	oGbKET91X/nmmm2OewJOg2AML1nBfaKym71JzF/aQeCD4Gvpg5ckgIJMd9y4dDIKE2n98IhSaJBg/
	ICQq4v5XcnfTLyX2qgjl2ZVJdWAsJN+MySqoX9Vnim9L9BKPwOlzK8C3kTEKZEjOy2/6B/q1gyjam
	U/EHJjL6k/M3fjAMPgsNfsgfF/VuGu4B/MjJ6ru6ONqXmBbrp+L5mGEYnSWbF45HxVOMvACde94wk
	Ow4+tpk/DtCmVaryqaOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd7RU-0000000BS0K-1bRJ;
	Fri, 26 Jun 2026 14:22:04 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd7RR-0000000BRzJ-2UvC
	for linux-mtd@lists.infradead.org;
	Fri, 26 Jun 2026 14:22:03 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 5E7C1C6344B;
	Fri, 26 Jun 2026 14:22:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 75E2F60232;
	Fri, 26 Jun 2026 14:21:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4086C104C9767;
	Fri, 26 Jun 2026 16:21:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782483716; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=nuxf2cfS2nCVAFVu7/RkvHjeobxsvhOt+OH98R0cm+o=;
	b=D5Rv63OqSdY6oH5OArGLroKQhy2N5Y99QQnpyrAXeHwTQYFnQbu83iypZbUceI836U7rgI
	KlPZlwbvjFbkHy2Rpk5uEaEFNLnzSr5wMBvmoUjjksPa57I/qzqsl1b+0Jb2qstm7TKlxY
	8KJ7AHC/DfQruOLtW+/XjjknwWYttA5xeaY1GqKWBmx7IAqXK2W5ddt2IklLc7GsU2jgLm
	Hq6T1WRvSITvwSoKmgKnib3gGQxlfFv8HKaj98VDLmWF1DAWmL36xXJakMi/rSS0B7alVm
	luMPRqQMn7W1n6iSaIi2bP0fG1b3VQzTHn+3+gXwC5Vk6xV6y19jtgM4gLfAHA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Arnd Bergmann" <arnd@arndb.de>
Cc: "Greg Ungerer" <gregungerer@westnet.com.au>,  "Arnd Bergmann"
 <arnd@kernel.org>,  "Richard Weinberger" <richard@nod.at>,  "Vignesh
 Raghavendra" <vigneshr@ti.com>,  "Randy Dunlap" <rdunlap@infradead.org>,
  "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
  linux-kernel@vger.kernel.org,  linux-mtd@lists.infradead.org,  linux-m68k
 <linux-m68k@lists.linux-m68k.org>,  "Pengpeng Hou" <pengpeng@iscas.ac.cn>
Subject: Re: [PATCH 2/3] mtd: maps: remove uclinux map driver
In-Reply-To: <f3e984cd-0614-48d1-b03f-e0670b87e282@app.fastmail.com> (Arnd
	Bergmann's message of "Thu, 25 Jun 2026 16:10:54 +0200")
References: <20260526103227.3152003-1-arnd@kernel.org>
	<20260526103227.3152003-2-arnd@kernel.org>
	<b55ac37f-4523-46d0-8e77-3a17d7235ffe@westnet.com.au>
	<f3e984cd-0614-48d1-b03f-e0670b87e282@app.fastmail.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Fri, 26 Jun 2026 16:21:50 +0200
Message-ID: <87ik75l6v5.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_072201_800094_23528881 
X-CRM114-Status: UNSURE (   9.34  )
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

SGVsbG8gQXJuZCwKCj4+IE5vIG91dCBvZiB0cmVlIGNvZGUgaXMgcmVxdWlyZWQuIE1vc3Qgb2Yg
dGhlIENvbGRGaXJlIGRlZmNvbmZpZ3MgaGF2ZQo+PiBDT05GSUdfTVREX1VDTElOVVggZW5hYmxl
ZCwgc2luY2UgaXQgaXMgY29tbW9ubHkgdXNlZC4KPgo+IEkgc2VlLCB0aGlzIGlzIHN1cnByaXNp
bmcgZnJvbSByZWFkaW5nIHRoZSBzb3VyY2UgYW5kCj4gZ2l0IGhpc3RvcnksIGJ1dCBJIGNhbiBz
ZWUgZXhhY3RseSBob3cgaXQgZ290IHRoZXJlLgo+Cj4gU28gdGhpcyBpcyBub3QgYWN0dWFsbHkg
YSBkZXZpY2UgYnV0IHJhdGhlciBhIHJlcGxhY2VtZW50Cj4gZm9yIENPTkZJR19CTEtfREVWX0lO
SVRSRCB0aGF0IGRvZXMgY2FuIHdvcmsgd2l0aCBDT05GSUdfQkxPQ0s9eSwKPiByaWdodD8KPgo+
PiBDYW4gd2UgZ2V0IHRoaXMgcmV2ZXJ0ZWQ/Cj4KPiBZZXMsIG9mIGNvdXJzZS4gTWlxdWVsL1Jp
Y2hhcmQvVmlnbmVzaCwgc2hvdWxkIEkgc2VuZCBhIHJldmVydCBvcgo+IGNhbiB5b3UganVzdCBh
cHBseSBvbmUgd2l0aCBHcmVnJ3MgZXhwbGFuYXRpb24gYW5kIG15IEFjaz8KCkknbGwgdHJ5IHRv
IGNvbWUgdXAgd2l0aCBzb21ldGhpbmcgbmV4dCB3ZWVrIDotKQoKVGhhbmtzLApNaXF1w6hsCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
