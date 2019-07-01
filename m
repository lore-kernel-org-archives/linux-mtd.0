Return-Path: <SRS0=0U+/=U6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56F49C5B578
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Jul 2019 07:11:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E9F6212F5
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Jul 2019 07:11:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eJO+LRpj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="kZgXiFwl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E9F6212F5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xgdu8A6oWWyoNJlLUt2L9UiBQt57Y2yX8H8wxTVdya8=; b=eJO+LRpjglYdqz
	8KA1/ISEwmzspur+/s/ieTYc0uaq3eyQ5KnKbxZGbtMEurykE/B1ba+oDwXWfz7Ca1q+eT/H3uaUZ
	aBHwP7DPnghX4HwGX1DWVeeDMBqjGMDQA/C3byUJfEu5G33YKddddHKhsW4d+fml4F6alPdoWWtJV
	qx4PDu+MFtWzisOEMVGOxsUXumMhlHvWsDpMWixeyYy0dKsos0dmnMGGfKAM0xN0lHTPZBg8OWWV/
	Pn6gbdGE6cVBudV6QFu2rX9MElugKdQhn8HRhYX3TISm3KKfu/PP8KN6J858kTYEBMKKbE89AF2eY
	myNwTTY/um8KqYK6wn0Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hhqSh-0000B2-J4; Mon, 01 Jul 2019 07:10:51 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hhqSc-0000AF-89; Mon, 01 Jul 2019 07:10:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EEP68zDwyPrN704V6W7wZDv5MY+CyjtxVFMvKVCBDf0=; b=kZgXiFwlJPLgyFN+vLQzqWRoam
 136gXuEXEjPt2PEO37C+5ptuxsXUUza4MvDwnoKGkKECWe7zT9AREpx+YTjV7BHAn1zgiFaq+715U
 A4U8jHrau8TO0PiJJWB2rAeGHP3IE5sf5lMwbSUyKLgkv+E2YNS3+K8uITs5l82ZZb45k9HVRciK4
 23ngSpF39yJAY/azdrCiXGjFzdw1extKNQLoLrX7aV906tDkD6+0Tblp8hlduQxMCsyKmOj9wvpwq
 aWr81IyCi41T6h9dfufl+n2Vitgydb9NrLbDMJxOOrn/6j0rCzuzAw6RUT0Tu3JwTIGf9PgoRpv83
 Q+5OBKmA==;
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by merlin.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hhqSY-0004HO-HK; Mon, 01 Jul 2019 07:10:44 +0000
Received: from xps13 (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id C62BC200007;
 Mon,  1 Jul 2019 07:10:02 +0000 (UTC)
Date: Mon, 1 Jul 2019 09:10:01 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: <xiaolei.li@mediatek.com>
Subject: Re: [PATCH v2] mtd: rawnand: mtk: Re-license MTK NAND driver as
 Dual MIT/GPL
Message-ID: <20190701084954.1d590021@xps13>
In-Reply-To: <20190624013856.20732-1-xiaolei.li@mediatek.com>
References: <20190624013856.20732-1-xiaolei.li@mediatek.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
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
Cc: ryder.lee@mediatek.com, arnd@arndb.de, srv_heupstream@mediatek.com,
 richard@nod.at, yellowriver2010@hotmail.com, yamada.masahiro@socionext.com,
 boris.brezillon@collabora.com, linux-mediatek@lists.infradead.org,
 jorge.ramirez-ortiz@linaro.org, rafal@milecki.pl,
 linux-mtd@lists.infradead.org, rogercc.lin@mediatek.com,
 dan.carpenter@oracle.com, matthias.bgg@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgWGlhb2xlaWwsCgo8eGlhb2xlaS5saUBtZWRpYXRlay5jb20+IHdyb3RlIG9uIE1vbiwgMjQg
SnVuIDIwMTkgMDk6Mzg6NTYgKzA4MDA6Cgo+IEZyb206IFhpYW9sZWkgTGkgPHhpYW9sZWkubGlA
bWVkaWF0ZWsuY29tPgo+IAo+IEl0IGlzIHdhbnRlZCB0byB1c2UgTVRLIE5BTkQgZHJpdmVyIHdp
dGggR1BMLTIuMCBvciBNSVQgbGljZW5zZS4KPiBCdXQgbm93IGl0IGlzIG9ubHkgbGljZW5zZWQg
YXMgR1BMLTIuMC4KPiBTbyByZS1saWNlbnNlIGl0IGFzIGR1YWwgTUlUL0dQTCBhbmQgcmVwbGFj
ZSBsaWNlbnNlIHRleHQgd2l0aAo+IFNQRFggdGFnLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFhpYW9s
ZWkgTGkgPHhpYW9sZWkubGlAbWVkaWF0ZWsuY29tPgo+IEFja2VkLWJ5OiBKb3JnZSBSYW1pcmV6
LU9ydGl6IDxqb3JnZS5yYW1pcmV6LW9ydGl6QGxpbmFyby5vcmc+Cj4gQWNrZWQtYnk6IFJ5ZGVy
IExlZSA8cnlkZXIubGVlQG1lZGlhdGVrLmNvbT4KPiBBY2tlZC1ieTogUmFmYcWCIE1pxYJlY2tp
IDxyYWZhbEBtaWxlY2tpLnBsPgo+IEFja2VkLWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5
bmFsQGJvb3RsaW4uY29tPgo+IEFja2VkLWJ5OiBCb3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXpp
bGxvbkBjb2xsYWJvcmEuY29tPgo+IEFja2VkLWJ5OiBXZW4gWWFuZyA8eWVsbG93cml2ZXIyMDEw
QGhvdG1haWwuY29tPgo+IEFja2VkLWJ5OiBEYW4gQ2FycGVudGVyIDxkYW4uY2FycGVudGVyQG9y
YWNsZS5jb20+Cj4gQWNrZWQtYnk6IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+Cj4gQWNr
ZWQtYnk6IE1hc2FoaXJvIFlhbWFkYSA8eWFtYWRhLm1hc2FoaXJvQHNvY2lvbmV4dC5jb20+Cj4g
QWNrZWQtYnk6IFJvZ2VyQ0MgTGluIDxyb2dlcmNjLmxpbkBtZWRpYXRlay5jb20+Cj4gUmV2aWV3
ZWQtYnk6IE1hdHRoaWFzIEJydWdnZXIgPG1hdHRoaWFzLmJnZ0BnbWFpbC5jb20+Cj4gLS0tCgpB
cHBsaWVkIHRvIG5hbmQvbmV4dCwgdGhhbmtzLgpNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24g
bWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbXRkLwo=
