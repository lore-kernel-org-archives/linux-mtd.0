Return-Path: <SRS0=Bfvl=ST=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 340ADC10F12
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Apr 2019 10:25:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 027EF2064A
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Apr 2019 10:25:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Fy3VmbfS";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Wevz2QvY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 027EF2064A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I2Eazg5GXgIgL2uDEOmxqkSxWiZ4DcHIWpVOJoRspKQ=; b=Fy3VmbfSyWuOwa
	NLQWTxMKzuYUmHzOaHQKX9yGpkGAFXx2019d1OkDGnGEX601+lWch2HNzWCLJYrr+6T9HLxxpOpc4
	Vo+V++wBwWjGDzdcYNwWt9XLjXugB3xZb+IvwN3GUWGxZY9rOovE0F/IUJ5ZPIfFQpAmXdCExTFRQ
	kQKOLwz9Z0L4OS1TlSesYWxELnsM379VmRbI5dHVNcI9dqRBNm98S7QjSANBJpBafSikOI/tVhUk5
	QkFQgFXH28Hl7i2mkVbvKgGDxQW+hZGb3sM5D6dhgKp/9+Usku0dUNFgKRKILRkRNLZiT8GLPDmMZ
	02u4tVV8CVzocud540EA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hGhl7-0002Zk-SE; Wed, 17 Apr 2019 10:25:41 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGhl6-0002Xg-M3
 for linux-mtd@bombadil.infradead.org; Wed, 17 Apr 2019 10:25:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5nFiBxo6ZLngWN91OqZBKKELPTh3Ljupv/AZFTz7Hjc=; b=Wevz2QvY31lHSWbQJHcvA/phJ1
 67xGqNYXOfZVqalPEJu4K5hYx+fg/ATHI9nkTJc3QCYKHdpG1mschJib+lebXI9Vj5VgxYpK4Essl
 sNqdrDR50+eBSUa0zWAdDRQ12ysJcspL9f7pnoScqoHjNh+GR2o7N92R7r+UIDS0lsBV0eJysMrgY
 eEjCMUK4GlYz+pbw51Eu508wgTIs3E29B3vasJBHqy3wwVyiBxgjwZ3cl8cHFV4Pff7Fx6cfLVUFw
 ULKC5RsVayUMZS1XyZnG0etQY6bGeUkv+j7rFDV+9XuBxEziqO/fW5XrlbLouNfbOlhHEL9Hqo0Xv
 uYhWHdjA==;
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGhl3-00015f-JR
 for linux-mtd@lists.infradead.org; Wed, 17 Apr 2019 10:25:39 +0000
X-Originating-IP: 90.88.160.238
Received: from xps13 (aaubervilliers-681-1-42-238.w90-88.abo.wanadoo.fr
 [90.88.160.238]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 1285840003;
 Wed, 17 Apr 2019 10:24:53 +0000 (UTC)
Date: Wed, 17 Apr 2019 12:24:52 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH 05/14] mtd: rawnand: gpmi: Remove unnecessary variables
Message-ID: <20190417122452.2b39ea08@xps13>
In-Reply-To: <20190409113421.3037-6-s.hauer@pengutronix.de>
References: <20190409113421.3037-1-s.hauer@pengutronix.de>
 <20190409113421.3037-6-s.hauer@pengutronix.de>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190417_112537_721843_301292F8 
X-CRM114-Status: UNSURE (   7.49  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: kernel@pengutronix.de, Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>, Vinod Koul <vkoul@kernel.org>,
 linux-mtd@lists.infradead.org, NXP Linux Team <linux-imx@nxp.com>,
 Fabio Estevam <festevam@gmail.com>, Han Xu <han.xu@nxp.com>,
 Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgU2FzY2hhLAoKU2FzY2hhIEhhdWVyIDxzLmhhdWVyQHBlbmd1dHJvbml4LmRlPiB3cm90ZSBv
biBUdWUsICA5IEFwciAyMDE5CjEzOjM0OjEyICswMjAwOgoKPiB0aGlzLT5wYWdlX2J1ZmZlcl92
aXJ0IGFuZCB0aGlzLT5wYXlsb2FkX3ZpcnQgYXJlIGFsd2F5cyBzZXQgdG8gdGhlIHNhbWUKPiB2
YWx1ZSwgc28gZHJvcCB0aGUgZm9ybWVyIGFuZCBqdXN0IHVzZSB0aGUgbGF0dGVyLiBTYW1lIGZv
cgo+IHRoaXMtPnBhZ2VfYnVmZmVyX3ZpcnQgYW5kIHRoaXMtPnBheWxvYWRfdmlydC4KPiAKPiBT
aWduZWQtb2ZmLWJ5OiBTYXNjaGEgSGF1ZXIgPHMuaGF1ZXJAcGVuZ3V0cm9uaXguZGU+Cj4gLS0t
CgpSZXZpZXdlZC1ieTogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4K
CgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
