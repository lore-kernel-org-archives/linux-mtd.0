Return-Path: <SRS0=x2+d=ZK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8439C432C0
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Nov 2019 11:47:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8BCFC20748
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Nov 2019 11:47:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Z73wZfwk";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="feKrCvQ/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8BCFC20748
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+tMABAzgZLA688KCrrEx6NYIcDo9VnphDNWFIOiGyVQ=; b=Z73wZfwkwhkNXg
	4y2jtc7ntmMfUX1h75P0p4ylYDap/waBbaTBFRWnow4sL8ly+lqbmWUIw88R1DBI5RBIc3/qPjWhI
	NoUKH8tFdwSTsxZJkgBDRFXtx0TlfZBltWUWEHrYF09of0Ho82qBXoCNF53rNgc6Qz/Yd0UBKr4xz
	SRo/P3hlIgpPs5PcEn8HTrLIJ49maJHsGn9X7i+Fyon6t4TzGjsmK1F/TRO557jTi84ocGZVpBRqW
	1yT/INZtgyoLG1OESfVOtkcPQdO2zVj6l89+iDwjkzfZtzJOkkF8A9d72bC/ag4MH7IE2FE+xXaji
	Cxi8xPRW0T5KgYqElpwA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iWfUm-000626-0j; Mon, 18 Nov 2019 11:47:04 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iWfUj-00061Y-SR
 for linux-mtd@lists.infradead.org; Mon, 18 Nov 2019 11:47:03 +0000
Received: from localhost (unknown [89.205.134.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3FB5820730;
 Mon, 18 Nov 2019 11:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1574077621;
 bh=kDnVWqM8rv4v0DFbARQKnL4pnCPNws5EF5tS19PJ2+o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=feKrCvQ/m8Ef+oJobtODMFU/XcxXBRqauk0eAksInQzk60LFEAgNKobEQ/8djXNv5
 SdqcRwonoa3KFQt2IANfPfJy1hUC6al1156N2ZzeXxFqzBcrATsNn3ry8d6fDDotjk
 aJ+T9NNv1Sxv4LKP2WJOIGl1ohIEsJFHgpW31F1E=
Date: Mon, 18 Nov 2019 12:46:57 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Subject: Re: [PATCH v2] {tty: serial, nand: onenand}: samsung: rename to fix
 build warning
Message-ID: <20191118114657.GA228826@kroah.com>
References: <20191117202435.28127-1-sudipm.mukherjee@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191117202435.28127-1-sudipm.mukherjee@gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191118_034701_938301_6A8E8A6F 
X-CRM114-Status: GOOD (  14.18  )
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
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-kernel@vger.kernel.org,
 Kyungmin Park <kyungmin.park@samsung.com>, linux-mtd@lists.infradead.org,
 linux-serial@vger.kernel.org, Jiri Slaby <jslaby@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sun, Nov 17, 2019 at 08:24:35PM +0000, Sudip Mukherjee wrote:
> Any arm config which has 'CONFIG_MTD_ONENAND_SAMSUNG=m' and
> 'CONFIG_SERIAL_SAMSUNG=m' gives a build warning:
> 
> warning: same module names found:
>   drivers/tty/serial/samsung.ko
>   drivers/mtd/nand/onenand/samsung.ko
> 
> Rename both drivers/tty/serial/samsung.c to
> drivers/tty/serial/samsung_tty.c and drivers/mtd/nand/onenand/samsung.c
> drivers/mtd/nand/onenand/samsung_mtd.c to fix the warning.
> 
> Signed-off-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
> ---
> 
> v1: only renamed drivers/tty/serial/samsung.c
> link: https://lore.kernel.org/lkml/20191018194707.27188-1-sudipm.mukherjee@gmail.com
> 
> v2: rename both files.
> 
> I was not sure if this should have been two different patch, but since
> this will be fixing the same problem so it seems its better to have them
> in a single patch.
> 
>  drivers/mtd/nand/onenand/Makefile                     | 2 +-
>  drivers/mtd/nand/onenand/{samsung.c => samsung_mtd.c} | 0
>  drivers/tty/serial/Makefile                           | 2 +-
>  drivers/tty/serial/{samsung.c => samsung_tty.c}       | 0
>  4 files changed, 2 insertions(+), 2 deletions(-)
>  rename drivers/mtd/nand/onenand/{samsung.c => samsung_mtd.c} (100%)
>  rename drivers/tty/serial/{samsung.c => samsung_tty.c} (100%)

I can take this in the tty tree if the mtd maintainer gives an ack for
it...


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
