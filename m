Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAACCC433EF
	for <linux-mtd@archiver.kernel.org>; Sun, 23 Jan 2022 15:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2GvCNg5zUWtMAsChqF7si/Rj7m0yzkBKHS4YCL7n9bg=; b=zoBOPn80HOGa18
	fBMxhxd7WbS8C9Owiij4QtlUdCQRFQByHFre1SrkV9kyTQ+mPoGSIMRyCuynEoTx04moKSiQvktZL
	ji9Er3KUnvvHWyk59OmI2RDGB8r+ODDrMw6PE2z7qjvyLY2R9ow/3+e1axuAsqubyXqNPyfvVDRg9
	C0GmCCVE3EOt7RET0WykQTi5k8BOJMBJGwSRQZsVt+BMg/H9V5+HhZR7aJD4AVs4Oo2MnaWTDu3w3
	XBZXtC5dAKajtmDUx5xFxb4+kokve29ro/yDY/dIDi2NcRN+0RXeVf/iF8XlVrwadnwQFFIpS+3pv
	tJGV5yhr1dLZQUPSCP8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nBfAD-001CXj-Jk; Sun, 23 Jan 2022 15:52:22 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nBf1W-0019Px-GB
 for linux-mtd@lists.infradead.org; Sun, 23 Jan 2022 15:43:23 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id EDAF1FF802;
 Sun, 23 Jan 2022 15:43:19 +0000 (UTC)
Date: Sun, 23 Jan 2022 16:43:18 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
Cc: <richard@nod.at>, <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] mtd: rawnand: Remove of_get_nand_on_flash_bbt()
 wrapper
Message-ID: <20220123164250.6ff0e49e@xps13>
In-Reply-To: <20220106131610.225661-1-tudor.ambarus@microchip.com>
References: <20220106131610.225661-1-tudor.ambarus@microchip.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220123_074322_737683_19FE60FB 
X-CRM114-Status: UNSURE (   6.41  )
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

SGkgVHVkb3IsCgp0dWRvci5hbWJhcnVzQG1pY3JvY2hpcC5jb20gd3JvdGUgb24gVGh1LCA2IEph
biAyMDIyIDE1OjE2OjA5ICswMjAwOgoKPiBSZW1vdmUgdGhlIHdyYXBwZXIgYXMgaXQgaGlkZXMg
Zm9yIG5vIHJlYXNvbiB3aGF0IHdlIHJlYWxseSB3YW50OiBmaW5kIGFuCj4gb2ZfcHJvcGVydHku
IFJlbW92aW5nIHRoZSB3cmFwcGVyIG1ha2VzIHRoZSBjb2RlIGVhc2llciB0byByZWFkLgo+IAo+
IFNpZ25lZC1vZmYtYnk6IFR1ZG9yIEFtYmFydXMgPHR1ZG9yLmFtYmFydXNAbWljcm9jaGlwLmNv
bT4KClNlcmllcyBhcHBsaWVzIHRvIG5hbmQvbmV4dC4KClRoYW5rcywKTWlxdcOobAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1U
RCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
