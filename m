Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CC4DC982DA
	for <linux-mtd@archiver.kernel.org>; Sun, 20 Sep 2026 13:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0zRoSo/lgmbH6B6ocHMjjjvkch977wXtroLTkBr4j+U=; b=mie0gNy7uGxjri
	QxdmXqF3lpTiA180RSNRTVnqoLt4dLGfqvmDhbqAy8Wb+9hxhdt/P8MHeVN/AhR7SUPlHAVACMLy+
	w1tQNn3La5TPJUGpGAGpEJYJg0Ij3YIGLH7VbpbB+SJvLWB47ESmnijs+YLjLCSZP+pnG1zCeg8U4
	N67UGmCNkSZggX+z8ahCeQtwT6DioGrXUaDH22oK8SC+f+7ZCdXoTZDyBNjcw1Ol2gAfekFBHZceZ
	eVggfvlJFwWp3qquXbhKNYq3hgKpneRVZZ4b0qC1iJMsG3h23swF78uV7W3WwAkhbGtdRAy3EYMqJ
	jTQQiJruvPmkj6F/9omg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8HYX-0000000HVIL-2qSX;
	Sun, 20 Sep 2026 13:26:09 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8HYU-0000000HVI0-0Vdw
	for linux-mtd@lists.infradead.org;
	Sun, 20 Sep 2026 13:26:08 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 569D84E40928;
	Sun, 20 Sep 2026 13:26:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 22BF96033F;
	Sun, 20 Sep 2026 13:26:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E7C7B103286A4;
	Sun, 20 Sep 2026 15:25:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789910762; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=eVq1UjiuukNj5t/1x+aogDljrB2G+SQdHnTWKmTTTw4=;
	b=e7X9a7PRFMpJjFeyG3J6ohbQXrp01dQ2yrJ/+trKMZub0zqCBrZ38IhRq9ZbQA4xIFHa/u
	qNmZiqaFqZ/K8b7VT8+l4y7lZe5t+Qj1DVXlOafpTf4ZQHukY2PVryJl85qXE0xQD7y+vX
	wNrsPjtcOocqYQFnu1Gc7qQ6560c7RMc8NENeoG9hMmtpKLpzJA2LR75j9l1NesKnvStSk
	M6nSjx5VfqyT8QpWkJcuk/w8Y0LqgVJ1j7mgdC8vrrRZDP42S6n7m+eIGwgHItGiRDxKxz
	wNvqVwqhUZ4RXfB25dFjBtnp3DNJaBxQL7ItGqUmthBPYNIgI5VFOVUC3suqPQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Yibo Tan <lhfff@tju.edu.cn>
Cc: Maxim Levitsky <maximlevitsky@gmail.com>,  Richard Weinberger
 <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] mtd: rawnand: r852: Prevent card work during removal
In-Reply-To: <20260915144543.3466083-1-lhfff@tju.edu.cn> (Yibo Tan's message
	of "Tue, 15 Sep 2026 22:45:43 +0800")
References: <20260915144543.3466083-1-lhfff@tju.edu.cn>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Sun, 20 Sep 2026 15:25:25 +0200
Message-ID: <87zexc837e.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_062606_305476_95D302DC 
X-CRM114-Status: UNSURE (   8.85  )
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

T24gMTUvMDkvMjAyNiBhdCAyMjo0NTo0MyArMDgsIFlpYm8gVGFuIDxsaGZmZkB0anUuZWR1LmNu
PiB3cm90ZToKCj4gcjg1Ml9pcnEoKSBxdWV1ZXMgY2FyZF9kZXRlY3Rfd29yayB3aGVuIGNhcmQg
c3RhdGUgY2hhbmdlcy4gIHI4NTJfcmVtb3ZlKCkKPiBjdXJyZW50bHkgY2FuY2VscyB0aGF0IHdv
cmsgYW5kIGRlc3Ryb3lzIGl0cyBwcml2YXRlIHdvcmtxdWV1ZSBiZWZvcmUgaXQKPiBkaXNhYmxl
cyBhbmQgZnJlZXMgdGhlIElSUS4KPgo+IEEgY2FyZCBldmVudCBpbiB0aGlzIGludGVydmFsIGNh
biBxdWV1ZSBkZWxheWVkIHdvcmsgb24gdGhlIGRlc3Ryb3llZAo+IHdvcmtxdWV1ZS4gIEl0cyB0
aW1lciBpcyBwYXJ0IG9mIHN0cnVjdCByODUyX2RldmljZSwgd2hpY2ggaXMgZnJlZWQgbGF0ZXIK
PiBpbiByODUyX3JlbW92ZSgpLiAgS0FTQU4gcmVwb3J0ZWQgYSB1c2UtYWZ0ZXItZnJlZSBpbiB0
aGUgdGltZXIgY29kZSB3aGVuCj4gdGhlIGNhcmQgaW50ZXJydXB0IG9jY3VycmVkIGluIHRoaXMg
aW50ZXJ2YWwuICBUaGUgc2FtZSB0ZXN0IGNvbXBsZXRlZAo+IHdpdGhvdXQgYSBrZXJuZWwgZGlh
Z25vc3RpYyBhZnRlciB0aGlzIGNoYW5nZS4KPgo+IFNldCBhIHJlbW92YWwgZmxhZyB3aGlsZSBo
b2xkaW5nIGlycWxvY2sgYmVmb3JlIGNhbmNlbGxpbmcgdGhlIHdvcmsuICBUaGUKPiBJUlEgaGFu
ZGxlciBzdGlsbCBhY2tub3dsZWRnZXMgYW5kIGRpc2FibGVzIGNhcmQgZXZlbnRzLCBidXQgZG9l
cyBub3QKPiBxdWV1ZSBtb3JlIGNhcmQtZGV0ZWN0IHdvcmsgZHVyaW5nIHJlbW92YWwuICBUaGUg
bG9jayBlbnN1cmVzIHRoYXQgd29yawo+IHF1ZXVlZCBiZWZvcmUgdGhlIGZsYWcgaXMgY2FuY2Vs
bGVkIGFuZCBsYXRlciBpbnRlcnJ1cHRzIHNraXAgdGhlCj4gcXVldWUuCgpXaHkgZG9uJ3QgeW91
IGp1c3QgZGlzYWJsZSB0aGUgSVJRcz8gVGhlcmUgaXMgYSBoZWxwZXIgZm9yIHRoYXQuCgpUaGFu
a3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
