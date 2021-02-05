Return-Path: <SRS0=fkbb=HH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7797C433DB
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Feb 2021 13:57:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 43A5E64FC0
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Feb 2021 13:57:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 43A5E64FC0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SqIvdwh7G3YKm4a3Q+xJk5Uum38Tj6HNGKsqQyweh0Y=; b=TIvq5nHHkm1+35V9ubKVriFVO
	aRNS/mIZUMBZb5JFa/SMqiqLZ5kccWLTfR1052MHu1tYLC3xAvlqKdCwMEhlT/HLNx7oDLB5r1Qje
	SrtxLNxWzKBUJ0WuNpuWNBHEgiBPFP6Dhg+sJQ5r4b7WWgbfb6NljuawR3zuEiae7r6GIqj3AA6CO
	y8YEsMkkDh1ljaM39gQrOF1DqRTUegSEv9aCM5VcXT0R8lyU5V8eEI9mmmSI6IHVfj3nlvghxFOWB
	ev4q21CI4pvpWbRhMxwjm45dSgsz3xYhlMCGlfNg39NydVaSOHAUFoOqNIWtareTkiJ7b+8RtxMyx
	qk9Q0GZLA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l81bu-0005yM-Ce; Fri, 05 Feb 2021 13:57:22 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l81br-0005wk-2o
 for linux-mtd@lists.infradead.org; Fri, 05 Feb 2021 13:57:20 +0000
X-Originating-IP: 90.89.227.234
Received: from xps13 (lfbn-tou-1-1424-234.w90-89.abo.wanadoo.fr
 [90.89.227.234]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 3637960005;
 Fri,  5 Feb 2021 13:57:17 +0000 (UTC)
Date: Fri, 5 Feb 2021 14:57:16 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Bhaskar Chowdhury <unixbhaskar@gmail.com>
Subject: Re: [PATCH] drivers: mtd: Better word replace a not so good word in
 the file mtd_blkdevs.c
Message-ID: <20210205145716.4083e083@xps13>
In-Reply-To: <YB1J53adyW4BBK3g@ArchLinux>
References: <20210205124151.1386271-1-unixbhaskar@gmail.com>
 <20210205142618.116852a0@xps13> <YB1J53adyW4BBK3g@ArchLinux>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210205_085719_253197_A574DB64 
X-CRM114-Status: GOOD (  20.87  )
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
Cc: richard@nod.at, rdunlap@infradead.org, linux-mtd@lists.infradead.org,
 vigneshr@ti.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Bhaskar,

Bhaskar Chowdhury <unixbhaskar@gmail.com> wrote on Fri, 5 Feb 2021
19:06:39 +0530:

> On 14:26 Fri 05 Feb 2021, Miquel Raynal wrote:
> >Hi Bhaskar,
> >
> >Bhaskar Chowdhury <unixbhaskar@gmail.com> wrote on Fri,  5 Feb 2021
> >18:11:51 +0530:
> >  
> >> s/fucking/invite/
> >>
> >>
> >> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
> >> ---
> >>  drivers/mtd/mtd_blkdevs.c | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
> >> index fb8e12d590a1..756a0995e474 100644
> >> --- a/drivers/mtd/mtd_blkdevs.c
> >> +++ b/drivers/mtd/mtd_blkdevs.c
> >> @@ -523,7 +523,7 @@ int register_mtd_blktrans(struct mtd_blktrans_ops *t  
> r)
> >>  	int ret;
> >>
> >>  	/* Register the notifier if/when the first device type is
> >> -	   registered, to prevent the link/init ordering from fucking
> >> +	   registered, to prevent the link/init ordering from invite
> >>  	   us over. */  
> >
> >invite us over?
> >
> >I'm not a native English speaker but this does not bring any value to
> >my ears. Worse, I don't even get the point. Better rewrite the comment
> >entirely than just swapping "fucking" with a random word, no?
> >  
> Got your point , and I do understand "fuck" and "fucking" is so strong word
> that it is really difficult to replace with something else.
> 
> But..but you suggestion to rewrite the comments sounds good Miquel ...wish I
> could have that much time in hand to replace every sentence having that word
> ...all the patched sent with that word replaces...please step forward and
>  make
> and send patches .
> 
> Today I sent 10 patches replacing that word(weather that make sense or not)
> you can see those in the ML ...please pick up as you wish and send patches.

There are currently 21 uses of "fuck[ing]". It's not a mountain to
climb. Nor a race.

> I was simply replacing the word ..never bother about the meaning it
> conveys..doesn't matter really.

Are you kidding? What is the purpose of a comment if no one understands
it after a blind change?

> 
> so...
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
