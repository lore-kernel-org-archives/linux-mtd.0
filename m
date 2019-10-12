Return-Path: <SRS0=XqRS=YF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCC69C10F14
	for <linux-mtd@archiver.kernel.org>; Sat, 12 Oct 2019 09:07:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A16AC2089F
	for <linux-mtd@archiver.kernel.org>; Sat, 12 Oct 2019 09:07:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UIV47Egx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A16AC2089F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zcDUsNr+7CoGYmo+D8zCe59w9W5MjDMpQCkTxnaqllE=; b=UIV47EgxclHrRK
	2TUzwHqiU8JUfc2E1AKAUt902frciXfjjxaH5MlNpPUtfQf9O6cZurAX1YC4B/K69H4/WTdYElajW
	g442Bujf88IyP0mcuuscCxeikFCk8z2sWuGzTpH3Fo6HMGiz1azYv4GI0OFo5r2k36/7LWpBzQeQ4
	NTozqaMyiIyl1m3T+0ecMPE1IAuRM+Vwn12JfeMOB6/PXbgVd7YRy7vuZ4aMfxUcWFUXFa6Ce05T4
	Cimi2R8x/wms8laI0kvuxlHMQhw64JD0vqODixC0HlqtJGmQSc9xcDsnDaPXdC8FaSecLuzC5lDDg
	PLY/AzcBvAnOzH0dvl3g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iJDN9-0000yX-QP; Sat, 12 Oct 2019 09:07:35 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iJDMy-0000oj-AA; Sat, 12 Oct 2019 09:07:25 +0000
Received: from dhcp-172-31-174-146.wireless.concordia.ca (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id BFFE62912EA;
 Sat, 12 Oct 2019 10:07:22 +0100 (BST)
Date: Sat, 12 Oct 2019 11:07:20 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v3 03/40] mtd: rawnand: Create a new enumeration to
 describe OOB placement
Message-ID: <20191012110720.7f497fff@dhcp-172-31-174-146.wireless.concordia.ca>
In-Reply-To: <20191012110209.3a3eafc6@dhcp-172-31-174-146.wireless.concordia.ca>
References: <20190919193141.7865-1-miquel.raynal@bootlin.com>
 <20190919193141.7865-4-miquel.raynal@bootlin.com>
 <20191012110209.3a3eafc6@dhcp-172-31-174-146.wireless.concordia.ca>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191012_020724_612690_4C609B99 
X-CRM114-Status: GOOD (  22.90  )
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
Cc: Mason Yang <masonccyang@mxic.com.tw>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, Julien Su <juliensu@mxic.com.tw>,
 Richard Weinberger <richard@nod.at>,
 Schrempf Frieder <frieder.schrempf@kontron.de>,
 Paul Cercueil <paul@crapouillou.net>, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sat, 12 Oct 2019 11:02:09 +0200
Boris Brezillon <boris.brezillon@collabora.com> wrote:

> On Thu, 19 Sep 2019 21:31:03 +0200
> Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> 
> > There is currently a confusion between the ECC type/mode/provider
> > (eg. hardware, software, on-die or none) and the in-bad/out-of-band  
> 
> 						   ^in-band
> 
> > layout which is only described for hardware engines (OOB first,
> > syndrome).  
> 
> It's not really about in-band/out-of-band data placement (though it
> also has an impact on it since free OOB bytes are sometimes protected
> by ECC or placed next to it), more ECC bytes placement.
> 
> > 
> > Create a new enumeration to describe this placement.
> > 
> > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> > ---
> >  drivers/mtd/nand/raw/nand_base.c |  5 +++++
> >  include/linux/mtd/rawnand.h      | 12 ++++++++++++
> >  2 files changed, 17 insertions(+)
> > 
> > diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
> > index e6c483ec191a..74e9289e931c 100644
> > --- a/drivers/mtd/nand/raw/nand_base.c
> > +++ b/drivers/mtd/nand/raw/nand_base.c
> > @@ -4842,6 +4842,11 @@ static const char * const nand_ecc_modes[] = {
> >  	[NAND_ECC_ON_DIE]	= "on-die",
> >  };
> >  
> > +static const char * const nand_ecc_engine_oob_placement[] = {  
> 
> 			     ^nand_ecc_placement ?
> 
> > +	[NAND_ECC_SYNDROME_OOB_PLACEMENT] = "hw_syndrome",
> > +	[NAND_ECC_OOB_FIRST_PLACEMENT] = "hw_oob_first",  
> 
> Since this is something you introduce, I'd recommend to change the
> naming here:
> 
> s/NAND_ECC_SYNDROME_OOB_PLACEMENT/NAND_ECC_PLACEMENT_INTERLEAVED/
> s/hw_syndrome/ecc-interleaved/

I realize the "ecc-" prefix is unneeded, so maybe just "interleaved"
and "first".

> s/NAND_ECC_OOB_FIRST_PLACEMENT/NAND_ECC_PLACEMENT_FIRST/
> s/hw_oob_first/ecc-first/
> 
> > +};
> > +
> >  static int of_get_nand_ecc_mode(struct device_node *np)
> >  {
> >  	const char *pm;
> > diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
> > index ccdc0c314acc..89f964816f2c 100644
> > --- a/include/linux/mtd/rawnand.h
> > +++ b/include/linux/mtd/rawnand.h
> > @@ -93,6 +93,18 @@ enum nand_ecc_mode {
> >  	NAND_ECC_ON_DIE,
> >  };
> >  
> > +/**
> > + * enum nand_ecc_engine_oob_placement - NAND ECC engine OOB placement
> > + * @NAND_ECC_DEFAULT_OOB_PLACEMENT: Standard layout, or not specified  
> 
> Maybe describe what the standard layout is (ECC placed at the end), and
> mention that "not specified/default" means the driver can decide to put
> the ECC/free-OOB bytes where he wants.
> 
> > + * @NAND_ECC_SYNDROME_OOB_PLACEMENT: Syndrome layout (interlaced)
> > + * @NAND_ECC_OOB_FIRST_PLACEMENT: Free OOB bytes first
> > + */
> > +enum nand_ecc_engine_oob_placement {
> > +	NAND_ECC_DEFAULT_OOB_PLACEMENT,
> > +	NAND_ECC_SYNDROME_OOB_PLACEMENT,
> > +	NAND_ECC_OOB_FIRST_PLACEMENT,
> > +};
> > +
> >  enum nand_ecc_algo {
> >  	NAND_ECC_UNKNOWN,
> >  	NAND_ECC_HAMMING,  
> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
