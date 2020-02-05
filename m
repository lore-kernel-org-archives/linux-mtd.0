Return-Path: <SRS0=LKht=3Z=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,URIBL_DBL_ABUSE_MALW,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5010DC33CA1
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Feb 2020 10:05:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 238E12051A
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Feb 2020 10:05:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="U1iV6rlQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 238E12051A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eSK2cZPxVOC4ViG0h4Wkn5Ve5alrQ4GohOlqM3xcgwo=; b=U1iV6rlQqMPgzU
	AA8mTEoKSieDmXixW3XVazv3bTKqa0pRIqC61J+5munOyb749rmZ8kR7RIsookS2ajP+49FkS+q8k
	8lNxKlqZ6IGF/B/IltWuIvswdI1BScmUbNa4sAd4iwqXzZYbQDtUQQYL7i1GoMODMkcuTknG1oD3T
	C6Usjr7/8EtB6d9Ad9/ceZm80KfTG1xJuRs8QUVQL/XFv4KHu0jHLJH/yn4kPV1RVetJ7Dcvbeqaa
	0NitSwPm8UgJ5sj+QLzRA1nhrFEVpfan1QLqd11a4sG4TIVpqlGjzNCyE9Ad+GeGFJSsHpzuALHiA
	e1UC+1t/+WM8QH+u0EnA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1izHYm-0001E5-Jc; Wed, 05 Feb 2020 10:05:28 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1izHYj-0001Da-Ao
 for linux-mtd@lists.infradead.org; Wed, 05 Feb 2020 10:05:27 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id AA52527BE9E;
 Wed,  5 Feb 2020 10:05:17 +0000 (GMT)
Date: Wed, 5 Feb 2020 11:05:14 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH] Revert "mtd: rawnand: denali: get
 ->setup_data_interface() working again"
Message-ID: <20200205110514.27406d5a@collabora.com>
In-Reply-To: <20200205105045.6877aca6@xps13>
References: <20200205070834.3087104-1-marex@denx.de>
 <20200205101223.21d99d93@xps13>
 <45a10680-5fe6-7cab-a7ef-f7f7a952e822@denx.de>
 <20200205105045.6877aca6@xps13>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200205_020525_506118_1A4F4785 
X-CRM114-Status: GOOD (  23.02  )
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
Cc: Marek Vasut <marex@denx.de>, Dinh Nguyen <dinguyen@kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>, linux-mtd@lists.infradead.org,
 Tim Sander <tim@krieglstein.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, 5 Feb 2020 10:50:45 +0100
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Hi Marek,
> 
> Marek Vasut <marex@denx.de> wrote on Wed, 5 Feb 2020 10:41:05 +0100:
> 
> > On 2/5/20 10:12 AM, Miquel Raynal wrote:  
> > > Hi Marek,
> > > 
> > > Marek Vasut <marex@denx.de> wrote on Wed,  5 Feb 2020 08:08:34 +0100:
> > >     
> > >> This reverts commit d311e0c27b8fcc27f707f8cac48cd8bdc4155224, which
> > >> completely breaks NAND access on Altera SoCFPGA (detected on ArriaV
> > >> SoC).
> > >>
> > >> On SoCFPGA, denali->clk_rate = 31.25 MHz and denali->clk_x_rate = 125 MHz,
> > >> hence the driver sets NAND_KEEP_TIMINGS flag. This did not happen before
> > >> and is actually incorrect, as on SoCFPGA we do not want to retain timings
> > >> from previous stage (the timings might be incorrect or outright invalid).
> > >>
> > >> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> > >> Cc: Dinh Nguyen <dinguyen@kernel.org>
> > >> Cc: Masahiro Yamada <masahiroy@kernel.org>
> > >> Cc: Miquel Raynal <miquel.raynal@bootlin.com>
> > >> Cc: Tim Sander <tim@krieglstein.org>
> > >> To: linux-mtd <linux-mtd@lists.infradead.org>
> > >> ---
> > >>  drivers/mtd/nand/raw/denali.c | 2 +-
> > >>  1 file changed, 1 insertion(+), 1 deletion(-)
> > >>
> > >> diff --git a/drivers/mtd/nand/raw/denali.c b/drivers/mtd/nand/raw/denali.c
> > >> index b6c463d02167..5fe3c62a756e 100644
> > >> --- a/drivers/mtd/nand/raw/denali.c
> > >> +++ b/drivers/mtd/nand/raw/denali.c
> > >> @@ -1209,7 +1209,7 @@ int denali_chip_init(struct denali_controller *denali,
> > >>  	}
> > >>  
> > >>  	/* clk rate info is needed for setup_data_interface */
> > >> -	if (!denali->clk_rate || !denali->clk_x_rate)    
> > > 
> > > I don't get it, if both clk_rate and clk_x_rate are set, the if
> > > condition will not be entered, right?    
> > 
> > Err, then it's the other way around and I need to keep the timings on
> > socfpga ?  
> 
> Ok.
> 
> Do you have a different compatible? Or a register to check? How do you
> discriminate the different platforms by software? The quick and dirty
> solution is to add a special case for your platform and specifically
> use the NAND_KEEP_TIMINGS horror.
> 
> But I think using ->software_data_interface is the right solution. So

You probably mean ->setup_data_interface() :-).

> I would highly recommend fixing the implementation of this hook
> for your platform and in this case the commit reverted is not the
> culprit, the one introducing setup_data_interface is (for the Fixes:
> tag).

+1. If ->setup_data_interface() is buggy, it should be fixed.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
