Return-Path: <SRS0=/Eax=6V=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F8C6C38A24
	for <linux-mtd@archiver.kernel.org>; Thu,  7 May 2020 06:48:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D7C1E2078C
	for <linux-mtd@archiver.kernel.org>; Thu,  7 May 2020 06:48:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="e5Otwceu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D7C1E2078C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0RfsJF6sgtD/BdHehdz1OKg92sHmXXFO/cMwY5+X7ss=; b=e5OtwceuoDZYkC
	nMoquuy8b6uYKrXRoSzJLHhDRxOApkSwFRMh5C6vLkWBWZeFA+AphQbsttBq4DxQmDDRvItNTK+wk
	NzQIkfH5/cbeigChu7XsWYncCKZdFDQ0pW87soYRVD33pLzucqDffaEjMjjQtzEhlaI85gJddUxfZ
	KsOaEODdRv/o7haGIjM+OUW2IBO90nLE+Zmvz2KrOu/GiJObLk1Nmi/mFpSpT1TjyytUI0N08AdJW
	oZ6/4Eg49MioqzTtQmGcKNiYsRerQKttfBTyXwE+MH7sL95RBinOZ+KWEqBNvCsBg7xFI4EiH5rTE
	Mt2kD/poDdt8wHAe4hbw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWaKm-000101-Hz; Thu, 07 May 2020 06:48:40 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWaKj-0000z8-QI
 for linux-mtd@lists.infradead.org; Thu, 07 May 2020 06:48:39 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 4FF7D2A27B2;
 Thu,  7 May 2020 07:48:34 +0100 (BST)
Date: Thu, 7 May 2020 08:48:31 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: "Ramuthevar, Vadivel MuruganX"
 <vadivel.muruganx.ramuthevar@linux.intel.com>
Subject: Re: [PATCH v5 2/2] mtd: rawnand: Add NAND controller support on
 Intel LGM SoC
Message-ID: <20200507084831.1483b19a@collabora.com>
In-Reply-To: <69a06362-1f9d-bf65-4a9b-98fc6b63a391@linux.intel.com>
References: <20200507001537.4034-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200507001537.4034-3-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200507072831.1bf7f784@collabora.com>
 <440c0002-e572-7b8b-ba08-773932370eb0@linux.intel.com>
 <20200507082730.6425cd96@collabora.com>
 <69a06362-1f9d-bf65-4a9b-98fc6b63a391@linux.intel.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200506_234837_982836_9428EC42 
X-CRM114-Status: GOOD (  22.39  )
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
Cc: cheol.yong.kim@intel.com, devicetree@vger.kernel.org, qi-ming.wu@intel.com,
 anders.roxell@linaro.org, vigneshr@ti.com, arnd@arndb.de,
 hauke.mehrtens@intel.com, richard@nod.at, brendanhiggins@google.com,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com, tglx@linutronix.de,
 masonccyang@mxic.com.tw, andriy.shevchenko@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, 7 May 2020 14:38:52 +0800
"Ramuthevar, Vadivel MuruganX"
<vadivel.muruganx.ramuthevar@linux.intel.com> wrote:

> Hi Boris,
> 
>    Thank you very much for the review comments and your time...
> 
> On 7/5/2020 2:27 pm, Boris Brezillon wrote:
> > On Thu, 7 May 2020 14:13:42 +0800
> > "Ramuthevar, Vadivel MuruganX"
> > <vadivel.muruganx.ramuthevar@linux.intel.com> wrote:
> >   
> >> Hi Boris,
> >>
> >>      Thank you very much for the review comments and your time...
> >>
> >> On 7/5/2020 1:28 pm, Boris Brezillon wrote:  
> >>> On Thu,  7 May 2020 08:15:37 +0800
> >>> "Ramuthevar,Vadivel MuruganX"
> >>> <vadivel.muruganx.ramuthevar@linux.intel.com> wrote:
> >>>      
> >>>> +	reg = readl(ebu_host->ebu + EBU_ADDR_SEL(ebu_host->cs_num));
> >>>> +	writel(reg | EBU_ADDR_MASK(5) | EBU_ADDR_SEL_REGEN,
> >>>> +	       ebu_host->ebu + EBU_ADDR_SEL(ebu_host->cs_num));  
> >>>
> >>> Seriously, did you really think I would not notice what you're doing
> >>> here?  
> >> Yes , I know that you have very good understanding about this.
> >>    You're reading the previous value which either contains a default  
> >>> mapping or has the mapping set by the bootloader, and write it back to
> >>> the register along with a new mask and the REGEN bit set (which
> >>> BTW is wrong since you don't mask out other fields before updating
> >>> them).  
> >> There is no other field get overwritten
> >>    This confirms that this Core -> FPI address translation exists  
> >>> and has to be set properly, so please stop lying about that.  
> >>
> >> Sorry, there is no SW translation, as I have mentioned that it's
> >> optional only, for safer side , reading and writing the default values.  
> > 
> > Then write EBU_ADDR_SEL_REGEN and we'll if see that works. I suspect it
> > won't.  
> 
> You mean, without reading just writing EBU_ADDR_SEL_REGEN bit alone in 
> EBU_ADDR_SELx , as you said it won't work because it overwrites 0x174 
> with 0x0 values so BASE is lost.

Which confirms that this mapping has to be defined.

> either we can leave it or read & write with ORed | EBU_ADDR_SEL_REGEN

None of this is acceptable IMO. You have to build the value based on the
address translation described in the DT. Why are you so reluctant to
this approach?

> 
> Please correct me if anything is wrong, Thanks!
> >   
> >> The memory region to enabled that's my concern so written the same
> >> register values.  
> > 
> > I don't buy that, sorry.
> >   
> >>
> >> This will not be impact other fields, so please see below for reference
> >>
> >> The EBU Address Select Registers EBU_ADDR_SEL_0 to EBU_ADDSEL3 establish
> >> and control memory regions for external accesses.
> >>
> >> Reset Value: 17400001H  
> > 
> > See, as suspected the reset value is exactly what you expect.  
> 
> Yes , that's the reason said being optional.

Then it's not optional. It just works because you use the default
value.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
