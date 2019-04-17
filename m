Return-Path: <SRS0=Bfvl=ST=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47DADC10F12
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Apr 2019 10:24:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 109D420872
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Apr 2019 10:24:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Am73ds2a"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 109D420872
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yHOmUCVr0FQ8FeZ5PHir+7pUK7qpDrFlHsU09z8Wy78=; b=Am73ds2a8L7upM
	uv6ZEj5On0oXMJ0PKJB2cbgV+wUuemrzoI3WJZzHSQuCsJlMjQvgqvEKLA3d7c4ubWIt9RK5igzb+
	WjdEs5qgJ/lmwZJUmuwR3SSgkY2+AAY8g2YE1SbOWDIB2JQ5KZho/3LYMTaPMr5sU85lqnUHr1xK9
	Rbf8cxG/RdKzoePonbw14Vjk42xeroFzpfL+4La8dRcCcmFcEc8eIriE5jIVYmCsLlrR+idx4evrf
	84Qj4LN4/mcyiXuuY7612hjtmcTxFTsinhSMb4pU+37dn/PABD2u3ABbHLpMlB98TxZ8pTDZyjej1
	MGj7M+LFl8L3Gd5YWAeA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hGhjR-0000cx-7u; Wed, 17 Apr 2019 10:23:57 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGhjO-0000cY-Uz
 for linux-mtd@lists.infradead.org; Wed, 17 Apr 2019 10:23:56 +0000
X-Originating-IP: 90.88.160.238
Received: from xps13 (aaubervilliers-681-1-42-238.w90-88.abo.wanadoo.fr
 [90.88.160.238]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 4917CE0003;
 Wed, 17 Apr 2019 10:23:51 +0000 (UTC)
Date: Wed, 17 Apr 2019 12:23:50 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH 03/14] mtd: rawnand: gpmi: move all driver code into
 single file
Message-ID: <20190417122350.57879cd9@xps13>
In-Reply-To: <20190409113421.3037-4-s.hauer@pengutronix.de>
References: <20190409113421.3037-1-s.hauer@pengutronix.de>
 <20190409113421.3037-4-s.hauer@pengutronix.de>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190417_032355_145417_80012703 
X-CRM114-Status: UNSURE (   8.35  )
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
biBUdWUsICA5IEFwciAyMDE5CjEzOjM0OjEwICswMjAwOgoKPiBUaGlzIG1vdmVzIHRoZSB3aG9s
ZSBkcml2ZXIgaW50byBhIHNpbmdsZSBDIGZpbGUuIFRoZSBmaWxlbmFtZSBncG1pLWxpYgo+IGlt
cGxpZXMgdGhhdCBpdCBpbXBsZW1lbnRzIGxpYnJhcnkgZnVuY3Rpb25zLCBidXQgaW4gZmFjdCB0
aGVyZSBhcmUKPiBzZXZlcmFsIGNhc2VzIHdoZXJlIGZ1bmN0aW9ucyBpbiBncG1pLWxpYi5jIGNh
bGwgYmFjayBpbnRvIGZ1bmN0aW9ucyBpbgo+IGdwbWktbmFuZC5jLiBXaXRoIHRoaXMgb25lIGhh
cyB0byBjb25zdGFudGx5IGp1bXAgYmV0d2VlbiB0aG9zZSB0d28KPiBmaWxlcywgc28gbW92aW5n
IGl0IGludG8gYSBzaW5nbGUgZmlsZSBpbXByb3ZlcyByZWFkYWJpbGl0eSwgZXZlbiB3aGVuCj4g
dGhlIGZpbGUgZ2V0cyBxdWl0ZSBsYXJnZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBTYXNjaGEgSGF1
ZXIgPHMuaGF1ZXJAcGVuZ3V0cm9uaXguZGU+Cj4gLS0tCgpSZXZpZXdlZC1ieTogTWlxdWVsIFJh
eW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4KCgpUaGFua3MsCk1pcXXDqGwKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
