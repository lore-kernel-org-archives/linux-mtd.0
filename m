Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 793BAC5AD7B
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Aug 2026 12:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FDQOdbZ0Sf2AW3FYu37F3wK6iMibEw0vq1fuC79luNM=; b=Qr/Q/aWVSw+XOv
	M9yeaAbZYnqAAkBtRjSUdHExqoJZ5gKIXbdQ/9XLVdGAvxqcsr1dklAAyxyq5dLFNOt4OSEq1GHwp
	iYV1gWY7BqkbJt79AC0TQKp5hvXVGFM4CulxKaFfwhqXzYCMtwa0l/hEHIXB/nIjhIgtXGQ/BvWJZ
	aNCckiEd7AKCbAs6/9uPrz4D7iIRGCQ/7N8n5nJ/AYL2ap5a0XP5s0FpRX/+7HQJLVRl6ea7NnVv0
	Q7UZZrvCIMsB81nU7hLq7XKCcOWQlZE3oZQTfWlxcSmYvb+r/hp8GGMVW/NC0Y85K+DsyRM2kD8U9
	6ejH0JnclsdCvnwsc7zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtPQB-0000000BpBk-1Qmo;
	Mon, 10 Aug 2026 12:48:03 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtPQ8-0000000BpAx-1tQo
	for linux-mtd@lists.infradead.org;
	Mon, 10 Aug 2026 12:48:02 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C3A7D1A152A;
	Mon, 10 Aug 2026 12:47:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 960916033B;
	Mon, 10 Aug 2026 12:47:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0B6A411C4A56B;
	Mon, 10 Aug 2026 14:47:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786366078; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=udAMHzRtyQaOkwLerVor+ncwwjh/ZWCrpPKCMkWf7fE=;
	b=aJhc4slyOKzqCwyPlKrJ5bTf2deEFDIXqXSEDmcv+8Wf3qyU9mq5u5IE6fLV/3Fxbcz79g
	3BhpgUiuKfpD/LICkrGYC4pZGvStD469hF+JbSp0A++QFuFsTV2oDJJcSBG2z7XxBkmH2P
	fH7kk43gkWIL0LsHR4uGTTjVymeJB/lvfd/feGtAGYRatoEYnE2fzjaGtn3Xi1ODTNhQII
	KWxn0SRwY78mW8ayZ7R7lMEJe8Y3yy+kGThWcE43L5PkN6cVrlvnTqXD5p0Oh8A8j32uK3
	rV5e9KTiwJ2629AYQQ7FItj3nc4D7sGmoQde/+B74f9Fi3nK9rQc7qsDtJc9eA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Michael Walle" <mwalle@kernel.org>
Cc: "Runyu Xiao" <runyu.xiao@seu.edu.cn>,  <tudor.ambarus@linaro.org>,
  <pratyush@kernel.org>,  <richard@nod.at>,  <vigneshr@ti.com>,
  <linux-mtd@lists.infradead.org>,  <linux-kernel@vger.kernel.org>,
  <jianhao.xu@seu.edu.cn>,  <stable@vger.kernel.org>
Subject: Re: [PATCH] mtd: spi-nor: scope the exclusive RWW lock
In-Reply-To: <DKL4CBQNKCO2.3NAZ6S25Q60XN@kernel.org> (Michael Walle's message
	of "Mon, 10 Aug 2026 10:25:28 +0200")
References: <20260809084223.3596259-1-runyu.xiao@seu.edu.cn>
	<DKL4CBQNKCO2.3NAZ6S25Q60XN@kernel.org>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Mon, 10 Aug 2026 14:47:50 +0200
Message-ID: <87h5l2qgzt.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_054800_632207_766E760F 
X-CRM114-Status: GOOD (  16.46  )
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

