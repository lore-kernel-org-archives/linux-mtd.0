Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED1F2C61DD3
	for <linux-mtd@archiver.kernel.org>; Mon, 31 Aug 2026 08:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5BIdXSE+0fYPYQ0vCc5hdkSzQXfARdC+bQ5QvwEeTJM=; b=tS30ARi+JoIZo8
	s0fqEsmcO0DRkh6Az2Odu+V8DD3vi6LZD2ilZp7bossPu3koEDHb1y9MaBLKHHSGiQUhq3a4NvLe5
	yCno5qyMoWotCmbcnKrZLT3vug42va7QylBKf4Lz9KCxybnTKDY+YxdboW4/D63Ne93ke8ZCc4oDC
	4AwikldPRvgbjf+GAOM/AC11xYM4Ejy/lkl8BlKXGnRzzIKEK1A0pws9dN/kTaM3z+SE5+BlMZYWV
	1ZfwmD45FRKtgxArbjRIbqQvb1PZyREXwKNOdSx7H2EaK8IlCQV6KzDFtmHKztGmNg8vfRLoDDPL7
	lVsCAlNEkjvhTFWrq/zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0x37-00000008nHJ-0hPc;
	Mon, 31 Aug 2026 08:07:25 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0x34-00000008nGT-0Mlw
	for linux-mtd@lists.infradead.org;
	Mon, 31 Aug 2026 08:07:24 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 7407D1A18E7;
	Mon, 31 Aug 2026 08:07:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3ED58601E1;
	Mon, 31 Aug 2026 08:07:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8737711C783B9;
	Mon, 31 Aug 2026 10:07:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788163638; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=CX1WdLvxKwHuhwVifTZGUobLmn/2NrYDlUWYb3YMFuQ=;
	b=c8CkxFxbt7rff3WTpvh333rN+gn5h3MeU2JGxbvWFESup7CI4/vmx+SuPVbI9Oh07JFwk1
	YDD/UFPG2IH3jdQI/Of+2uhRtSp2RhJOxGYcwgYu/AfSCr/hAoS4taJKArKYpmxvgfe8/1
	If6HB9iFDnHKLy2BKVSVq5px1peNlcJbScOh57zPjDiPc/NpNxiBunEkxWNNPtM4Y0GWNP
	os3WTcne/vUoYW6+o3IpoC2pISR6kqjKco0T/eTJGTyHo59cwufnwBFRZcTO9wgyqwAb+j
	xpr4+7kqyRsZdq2Hd6ObMo2RaJQ4BADWeyqbREwC0XQMUzTAGaGJs3FDhcwXyA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mehmet Fide <mehmet.fide@gmail.com>
Cc: Stefan Agner <stefan@agner.ch>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  Boris Brezillon
 <bbrezillon@kernel.org>,  Frieder Schrempf <frieder.schrempf@kontron.de>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] mtd: rawnand: vf610_nfc: fix reads on chips with
 more than 64 bytes of OOB
In-Reply-To: <20260828085337.3916199-1-mehmet.fide@gmail.com> (Mehmet Fide's
	message of "Fri, 28 Aug 2026 10:53:35 +0200")
References: <20260828085337.3916199-1-mehmet.fide@gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Mon, 31 Aug 2026 10:07:17 +0200
Message-ID: <87pkyybtmy.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_010722_821775_BA81C80F 
X-CRM114-Status: UNSURE (   8.38  )
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

T24gMjgvMDgvMjAyNiBhdCAxMDo1MzozNSArMDIsIE1laG1ldCBGaWRlIDxtZWhtZXQuZmlkZUBn
bWFpbC5jb20+IHdyb3RlOgoKPiBGcm9tOiBNZWhtZXQgRmlkZSA8bWVobWV0LmZpZGVAc2NyZWVu
aW5nZWFnbGUuY29tPgoKU2FzaGlrbyBzYXlzOgoKPiBOZXcgaXNzdWVzOgo+IC0gW0hpZ2hdIEtl
cm5lbCBoZWFwIG1lbW9yeSBpcyBsZWFrZWQgdG8gdXNlcnNwYWNlIGR1cmluZyBvdXQtb2YtYmFu
ZAo+IChPT0IpIHJlYWRzIHdoZW4gdGhlIE5BTkQgY2hpcCdzIE9PQiBzaXplIGlzIGxhcmdlciB0
aGFuIDY0IGJ5dGVzLgoKUHJvYmFibHkgcmlnaHQsIHRvIGJlIGNoZWNrZWQuCgo+IC0gW01lZGl1
bV0gSW50ZWdlciB1bmRlcmZsb3dzIG9jY3VyIGluIE9PQiBsYXlvdXQgZnVuY3Rpb25zIHdoZW4g
dGhlCj4gZmxhc2ggY2hpcCdzIHNwYXJlIHNpemUgaXMgc21hbGxlciB0aGFuIHRoZSByZXF1aXJl
ZCBFQ0MgYnl0ZXMgKyAyLAo+IGxlYWRpbmcgdG8gYW4gaW5mbGF0ZWQgYG10ZC0+b29iYXZhaWxg
IGFuZCBwb3RlbnRpYWwgaGVhcCBidWZmZXIKPiBvdmVyZmxvdy4KCkNhbm5vdCBoYXBwZW4uCgo+
IFByZS1leGlzdGluZyBpc3N1ZXM6Cj4gLSBbSGlnaF0gYHZmNjEwX25mY193cml0ZV9wYWdlKClg
IGNvbXBsZXRlbHkgaWdub3JlcyB0aGUgYG9vYl9yZXF1aXJlZGAKPiBwYXJhbWV0ZXIgYW5kIGZh
aWxzIHRvIGNvcHkgdGhlIGNhbGxlcidzIE9PQiBkYXRhIGludG8gdGhlIGNvbnRyb2xsZXIncwo+
IFNSQU0sIGxlYWRpbmcgdG8gc3RhbGUgZGF0YSB3cml0dGVuIHRvIHRoZSBmbGFzaC4KClByb2Jh
Ymx5IHRydWUuCgpDaGVlcnMsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
