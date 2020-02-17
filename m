Return-Path: <SRS0=B4Yk=4F=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D349BC7619F
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Feb 2020 09:04:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A3E0120718
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Feb 2020 09:04:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="i+SHPpE2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A3E0120718
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cgMyZpOTJMiuynQsU25E2gBvKU/QQlR85J1KxHmK8jk=; b=i+SHPpE2DYo8Hp
	JMMmco2su4wZR/LuwB5kB1LvBl0Zg4glyF4yK0vqgyxfBWfIyJrei542sbn5yho+ws3PHS7L2kAnb
	yrtksZx7404Defl+JZeUzkz4hDQmCITsbABoxCFLB/Cr8KuMKI6r910Dg4Vc78wlPgZpF5OYo0rkm
	mu/rGUNMy8IJEJHIgof/WCAd/9GQucMgaQQbZWUbmiKIIMfbL8yofW19NbAMEbS5h+vBQogwV4fB2
	xWsu4fDwjMQZnhQmzExn11hYpKKqt2qSKy8ZajOa/HBlrmZD+0JjV3qf/Lv/b50rtZ49ki2zDwpRx
	rbd8jy4rxQmWtd6DmRyQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j3cKS-00024P-BC; Mon, 17 Feb 2020 09:04:36 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j3cKO-00023u-Rb
 for linux-mtd@lists.infradead.org; Mon, 17 Feb 2020 09:04:34 +0000
X-Originating-IP: 90.76.211.102
Received: from xps13 (lfbn-tou-1-1151-102.w90-76.abo.wanadoo.fr
 [90.76.211.102]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id C25D3FF805;
 Mon, 17 Feb 2020 09:04:30 +0000 (UTC)
Date: Mon, 17 Feb 2020 10:04:30 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Yoshio Furuyama <ytc-mb-yfuruyama7@kioxia.com>
Subject: Re: [PATCH] mtd: spinand: toshiba: Support for new Kioxia Serial NAND
Message-ID: <20200217100430.420142a3@xps13>
In-Reply-To: <1581907305-3606-1-git-send-email-ytc-mb-yfuruyama7@kioxia.com>
References: <1581907305-3606-1-git-send-email-ytc-mb-yfuruyama7@kioxia.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200217_010433_032561_B15E3A4B 
X-CRM114-Status: UNSURE (   7.26  )
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
Cc: linux-mtd@lists.infradead.org, vigneshr@ti.com,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgWW9zaGlvLAoKWW9zaGlvIEZ1cnV5YW1hIDx5dGMtbWIteWZ1cnV5YW1hN0BraW94aWEuY29t
PiB3cm90ZSBvbiBNb24sIDE3IEZlYgoyMDIwIDExOjQxOjQ1ICswOTAwOgoKPiBGcm9tOiBZb3No
aW8gRnVydXlhbWEgPHRtY21jLW1iLXlmdXJ1eWFtYTdAbWwudG9zaGliYS5jby5qcD4KPiAKPiBB
ZGQgc3VwcG9ydCBmb3IgbmV3IEtpb3hpYSBwcm9kdWN0cy4KPiBUaGUgbmV3IEtpb3hpYSBwcm9k
dWN0cyBzdXBwb3J0IHByb2dyYW0gbG9hZCB4NCBjb21tYW5kLCBhbmQgaGF2ZSBIT0xEX0QgYml0
Cj4gd2hpY2ggaXMgZXF1aXZhbGVudCB0byBRRSBiaXQuCj4gQWxzbywgZ2VuZXJhbGl6ZSBwcmVm
aXggbmFtZXMgb2Ygc3RydWN0dXJlcyBhbmQgZnVuY3Rpb25zLgoKV291bGQgeW91IG1pbmQgc3Bs
aXR0aW5nIHRoaXMgcGF0Y2g/CgoxLyBSZW5hbWUgdGhlIGN1cnJlbnQgZnVuY3Rpb25zIChhbmQg
ZXhwbGFpbiB3aHkpCjIvIEFkZCBuZXcgS2lveGlhIHBhcnRzIHN1cHBvcnQuCgpUaGFua3MsCk1p
cXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
