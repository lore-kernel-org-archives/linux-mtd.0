Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDEA8C9830E
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Sep 2026 13:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mFhRGJMpItZg1MJdFWGvqpwjWn4GIxZGZ6PA5XilpsU=; b=rEfxum9j9ilp34
	sU9Uzos2qX94LYlPg8ZoyqB1zUbDtuEfu0fc6vBhIzLtkJAbjRLJmz+0bA+X2E2NWttTg9LA3fk5E
	tH7ZQ+Umy1f6o4PJp0LznyQq7pv/Ga3asr5zoKn2V23GgJHNLlNXid5KJEfzXKqTb6rTw1UmDdrie
	L7zk/F7fz5O2YbrIRZIcFGKlf5x0TXwX9hHX5lxGt8y8ej3ty5RZimOjH6XRWECqnvfEtJZD6hHei
	ubFydoRspr/hIo254WpjmOxk/oXn74QVzHL+WBbC0qxUXmAP82hXyfch4O/KD4nLD8C7Wvsg2HFZX
	b0IzVt4a+S4jvy5XiTKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA65x-0000000DSS7-0z0I;
	Fri, 25 Sep 2026 13:36:09 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA65g-0000000DSET-47cC;
	Fri, 25 Sep 2026 13:35:56 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 42FA21A1012;
	Fri, 25 Sep 2026 13:35:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 152A26073B;
	Fri, 25 Sep 2026 13:35:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B70A810328856;
	Fri, 25 Sep 2026 15:35:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790343349; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=WQZlysiv0d/2BjDEIe3tNwkeQrAxLfTelLLNUmuJ3W4=;
	b=cw1Dm84viQYCZx6ABoHnHL1Qp9oQfr5rKvoMMxb+r9sNGxE7HwsyCXIsK14za/yYulyUev
	ykqBIkwzXO23hvV/2Xu1UPId8vjaogYuO6EQ36ik2HxCFInJV0o4nFTvnXHrc5rCViVfXf
	TLs8WZJd9Wnsy5Bwcsy/DxOky5ivu2e3jrStr2kp88CG2xnkPKpETPzc/JDAAz4Ea0lpd0
	0lOwcLXS8u61ce7L9z5E3hzS67PiK4q0wTDXsbm1j4fmR4A4l7pov7Pl9Xtqol+bQJCF2g
	SBYbwhpFZD3QCd1IU3JEDouubYPDDsJo4Haj1EZ5XvXvPQJONj/pjKNU5DhhYg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: alexandre.belloni@bootlin.com, Wentao Liang <vulab@iscas.ac.cn>
Cc: bbrezillon@kernel.org, claudiu.beznea@tuxon.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, nicolas.ferre@microchip.com, richard@nod.at, 
 vigneshr@ti.com, stable@vger.kernel.org
In-Reply-To: <20260917102924.2146959-1-vulab@iscas.ac.cn>
References: <20260917102924.2146959-1-vulab@iscas.ac.cn>
Subject: Re: [PATCH] mtd: rawnand: atmel: Fix MCK clock leak in
 atmel_nand_controller_init()
Message-Id: <179034334517.1124555.16021884625975139988.b4-ty@bootlin.com>
Date: Fri, 25 Sep 2026 15:35:45 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_063553_184305_B8F072ED 
X-CRM114-Status: UNSURE (   8.29  )
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

T24gVGh1LCAxNyBTZXAgMjAyNiAxMDoyOToyNCArMDAwMCwgV2VudGFvIExpYW5nIHdyb3RlOgo+
IGF0bWVsX25hbmRfY29udHJvbGxlcl9pbml0KCkgdGFrZXMgYSByZWZlcmVuY2UgdG8gdGhlIE1D
SyBjbG9jayB3aXRoCj4gb2ZfY2xrX2dldCgpIGFuZCBrZWVwcyBpdCBpbiBuYy0+bWNrIGZvciB0
aGUgbGlmZXRpbWUgb2YgdGhlCj4gY29udHJvbGxlci4gIElmIHRoZSAiYXRtZWwsc21jIiBwaGFu
ZGxlIGlzIG1pc3Npbmcgb3IgdGhlIFNNQyByZWdtYXAKPiBjYW5ub3QgYmUgb2J0YWluZWQgYWZ0
ZXJ3YXJkcywgdGhlIGVycm9yIHBhdGgganVtcHMgdG8gb3V0X3JlbGVhc2VfZG1hCj4gd2hpY2gg
b25seSByZWxlYXNlcyB0aGUgRE1BIGNoYW5uZWwsIHNvIHRoZSBjbG9jayByZWZlcmVuY2UgaXMg
bGVha2VkLgo+IFRoZSBjYWxsZXJzIHJldHVybiB0aGUgZXJyb3IgZGlyZWN0bHkgYW5kIG5ldmVy
IHJ1bgo+IGF0bWVsX25hbmRfY29udHJvbGxlcl9jbGVhbnVwKCksIHdoZXJlIHRoZSBjbG9jayBp
cyBub3JtYWxseSBwdXQuCj4gCj4gWy4uLl0KCkFwcGxpZWQgdG8gbmFuZC9uZXh0LCB0aGFua3Mh
CgpbMS8xXSBtdGQ6IHJhd25hbmQ6IGF0bWVsOiBGaXggTUNLIGNsb2NrIGxlYWsgaW4gYXRtZWxf
bmFuZF9jb250cm9sbGVyX2luaXQoKQogICAgICBjb21taXQ6IDk0ZWRjZGE0NWQ4ODhjM2JiMTMx
MGRlMTFlMTBlNDUzN2MxNjZmMDAKClBhdGNoZShzKSBzaG91bGQgYmUgYXZhaWxhYmxlIG9uIG10
ZC9saW51eC5naXQgYW5kIHdpbGwgYmUKcGFydCBvZiB0aGUgbmV4dCBQUiAocHJvdmlkZWQgdGhh
dCBubyByb2JvdCBjb21wbGFpbnMgYnkgdGhlbikuCgpLaW5kIHJlZ2FyZHMsCk1pcXXDqGwKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
