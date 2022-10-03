Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3172EC433F5
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Oct 2022 05:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZfIcUweMsuqCayqSof1I6VlHybeb8LviZtwhWfzoWE8=; b=rUcSkgwqo9WQ1t
	RJZ9rL8MtJkNPjwt6rLB+NFHiEUL3Ipg5enSndArjAtPCy3FIEVA6oXZFoW13e3tDAdqFq7ILM4Go
	uBacxOnl64kDH8n1UFJOuV5y1TifBYjbTqh8LNPWWLhrujP0u+M8i/pSRHW+DBzpgM7wtyhUfU+Ve
	hjEP13k7eZOsXl3H15ZWraHT0eEzaJ+xTJOR1QPOmi0YfJPsNlp7Qxi/S/pO9fGTHjc2bUh9ulXXK
	9y91grccTekIHCQWRMqM95rQUL/iFJmKg/zfF/+C0cws+VOFwcAaiPzaCHxo0W2ePnaBcXZb0zSTc
	jK9865xfUEI+CtbRi7RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofDtf-003zB7-9r; Mon, 03 Oct 2022 05:21:43 +0000
Received: from mga12.intel.com ([192.55.52.136])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofDtc-003zAM-HT
	for linux-mtd@lists.infradead.org; Mon, 03 Oct 2022 05:21:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664774500; x=1696310500;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XwwD+1F1aXHLGziJwQmsdunhfT1twiA+CKrw+Pd8VZA=;
  b=DCnRokjNEqO3571/twaCel7QT/CyQ1+MbK4MnvayoQUP8wq4TIaMGgUI
   xQGMtalAn9HB55IGLWIgZqM5+CNXFRaNUT5eRHLIkuMt7lRvZ1zGGXZ/9
   0kBEImYOMpmINHZMhHX5jJyHCaBqcghw8MHb8MrYZWDd4diy8mi8bnTOI
   c6F5Ra3r/6JTUFELOHlikl+T5Mf/fv/hPtI40IRwAXOm2g206IDFwXx5h
   9/yHw9RAAMLqTa0ktIkk+ixLGkQao8f12TpX3m2vjesKmhr0aeRdz09/D
   qpfOcl04ID+48GqMmBcKFfifrDzr6tpG3CBHl3yToi2jmS/a/7rDCLAO+
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10488"; a="282261922"
X-IronPort-AV: E=Sophos;i="5.93,364,1654585200"; 
   d="scan'208";a="282261922"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2022 22:21:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10488"; a="868457142"
X-IronPort-AV: E=Sophos;i="5.93,364,1654585200"; 
   d="scan'208";a="868457142"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga006.fm.intel.com with ESMTP; 02 Oct 2022 22:21:35 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id A4BA8D0; Mon,  3 Oct 2022 08:21:54 +0300 (EEST)
Date: Mon, 3 Oct 2022 08:21:54 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Tudor.Ambarus@microchip.com
Cc: pratyush@kernel.org, michael@walle.cc, miquel.raynal@bootlin.com,
	richard@nod.at, vigneshr@ti.com, Takahiro.Kuwano@infineon.com,
	hongyu.ning@intel.com, linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2] mtd: spi-nor: core: Ignore -ENOTSUPP in spi_nor_init()
Message-ID: <Yzpxcrgynprx75wQ@black.fi.intel.com>
References: <20220923093441.3178-1-mika.westerberg@linux.intel.com>
 <1da83197-fa6c-8cd9-1e81-c317db1bccf3@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1da83197-fa6c-8cd9-1e81-c317db1bccf3@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221002_222140_608316_E1062A97 
X-CRM114-Status: GOOD (  32.70  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

On Mon, Oct 03, 2022 at 05:04:26AM +0000, Tudor.Ambarus@microchip.com wrote:
> On 9/23/22 12:34, Mika Westerberg wrote:
> 
> Hi, Mika,
> 
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > 
> > The Intel SPI-NOR controller does not support the 4-byte address opcode
> > so ->set_4byte_addr_mode() ends up returning -ENOTSUPP and the SPI flash
> > chip probe fail like this:
> > 
> >   [ 12.291082] spi-nor: probe of spi0.0 failed with error -524
> > 
> > Whereas previously before commit 08412e72afba ("mtd: spi-nor: core:
> > Return error code from set_4byte_addr_mode()") it worked just fine.
> > 
> > Fix this by ignoring -ENOTSUPP in spi_nor_init().
> > 
> > Fixes: 08412e72afba ("mtd: spi-nor: core: Return error code from set_4byte_addr_mode()")
> > Cc: stable@vger.kernel.org
> > Reported-by: Hongyu Ning <hongyu.ning@intel.com>
> > Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> > ---
> > The previous version of the patch (the revert) can be found here:
> > 
> >   https://lore.kernel.org/linux-mtd/20220922134824.46758-1-mika.westerberg@linux.intel.com/
> > 
> > In this version we ignore -ENOTSUPP but the other error codes will be
> > passed to the caller.
> > 
> >  drivers/mtd/spi-nor/core.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> > index f2c64006f8d7..bee8fc4c9f07 100644
> > --- a/drivers/mtd/spi-nor/core.c
> > +++ b/drivers/mtd/spi-nor/core.c
> > @@ -2724,7 +2724,9 @@ static int spi_nor_init(struct spi_nor *nor)
> >                  */
> >                 WARN_ONCE(nor->flags & SNOR_F_BROKEN_RESET,
> >                           "enabling reset hack; may not recover from unexpected reboots\n");
> > -               return nor->params->set_4byte_addr_mode(nor, true);
> > +               err = nor->params->set_4byte_addr_mode(nor, true);
> > +               if (err && err != -ENOTSUPP)
> > +                       return err;
> >         }
> 
> So as of now if you use a flash larger than 16 MBytes, you can't
> access above 16 MBytes, right? What happens at the controller side
> when it receives a nor->addr_nbytes of value 4?

The Intel controller does not really expose any of these operations to
the CPU so the only thing the driver can do is to tell the SPI-NOR core
that this is not supported.

> 
> Shouldn't spi_mem_supports_op() trim the 4-byte ops?
> 
> The better fix to me would be to extend the SPI NOR core to support the Extended Address
> Register which consists of the 4th byte of memory address when the flash is operated
> in 3-byte address mode.

This is also something the Intel controller does not expose to the CPU
so I'm not sure if I have any means to test this approach.

My point is that currently all the Intel SPI users are basically broken
in v6.0 because of the commit 08412e72afba so shouldn't that be dealt
first and then look at any possible improments?

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
