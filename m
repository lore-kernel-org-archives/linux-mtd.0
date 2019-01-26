Return-Path: <SRS0=SfKP=QC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33BCFC282C7
	for <linux-mtd@archiver.kernel.org>; Sat, 26 Jan 2019 16:55:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC74921872
	for <linux-mtd@archiver.kernel.org>; Sat, 26 Jan 2019 16:55:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QlZDSG1f";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="DGeHc5v5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EC74921872
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NYsRl2QYKjp+hgBxKOJMUyeG4ySoFpIN8JbsK9GfSKc=; b=QlZDSG1fAVYhFF
	5Ag/PR5ZYXmIdzM94UOSKJQ2tax7al3WLE7juIVt8W+m6j63wyO0LhXQcZGxb+Im///2lwNMt+UdD
	+n9fam3Mq2958HdJ7V4kIJ27Pl31I2E9MHz+iIR8WR0nAu9W87X4CEdWt+TJKwK1uQwBYO+v2X6n8
	krkUIYgLtk0XV8ZzaSLgZkVfPKcyBM4wLMy9vfvxOV7BNTqPANE/tdF+fnUsRdVvswkQ+L+CmWLA5
	viYDUCiApkF7TpQaFnxYmcc+vYb3krpWLiE+dsZOG8udi6hMlbUrH7AlGS+EPSjVdLkDMVjm7BhU5
	4kJVQzq8VEgPh94zbNeg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gnREQ-0007YN-3h; Sat, 26 Jan 2019 16:54:58 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gnREC-0007NN-A6; Sat, 26 Jan 2019 16:54:45 +0000
Received: from bbrezillon (unknown [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 66E9621872;
 Sat, 26 Jan 2019 16:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1548521681;
 bh=U97JhAc67TlIoQxUSKMiEuA/BMeDSBdzpp3PIvkto18=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=DGeHc5v5OwpsLrtBKuw5LKAZtnbOM1h3gUlVB+JpQVIoI9ZFI388RiN1YZs2GYCUc
 NH1xt5YrV0NkoLod8XeOTNgAUbQM66STTm60psyzC9xptsRDww83fVfCdNNjACkiOa
 k87uIPS9qbh24NlaJ9ZDpSTWSCC5Bxu3pFRuRvlo=
Date: Sat, 26 Jan 2019 17:54:29 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: Re: [PATCH] mtd: rawnand: mark expected switch fall-throughs
Message-ID: <20190126175429.65e6bfd8@bbrezillon>
In-Reply-To: <853a267c-807b-c613-6662-93730a0b4c33@embeddedor.com>
References: <20190125210950.GA27855@embeddedor>
 <20190126105208.221a2051@bbrezillon>
 <853a267c-807b-c613-6662-93730a0b4c33@embeddedor.com>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190126_085444_366529_B1C7853A 
X-CRM114-Status: GOOD (  14.58  )
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
Cc: Kees Cook <keescook@chromium.org>, Wan ZongShun <mcuos.com@gmail.com>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Marek Vasut <marek.vasut@gmail.com>, Kyungmin Park <kyungmin.park@samsung.com>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sat, 26 Jan 2019 07:48:50 -0600
"Gustavo A. R. Silva" <gustavo@embeddedor.com> wrote:

> Hey Boris,
> 
> On 1/26/19 3:52 AM, Boris Brezillon wrote:
> > On Fri, 25 Jan 2019 15:09:50 -0600
> > "Gustavo A. R. Silva" <gustavo@embeddedor.com> wrote:
> >   
> >> diff --git a/drivers/mtd/nand/raw/nandsim.c b/drivers/mtd/nand/raw/nandsim.c
> >> index 933d1a629c51..d33e15dc4cdc 100644
> >> --- a/drivers/mtd/nand/raw/nandsim.c
> >> +++ b/drivers/mtd/nand/raw/nandsim.c
> >> @@ -2251,9 +2251,10 @@ static int __init ns_init_module(void)
> >>  
> >>  	switch (bbt) {
> >>  	case 2:
> >> -		 chip->bbt_options |= NAND_BBT_NO_OOB;
> >> +		chip->bbt_options |= NAND_BBT_NO_OOB;
> >> +		/* fall through */
> >>  	case 1:
> >> -		 chip->bbt_options |= NAND_BBT_USE_FLASH;
> >> +		chip->bbt_options |= NAND_BBT_USE_FLASH;  
> > 
> > You miss a '/* fall through */' here.
> >   
> 
> Not really.  Notice that in this case the code falls through
> to a break statement.

Still find it weird to mandate fall through comments in all cases but
this one...

> 
> >>  	case 0:
> >>  		break;
> >>  	default:  
> 
> Thanks
> --
> Gustavo
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
