Return-Path: <SRS0=Gd7z=SS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 428F8C10F13
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Apr 2019 21:53:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0FBEA2173C
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Apr 2019 21:53:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qyXaaynV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0FBEA2173C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IaepDnaqxdMswEZIE8k40ZUkt+1msrUHFvHOCqSh7gM=; b=qyXaaynVhx5Sbw
	QMngSxT7HjDXassRb2kh/UWMcn4oHKedzuSERbXPW4A5a82ihLM5uCix/dTmLFWRKOFPA5Lfum5/0
	XTkh9vqrV3rZBzmc7qxe+d+/OPmVLWm56Klgqw+dnnnyMlcJ7TBR6xA/eFt62xYywaF0zU+zW4/g1
	Fl66n6G/woboIA3JdhL9WyH94LTwpnekOw3QUa4o45ccqtoTY/rWQeisnNcMDl553nKGopzWLi6Ah
	3jlWIleZCDS4ymogMMfaKfFNRPJ0bzXZ9iTvsT0wum3t/wEUUuZFABH/xL5urHOQRX1ABHZSRtcei
	uRT2LcRplnul2Ndrjcng==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hGW1G-0007se-Dz; Tue, 16 Apr 2019 21:53:34 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGW1C-0007s2-FQ
 for linux-mtd@lists.infradead.org; Tue, 16 Apr 2019 21:53:31 +0000
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 6B355200009;
 Tue, 16 Apr 2019 21:53:24 +0000 (UTC)
Date: Tue, 16 Apr 2019 23:53:22 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Anders Roxell <anders.roxell@linaro.org>
Subject: Re: [PATCH 1/2] mtd: nand: Kconfig: correct the MTD_NAND_ECC_SW_BCH
 select
Message-ID: <20190416235322.3b88df99@xps13>
In-Reply-To: <20190410195852.4066-1-anders.roxell@linaro.org>
References: <20190410195852.4066-1-anders.roxell@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190416_145330_665684_0A7F1C3F 
X-CRM114-Status: UNSURE (   7.28  )
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
Cc: bbrezillon@kernel.org, richard@nod.at, linux-kernel@vger.kernel.org,
 marek.vasut@gmail.com, linux-mtd@lists.infradead.org,
 computersforpeace@gmail.com, dwmw2@infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgQW5kZXJzLAoKQW5kZXJzIFJveGVsbCA8YW5kZXJzLnJveGVsbEBsaW5hcm8ub3JnPiB3cm90
ZSBvbiBXZWQsIDEwIEFwciAyMDE5CjIxOjU4OjUxICswMjAwOgoKPiBDb25maWcgZnJhZ21lbnRz
IHNob3VsZCBub3QgaGF2ZSB0aGUgcHJlZml4ICdDT05GSUdfJy4KPiAKPiBSZXdvcmsgdG8gcmVt
b3ZlIHRoZSBwcmVmaXggJ0NPTkZJR18nIGZyb20gJ0NPTkZJR19NVERfTkFORF9FQ0NfU1dfQkNI
Jy4KPiAKPiBGaXhlczogNTFlZjFkMGIyMDk1ICgibXRkOiBuYW5kOiBDbGFyaWZ5IEtjb25maWcg
ZW50cnkgZm9yIHNvZnR3YXJlIEJDSCBFQ0MgYWxnb3JpdGhtIikKPiBTaWduZWQtb2ZmLWJ5OiBB
bmRlcnMgUm94ZWxsIDxhbmRlcnMucm94ZWxsQGxpbmFyby5vcmc+Cj4gLS0tCgpUaGFua3MgZm9y
IGJvdGggcGF0Y2hlcywgZG8geW91IG1pbmQgaWYgSSBzcXVhc2ggdGhlc2Ugd2l0aCB0aGUgZmF1
bHR5CmNvbW1pdHMgd2hpY2ggYXJlIHN0aWxsIGluIG5hbmQvbmV4dD8KClRoYW5rcywKTWlxdcOo
bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
