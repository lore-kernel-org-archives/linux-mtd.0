Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7FE6C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Dec 2021 13:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GRCmNCMNNyDqAVjkKtWwa6KhzkplWPko+dvXKEVdHSs=; b=YXjjCgBY9VMOPVGHBS5VBvfDnr
	k7mUSHip1kLNjL2oP5ASfsFWkNTXAnlGMSzu0NOk50fj9A7Lk/+heDj8pbrIlLQGKfmRBlX6rcYRC
	n5urUPfW3oB4ihavcMAYvfDY6ZWG9m+6mJA3qqkBp2+Rp12Y1Fl4teUZmi7A2AedXiyoLfE3zORU7
	dW5OCabZA8UNVkzPKGR7/XpB6L3oU3xHUzXOiaSpx+H+x7J567CVmMDI6J5kAKQPqLIGaQSvYuX5P
	At4s1/m0yBCUtPZco+OGiF0EJ/QxHM08c5weyCezjEzJAr20YEXH1OhYQSuHnCA3cTz0GK0MW7iM3
	PNxA6Yzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzIMh-002SvZ-ON; Mon, 20 Dec 2021 13:06:07 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzIMc-002StG-Mv
 for linux-mtd@lists.infradead.org; Mon, 20 Dec 2021 13:06:05 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 53C87223ED;
 Mon, 20 Dec 2021 14:05:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1640005557;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dTY1s8xROZ8eZkA1A8ctnHjL2GpMHeZVdIQO7kot2X0=;
 b=i5vE1Jo8GK/6GI2L3R56z2AfVIbnr8IAvac2n4bkuLDzPzcfMuE+OqqURvhExSdy+T+cjg
 4lnyOiNJb8KwXlIjf90s8+Hh7MAgn0S3Sb8qe20tqDujXveTPehf1q0dLvmYxPe3fPOaBX
 A9Q6DhxDCnp3s44BxzII7MGnK3Ai+f4=
MIME-Version: 1.0
Date: Mon, 20 Dec 2021 14:05:57 +0100
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 zhuohao@chromium.org, p.yadav@ti.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] mtd: core: Remove partid and partname debugfs files
In-Reply-To: <20211217122636.474976-1-tudor.ambarus@microchip.com>
References: <20211217122636.474976-1-tudor.ambarus@microchip.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <4fb031eee886f1e88b4f0bab6a55c2bd@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211220_050602_963802_71CF180A 
X-CRM114-Status: UNSURE (   9.05  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Am 2021-12-17 13:26, schrieb Tudor Ambarus:
> SPI NOR has equivalent sysfs device attributes, thus let's remove the
> duplicated debugfs entries. There's no one else using partid and 
> partname
> debugfs files, thus remove them from the mtd core as well.
> 
> If you find the idea acceptable, I would like to queue these through
> spi-nor/next, I'll have some other patches that will depend on these.

I'm fine with it.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
