Return-Path: <SRS0=B4Yk=4F=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08354C7619F
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Feb 2020 11:18:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD9BA2070B
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Feb 2020 11:18:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qkFSfmiP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD9BA2070B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T/UdVOZGLQrnM3HpJGyqR+WAbC48i+4iYglrXIwuFwM=; b=qkFSfmiPjny/NS
	8iCCQ0RQEfooeMEqpfOtvovesPDotPw/SV50fqhqqQlXlY2iVCjOgisu8n+yMjUGStvuwk5CE7wLu
	BYWOh56VSxcYXlcaOBIphUZd+5Endc3fDXYtAxUup4I72QchUPqG2KlVpjmtxYyuVeT3Ap/br6RzN
	kI7MYNS8cb0BDxpYdnrnrhv+LxqOr7WHTGrii8fSWjRNCdqrAbVoGBVGuR1vXM7lWBDe5c+AnEb8Y
	TkQ/6mzba2OkqiY+wCpO9rR6oTWdG8BVI2LO1y14NL+TvEpnWr4ySTH07IqwbEVJH2Dz9meRc1xzg
	8pIvFds6kSVd2aOAABzw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j3ePn-0007ny-4U; Mon, 17 Feb 2020 11:18:15 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j3ePk-0007nP-9Z
 for linux-mtd@lists.infradead.org; Mon, 17 Feb 2020 11:18:13 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id F0F8E293121;
 Mon, 17 Feb 2020 11:18:10 +0000 (GMT)
Date: Mon, 17 Feb 2020 12:18:07 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Schrempf Frieder <frieder.schrempf@kontron.de>
Subject: Re: [PATCH 2/3] mtd: spinand: Explicitly use MTD_OPS_RAW to write
 the bad block marker to OOB
Message-ID: <20200217121807.3ac0de4c@collabora.com>
In-Reply-To: <20200211163452.25442-3-frieder.schrempf@kontron.de>
References: <20200211163452.25442-1-frieder.schrempf@kontron.de>
 <20200211163452.25442-3-frieder.schrempf@kontron.de>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200217_031812_461030_4EB99AB7 
X-CRM114-Status: GOOD (  16.79  )
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
Cc: Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 liaoweixiong <liaoweixiong@allwinnertech.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Jeff Kletsky <git-commits@allycomm.com>, Peter Pan <peterpandong@micron.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, 11 Feb 2020 16:35:43 +0000
Schrempf Frieder <frieder.schrempf@kontron.de> wrote:

> From: Frieder Schrempf <frieder.schrempf@kontron.de>
> 
> When writing the bad block marker to the OOB area the access mode
> should be set to MTD_OPS_RAW as it is done for reading the marker.
> Currently this only works because req.mode is initialized to
> MTD_OPS_PLACE_OOB (0) and spinand_write_to_cache_op() checks for
> req.mode != MTD_OPS_AUTO_OOB.
> 
> Fix this by explicitly setting req.mode to MTD_OPS_RAW.
> 
> Fixes: 7529df465248 ("mtd: nand: Add core infrastructure to support SPI NANDs")
> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/mtd/nand/spi/core.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
> index 5d267a67a5f7..925db6269861 100644
> --- a/drivers/mtd/nand/spi/core.c
> +++ b/drivers/mtd/nand/spi/core.c
> @@ -609,6 +609,7 @@ static int spinand_markbad(struct nand_device *nand, const struct nand_pos *pos)
>  		.ooboffs = 0,
>  		.ooblen = 2,
>  		.oobbuf.out = marker,
> +		.mode = MTD_OPS_RAW,
>  	};
>  	int ret;
>  


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
