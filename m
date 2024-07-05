Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C28D0C3271E
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Jul 2024 11:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7QQUMQneSzxJdLgMkugLyQN5VitckkkrD+CZ8qHmnns=; b=ePeBy6w9v95Fvp
	qkNLUx27sm88pgoqCMtDD4xhx3I7+cAdEZeKY0ovzR7p9UCQQij8zqh7eYxRLOSxK/8r3mO2bKskM
	iZSuTLawcMy3eYNQHtqfcxsO4O0/FEFA+xFXEwEIX1fU9eGC+dleG4DOwTaqSLDl/l6HGE6D8kq8X
	VHwz2LIbyog4oLCGyDIf3lAqcAHcF0YBeqZFTgDYkfN+qP9MrRCXsNtOzqpsEtPOkC2hby/GYrgiK
	1PfSYfAX8cnJ6tW3KwfjvQ5eleLnT2V+tEs0wEvEP5CLdAYLi0H8J3VAd/sxfIARj2lcvRbfTtajT
	XVMZx6u7YIY3ymLNbWZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPhAu-0000000Fo0d-3Col;
	Fri, 05 Jul 2024 11:32:24 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPhAd-0000000FnxP-3xpS;
	Fri, 05 Jul 2024 11:32:09 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8C2832000C;
	Fri,  5 Jul 2024 11:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1720179123;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZsViN59W6qMf/mS+MNMH3PMMvUGwpG61clKEaWdUd48=;
	b=cOBxOY8+JvnXcaqpYardXjxv6JGoZAAHi9BSk1DJMLh6OtxUT0QiBTMYviE8ISc3OA+TTt
	KHR4DmAeL0da+lyIAqpKcaLX15mbFKCA31+avHflmhs9KzOiRhhnDwzuyFbbsyI1dJK7uO
	wxj3/0Ubx4/U11lKDTqddlIXJqttq7BEzdrm5KWB0BdAM8JnPgGlJVU01prpy6XJCnac+F
	aOM9uMdr6Y1j+gr9OwZDCvnt++THPMJZlPIjZDjmfLvq35h4CP4g31qU2KTXAqk1yebEz9
	AP58NYmPCFsOCMykZU2rWvo9/1MrDX7/DtpvBNWy/q1j0sFnqLvMDsMlNa6y7g==
Date: Fri, 5 Jul 2024 13:32:01 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Cc: dan.carpenter@linaro.org, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Vladimir Zapolskiy <vz@mleia.com>, Arnd
 Bergmann <arnd@arndb.de>, Yangtao Li <frank.li@vivo.com>, Li Zetao
 <lizetao1@huawei.com>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: lpx32xx: Fix dma_request_chan() error
 checks
Message-ID: <20240705133201.023cf3c7@xps-13>
In-Reply-To: <20240705093851.18107-1-piotr.wojtaszczyk@timesys.com>
References: <20240705093851.18107-1-piotr.wojtaszczyk@timesys.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240705_043208_137358_3FDBB7F7 
X-CRM114-Status: UNSURE (   6.85  )
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

SGkgUGlvdHIsCgpwaW90ci53b2p0YXN6Y3p5a0B0aW1lc3lzLmNvbSB3cm90ZSBvbiBGcmksICA1
IEp1bCAyMDI0IDExOjM4OjQ3ICswMjAwOgoKPiBUaGUgZG1hX3JlcXVlc3RfY2hhbigpIHJldHVy
bnMgZXJyb3IgcG9pbnRlciBpbiBjYXNlIG9mIGVycm9yLCB3aGlsZQo+IGRtYV9yZXF1ZXN0X2No
YW5uZWwoKSByZXR1cm5zIE5VTEwgaW4gY2FzZSBvZiBlcnJvciB0aGVyZWZvcmUgZGlmZmVyZW50
Cj4gZXJyb3IgY2hlY2tzIGFyZSBuZWVkZWQgZm9yIHRoZSB0d28uCj4gCj4gRml4ZXM6IDczMjZk
M2ZiMWVlMyAoIm10ZDogcmF3bmFuZDogbHB4MzJ4eDogUmVxdWVzdCBETUEgY2hhbm5lbHMKPiB1
c2luZyBEVCBlbnRyaWVzIikKClBsZWFlIGRvbid0IHNwbGl0IHRoZSBjb21taXQgdGl0bGUgb3Zl
ciB0d28gbGluZXMuCgpNaXNzaW5nOiBDYzogc3RhYmxlLgoKPiBTaWduZWQtb2ZmLWJ5OiBQaW90
ciBXb2p0YXN6Y3p5ayA8cGlvdHIud29qdGFzemN6eWtAdGltZXN5cy5jb20+CgpUaGFua3MsCk1p
cXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
