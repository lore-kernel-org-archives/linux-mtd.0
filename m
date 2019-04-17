Return-Path: <SRS0=Bfvl=ST=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A35A4C10F12
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Apr 2019 10:29:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6DCBF2173C
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Apr 2019 10:29:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Hhjg1FLn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="WCMIE56k"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6DCBF2173C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+OcPF+dJ+vPv+AmybYsd5vbO/5JYkZY/uDGBDCtSM5k=; b=Hhjg1FLnMDmIn/
	GmGkiJeBtLfCxtd2QQHdMXmM6llG+8WH0HKZp8YTF4Hu1LXB2S5BkHvr/ZPp6UGMz/Va1tlQhQMxP
	cpjXe6cunqLKeTeZkQHGmSI/AdVO6skVk+72LeJrwZ2BiBjxjFGenbAHiG5ZweeU8A6jChgV0lFOn
	Ob/8lFv1BdxwxmgUfKvoY2FYYC/T2LwNRAnMJ3WSOqBHdT+m75TQaVIrWdepBZLivRKQGHzkfHObN
	WqgETrkgrJ3G1fjs2LulagDaHwfmsh7nRbU3WHFhOnH7ApxvAiucRkUQB5U0J2ByYtmfkcTlXJ3EM
	pJyNcYabs5SAqZR+vJTA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hGhp7-00041Y-Lh; Wed, 17 Apr 2019 10:29:49 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGhp6-00041P-9L
 for linux-mtd@bombadil.infradead.org; Wed, 17 Apr 2019 10:29:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VOHBhjGs/NEJpizQC7oUcjuyffK68o6MsDtF+aAIl0c=; b=WCMIE56kDbG4RT3rt775D9nE6e
 qAbItzTZ9GT05UPXSy7Zz+4ot7hOOZoqkTU9NmsFDNJTyiuHa/YPqoAAEiZEINqYN5gtugqkZr/E+
 psYnf2Zt/FJda6cKQvXi1IZEUfGUoNiThH6msqAWCRMooQ1+pFTmYIi05ML4+l8OG1iwfsovIv8SO
 bgoR70n3J4ZJj6rprOG/cJ4+Irmbt6eTnGsKhSHGkfTV0AF4LWuzoNbHgkV6oLQFnAdFuvqvavY6n
 sZTEXCjlfdCKRkqqQ+C8A+LczPQbEwrWKzIlTsSE/q/4ZQZI8wNKTpaapvzFaCgGj3Mg0z3+b4mMZ
 Ejvf8BEw==;
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGhp3-0001E4-AO
 for linux-mtd@lists.infradead.org; Wed, 17 Apr 2019 10:29:47 +0000
X-Originating-IP: 90.88.160.238
Received: from xps13 (aaubervilliers-681-1-42-238.w90-88.abo.wanadoo.fr
 [90.88.160.238]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 7397A1BF204;
 Wed, 17 Apr 2019 10:28:53 +0000 (UTC)
Date: Wed, 17 Apr 2019 12:28:52 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH 11/14] mtd: rawnand: gpmi: drop unnecessary flag
Message-ID: <20190417122852.31a5be35@xps13>
In-Reply-To: <20190409113421.3037-12-s.hauer@pengutronix.de>
References: <20190409113421.3037-1-s.hauer@pengutronix.de>
 <20190409113421.3037-12-s.hauer@pengutronix.de>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190417_112945_446385_C7478065 
X-CRM114-Status: UNSURE (   6.70  )
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
biBUdWUsICA5IEFwciAyMDE5CjEzOjM0OjE4ICswMjAwOgoKPiBUaGUgRE1BX1BSRVBfSU5URVJS
VVBUIGZsYWcgaXMgbm8gbG9uZ2VyIG5lZWRlZCBieSB0aGUgbXhzIGRtYSBkcml2ZXIsCj4gZHJv
cCBpdC4KPiAKCnMvZG1hL0RNQS8/CgpPdGhlcndpc2UKClJldmlld2VkLWJ5OiBNaXF1ZWwgUmF5
bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgoKPiBTaWduZWQtb2ZmLWJ5OiBTYXNjaGEg
SGF1ZXIgPHMuaGF1ZXJAcGVuZ3V0cm9uaXguZGU+Cj4gLS0tCgpUaGFua3MsCk1pcXXDqGwKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
