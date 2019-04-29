Return-Path: <SRS0=nQMH=S7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66E6AC43219
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Apr 2019 08:09:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 381F320652
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Apr 2019 08:09:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PVBumO5f"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 381F320652
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=udVbYMR5SyEjpCshdV8eRGBWE0N5FVvqYwGO9aLdFHk=; b=PVBumO5fyFSdQK
	qLPZCOt+KmjaPIX9v3t8/+uwDcx14ZBx0OXZQxQuwSKIIV8QlSfvutuYIVhPXlJyK/6LmKSD+7g/6
	9mdCbGRFloAc00qdCE6EuYhNcunI8CmIi4eSuS/v9ltbI856Dl/9EKTAHUdF6r2yi6KxZcFeqM5rt
	tHWLfc/5rM5aFCdzWCk1x5ODeGSOeAg7sQ+wsBbWSQED2qt5zNnrAaFpm+gzMjWmJAiXLXSxy5xMI
	lu09jPYotbvVpN27S61qmXf/5GRVWhsNFOI0KqOx3h/Gt880p6t8SuXz405FhGiXP635SIIdQTJqX
	OfVD0IpLvdWeRl0bViYg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hL1Lb-0004aW-KU; Mon, 29 Apr 2019 08:09:11 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hL1LZ-0004aE-8E
 for linux-mtd@lists.infradead.org; Mon, 29 Apr 2019 08:09:10 +0000
X-Originating-IP: 90.88.147.33
Received: from xps13 (aaubervilliers-681-1-27-33.w90-88.abo.wanadoo.fr
 [90.88.147.33]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 421F71C0003;
 Mon, 29 Apr 2019 08:08:54 +0000 (UTC)
Date: Mon, 29 Apr 2019 10:08:53 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Helmut Grohne <helmut.grohne@intenta.de>
Subject: Re: [LINUX PATCH v14] mtd: rawnand: pl353: Add basic driver for arm
 pl353 smc nand interface
Message-ID: <20190429100853.028815d6@xps13>
In-Reply-To: <20190425112338.dipgmqqfuj45gx6s@laureti-dev>
References: <1555326613-26739-1-git-send-email-naga.sureshkumar.relli@xilinx.com>
 <20190425112338.dipgmqqfuj45gx6s@laureti-dev>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190429_010909_446034_83FD551E 
X-CRM114-Status: UNSURE (   5.07  )
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
Cc: Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>,
 bbrezillon@kernel.org, richard@nod.at, linux-kernel@vger.kernel.org,
 marek.vasut@gmail.com, linux-mtd@lists.infradead.org,
 nagasureshkumarrelli@gmail.com, michals@xilinx.com,
 computersforpeace@gmail.com, dwmw2@infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgSGVsbXV0LAoKSGVsbXV0IEdyb2huZSA8aGVsbXV0Lmdyb2huZUBpbnRlbnRhLmRlPiB3cm90
ZSBvbiBUaHUsIDI1IEFwciAyMDE5CjEzOjIzOjM5ICswMjAwOgoKPiBXaXRob3V0IG11Y2gga25v
d2xlZGdlIG9mIHRoZSBuYW5kIGZyYW1ld29yaywgSSBhdHRlbXB0ZWQgcmV2aWV3aW5nIHRoZQo+
IGNvZGUuIEhvcGUgdGhpcyBoZWxwcy4KCkl0IGRvZXMgaGVscCBhIGxvdCwgdGhhbmtzIGZvciB5
b3VyIHRpbWUhCgpNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
