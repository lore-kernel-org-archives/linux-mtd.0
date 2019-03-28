Return-Path: <SRS0=odZH=R7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8EFCC43381
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Mar 2019 10:30:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B7D5C206B6
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Mar 2019 10:30:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mI5httCG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B7D5C206B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=doHW+X3wek7fatvL+Ghx0SOMb6YBtyhzZGHjar3gyOE=; b=mI5httCGU46WKR
	zS7NPMLJr1wdPGEuXn3lMGoXuMQhFlH0nFYLyQzPGdzcS+OWdV8xNTJ82A0Y+bZVDZld64LQLPCwb
	wXsJk95bXTuOSuNThEcq15XngV7tfsG9vdUjk+lPhFC7qrhITU0v8UTR/Y6G3VfCNISezBlvg2+3+
	g64vM1LygtRNOtm3cUOztw8LcUVCg2eTrstxvSPFzxW+X15hkM7aTKUso8cDLVVlUwbJfZtCCYfUv
	BUGu1FXf5kyXLsPlrw+yf9pXAiunUyCtoOPNqqUh6tovYIuiJajYVxxW2WW8eD66OTQg35nRTESLn
	qbS/f3ScIs0KVdrwYyFw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9SJ3-0003pE-Rh; Thu, 28 Mar 2019 10:30:45 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9SIx-0003oB-TA
 for linux-mtd@lists.infradead.org; Thu, 28 Mar 2019 10:30:43 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 306A22820C7;
 Thu, 28 Mar 2019 10:30:34 +0000 (GMT)
Date: Thu, 28 Mar 2019 11:30:30 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH] MAINTAINERS: Add myself as co-maintainer for MTD
Message-ID: <20190328113030.777abc92@collabora.com>
In-Reply-To: <20190325094846.30709-1-vigneshr@ti.com>
References: <20190325094846.30709-1-vigneshr@ti.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190328_033040_079610_E10D577E 
X-CRM114-Status: GOOD (  19.40  )
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
Cc: Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, 25 Mar 2019 15:18:46 +0530
Vignesh Raghavendra <vigneshr@ti.com> wrote:

> I have been contributing and reviewing MTD patches for a while now and
> would like to add myself as co-maintainer for MTD to help maintain
> CFI and SPI NOR parts of the subsystem.
> Hopefully, this will help in taking some load off current maintainers.

Thanks for doing that.

Acked-by: Boris Brezillon <boris.brezillon@collabora.com>

> 
> Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3453f397ad87..d950fa01d829 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -10014,6 +10014,7 @@ M:	Brian Norris <computersforpeace@gmail.com>
>  M:	Boris Brezillon <bbrezillon@kernel.org>
>  M:	Marek Vasut <marek.vasut@gmail.com>
>  M:	Richard Weinberger <richard@nod.at>
> +M:	Vignesh Raghavendra <vigneshr@ti.com>
>  L:	linux-mtd@lists.infradead.org
>  W:	http://www.linux-mtd.infradead.org/
>  Q:	http://patchwork.ozlabs.org/project/linux-mtd/list/


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
