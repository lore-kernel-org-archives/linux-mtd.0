Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F42BC433F5
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Jan 2022 17:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sVdHuIA8Dnfr0MKkzDrHjdfjo0gUDqwuy2FqBg8MUy0=; b=2AY8o22GmcComZ
	BlRS/VRJHfj+akAhZKS8EA45XmkHYnStzzw5i+WHoYyokLa0XNTR87iUaeCHzu6+Yw745HMVXzY+w
	cOr8F/ElIQgDuoTTbTdLl3yA3U0RsG7qkoY3M5Uh4/3O+7zpZY3HvftgkwjciwfrGC5pKfFc0KKCF
	DevOeUlLxE92hqDGO4+QRjm1CCfnxQNq4xR5sEs9ajZ5AwDG/FD4cn+/kWjHi2dJrOgCQykDqCX6w
	bMVZ5SuXvg+D13+bQguCc1V7uOQjHvtIdBFFV6PNpLP7p7FA8HcO8ipAb6hyqogSKctUMc47yZ452
	QcZbazAs85mIQgvHTwBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4Qsv-009eDs-Pj; Mon, 03 Jan 2022 17:12:37 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4Qss-009eCw-V9
 for linux-mtd@lists.infradead.org; Mon, 03 Jan 2022 17:12:36 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id D1362FF80C;
 Mon,  3 Jan 2022 17:12:26 +0000 (UTC)
Date: Mon, 3 Jan 2022 18:12:25 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: linux-mtd@lists.infradead.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <zajec5@gmail.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Brian Norris <computersforpeace@gmail.com>,
 Kamal Dasu <kdasu.kdev@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Cai
 Huoqing <caihuoqing@baidu.com>, Colin Ian King <colin.king@intel.com>,
 linux-kernel@vger.kernel.org (open list), linux-wireless@vger.kernel.org
 (open list:BROADCOM SPECIFIC AMBA DRIVER (BCMA)),
 bcm-kernel-feedback-list@broadcom.com (open list:BROADCOM STB NAND FLASH
 DRIVER)
Subject: Re: [PATCH 9/9] mtd: rawnand: brcmnand: Add BCMA shim
Message-ID: <20220103181225.20a60d82@xps13>
In-Reply-To: <20211223002225.3738385-10-f.fainelli@gmail.com>
References: <20211223002225.3738385-1-f.fainelli@gmail.com>
 <20211223002225.3738385-10-f.fainelli@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220103_091235_163804_F8B8F5CD 
X-CRM114-Status: UNSURE (   7.56  )
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

Cj4gK01PRFVMRV9MSUNFTlNFKCJHUEwgdjIiKTsKPiArTU9EVUxFX0FVVEhPUigiQnJhb2Rjb20i
KTsKClNtYWxsIHR5cG8gaGVyZSA6KQoKPiArTU9EVUxFX0RFU0NSSVBUSU9OKCJOQU5EIGRyaXZl
ciBmb3IgQkNNQSBjaGlwcyIpOwoKTkFORCBjb250cm9sbGVyIGRyaXZlciwgSSB3YW50IHRvIGVu
Zm9yY2UgdGhpcyAqY29udHJvbGxlciogd29yZApiZWNhdXNlIE5BTkQgaXMgd2F5IHRvbyB2YWd1
ZSBhbmQgcmVmZXJzIHRvIG5vdGhpbmcgc3BlY2lmaWMuCgpQbHVzLCBpdCdzIG5vdCByZWFsbHkg
YSBjb250cm9sbGVyIGRyaXZlciB0aGF0IHdlIGhhdmUgaGVyZSwgbW9yZSBsaWtlCmEgZ2x1ZSBp
bnRlcmZhY2UuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
