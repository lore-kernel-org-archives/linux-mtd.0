Return-Path: <SRS0=3ySE=X5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9E5AC47404
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Oct 2019 16:09:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7447A20873
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Oct 2019 16:09:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="G6iQUxiZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7447A20873
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VL9rJQtj67TNdhimmXyW6UyV11qrCu4ZSL8ZSc1Oi6M=; b=G6iQUxiZ+wJdLO
	rrD3DKeyjyetkvsjCHuNEVkexW51WEFDedhI7v0TD8HZSzch/dHXr7xN/2J/I0EyEb+1CBSVRLITw
	OxCn1qxwUcrShQwvAzybz9cjzvqwr+2my0XigkSgzq2ZdvdCuVowkdoXzxcIvu1lAg2kWxm5fFMMp
	mpJphqA281FZxKTbiqSw3slVDOaQCgs24+i93Ev7GQ9l38X4Kr8UmFpKAMd9dHRiOCM3gj5GNLiYx
	jfEDbi+oZjxzM7Edwa0XWfNVlbWBHR/XHq3Y39Z721M3ZRES+jfrmmbo5ncL4sNwyIqSpEBJOPQ3q
	6TtzE17r9Snl30UnoMqQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iGQ9P-0007jJ-4W; Fri, 04 Oct 2019 16:09:51 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iGQ9F-0007KR-Vz
 for linux-mtd@lists.infradead.org; Fri, 04 Oct 2019 16:09:43 +0000
Received: from xps13.stephanxp.local (117.105.23.93.rev.sfr.net
 [93.23.105.117]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 275B9240006;
 Fri,  4 Oct 2019 16:09:32 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tudor.Ambarus@microchip.com, vigneshr@ti.com, miquel.raynal@bootlin.com,
 richard@nod.at, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, john.garry@huawei.com
Subject: Re: [PATCH] mtd: spi-nor: Fix direction of the write_sr() transfer
Date: Fri,  4 Oct 2019 18:09:21 +0200
Message-Id: <20191004160921.6721-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191004104746.23537-1-tudor.ambarus@microchip.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: 41e086e1550646344dd47d3462ca2d19caabb943
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191004_090942_174338_C81F43E9 
X-CRM114-Status: UNSURE (   5.26  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, 2019-10-04 at 10:47:55 UTC,  wrote:
> From: Tudor Ambarus <tudor.ambarus@microchip.com>
> 
> write_sr() sends data to the SPI memory, fix the direction.
> 
> Fixes: b35b9a10362d ("mtd: spi-nor: Move m25p80 code in spi-nor.c")
> Reported-by: John Garry <john.garry@huawei.com>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> Tested-by: John Garry <john.garry@huawei.com>
> Acked-by: Vignesh Raghavendra <vigneshr@ti.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/fixes, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
