Return-Path: <SRS0=dr6A=FL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83487C433FE
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Dec 2020 11:11:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1BE18206CB
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Dec 2020 11:11:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1BE18206CB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GBFEDFL5NqHDnLk1LhwtJLUyN8OeIlT+AZsJlhwJblM=; b=p91ZS5UZXYU/4LhsloOFDfjiJ
	gmPOpS8VCKq8jFVC+sVWcbzY4jTPOWfff5tZQEW1PHJkL+0og0VfIx8AbZt+HcsHeOmFAHxGaxsiH
	JjItr0YutBFfhlEF/i5CXbf9ax3R5CzWzMpKnLXKja7WtJFfsJ/ll3IG8yhHGC+uAdMmgaU4NriCe
	84fJkTupBqCGkg5md2NpoQNBI6Cdq3Joq1Uit/sRZaB3ksxx4sG9DBOCf5lkUqCZZEu9rA2wofFgK
	2+7d6prifG6vqufEl8wXmKw5nNf0GSDdIX2REKaxLX6EMHBlf1ofcrq7RxXh8WY4nDaaHdoC1knsS
	ARVcj8iEQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmEPg-00042o-V7; Mon, 07 Dec 2020 11:10:41 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmEPL-0003tg-Vk
 for linux-mtd@lists.infradead.org; Mon, 07 Dec 2020 11:10:21 +0000
Received: from xps13 (lfbn-tou-1-1617-103.w109-220.abo.wanadoo.fr
 [109.220.208.103]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 4D3BF240016;
 Mon,  7 Dec 2020 11:10:17 +0000 (UTC)
Date: Mon, 7 Dec 2020 12:10:16 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Thirumalesha Narasimhappa <nthirumalesha7@gmail.com>
Subject: Re: [PATCH v7 1/2] mtd: spinand: micron: Generalize the structure
 names
Message-ID: <20201207121016.3b6d986b@xps13>
In-Reply-To: <20201108113735.2533-2-nthirumalesha7@gmail.com>
References: <20201108113735.2533-1-nthirumalesha7@gmail.com>
 <20201108113735.2533-2-nthirumalesha7@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201207_061020_212531_4ED99A79 
X-CRM114-Status: UNSURE (   8.71  )
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
 linux-kernel@vger.kernel.org, Boris Brezillon <boris.brezillon@collabora.com>,
 linux-mtd@lists.infradead.org, Chuanhong Guo <gch981213@gmail.com>,
 Shivamurthy Shastri <sshivamurthy@micron.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgVGhpcnVtYWxlc2hhLAoKVGhpcnVtYWxlc2hhIE5hcmFzaW1oYXBwYSA8bnRoaXJ1bWFsZXNo
YTdAZ21haWwuY29tPiB3cm90ZSBvbiBTdW4sICA4Ck5vdiAyMDIwIDE5OjM3OjM0ICswODAwOgoK
PiBSZW5hbWUgdGhlIHJlYWQvd3JpdGUvdXBkYXRlIG9mIFNQSU5BTkRfT1BfVkFSSUFOVFMoKSB0
byBhIGdlbmVyaWMgbmFtZXMKCkkgYXBwbGllZCB0aGlzIHBhdGNoIHdpdGggYSBtaW5vciBjaGFu
Z2U6IGl0J3Mgbm90IGEgZ2VuZXJhbGl6YXRpb24gb2YKdGhlIG5hbWUsIGJ1dCBxdWl0ZSB0aGUg
b3Bwb3NpdGUuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
