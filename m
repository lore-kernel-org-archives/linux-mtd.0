Return-Path: <SRS0=LhK/=CQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB64CC2BB84
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Sep 2020 07:24:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 344BF20757
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Sep 2020 07:24:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AQjU0TNm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 344BF20757
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Mv0iJTnveVuXx9lBJa7pZ3vcQ0jz4vumPgVXNdqnbSw=; b=AQjU0TNmrQSs3XA1pZYLO3vCF
	npVM7A1wD7MAbcSV4x+REamWOiVcrUmFIqY8RcgwtaZbs6mtHoN5FXg1zLxxZ9hMQ7ZpU2eRp2v7D
	A33tetw5QoJYNGb9QRHrZQfJDFKxarapA+fD5pGJZkds3vxlWggDm8EIJ0UdGAXWBmFbt4eBilUo5
	Nr/wDILxq//IIW7UpzuOe35YyI+MET1aeihQnq/0XRfcpaTNhk9p4GHokSsxoScqbJIcktCPxJrEN
	xDpKuaADDNiY1Zm6fr+k2zx4qA4TRhVTuPuMZFUU2Y48LIQbXkO89Hl8qzKLwypelCbanSk3vMMew
	gU0WomIMQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFBUf-0002v8-Jq; Mon, 07 Sep 2020 07:23:13 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFBUK-0002ki-AG
 for linux-mtd@lists.infradead.org; Mon, 07 Sep 2020 07:22:58 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id C9FF320008;
 Mon,  7 Sep 2020 07:22:49 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>, miquel.raynal@bootlin.com,
 boris.brezillon@collabora.com
Subject: Re: [PATCH v5 4/6] mtd: rawnand: atmel: Use nand_prog_page_end_op()
Date: Mon,  7 Sep 2020 09:22:48 +0200
Message-Id: <20200907072248.3952-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200720131356.1579073-5-tudor.ambarus@microchip.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: 8bda001490cdd205bd2872c446270960d61affa0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200907_032252_516132_8BD54D33 
X-CRM114-Status: UNSURE (   8.02  )
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
Cc: alexandre.belloni@bootlin.com, linux-mtd@lists.infradead.org,
 ludovic.desroches@microchip.com, nicolas.ferre@microchip.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, 2020-07-20 at 13:13:54 UTC, Tudor Ambarus wrote:
> From: Boris Brezillon <boris.brezillon@collabora.com>
> 
> The nand_prog_page_end_op() sequence is open-coded in
> atmel_hsmc_nand_pmecc_write_pg(). Let's use the generic helper here.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
