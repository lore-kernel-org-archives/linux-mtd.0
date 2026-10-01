Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA199CA5FCB
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Oct 2026 10:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BNAqmSnAy8LqoqZbFAFWYAdJ//9ACCg1Md6bwyINqjI=; b=RJNcWSrH6gswRG
	izgkYc9oG67qlr0sQh2mgQwckGqXslsq0R973fqZ5Hh9/i7s4/bAtG3ts5ArCsKXsnm1OVl8Ew/0Q
	4IUQO4OCDObDcKlDNEL3sbQM2ll2OG2WmfDayoi3kGUxo5RUcS+P4A1Z8cVjqD2P5PqeXLS7xmO/k
	1O1ymRh8CPrs/ke9njGOZ51oBeV/KmqK21whnXrbKCQhLcWUOXKmPgd68Ie/3bcsgPt1xnpIDZ5g0
	+B1fGcrkS2MzCjs0OormVUc7Tu0DuF/ERQogwEdKX36KQdNWzD8DzjEef61dU8A65QaR/2dDeY2qJ
	kWi7IoxIlEbQNeIEQEuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCER4-00000008ZRu-3QUi;
	Thu, 01 Oct 2026 10:54:46 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCER0-00000008ZR1-1v8Q
	for linux-mtd@lists.infradead.org;
	Thu, 01 Oct 2026 10:54:44 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id ECC9C1A109A;
	Thu,  1 Oct 2026 10:54:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BA02E60341;
	Thu,  1 Oct 2026 10:54:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1D7F2103281EA;
	Thu,  1 Oct 2026 12:54:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790852074; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=e8IYci6+q2vr8BbuoelQ5417mWlfR58G3RY1mNgh/H0=;
	b=1VteOxYtU4wlQMtBhAUTO5ju27XR+/kFHqMWVcN5wQLwGpmpaD7nlX7+q3V6zsIjym9dr6
	+WaeC8OlY9vHLpMLwpMpMiwGMK3bYvdoRV4jRcryXyPTQ95+AomL7d1I9mKWszVSquhx4S
	6FUY+H7sl7a0/pp+xeonwSId0oYjiSjic7/JU7dpn6jFZER1RTulaUffw9Z20ow5RBXhvS
	qobLlQ2rbGi87Hdtndj1qHd3N0Txwjr8nf7dw19LvwNPNcVsKe6IehqSDslFsgLErUPuVt
	vsGbBuO6Ox+hnpvNH7qOHHyxl+hYe2rzsRbgifDgMdx0/ieylCeZoCGeMG3mWQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: wang wei <a929244872@163.com>
Cc: richard@nod.at,  vigneshr@ti.com,  bbrezillon@kernel.org,
  yamada.masahiro@socionext.com,  wenyou.yang@microchip.com,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drivers/mtd: rawnand: nandsim: Fix stale
 NAND_ROW_ADDR_3 with overridesize
In-Reply-To: <20261001103359.20216-1-a929244872@163.com> (wang wei's message
	of "Thu, 1 Oct 2026 18:33:59 +0800")
References: <20261001103359.20216-1-a929244872@163.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Thu, 01 Oct 2026 12:54:28 +0200
Message-ID: <875wzlofmj.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_035442_883286_8DE49C03 
X-CRM114-Status: GOOD (  24.70  )
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

