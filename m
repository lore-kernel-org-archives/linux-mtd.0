Return-Path: <SRS0=IJcR=NO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CA4CC4338F
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Aug 2021 08:38:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EFD1E61262
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Aug 2021 08:38:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EFD1E61262
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R/fH/m3v3e99pjviWTDeirSESvMrBXlTN/tXDRdosdQ=; b=NlsE2RRie2Fu58
	Xta/6yQRZ6SDAxi/i1sBOn5DTUnQ4fIDix704AbooDjg0q5MTyH5c2OvVdEjD6mpAQoIWBcm0grMw
	3uWSVDjS30wv7ESolo/2ofP6JvSVFKZbK6p3+YSK/+DfmJRmt6X6PgGt+x2I/QPIOgHtNnmXzvIjQ
	4H5Glwgsu1dJd7Q2h1mYqLErUebkpSKUWuySEv1pjpMZ+8aYrdSsGo8V8QR232FIVzqDPU51f0yqW
	9KSKauHH2mj0zm5GCTN7PFTr9q9rlKSPNI9DNVUIwS61pzOfMzBj8lXMBH4TaPk3e8oYbMd4fygzF
	MMEfqfVjSikmocSWiNJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mI5SX-00FxUD-1a; Mon, 23 Aug 2021 08:37:33 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mI5Qf-00Fwp0-7e
 for linux-mtd@lists.infradead.org; Mon, 23 Aug 2021 08:35:38 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 1671A100005;
 Mon, 23 Aug 2021 08:35:33 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 boris.brezillon@collabora.com, lee.jones@linaro.org,
 segher@kernel.crashing.org, dwmw2@infradead.org
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: cafe: Fix a resource leak in the error
 handling path of 'cafe_nand_probe()'
Date: Mon, 23 Aug 2021 10:35:33 +0200
Message-Id: <20210823083533.9576-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <fd313d3fb787458bcc73189e349f481133a2cdc9.1629532640.git.christophe.jaillet@wanadoo.fr>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'cb8c546dce441d53699ce250873b8e805a267686'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210823_013537_469573_406040A5 
X-CRM114-Status: UNSURE (   7.34  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gU2F0LCAyMDIxLTA4LTIxIGF0IDA3OjU4OjQ1IFVUQywgQ2hyaXN0b3BoZSBKQUlMTEVUIHdy
b3RlOgo+IEEgc3VjY2Vzc2Z1bCAnaW5pdF9yc19ub25fY2Fub25pY2FsKCknIGNhbGwgc2hvdWxk
IGJlIGJhbGFuY2VkIGJ5IGEKPiBjb3JyZXNwb25kaW5nICdmcmVlX3JzKCknIGNhbGwgaW4gdGhl
IGVycm9yIGhhbmRsaW5nIHBhdGggb2YgdGhlIHByb2JlLCBhcwo+IGFscmVhZHkgZG9uZSBpbiB0
aGUgcmVtb3ZlIGZ1bmN0aW9uLgo+IAo+IFVwZGF0ZSB0aGUgZXJyb3IgaGFuZGxpbmcgcGF0aCBh
Y2NvcmRpbmdseS4KPiAKPiBGaXhlczogOGM2MWI3YTdmNGQ0ICgiW01URF0gW05BTkRdIFVzZSBy
c2xpYiBmb3IgQ0FGw4kgRUNDIikKPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGhlIEpBSUxMRVQg
PGNocmlzdG9waGUuamFpbGxldEB3YW5hZG9vLmZyPgoKQXBwbGllZCB0byBodHRwczovL2dpdC5r
ZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9tdGQvbGludXguZ2l0IG5hbmQvbmV4
dCwgdGhhbmtzLgoKTWlxdWVsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
