Return-Path: <SRS0=6Wn1=P7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B6CDC282C0
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Jan 2019 17:23:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E0393204EC
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Jan 2019 17:23:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="I8b2xMNJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E0393204EC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=marcant.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aSXjR1s2tCKVwub61buFF0DCKkswfZm5/UsTMl+pdss=; b=I8b2xMNJ/KwGvF
	up+z8kVO/EhvLFytRPHih2tHZcb8N9CR23VHZcrlnhSFlZ4nAVJJ11aMJ/Sq2VWWL9GKXsCwK3XnT
	gtdmffqNdxqT3v/ZrWFLxcx/muNvhPcKRbOLrd5GaQhvmciC/mlcvrNjCbw7ZLI2kO1BnDcw9WMZ/
	gKvuYZn38vmnv6D8WMwOs9Gmp/3YToaxUsOIyO+7xfGfBdylA+xN6PrD62p/0GWgYByg5wu8F8NYT
	EKi0wgN4f28o6nPMCtGQ4yqQZqE0XXWWSSBNMClNQWEB9LszE13XyijK9Np8Pi0cMUNA8CvT/Cx0Y
	fFP4K1WNXMuwCIqAho7g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gmMFh-0003iz-9F; Wed, 23 Jan 2019 17:23:49 +0000
Received: from mail3.marcant.net ([217.14.160.188])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gmMFe-0003iX-1c
 for linux-mtd@lists.infradead.org; Wed, 23 Jan 2019 17:23:48 +0000
Received: from [192.168.180.1] (port=43708 helo=admins.marcant.net)
 by mail3.marcant.net with esmtp (Exim 4.82_1-5b7a7c0-XX)
 (envelope-from <avalentin@marcant.net>)
 id 1gmMFI-0007SY-2K; Wed, 23 Jan 2019 18:23:24 +0100
Received: from vmh.kalnet.hooya.de (unknown [192.168.203.15])
 by admins.marcant.net (Postfix) with ESMTP id 5CBD6280189;
 Wed, 23 Jan 2019 18:23:24 +0100 (CET)
From: =?UTF-8?q?Andr=C3=A9=20Valentin?= <avalentin@marcant.net>
To: avalentin@marcant.net, hauke@hauke-m.de, marek.vasut@gmail.com,
 dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@bootlin.com, richard@nod.at, miyatsu@qq.com
Subject: [PATCH] mtd: spi-nor: Add support for mx25u3235f
Date: Wed, 23 Jan 2019 18:22:32 +0100
Message-Id: <20190123172231.17972-1-avalentin@marcant.net>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190123_092346_231313_C5B73C75 
X-CRM114-Status: UNSURE (   7.19  )
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
Cc: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

VGhlIG14MjV1MzIzNWYgaXMgZm91bmQgb24gdGhlIFp5WEVMIE5CRzY4MTcgcm91dGVyLCB0aGVy
ZWZvcmUKYWRkIGRyaXZlciBzdXBwb3J0IGZvciBpdCBzbyB0aGF0IHdlIGNhbiB1cHN0cmVhbSBi
b2FyZCBzdXBwb3J0LgoKU2lnbmVkLW9mZi1ieTogQW5kcsOpIFZhbGVudGluIDxhdmFsZW50aW5A
bWFyY2FudC5uZXQ+Ci0tLQogZHJpdmVycy9tdGQvc3BpLW5vci9zcGktbm9yLmMgfCAyICsrCiAx
IGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQv
c3BpLW5vci9zcGktbm9yLmMgYi9kcml2ZXJzL210ZC9zcGktbm9yL3NwaS1ub3IuYwppbmRleCA2
ZTEzYmJkMWFhYTUuLjA0ZGQ1MTAwZTQ0NSAxMDA2NDQKLS0tIGEvZHJpdmVycy9tdGQvc3BpLW5v
ci9zcGktbm9yLmMKKysrIGIvZHJpdmVycy9tdGQvc3BpLW5vci9zcGktbm9yLmMKQEAgLTE4MzYs
NiArMTgzNiw4IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZmxhc2hfaW5mbyBzcGlfbm9yX2lkc1td
ID0gewogCXsgIm14MjVsMzI1NWUiLCAgSU5GTygweGMyOWUxNiwgMCwgNjQgKiAxMDI0LCAgNjQs
IFNFQ1RfNEspIH0sCiAJeyAibXgyNWw2NDA1ZCIsICBJTkZPKDB4YzIyMDE3LCAwLCA2NCAqIDEw
MjQsIDEyOCwgU0VDVF80SykgfSwKIAl7ICJteDI1dTIwMzNlIiwgIElORk8oMHhjMjI1MzIsIDAs
IDY0ICogMTAyNCwgICA0LCBTRUNUXzRLKSB9LAorCXsgIm14MjV1MzIzNWYiLAkgSU5GTygweGMy
MjUzNiwgMCwgNjQgKiAxMDI0LCAgNjQsIAorCQkJIFNFQ1RfNEsgfCBTUElfTk9SX0RVQUxfUkVB
RCB8IFNQSV9OT1JfUVVBRF9SRUFEKSB9LAogCXsgIm14MjV1NDAzNSIsICAgSU5GTygweGMyMjUz
MywgMCwgNjQgKiAxMDI0LCAgIDgsIFNFQ1RfNEspIH0sCiAJeyAibXgyNXU4MDM1IiwgICBJTkZP
KDB4YzIyNTM0LCAwLCA2NCAqIDEwMjQsICAxNiwgU0VDVF80SykgfSwKIAl7ICJteDI1dTY0MzVm
IiwgIElORk8oMHhjMjI1MzcsIDAsIDY0ICogMTAyNCwgMTI4LCBTRUNUXzRLKSB9LAotLSAKMi4y
MC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
