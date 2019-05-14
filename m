Return-Path: <SRS0=Ul+2=TO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4144FC04AB4
	for <linux-mtd@archiver.kernel.org>; Tue, 14 May 2019 07:41:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 133042086A
	for <linux-mtd@archiver.kernel.org>; Tue, 14 May 2019 07:41:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VwiJQEq+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 133042086A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7I5p3pwNKVhVzlIWrHUM9kcw6FOr04lvEId1yP6uChA=; b=VwiJQEq+5yUv5f
	4neXve4i7cF3gV/29sNBsaC0a2AjR3bquqLxMepV/vlFSJgxuuzSmpUDrrFVh4/RILUEwgFD/V/To
	Lxpz+boy409IW4nLPNRPu+BMzZsGZYECkSKAn58DLJzh4AqU4cQrLX7BYaWXykPVDyHaQF89x956A
	SXJTc03VIEo7cyn3goODqJGEhV0qs1iJERuk77x+k25DblvgYyXQu90bOhemlwgE/aE6emZL3VPkz
	daQj7Z8zBfMO6oYFuPvJutAL2gFWFvMHNU6hzI7rOe9tEYg/eDs6q4OCBxp/3m47qgJqbyWE7uZDm
	LxtLu8TQZE7sHBhuihzQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hQS3q-0003DT-47; Tue, 14 May 2019 07:41:18 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQS3n-0003Cl-7I
 for linux-mtd@lists.infradead.org; Tue, 14 May 2019 07:41:17 +0000
X-Originating-IP: 80.12.43.150
Received: from windsurf.home (unknown [80.12.43.150])
 (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 6019D4000C;
 Tue, 14 May 2019 07:41:01 +0000 (UTC)
Date: Tue, 14 May 2019 09:41:00 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: masonccyang@mxic.com.tw
Subject: Re: [PATCH v1] mtd: rawnand: Add Macronix NAND read retry support
Message-ID: <20190514094100.34d2a6ba@windsurf.home>
In-Reply-To: <OFB5D53BFC.6B44E7E0-ON482583FA.00090982-482583FA.000A5E93@mxic.com.tw>
References: <1557474062-4949-1-git-send-email-masonccyang@mxic.com.tw>
 <20190510153704.33de9568@windsurf.home>
 <OF1EDBA487.7723094D-ON482583F9.00297ABF-482583F9.0029E3EE@mxic.com.tw>
 <20190513114059.3934b0bb@windsurf.home>
 <OFB5D53BFC.6B44E7E0-ON482583FA.00090982-482583FA.000A5E93@mxic.com.tw>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190514_004115_410446_CA1555E0 
X-CRM114-Status: GOOD (  10.79  )
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
Cc: bbrezillon@kernel.org, juliensu@mxic.com.tw, richard@nod.at,
 linux-kernel@vger.kernel.org, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 computersforpeace@gmail.com, dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello,

On Tue, 14 May 2019 09:53:16 +0800
masonccyang@mxic.com.tw wrote:

> > > -------------------------------------------------------------------
> > >  static void macronix_nand_onfi_init(struct nand_chip *chip)
> > >  {
> > >           struct nand_parameters *p = &chip->parameters;
> > >           struct nand_onfi_vendor_macronix *mxic = (void 
> > > *)p->onfi->vendor;  
> > 
> > Why cast to void*, instead of casting directly to struct
> > nand_onfi_vendor_macronix * ?  
> 
> Due to got a warning:
> 
>  warning: initialization from incompatible pointer type
>   struct nand_onfi_vendor_macronix *mxic = p->onfi->vendor;

You didn't look at my code, I suggested:

	mxic = (struct nand_onfi_vendor_macronix *) p->info->vendor;

I.e, you indeed still need a cast, because p->info->vendor is a u8[].
But instead of casting to void*, and then implicitly casting to struct
nand_onfi_vendor_macronix *, I suggest to cast directly to struct
nand_onfi_vendor_macronix *.

> > >           if (!p->onfi ||
> > >               ((mxic->reliability_func & MACRONIX_READ_RETRY_BIT) ==   
> 0))
> > >                   return;  
> > 
> > So, the code should be:
> > 
> >    struct nand_onfi_vendor_macronix *mxic;
> > 
> >    if (!p->onfi)
> >       return;
> > 
> >    mxic = (struct nand_onfi_vendor_macronix *) p->info->vendor;
> > 
> >    if ((mxic->reliability_func & MACRONIX_READ_RETRY_BIT) == 0)
> >       return;  
> 
> Also got a warning:
> 
> warning: ISO C90 forbids mixed declarations and code 
> [-Wdeclaration-after-statement]

No, you don't get this warning if you use my code. You get this warning
if you declare and initialized the "mxic" variable at the same location.

>  static void macronix_nand_onfi_init(struct nand_chip *chip)
>  {
>          struct nand_parameters *p = &chip->parameters;
>          struct nand_onfi_vendor_macronix *mxic = (void *)p->onfi->vendor;

You are dereferencing p->info...

> 
>          if (!p->onfi)
>                  return;

... before you check it is NULL. This is wrong.

Please check again the code I sent in my previous e-mail:

    struct nand_onfi_vendor_macronix *mxic;
 
    if (!p->onfi)
       return;
 
    mxic = (struct nand_onfi_vendor_macronix *) p->info->vendor;
 
    if ((mxic->reliability_func & MACRONIX_READ_RETRY_BIT) == 0)
       return;  

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