SGVsbG8sCgpPbiAxMC8wOC8yMDI2IGF0IDEwOjI1OjI4ICswMiwgIk1pY2hhZWwgV2FsbGUiIDxt
d2FsbGVAa2VybmVsLm9yZz4gd3JvdGU6Cgo+IE9uIFN1biBBdWcgOSwgMjAyNiBhdCAxMDo0MiBB
TSBDRVNULCBSdW55dSBYaWFvIHdyb3RlOgo+PiBzcGlfbm9yX3J3d19zdGFydF9leGNsdXNpdmUo
KSBpcyB1c2VkIGFzIGEgd2FpdF9ldmVudF9raWxsYWJsZSgpCj4+IGNvbmRpdGlvbi4gVGhlIHJh
dyBtdXRleF9sb2NrKCkgbGVhdmVzIG5vci0+bG9jayBoZWxkIHdoZW4gdGhlIGJ1c3kKPj4gY29u
ZGl0aW9uIHJldHVybnMgZmFsc2UsIHNvIHRoZSB3YWl0ZXIgY2FuIGJsb2NrIHRoZSBhY3RpdmUg
b3BlcmF0aW9uIHRoYXQKPj4gbXVzdCBjbGVhciB0aGUgUldXIHN0YXRlLgo+Pgo+PiBVc2UgdGhl
IHNhbWUgc2NvcGVkIG11dGV4IGd1YXJkIGFzIHRoZSBvdGhlciBSV1cgc3RhcnQgaGVscGVycyBz
byB0aGUKPj4gbXV0ZXggaXMgcmVsZWFzZWQgb24gYm90aCB0aGUgYnVzeSBhbmQgc3VjY2Vzc2Z1
bCBjb25kaXRpb24gcGF0aHMuIFRoZQo+PiBzdGF0ZSBmbGFncyByZW1haW4gdGhlIGhhbmRvZmYg
dG8gdGhlIGNhbGxlciwgd2hpbGUKPj4gc3BpX25vcl9yd3dfZW5kX2V4Y2x1c2l2ZSgpIGNvbnRp
bnVlcwo+PiB0byBhY3F1aXJlIHRoZSBtdXRleCB3aGVuIGNsZWFyaW5nIHRoZW0uCj4+Cj4+IFRo
ZSBjaGFuZ2Ugd2FzIGNoZWNrZWQgYnkgY29tcGFyaW5nIHRoZSBvcmlnaW5hbCBhbmQgcGF0Y2hl
ZCBzb3VyY2UuCj4KPiBXaGF0IGRvIHlvdSBtZWFuPyBXYXMgdGhpcyBBSSBhc3Npc3RlZD8KPgo+
PiBBIHNvdXJjZS1sZXZlbCBjaGVjayBvZiB0aGUgb3JpZ2luYWwgd2FpdCBjb25kaXRpb24gZm91
bmQgdGhhdCBpdCB0YWtlcwo+PiBgbm9yLT5sb2NrYCBhbmQgcmV0dXJucyBmYWxzZSB3aGlsZSBh
biBSV1cgb3BlcmF0aW9uIGlzIHN0aWxsIGFjdGl2ZS4gVGhlCj4+IHBhdGNoZWQgc291cmNlIHdh
cyBjaGVja2VkIGZvciBhIHNjb3BlZCBtdXRleCBndWFyZCB0aGF0IHJlbGVhc2VzCj4+IGBub3It
PmxvY2tgIGJlZm9yZSB0aGUgd2FpdCBjb25kaXRpb24gcmV0dXJucy4gQSB1c2VyLXNwYWNlIHB0
aHJlYWQgbW9kZWwKPj4gaGVsZCBgbm9yLT5sb2NrYCBvbiB0aGUgZmFsc2UtY29uZGl0aW9uIHBh
dGggYW5kIHNob3dlZCB0aGF0IHRoZQo+PiBvcGVyYXRpb24tZW5kaW5nIHBhdGggdGhlbiBibG9j
a3Mgd2hlbiBpdCBuZWVkcyB0aGUgc2FtZSBtdXRleC4gTm8gbGl2ZQo+PiBTUEktTk9SIHRlc3Qg
d2FzIHJ1bi4KPgo+IFdoYXQgZG8geW91IG1lYW4gYnkgInVzZXItc3BhY2UgcHRocmVhZCBtb2Rl
bCI/IFBvcnRlZCB0aGlzIGludG8KPiB1c2VyLXNwYWNlIGFuZCB0cmllZCBpdCB0aGVyZT8gUGxl
YXNlIGtlZXAgdGhlIGNvbW1pdCBtZXNzYWdlCj4gcHJlY2lzZSBhbmQgZG9uJ3QgdXNlIGFueSBB
SSBnaWJiZXJpc2guIFBsZWFzZSwgZXhwbGFpbiB3aGF0J3MgZ29pbmcKPiBvbiB3aXRoIHlvdXIg
b3duIHNlbnRlbmNlcy4gVGhhdCB3YXksIGl0IHNob3dzIGF0IGxlYXN0IHNvbWUKPiB1bmRlcnN0
YW5kaW5nIHdoYXQgeW91IGFyZSB0cnlpbmcgdG8gY2hhbmdlIGhlcmUuCj4KPiBUaGF0IGJlaW5n
IHNhaWQsIHRoZXJlIGlzIHNvbWV0aGluZyBvZGQgYWJvdXQgdGhhdCBjb21taXQuIFR1ZG9yLCBk
bwo+IHlvdSBrbm93IHdoeSB5b3UndmUgb21pdHRlZCB0aGUgZ3VhcmQoKSBpbgo+IHNwaV9ub3Jf
cnd3X3N0YXJ0X2V4Y2x1c2l2ZSgpPwoKSSBhZ3JlZSB3aXRoIE1pY2hhZWwsIHRoZSBmaXggbG9v
a3MgbGVnaXRpbWF0ZSwgaG93ZXZlciB0aGUgY29tbWl0IGxvZwppcyB1bnJlYWRhYmxlIGFuZCBz
aG91bGQgYmUgYSAzLWxpbmUgc3RyYWlnaHRmb3J3YXJkIHBhcmFncmFwaC4KClRoYW5rcywKTWlx
dcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
