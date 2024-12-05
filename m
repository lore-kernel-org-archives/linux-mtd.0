Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A1B6E7716C
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Dec 2024 10:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bNAYNuXvtUBtEM7EmQCnRoOElcXCMs6aI+X+n9OHfwc=; b=D/VjeG+LjcT+G6
	6G/C9e4x47XzuRtjIaE1eLaMay4JtbXFN6zLyBTgqk/A5iVsUdvqVo4JZXQeR6p1WV4b33edMZxUb
	UmEg0QFIZPfYP3UZZjL2azIPgr3Zvx6t++XUggpPlIYZxdCaWv1rylyeFrTyJFqAXbgXVnCkCv9zD
	wlvAWt5ylRbGBRLHM07FcRs/Km/4IMACcZ6Ta8Rp11e5NTfYnUQmfR0EFQ3WNiTeplQOobNI6qdjE
	ahmA8Z6Ct/w7JmtykC9UHPzX4Obd44ZxC2O7w0SgF7kYAWhpxaoITUpYWON2UoBBpyia+/C1FRmg0
	aQn97e+xrYqmnZh5CX9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ9Qv-0000000FcZ8-1wgk;
	Thu, 05 Dec 2024 10:50:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ9Ma-0000000FbXh-0pBu
	for linux-mtd@bombadil.infradead.org;
	Thu, 05 Dec 2024 10:45:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=4Uri7Y+YVnb+hu2KTTaPPkBHIkOlmugJlKRgqXdrzp8=; b=OchUtLWTJqymYKJAsttqFvR/WJ
	HydMMFhZuyBWmDcAH/BPH4qFMcpFdL9bU1JMQjQ9ZjzNd3ppKHs8aHH0AkCYgXi2HuyXiXkYXShiJ
	pspLFwDvYko2pClaXIQwpA044mkyabravNyfNU7LX8wGJxVVdP3Ftvw+mUQWFIjdSJotKxAQ+Qbb3
	sUTlMeAvjUPIqvUn3MDTvFTTIk42w1WC0iBLtKkQFq+EU5zjfJsR7ynl7jZukOo3jy+UxOcZQmXWh
	AVH0oMLmoLcByUIwclwbENhvvpkSOl502fk50C7ByHVKPuDanoa+ykY+AroqngcmWTgv3Ey2rYaGc
	8HYPXRBA==;
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ9MX-00000002ouT-1ETw
	for linux-mtd@lists.infradead.org;
	Thu, 05 Dec 2024 10:45:39 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id BA1B24000B;
	Thu,  5 Dec 2024 10:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1733395533;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4Uri7Y+YVnb+hu2KTTaPPkBHIkOlmugJlKRgqXdrzp8=;
	b=pEVEdXrvRy6+WU+HmfasxfEXMV0l+SDmkdUlMBE+0hoRWA/FHTbe/xxHLUtU4+Ayb6rikg
	NCa3acN6UVUYI5OvZk3hdqNfufHHs0EbXlzxVa43hc+ft0HqxfvMbAPNgSmQjXwLo1Xf0W
	la0lbt9ki+VOKKwd/MEc0ZgGm/4Z+0xDQaf3RuohTezmfW9H28q8gfW+Ry2lpyIZn7hVuj
	mqwQ2OZ8oZkOlfA5EKWk1ObL4Zp0nKmoetel231LCeSKOl6PoMdzGdHjgV/gZ+GTC+bQJi
	CKCMtKwzvYRxn8RNhMWKsPIouTSn19rRuEuc+qdby87M2mN1HbYClXPqP8B31Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-mtd@lists.infradead.org,  Joern Engel <joern@lazybastard.org>,
  Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  linux-kernel@vger.kernel.org,  Fabian Vogt
 <fvogt@suse.com>
Subject: Re: [PATCH] mtd: phram: Add the kernel lock down check
In-Reply-To: <20241114154442.25920-1-tiwai@suse.de> (Takashi Iwai's message of
	"Thu, 14 Nov 2024 16:44:41 +0100")
References: <20241114154442.25920-1-tiwai@suse.de>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Thu, 05 Dec 2024 11:45:32 +0100
Message-ID: <87o71qv25v.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_104537_435318_ECBB7953 
X-CRM114-Status: UNSURE (   7.04  )
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

T24gMTQvMTEvMjAyNCBhdCAxNjo0NDo0MSArMDEsIFRha2FzaGkgSXdhaSA8dGl3YWlAc3VzZS5k
ZT4gd3JvdGU6Cgo+IFRoZSBwaHJhbSBNVEQgZHJpdmVyIG1heSBtYXAgYW55IG1lbW9yeSBwYWdl
cyBubyBtYXR0ZXIgd2hldGhlciBpdCdzCj4gcmVzZXJ2ZWQgb3Igd2hhdGV2ZXIgdXNlZCBmb3Ig
c3lzdGVtcywgd2hpY2ggYmFzaWNhbGx5IGFsbG93cyB1c2VyCj4gYnlwYXNzaW5nIHRoZSBsb2Nr
IGRvd24uCj4KPiBBZGQgdGhlIGNoZWNrIGFuZCBhYm9ydCB0aGUgcHJvYmUgaWYgdGhlIGtlcm5l
bCBpcyBsb2NrZWQgZG93biBmb3IKPiBMT0NLRE9XTl9ERVZfTUVNLgo+Cj4gUmVwb3J0ZWQtYnk6
IEZhYmlhbiBWb2d0IDxmdm9ndEBzdXNlLmNvbT4KPiBTdWdnZXN0ZWQtYnk6IEZhYmlhbiBWb2d0
IDxmdm9ndEBzdXNlLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBUYWthc2hpIEl3YWkgPHRpd2FpQHN1
c2UuZGU+CgpBcHBsaWVkIHRvIG10ZC9uZXh0LgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRp
c2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbXRkLwo=
