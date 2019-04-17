Return-Path: <SRS0=Bfvl=ST=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C37A6C10F12
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Apr 2019 10:22:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 89FAD20872
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Apr 2019 10:22:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ruttT5hu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 89FAD20872
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ctkLBskT6sO6TTpPNVOb0ijIv7YRiG0J3/avR2lwlA8=; b=ruttT5hueLwukL
	7LXfPEvn0SDSCW5bt23BchqMwjSE2wSKIEcXu8sRNsNkW/YW3HeDs3ZjONQ48hep54qSzFi83HP+o
	P2wtctb3Kx4at31XtoOVwGqFVdNjWSS2XnOqF3CsaeZXwsim26XqW/U7BdfFshVOXdQSiazlouvKI
	Sg0bvbAURzqnaTz6w5TQC3cCClxseYwB5Ea9azaTb3PgBGgsFawvTK9xBniwq4+nWbO6kbL7de5VZ
	Hr7TFS/tN1iNYG9aekps3Bpk5n6vwuhCrdhJzhwWzPKS1jPVZLTmc3BLsrKM7xAYK3vmVPbjf0Ef+
	wH+2jOGAAKJHdrjLTILQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hGhi8-0008TO-GS; Wed, 17 Apr 2019 10:22:36 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGhi5-0008T0-Lj
 for linux-mtd@lists.infradead.org; Wed, 17 Apr 2019 10:22:34 +0000
X-Originating-IP: 90.88.160.238
Received: from xps13 (aaubervilliers-681-1-42-238.w90-88.abo.wanadoo.fr
 [90.88.160.238]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 257D3FF812;
 Wed, 17 Apr 2019 10:22:29 +0000 (UTC)
Date: Wed, 17 Apr 2019 12:22:29 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH 01/14] mtd: rawnand: export nand operation tracer
Message-ID: <20190417122229.2b7a6a44@xps13>
In-Reply-To: <20190409113421.3037-2-s.hauer@pengutronix.de>
References: <20190409113421.3037-1-s.hauer@pengutronix.de>
 <20190409113421.3037-2-s.hauer@pengutronix.de>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190417_032233_857007_897D7D05 
X-CRM114-Status: UNSURE (   8.51  )
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
biBUdWUsICA5IEFwciAyMDE5CjEzOjM0OjA4ICswMjAwOgoKPiBUaGUgbmFuZCBjb3JlIGhhcyBh
IG5hbmQgb3BlcmF0aW9uIHRyYWNpbmcgZnVuY3Rpb24sIGJ1dCBpdCBjYW4gb25seQoKcy9uYW5k
L05BTkQvIChwbGVhc2UgdXNlIHVwcGVyY2FzZSBpbiBhbGwgeW91ciBjb21taXQgbG9ncykKCj4g
YmUgdXNlZCBieSBkcml2ZXJzIHVzaW5nIHRoZSBnZW5lcmljIG9wdGlvbiBwYXJzZXIgZnJvbSB0
aGUgbmFuZCBjb3JlLgo+IEV4cG9ydCB0aGUgdHJhY2luZyBmdW5jdGlvbiBhcyBhIHN0YXRpYyBp
bmxpbmUgZnVuY3Rpb24gaW4gcmF3bmFuZC5oCj4gc28gdGhhdCBkcml2ZXJzIGltcGxlbWVudGlu
ZyBleGVjX29wIGRpcmVjdGx5IGRvIG5vdCBoYXZlIHRvIHdyaXRlIHRoZWlyCj4gb3duIG9wZXJh
dGlvbiB0cmFjaW5nLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFNhc2NoYSBIYXVlciA8cy5oYXVlckBw
ZW5ndXRyb25peC5kZT4KPiAtLS0KCk90aGVyd2lzZToKClJldmlld2VkLWJ5OiBNaXF1ZWwgUmF5
bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