SGkgV2FuZywKCk9uIDAxLzEwLzIwMjYgYXQgMTg6MzM6NTkgKzA4LCB3YW5nIHdlaSA8YTkyOTI0
NDg3MkAxNjMuY29tPiB3cm90ZToKCj4gVGhlIG92ZXJyaWRlc2l6ZSBtb2R1bGUgcGFyYW1ldGVy
IGNoYW5nZXMgdGhlIHNpemUgb2YgdGhlIHNpbXVsYXRlZAo+IGRldmljZSBhZnRlciBuYW5kX3Nj
YW4oKSBoYXMgY29tcGxldGVkLiBJdCB1cGRhdGVzIG5zbXRkLT5zaXplLAo+IG1lbW9yZy0+ZXJh
c2VibG9ja3NfcGVyX2x1biwgY2hpcC0+Y2hpcF9zaGlmdCBhbmQgY2hpcC0+cGFnZW1hc2sgdG8K
PiBtYXRjaCB0aGUgbmV3IGdlb21ldHJ5LCBidXQgbGVhdmVzIHRoZSBOQU5EX1JPV19BRERSXzMg
b3B0aW9uCj4gdW50b3VjaGVkLCBldmVuIHRob3VnaCBuYW5kX3NjYW5faWRlbnQoKSBzZXQgaXQg
ZnJvbSB0aGUgZ2VvbWV0cnkKPiBkZWNvZGVkIG91dCBvZiB0aGUgSUQgYnl0ZXMuCj4KPiBXaGVu
IHRoZSBJRCBieXRlcyBkZXNjcmliZSBhIGRldmljZSBsYXJnZXIgdGhhbiAxMjggTWlCIGFuZAo+
IG92ZXJyaWRlc2l6ZSBzaHJpbmtzIHRoZSBzaW11bGF0aW9uIHRvIDEyOCBNaUIgb3IgbGVzcywg
dGhlIHN0YWxlCj4gb3B0aW9uIG1ha2VzIHRoZSBjb3JlIGVtaXQgb25lIGV4dHJhIHJvdyBhZGRy
ZXNzIGJ5dGUgKHBhZ2UgPj4gMTYsCj4gYWx3YXlzIHplcm8gZ2l2ZW4gdGhlIHJlZHVjZWQgcGFn
ZSBjb3VudCkgaW4gZXZlcnkgcmVhZCwgcHJvZ3JhbSBhbmQKPiBlcmFzZSBvcGVyYXRpb24sIHdo
aWxlIHRoZSBzaW11bGF0b3Igc3RhdGUgbWFjaGluZSBleHBlY3RzIG9uZSBieXRlCj4gbGVzcy4g
QWxsIGFjY2Vzc2VzIHRoZW4gZmFpbCB3aXRoOgo+Cj4gICAgIG5hbmRzaW06IGVycm9yOiB3cml0
ZV9ieXRlOiBhZGRyZXNzICgweDApIGlzbid0IGV4cGVjdGVkLCBleHBlY3RlZAo+ICAgICBzdGF0
ZSBpcyBTVEFURV9DTURfUkVBRFNUQVJULCBzd2l0Y2ggdG8gU1RBVEVfUkVBRFkKPgo+IFRoZSBv
cHBvc2l0ZSBkaXJlY3Rpb24gaXMgZXF1YWxseSBicm9rZW46IGdyb3dpbmcgYSBzbWFsbCBkZXZp
Y2UgcGFzdAo+IDEyOCBNaUIga2VlcHMgTkFORF9ST1dfQUREUl8zIGNsZWFyZWQsIHNvIHRoZSB0
aGlyZCByb3cgYWRkcmVzcyBieXRlCj4gaXMgZHJvcHBlZCBhbmQgdGhlIHdyb25nIHBhZ2VzIGFy
ZSBzaWxlbnRseSBhZGRyZXNzZWQuCgpGaW5lIHVudGlsIGhlcmUuCgo+IFRoaXMgdXNlZCB0byB3
b3JrIGJlZm9yZSBjb21taXQgMTQxNTdmODYxNDM3ICgibXRkOiBuYW5kOiBpbnRyb2R1Y2UKPiBO
QU5EX1JPV19BRERSXzMgZmxhZyIpLiBCYWNrIHRoZW4gbmFuZHNpbSBrZXB0IGNoaXAtPmNoaXBz
aXplIGluIHN5bmMKCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLAoKPiB3aXRo
IHRoZSBvdmVycmlkZSwgYW5kIG5hbmRfY29tbWFuZF9scCgpIGRlY2lkZWQgYXQgcnVuIHRpbWUs
IHBlcgo+IGNvbW1hbmQsIHdoZXRoZXIgdGhlIHRoaXJkIHJvdyBhZGRyZXNzIGN5Y2xlIHdhcyBu
ZWVkZWQgYnkgdGVzdGluZwo+IGNoaXAtPmNoaXBzaXplIGFnYWluc3QgMTI4IE1pQi4gVGhlIGRl
Y2lzaW9uIHRodXMgYWx3YXlzIHNhdyB0aGUKCiJUaGUgZGVjaXNpb24iPwoKPiBvdmVycmlkZGVu
IHNpemUuIFRoZSBhYm92ZSBjb21taXQgbW92ZWQgdGhlIGRlY2lzaW9uIHRvCj4gbmFuZF9zY2Fu
X2lkZW50KCksIHdoaWNoIGVuY29kZXMgaXQgb25jZSBpbnRvIE5BTkRfUk9XX0FERFJfMyBhdAo+
IHNjYW4gdGltZSAtLSBiZWZvcmUgbmFuZHNpbSBhcHBsaWVzIHRoZSBvdmVycmlkZSAtLSBhbmQg
dGhlCj4gb3ZlcnJpZGVzaXplIHBhdGggd2FzIG5ldmVyIHRhdWdodCB0byByZS1ldmFsdWF0ZSB0
aGUgZmxhZy4gVGhlCj4gY29tbWl0IHRoYXQgaW50cm9kdWNlZCB0aGUgcmVncmVzc2lvbiBpczoK
Pgo+ICAgICBodHRwczovL2dpdC5rZXJuZWwub3JnL3RvcnZhbGRzL2MvMTQxNTdmODYxNDM3ZWJl
MmQ2MjRiMGE4NDViOTFiYmRmOGNhOWEyZAoKVGhpcyBpcyBub3QgbmVlZGVkLCB5b3UgbWVudGlv
biBpdCBhYm92ZSBhbmQgYmVsb3cgYWxyZWFkeS4KCj4gUmUtZXZhbHVhdGUgTkFORF9ST1dfQURE
Ul8zIHJpZ2h0IGFmdGVyIG92ZXJyaWRpbmcgY2hpcF9zaGlmdCwgdXNpbmcKPiB0aGUgc2FtZSB0
ZXN0IGFzIG5hbmRfc2Nhbl9pZGVudCgpLCBzbyB0aGF0IHRoZSBhZGRyZXNzIHdpZHRoIGVtaXR0
ZWQKPiBieSB0aGUgY29yZSBhbHdheXMgbWF0Y2hlcyBucy0+Z2VvbS5wZ2FkZHJieXRlcywgd2hp
Y2ggbnNfaW5pdCgpCj4gZGVyaXZlcyBmcm9tIHRoZSBvdmVycmlkZGVuIHRvdGFsIHNpemUuCj4K
PiBGaXhlczogMTQxNTdmODYxNDM3ICgibXRkOiBuYW5kOiBpbnRyb2R1Y2UgTkFORF9ST1dfQURE
Ul8zIGZsYWciKQoKQ2M6IHN0YWJsZQoKPiBTaWduZWQtb2ZmLWJ5OiB3YW5nIHdlaSA8YTkyOTI0
NDg3MkAxNjMuY29tPgo+IC0tLQo+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kc2ltLmMgfCAx
MiArKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKykKPgo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kc2ltLmMgYi9kcml2ZXJzL210ZC9u
YW5kL3Jhdy9uYW5kc2ltLmMKPiBpbmRleCBmZTk2ODAzLi4xNzZkYjg5IDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRzaW0uYwo+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQv
cmF3L25hbmRzaW0uYwo+IEBAIC0yMzU5LDYgKzIzNTksMTggQEAgc3RhdGljIGludCBfX2luaXQg
bnNfaW5pdF9tb2R1bGUodm9pZCkKPiAgCQl0YXJnZXRzaXplID0gbmFuZGRldl90YXJnZXRfc2l6
ZSgmY2hpcC0+YmFzZSk7Cj4gIAkJY2hpcC0+Y2hpcF9zaGlmdCA9IGZmcyhuc210ZC0+ZXJhc2Vz
aXplKSArIG92ZXJyaWRlc2l6ZSAtIDE7Cj4gIAkJY2hpcC0+cGFnZW1hc2sgPSAodGFyZ2V0c2l6
ZSA+PiBjaGlwLT5wYWdlX3NoaWZ0KSAtIDE7Cj4gKwo+ICsJCS8qCj4gKwkJICogTkFORF9ST1df
QUREUl8zIHdhcyBzZXQgYnkgbmFuZF9zY2FuX2lkZW50KCkgZnJvbSB0aGUKPiArCQkgKiBnZW9t
ZXRyeSBkZWNvZGVkIG91dCBvZiB0aGUgSUQgYnl0ZXMsIHdoaWNoIHRoZSBzaXplCj4gKwkJICog
b3ZlcnJpZGUgaGFzIGp1c3QgbWFkZSBzdGFsZS4gUmUtZXZhbHVhdGUgaXQgYWdhaW5zdAo+ICsJ
CSAqIHRoZSBuZXcgZ2VvbWV0cnksIG90aGVyd2lzZSB0aGUgY29yZSBlbWl0cyBvbmUgbW9yZSAo
b3IKPiArCQkgKiBvbmUgbGVzcykgcm93IGFkZHJlc3MgYnl0ZSB0aGFuIHRoZSBzaW11bGF0b3Ig
ZXhwZWN0cy4KPiArCQkgKi8KCkV2ZXJ5dGhpbmcgYWJvdmUgdGhpcyBsaW5lIGNhbiBqdXN0IGJl
IGRlbGV0ZWQuIFRlbGwgeW91ciBMTE0gdGhhdCB0aGlzCmlzIG9idmlvdXMgZW5vdWdoIGFuZCBk
b2VzIG5vdCByZXF1aXJlIGFueSBwYXJ0aWN1bGFyIGNvbW1lbnQuCgo+ICsJCWlmIChjaGlwLT5j
aGlwX3NoaWZ0IC0gY2hpcC0+cGFnZV9zaGlmdCA+IDE2KQo+ICsJCQljaGlwLT5vcHRpb25zIHw9
IE5BTkRfUk9XX0FERFJfMzsKPiArCQllbHNlCj4gKwkJCWNoaXAtPm9wdGlvbnMgJj0gfk5BTkRf
Uk9XX0FERFJfMzsKPiAgCX0KPiAgCj4gIAlyZXQgPSBuc19zZXR1cF93ZWFyX3JlcG9ydGluZyhu
c210ZCk7CgpJbnN0ZWFkIG9mIHJlcGVhdGluZyB0aGUgb3BlcmF0aW9uIGluIG5hbmRzaW0sIHdo
eSBub3QgY2FsbGluZwpuYW5kX3NjYW4oKSBhZnRlciBvdmVyIHdyaXRpbmcgdGhlIHNpemU/IChp
bnZlcnRpbmcgdGhlIHR3byBibG9ja3MpCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vz
c2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tdGQvCg==
