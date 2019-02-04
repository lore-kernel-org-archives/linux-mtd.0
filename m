Return-Path: <SRS0=dO6W=QL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA736C282C4
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Feb 2019 18:05:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9520F2082E
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Feb 2019 18:05:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CxXSFdhF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="aldXwTmK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9520F2082E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+uc4KsWfxnpBr3TIAHJmbtjhutH7bNWV5uXDv+L/XyA=; b=CxXSFdhFL8sQcc
	7kKm3ilMdkReWueJdDs8asypBgjZ00iKjyju8hlJ4fWBuFJVIPZbgUCePEj8V2e/QVs9+MOjx+9oB
	ABk3ZomQFYOxRylhrdAHJyECxu2/K2FtkRLsbUJhnWXUMACdL1AV4EsqUWY0mjURnUVGvG5FPCTo6
	HEaEWYloNusg9451vvThJzlzCHsond6DEGaDp4KZGrz3fnMPmNXJEA629cQAKfIw6XCzc2ZK5tavT
	cpyhPWAmd8DnhlcFpo/ixDUIhWaZgZeQkXcuAUXfekg2ZM9xRX03IQz5YF5mcgRLuZ+L3ePkHCsQq
	1whv9chsuOIeRMaeW56g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gqicy-0006lX-DW; Mon, 04 Feb 2019 18:05:52 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gqicv-0006lC-4p
 for linux-mtd@lists.infradead.org; Mon, 04 Feb 2019 18:05:50 +0000
Received: from bbrezillon (unknown [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8A2DA2082E;
 Mon,  4 Feb 2019 18:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1549303548;
 bh=c5+TyIJxBL/i7gzWS+Obq8HCkhQjP7W6QvPGBw6zdfw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=aldXwTmKeaD8bkhUeLrGGCxWard1w2rFqhk7jRMCnuKjYmMM1NmcUcA2lqvPOTcQh
 JeXBfj2P13kC7aUGfiqbKvwpJSaUG7uGqqBcHbsaAgPIjCVWhAmZpmBAdT7eyFczc7
 QsnaViBLGEn5jlhz5lTz1LnFX+g309KTowAY4HSQ=
Date: Mon, 4 Feb 2019 19:05:43 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: Tokunori Ikegami <ikegami_to@yahoo.co.jp>
Subject: Re: [PATCH v4 02/11] mtd: cfi_cmdset_0002: Remove chip_ready() from
 do_write_buffer()
Message-ID: <20190204190534.456d7bb4@bbrezillon>
In-Reply-To: <20190204173550.29703-3-ikegami_to@yahoo.co.jp>
References: <20190204173550.29703-1-ikegami_to@yahoo.co.jp>
 <20190204173550.29703-3-ikegami_to@yahoo.co.jp>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190204_100549_210819_004E97EB 
X-CRM114-Status: GOOD (  21.89  )
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
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 linux-mtd@lists.infradead.org, Fabio Bettoni <fbettoni@gmail.com>,
 Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue,  5 Feb 2019 02:35:41 +0900
Tokunori Ikegami <ikegami_to@yahoo.co.jp> wrote:

> It is enough to use chip_good() only so chip_ready() is not necessary.
> Since chip_good() is doing the same check chip_ready() is doing plus an extra
> check to make sure we end up with the data we wrote.
> 
> For this change the order to check timeout also will be changed at same time.
> The order is not a hard requirement, it's just better to avoid the case where
> the data update happens just after the timeout has expired.
> 
> Signed-off-by: Tokunori Ikegami <ikegami_to@yahoo.co.jp>

This patch actually fixes a bug (as reported in the other thread), so
please add Fixes and Cc-stable tags and explain why it might cause
an infinite loop in the commit message.

> Cc: Fabio Bettoni <fbettoni@gmail.com>
> Co: Hauke Mehrtens <hauke@hauke-m.de>
> Co: Koen Vandeputte <koen.vandeputte@ncentric.com>
> Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
> Cc: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
> Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
> Cc: linux-mtd@lists.infradead.org
> ---
> Changes since v3:
> - Update the commit message for the comment.
> - Change the email address of Tokunori Ikegami to ikegami_to@yahoo.co.jp.
> 
> Changes since v2:
> - None.
> 
> Changes since v1:
> - None.
> 
>  drivers/mtd/chips/cfi_cmdset_0002.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
> index 91a491b..ca9d5fa 100755
> --- a/drivers/mtd/chips/cfi_cmdset_0002.c
> +++ b/drivers/mtd/chips/cfi_cmdset_0002.c
> @@ -1878,14 +1878,14 @@ static int __xipram do_write_buffer(struct map_info *map, struct flchip *chip,
>  			continue;
>  		}
>  
> -		if (time_after(jiffies, timeo) && !chip_ready(map, adr))
> -			break;
> -
>  		if (chip_good(map, adr, datum)) {
>  			xip_enable(map, chip, adr);
>  			goto op_done;
>  		}
>  
> +		if (time_after(jiffies, timeo))
> +			break;
> +
>  		/* Latency issues. Drop the lock, wait a while and retry */
>  		UDELAY(map, chip, adr, 1);
>  	}


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
