Return-Path: <SRS0=RlT6=RH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37F2BC43381
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Mar 2019 22:31:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0956A20823
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Mar 2019 22:31:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fBB1s+L/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0956A20823
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hXRR2IaMJPQ5/rDitiQreIpGgDSwDxw+XHtHcpOaNGo=; b=fBB1s+L/tXkkeQ
	TqubpqtwQZCLbhax933XITwNQf8mp5RiCCV5Loz/EoOn5x3K/Rwclv3ufT92qfnavJUT5h30I0hMS
	uDO9KHki0ujXFcTFTeLuK5g7r/kyDsazwERk4pm8DWb4accry+WkLu2FTRLMC0FjidtZn7IIeQR07
	ib/4OExWo3yrRMKf6YHspqyp362ntq/d7Fkg7tUJEtPxC0u6QB5jobjCd1x/xYDKtLeLJJM1fK9yN
	SsPGZh1dc2NvWLh6U0n/Fk1cCN4P29Ru3blAuw+YWoFzSgDIGwWDZ/EsBMBxvOjddAAos17Z0SWUj
	L+183Gi35SDfFx+nXIng==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h0w7V-0000JV-9Q; Mon, 04 Mar 2019 22:31:37 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h0w65-0005w7-8K; Mon, 04 Mar 2019 22:30:57 +0000
X-Originating-IP: 90.5.42.199
Received: from localhost.localdomain
 (atoulouse-657-1-1088-199.w90-5.abo.wanadoo.fr [90.5.42.199])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 5936924000B;
 Mon,  4 Mar 2019 22:30:00 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>
Subject: [PATCH v2 15/36] mtd: nand: ecc: Use SPDX license identifier for the
 software BCH code
Date: Mon,  4 Mar 2019 23:28:20 +0100
Message-Id: <20190304222841.13899-16-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190304222841.13899-1-miquel.raynal@bootlin.com>
References: <20190304222841.13899-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190304_143010_210550_A0A3F87F 
X-CRM114-Status: GOOD (  14.73  )
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
Cc: Vignesh R <vigneshr@ti.com>, Tudor Ambarus <tudor.ambarus@microchip.com>,
 Julien Su <juliensu@mxic.com.tw>,
 Schrempf Frieder <frieder.schrempf@kontron.de>,
 Paul Cercueil <paul@crapouillou.net>, linux-mtd@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Mason Yang <masonccyang@mxic.com.tw>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

