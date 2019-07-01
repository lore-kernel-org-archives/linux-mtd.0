Return-Path: <SRS0=0U+/=U6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D39AC5B578
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Jul 2019 07:12:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0231120663
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Jul 2019 07:12:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KmgbqmC6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0231120663
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VyVciMpL4u+SXLryeFIEcEIeuz4kyoVj0Srd0cdclfk=; b=KmgbqmC6qHhmz2
	dPtr3xcEsuw0NPpOV2+cKBHyMk6LkB9YeJtTWml2Sp9pbYXs6IWsAIlFgbAkAAfNdL5qNlYak/Piq
	lXwZMupMciCRCG7rNrA0qaIFZrzpzmP4QqIuzLXQ6aXdxCEnjGr9m0Eyw0eLAiYx3s1TcRC926gQe
	FiZOSSSPrxUtVWSaMAY/0vws5rqWcisz9s3feDwi23em6qYce5quU3eG2jCI37GODZ3u6jR6qC42e
	vosX4Ric36PKGo0Jhct4P4Ram7nlEvB7HWtDfhtTbpCw6XGFa9xYyiHlAcnVt+zd5iAyL+pWZMOsf
	aB5Ia6n5NoHE7zrtmJNg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hhqUW-00012U-2H; Mon, 01 Jul 2019 07:12:44 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hhqUT-0000zR-4n
 for linux-mtd@lists.infradead.org; Mon, 01 Jul 2019 07:12:42 +0000
X-Originating-IP: 86.250.200.211
Received: from xps13 (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 662FA20010;
 Mon,  1 Jul 2019 07:12:32 +0000 (UTC)
Date: Mon, 1 Jul 2019 09:12:30 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Kamal Dasu <kdasu.kdev@gmail.com>
Subject: Re: [PATCH v2 1/3] mtd: nand: raw: brcmnand: Refactored code to
 introduce helper functions
Message-ID: <20190701091230.25443a5f@xps13>
In-Reply-To: <1559659013-34502-1-git-send-email-kdasu.kdev@gmail.com>
References: <1559659013-34502-1-git-send-email-kdasu.kdev@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190701_001241_342396_49972977 
X-CRM114-Status: UNSURE (   7.38  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 bcm-kernel-feedback-list@broadcom.com, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgS2FtYWwsCgpLYW1hbCBEYXN1IDxrZGFzdS5rZGV2QGdtYWlsLmNvbT4gd3JvdGUgb24gVHVl
LCAgNCBKdW4gMjAxOSAxMDozNjoyOQotMDQwMDoKCj4gUmVmYWN0b3JlZCBOQU5EIEVDQyBhbmQg
Q01EIGFkZHJlc3MgY29uZmlndXJhdGlvbiBjb2RlIHRvIHVzZSBoZWxwZXIKPiBmdW5jdGlvbnMu
Cj4gCj4gU2lnbmVkLW9mZi1ieTogS2FtYWwgRGFzdSA8a2Rhc3Uua2RldkBnbWFpbC5jb20+Cj4g
LS0tCgpBcHBsaWVkIHRvIG5hbmQvbmV4dCwgdGhhbmtzLgoKTWlxdcOobAoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
