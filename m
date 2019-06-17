Return-Path: <SRS0=mO4J=UQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1E7DC31E44
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Jun 2019 08:15:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8EEA921C38
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Jun 2019 08:15:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gOSMIKhO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8EEA921C38
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PTy2rrfAxobmjdL3TovF3plRCbiXxtd6tQ01STBVp7Q=; b=gOSMIKhO7MrKhF
	jT17QfjT1r4Qwvl9YGkkRtwhbsXpxpkdFUZaY4Sau6zUi1hcCepRJI4Iuio/PGVLXbkbAodZoxXu3
	Hi3e9EbuoxGuM5sIzwr0UqN+YJIy/TvXA1eHYMn/fOfQpfEvqmHZqRGRWvX+tR24qlJ4lLMpDzXMO
	npM4juwnFpAEcJ9otLR5QKb7PXAnH/8UnSini3KVcUaozAprQ3a6+efOf3QoxB1lj43etT5zS7Qm7
	MtjYC7ruf32pEOe8+1HJyAEF1G6GN9JJa6XJqFW8OXgQmhdT8Ku7wXBp0k1iufpOi91dj51QqfgYi
	t0QQJtoDO5bpRb7ErmiQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hcmn5-0000um-Kx; Mon, 17 Jun 2019 08:14:59 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hcmn2-0000sC-Gn
 for linux-mtd@lists.infradead.org; Mon, 17 Jun 2019 08:14:58 +0000
Received: from xps13 (aaubervilliers-681-1-81-150.w90-88.abo.wanadoo.fr
 [90.88.23.150]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 0372B200003;
 Mon, 17 Jun 2019 08:14:35 +0000 (UTC)
Date: Mon, 17 Jun 2019 10:14:34 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH] jffs2: do not use C++ style comments in uapi header
Message-ID: <20190617101434.3d29808c@xps13>
In-Reply-To: <20190603165027.11831-1-yamada.masahiro@socionext.com>
References: <20190603165027.11831-1-yamada.masahiro@socionext.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190617_011456_720550_FD39F4A7 
X-CRM114-Status: GOOD (  14.40  )
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
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWFzYWhpcm8sCgpNYXNhaGlybyBZYW1hZGEgPHlhbWFkYS5tYXNhaGlyb0Bzb2Npb25leHQu
Y29tPiB3cm90ZSBvbiBUdWUsICA0IEp1bgoyMDE5IDAxOjUwOjI3ICswOTAwOgoKPiBMaW51eCBr
ZXJuZWwgdG9sZXJhdGVzIEMrKyBzdHlsZSBjb21tZW50cyB0aGVzZSBkYXlzLiBBY3R1YWxseSwg
dGhlCj4gU1BEWCBMaWNlbnNlIElkZW50aWZpZXIgZm9yIC5jIGZpbGVzIHVzZXMgQysrIGNvbW1l
bnQgc3R5bGUuCj4gCj4gT24gdGhlIG90aGVyIGhhbmQsIHVhcGkgaGVhZGVycyBhcmUgc3RyaWN0
LCB3aGVyZSB0aGUgQysrIGNvbW1lbnQKPiBzdHlsZSBpcyBiYW5uZWQuCj4gCj4gTG9va3MgbGlr
ZSB0aGVzZSBsaW5lcyBhcmUgdGVtcG9yYXJpbHkgY29tbWVudGVkIG91dCwgc28gSSBkaWQgbm90
Cj4gdXNlIHRoZSBibG9jayBjb21tZW50IHN0eWxlLgo+IAo+IEhhdmluZyBzYWlkIHRoYXQsIHRo
ZXkgaGF2ZSBiZWVuIGNvbW1lbnRlZCBvdXQgc2luY2UgdGhlIHByZS1naXQgZXJhLgo+IChzbywg
YXQgbGVhc3QgMTQgeWVhcnMpLiAnTWF5YmUgbGF0ZXInIG1heSBub3QgaGFwcGVuLiBBbHRlcm5h
dGl2ZSBmaXgKPiBtaWdodCBiZSB0byBkZWxldGUgdGhlc2UgbGluZXMgZW50aXJlbHkuCgpSaWNo
YXJkJ3MgUE9WIG9uIHRoZSBxdWVzdGlvbiB3b3VsZCBiZSBpbnRlcmVzdGluZyBidXQgbWluZSB3
b3VsZCBiZSB0bwpzaW1wbGUgZHJvcCB0aGVzZSBsaW5lcy4KCj4gCj4gU2lnbmVkLW9mZi1ieTog
TWFzYWhpcm8gWWFtYWRhIDx5YW1hZGEubWFzYWhpcm9Ac29jaW9uZXh0LmNvbT4KPiAtLS0KPiAK
PiAgaW5jbHVkZS91YXBpL2xpbnV4L2pmZnMyLmggfCA4ICsrKystLS0tCj4gIDEgZmlsZSBjaGFu
Z2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2lu
Y2x1ZGUvdWFwaS9saW51eC9qZmZzMi5oIGIvaW5jbHVkZS91YXBpL2xpbnV4L2pmZnMyLmgKPiBp
bmRleCBhMThiNzE5ZjQ5ZDQuLjVkZWU2ZDkzMGQ1YiAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL3Vh
cGkvbGludXgvamZmczIuaAo+ICsrKyBiL2luY2x1ZGUvdWFwaS9saW51eC9qZmZzMi5oCj4gQEAg
LTc3LDEwICs3NywxMCBAQAo+ICAKPiAgI2RlZmluZSBKRkZTMl9BQ0xfVkVSU0lPTgkJMHgwMDAx
Cj4gIAo+IC0vLyBNYXliZSBsYXRlci4uLgo+IC0vLyNkZWZpbmUgSkZGUzJfTk9ERVRZUEVfQ0hF
Q0tQT0lOVCAoSkZGUzJfRkVBVFVSRV9SV0NPTVBBVF9ERUxFVEUgfCBKRkZTMl9OT0RFX0FDQ1VS
QVRFIHwgMykKPiAtLy8jZGVmaW5lIEpGRlMyX05PREVUWVBFX09QVElPTlMgKEpGRlMyX0ZFQVRV
UkVfUldDT01QQVRfQ09QWSB8IEpGRlMyX05PREVfQUNDVVJBVEUgfCA0KQo+IC0KPiArLyogTWF5
YmUgbGF0ZXIuLi4KPiArI2RlZmluZSBKRkZTMl9OT0RFVFlQRV9DSEVDS1BPSU5UIChKRkZTMl9G
RUFUVVJFX1JXQ09NUEFUX0RFTEVURSB8IEpGRlMyX05PREVfQUNDVVJBVEUgfCAzKQo+ICsjZGVm
aW5lIEpGRlMyX05PREVUWVBFX09QVElPTlMgKEpGRlMyX0ZFQVRVUkVfUldDT01QQVRfQ09QWSB8
IEpGRlMyX05PREVfQUNDVVJBVEUgfCA0KQo+ICsqLwo+ICAKPiAgI2RlZmluZSBKRkZTMl9JTk9f
RkxBR19QUkVSRUFECSAgMQkvKiBEbyByZWFkX2lub2RlKCkgZm9yIHRoaXMgb25lIGF0Cj4gIAkJ
CQkJICAgbW91bnQgdGltZSwgZG9uJ3Qgd2FpdCBmb3IgaXQgdG8KClRoYW5rcywKTWlxdcOobAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