UmVtb3ZlIHRoZSBsZWdhY3kgbGljZW5zZSB0ZXh0IGFuZCByZXBsYWNlIGl0IHdpdGggdGhlIG5l
dyBzdGFuZGFyZDoKYW4gU1BEWCBsaWNlbnNlIGlkZW50aWZpZXIuCgpTaWduZWQtb2ZmLWJ5OiBN
aXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgotLS0KIGRyaXZlcnMvbXRk
L25hbmQvZWNjL3N3LWJjaC5jICAgICAgIHwgMTUgKy0tLS0tLS0tLS0tLS0tCiBpbmNsdWRlL2xp
bnV4L210ZC9uYW5kLWVjYy1zdy1iY2guaCB8ICA1ICstLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKSwgMTggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQv
bmFuZC9lY2Mvc3ctYmNoLmMgYi9kcml2ZXJzL210ZC9uYW5kL2VjYy9zdy1iY2guYwppbmRleCBi
NjQwZDU3NzEzODIuLjJmOGYzODgzYzhhMyAxMDA2NDQKLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9l
Y2Mvc3ctYmNoLmMKKysrIGIvZHJpdmVycy9tdGQvbmFuZC9lY2Mvc3ctYmNoLmMKQEAgLTEsMjIg
KzEsOSBAQAorLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjArCiAvKgogICogVGhp
cyBmaWxlIHByb3ZpZGVzIEVDQyBjb3JyZWN0aW9uIGZvciBtb3JlIHRoYW4gMSBiaXQgcGVyIGJs
b2NrIG9mIGRhdGEsCiAgKiB1c2luZyBiaW5hcnkgQkNIIGNvZGVzLiBJdCByZWxpZXMgb24gdGhl
IGdlbmVyaWMgQkNIIGxpYnJhcnkgbGliL2JjaC5jLgogICoKICAqIENvcHlyaWdodCDCqSAyMDEx
IEl2YW4gRGplbGljIDxpdmFuLmRqZWxpY0BwYXJyb3QuY29tPgotICoKLSAqIFRoaXMgZmlsZSBp
cyBmcmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3IgbW9kaWZ5IGl0
Ci0gKiB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGFz
IHB1Ymxpc2hlZCBieSB0aGUKLSAqIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbjsgZWl0aGVyIHZl
cnNpb24gMiBvciAoYXQgeW91ciBvcHRpb24pIGFueQotICogbGF0ZXIgdmVyc2lvbi4KLSAqCi0g
KiBUaGlzIGZpbGUgaXMgZGlzdHJpYnV0ZWQgaW4gdGhlIGhvcGUgdGhhdCBpdCB3aWxsIGJlIHVz
ZWZ1bCwgYnV0IFdJVEhPVVQKLSAqIEFOWSBXQVJSQU5UWTsgd2l0aG91dCBldmVuIHRoZSBpbXBs
aWVkIHdhcnJhbnR5IG9mIE1FUkNIQU5UQUJJTElUWSBvcgotICogRklUTkVTUyBGT1IgQSBQQVJU
SUNVTEFSIFBVUlBPU0UuICBTZWUgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlCi0gKiBm
b3IgbW9yZSBkZXRhaWxzLgotICoKLSAqIFlvdSBzaG91bGQgaGF2ZSByZWNlaXZlZCBhIGNvcHkg
b2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGFsb25nCi0gKiB3aXRoIHRoaXMgZmls
ZTsgaWYgbm90LCB3cml0ZSB0byB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uLCBJbmMuLAot
ICogNTkgVGVtcGxlIFBsYWNlLCBTdWl0ZSAzMzAsIEJvc3RvbiwgTUEgMDIxMTEtMTMwNyBVU0Eu
CiAgKi8KIAogI2luY2x1ZGUgPGxpbnV4L3R5cGVzLmg+CmRpZmYgLS1naXQgYS9pbmNsdWRlL2xp
bnV4L210ZC9uYW5kLWVjYy1zdy1iY2guaCBiL2luY2x1ZGUvbGludXgvbXRkL25hbmQtZWNjLXN3
LWJjaC5oCmluZGV4IGE2ODJhMTVmYTE2NS4uMTIxMDdhYTdjMzcxIDEwMDY0NAotLS0gYS9pbmNs
dWRlL2xpbnV4L210ZC9uYW5kLWVjYy1zdy1iY2guaAorKysgYi9pbmNsdWRlL2xpbnV4L210ZC9u
YW5kLWVjYy1zdy1iY2guaApAQCAtMSwxMCArMSw3IEBACisvKiBTUERYLUxpY2Vuc2UtSWRlbnRp
ZmllcjogR1BMLTIuMCAqLwogLyoKICAqIENvcHlyaWdodCDCqSAyMDExIEl2YW4gRGplbGljIDxp
dmFuLmRqZWxpY0BwYXJyb3QuY29tPgogICoKLSAqIFRoaXMgcHJvZ3JhbSBpcyBmcmVlIHNvZnR3
YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3IgbW9kaWZ5Ci0gKiBpdCB1bmRlciB0
aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIHZlcnNpb24gMiBhcwot
ICogcHVibGlzaGVkIGJ5IHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb24uCi0gKgogICogVGhp
cyBmaWxlIGlzIHRoZSBoZWFkZXIgZm9yIHRoZSBOQU5EIEJDSCBFQ0MgaW1wbGVtZW50YXRpb24u
CiAgKi8KIAotLSAKMi4xOS4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
