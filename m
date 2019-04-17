Return-Path: <SRS0=Bfvl=ST=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B16FC10F12
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Apr 2019 10:29:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 14CBB2173C
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Apr 2019 10:29:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZA9v34fy";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ZHDqtpkJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 14CBB2173C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=itaRVmYyh5/L5zzQ5FvlYGIcetRjtBjZ6HiHSpTVaNM=; b=ZA9v34fy9uZSYs
	EeBwe9sGwhumfM0rnsYzkjt95hUTa6mYUeekJdEM387jdHFoIhP5dlRiMcL6BUYhqIYBRB6AL0Sk9
	B/7OmaykrBZ57YWjtvbvpwVLp19EJ5FA8pJNB+YpssUCYtNQ42dOdq0UE0kSnQyMqyH0RU1DPyNrT
	c94kSjbulNywhBJuzWenoAtfOk7QZq8gF+DtENnozxG2P374YS2JbDvCg9um2l5tvV9gxnIisJl+o
	QAjXkHzOjWkJepdCm15oY+V1COeVXeKWQLZY7c1w43jmuC9g2H4wBiIbFtUHj/iZT5H95tZnSGOrW
	GaTM+F/2/m8ZonF0cUxg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hGhoS-0003iL-8h; Wed, 17 Apr 2019 10:29:08 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGhoQ-0003iE-Tf
 for linux-mtd@bombadil.infradead.org; Wed, 17 Apr 2019 10:29:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zyeJQhOnst+U5Rj1k9XD/f3lvXsheoKhMwVuIFpyODM=; b=ZHDqtpkJtKHeEBf+TbSvOxUPCA
 SMOO1oej1pJ86u4LzIP57Ap+mROl1XE2I+yZ/tlbp9m5+db0KgVjCsjoOOPViMIPnBQRo3ScVw13s
 4x2K2SiUCBuG0zXMDDgDBNbiPxBzw2CDJ2NtNTdlFOlFLCXgWZeSt5/0wApe8nQ5oviEwgTbP+tHw
 bKYaUI9TryJHQFt+gJq8DsT2V1fvkRrY2K0VFdWQ7BFWUfNZlBjdJIk2D1F6HW+1dngId3ZSyJIuT
 acstHiq9r/uB2cl1xCg4Kx+L0in8Z94ghtQxbna7bnnT0B0GTSonRtiZPVJGmcGeJymvseWNjVeJ5
 PLdPxxag==;
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGhoM-000875-Kx
 for linux-mtd@lists.infradead.org; Wed, 17 Apr 2019 10:29:04 +0000
Received: from xps13 (aaubervilliers-681-1-42-238.w90-88.abo.wanadoo.fr
 [90.88.160.238]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 3ED12200015;
 Wed, 17 Apr 2019 10:28:19 +0000 (UTC)
Date: Wed, 17 Apr 2019 12:28:18 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH 09/14] mtd: rawnand: gpmi: use runtime PM to manage clocks
Message-ID: <20190417122818.287614d7@xps13>
In-Reply-To: <20190409113421.3037-10-s.hauer@pengutronix.de>
References: <20190409113421.3037-1-s.hauer@pengutronix.de>
 <20190409113421.3037-10-s.hauer@pengutronix.de>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190417_062902_847728_67090D6E 
X-CRM114-Status: UNSURE (   7.58  )
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
biBUdWUsICA5IEFwciAyMDE5CjEzOjM0OjE2ICswMjAwOgoKPiBUaGUgZ3BtaSBkcml2ZXIgYWdn
cmVzc2l2ZWx5IGVuL2Rpc2FibGVzIHRoZSBjbG9ja3MgYmV0d2VlbiBvcGVyYXRpb25zCj4gd2hp
Y2ggaGFzIHNpZ25pZmljYW50IHBlcmZvcm1hbmNlIGNvc3QuIFVzZSBydW50aW1lIFBNIHRvIGdl
dCByaWQgb2YKPiB0aGlzIGJvdHRsZW5lY2suCj4gCj4gU2lnbmVkLW9mZi1ieTogU2FzY2hhIEhh
dWVyIDxzLmhhdWVyQHBlbmd1dHJvbml4LmRlPgo+IC0tLQoKUmV2aWV3ZWQtYnk6IE1pcXVlbCBS
YXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+CgoKVGhhbmtzLApNaXF1w6hsCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
