Return-Path: <SRS0=cI5g=QH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C488FC169C4
	for <linux-mtd@archiver.kernel.org>; Thu, 31 Jan 2019 17:27:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 91C322086C
	for <linux-mtd@archiver.kernel.org>; Thu, 31 Jan 2019 17:27:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CtqmHw1J";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="lQlmALGr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 91C322086C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7/jaXu2IXMSbjUY4V+IVomWcvCq8icYgObbVXLOTS9g=; b=CtqmHw1JhjySsX
	GpSgLFi2bUqi5USZh1UzW3xv41qnUBsMq4wJOXsyBmirhzckpexOF1hPZPbsBzQ4PWKgM0nCO3uDf
	bYQumcV6E8Xk5Q7ortwpD6PwW8yAYggsHD82meIzYZqmbxYcDX8fiTwIHfl2a7ESfVUjxL7WinhVZ
	HbGDI2brPE5A78gDK1Ezc38/RKWD2xrA0VQr0jbBixX82GX/9rZKyboeJOhJWbha/fN/bFlpjnl48
	iUAJZooMUP12OH7jG2kY1RCbavO+uLeYTwLGz3ZAoe7RyXyj+BqgPP6/c//7og3re95PM6cCpef0B
	VQJq9UOBh/Be9YOfYcWA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gpG79-0004qn-L1; Thu, 31 Jan 2019 17:26:59 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gpG76-0004qN-GS
 for linux-mtd@lists.infradead.org; Thu, 31 Jan 2019 17:26:57 +0000
Received: from bbrezillon (91-160-177-164.subs.proxad.net [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 525DE2086C;
 Thu, 31 Jan 2019 17:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1548955616;
 bh=hoVKnWiEPCXYjt8XO0AVUKrPsNfz8S5p7fA/qbZ/mSc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=lQlmALGr6m+AF2rXvc4pXWUuntU2PV6Ca2YR387qZlPdOEhwQf1sTPOYUQdmoQbJc
 zxShWHDCsbow92FUZFU1XYwtPQ/gkNWWq+oTYaXOjO3mO1pll10VxSUBYi7LTI3iKH
 mFVblEv7x28vID31FHObDylk9Ytos8ivjGeHfvzA=
Date: Thu, 31 Jan 2019 18:26:44 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: Dinh Nguyen <dinguyen@kernel.org>
Subject: Re: [PATCH] mtd: rawnand: denali_dt: remove single anonymous clock
 support
Message-ID: <20190131182644.366a54a5@bbrezillon>
In-Reply-To: <da2ea926-30e9-c7b9-8b1f-ee65ccc0fb7a@kernel.org>
References: <1547539894-12898-1-git-send-email-yamada.masahiro@socionext.com>
 <20190115092229.59e09c2d@xps13>
 <CAK7LNATnfTQXHrXJQp7732-e7hvd8ORcYubyDmz0KHaRXRMDqQ@mail.gmail.com>
 <20190128112007.440046e6@xps13>
 <da2ea926-30e9-c7b9-8b1f-ee65ccc0fb7a@kernel.org>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190131_092656_565752_89DF02AC 
X-CRM114-Status: GOOD (  19.04  )
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
Cc: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Marek Vasut <marek.vasut@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Dinh,

On Thu, 31 Jan 2019 11:24:16 -0600
Dinh Nguyen <dinguyen@kernel.org> wrote:

> On 1/28/19 4:20 AM, Miquel Raynal wrote:
> > Hi Dinh,
> > 
> > Masahiro Yamada <yamada.masahiro@socionext.com> wrote on Wed, 16 Jan
> > 2019 10:27:11 +0900:
> >   
> >> (+CC Dinh Nguyen)
> >>
> >> On Tue, Jan 15, 2019 at 5:22 PM Miquel Raynal <miquel.raynal@bootlin.com> wrote:  
> >>>
> >>> Hi Masahiro,
> >>>
> >>> Masahiro Yamada <yamada.masahiro@socionext.com> wrote on Tue, 15 Jan
> >>> 2019 17:11:34 +0900:
> >>>    
> >>>> Commit 6f1fe97bec34 ("mtd: rawnand: denali_dt: add more clocks based
> >>>> on IP datasheet") introduced a more correct binding that requires
> >>>> three named clocks.
> >>>>
> >>>> Now that all upstream DT files migrated over to it, remove the single
> >>>> anonymous clock support.    
> >>>
> >>> I would love to do that but I think this is against the "DT backward
> >>> compatibility rule".    
> >>
> >> Yeah, I know this rule, but we break DT binding from time to time.
> >>
> >>
> >>  
> >>> Anyway, IIRC it is accepted that this kind of
> >>> rule might be broken if decided per the arch-maintainer (in this
> >>> case, you I suppose). So if this is really what you want, I'll queue
> >>> it.    
> >>
> >> My platform is fine, but this driver is used by SOCFPGA boards as well.
> >>
> >> I CCed the SOCFPGA maintainer, Dinh Nguyen.
> >>  
> > 
> > Gentle ping on this topic.
> >   
> 
> This patch looks fine to be. Feel free to add:
> 
> Tested-by: Dinh Nguyen <dinguyen@kernel.org>

I think Miquel is waiting for an Acked-by to confirm that you're okay
breaking backward compat with old DT.

Regards,

Boris

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
