Return-Path: <SRS0=zMTj=7Q=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8EE0C433DF
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Jun 2020 14:23:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B050520679
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Jun 2020 14:23:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lqBBQrLG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B050520679
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D9cDM5wDzSG0cJV+7i/pAnDs6j3NUoIQytNWjGX3wRM=; b=lqBBQrLGe8oRap
	0+uIzqHH2fZ1jUs7LiNOS1esGi2zpihyTHRBN8o4iYEK0RFGdAayOpQ0w16GqrR5O1ESjCnuB1/Dx
	IN7QedPzqc17YqbXk+3jMvb83xZ29IJaaBY3AjoEitZJ/T+jT+iWN3XX7lOd5s/QWXVh56oi8LESs
	iyYL79We9ZQVEU2hG7N9jgBMy7EvvU+n6dTh1sDPl5pJacCKyZ+5Ckebc1TwjHTFqY6TWiFeVgGN0
	YQLzE8XAc+8jg2gYa2/tjdjDu4tZmFtmyZvIJjfR1awoz0hnC9mQj8HDswhiRvkTeq1B9P2vTA4Ue
	SNyB3+VNrdISVGBvpGDQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jgUIQ-00039P-IV; Wed, 03 Jun 2020 14:23:10 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jgUIM-00037u-Pa; Wed, 03 Jun 2020 14:23:08 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 4CA9A2000F;
 Wed,  3 Jun 2020 14:23:02 +0000 (UTC)
Date: Wed, 3 Jun 2020 16:23:01 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH] mtd: rawnand: mtk: Convert the driver to exec_op()
Message-ID: <20200603162301.705af422@xps13>
In-Reply-To: <20200518170321.321697-1-boris.brezillon@collabora.com>
References: <20200518170321.321697-1-boris.brezillon@collabora.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200603_072306_962324_187019F3 
X-CRM114-Status: UNSURE (   8.16  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 Xiaolei Li <xiaolei.li@mediatek.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGVsbG8sCgpCb3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29tPiB3
cm90ZSBvbiBNb24sIDE4IE1heQoyMDIwIDE5OjAzOjIxICswMjAwOgoKPiBMZXQncyBjb252ZXJ0
IHRoZSBkcml2ZXIgdG8gZXhlY19vcCgpIHRvIGhhdmUgb25lIGxlc3MgZHJpdmVyIHJlbHlpbmcK
PiBvbiB0aGUgbGVnYWN5IGludGVyZmFjZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBCb3JpcyBCcmV6
aWxsb24gPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29tPgo+IC0tLQo+ICBkcml2ZXJzL210
ZC9uYW5kL3Jhdy9tdGtfbmFuZC5jIHwgMTE2ICsrKysrKysrKysrKysrKysrKystLS0tLS0tLS0t
LS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA3MSBpbnNlcnRpb25zKCspLCA0NSBkZWxldGlvbnMoLSkK
CkFueW9uZSB0byB0ZXN0IHRoaXMgc2VyaWVzPwoKSWYgbm90IEkgd2lsbCBhcHBseSBpdCBhcyBz
b29uIGFzIHY1LjgtcmMxIGlzIHJlbGVhc2VkLgoKClRoYW5rcywKTWlxdcOobAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
