Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D4A2C433F5
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Oct 2022 06:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2P0VudWeIBlwTEGljusAhpOsPJ39J2rYX7/Godq/sHo=; b=il6xkjKy5qj/JO
	NuqWilolkH/dp0106WhViWJEFATRm2oOig71UlUg6EtmnEfCH1ForrudtI3k93WK4HWk5rOv+PSev
	hwuNXQ1QRk3/towNL3+5Q+TdAlH4GheVf9jS5YtMp29pztX/l1GJx44g0ZdRK/mTYtAOrbmH8rF6m
	o+1Rs9tBM188/jLqQZxB6QnzsPjim/XSahDXheUXmFwEfDKbiCASK+bryE0VJdxg9HpQGQPzmhArT
	MGd1EF/OL2s4buGTRIUu6NNBZ/h6pst+lDjZvf8ynvuJOwRqiJrvr0LIQOkZ+nj1Qd8qVWfLOM2rU
	KO3s3ttOuhDytjCPO/MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofEg2-004APA-Kz; Mon, 03 Oct 2022 06:11:42 +0000
Received: from mga02.intel.com ([134.134.136.20])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofEfz-004AO9-N0
	for linux-mtd@lists.infradead.org; Mon, 03 Oct 2022 06:11:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664777499; x=1696313499;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=t9ZQH7CrwKnir/EVCYWJn+uURjsMGqF3no0onBC5ec4=;
  b=OXyOXOjqiZ536HJVPb8cjDDQF1U/5t5Hl3PoyFBWtL2gwtg5fgTczd4N
   O/s4Ki6DdJ++060XEmFSjwiWi2/Za92Jkg2ZoCiQ24Bk0MDZDJ1TYZKr+
   /YYhsxAhFmU+/Nk9uAuOSbKvNY4PsIuSP4LitNixwVAVsm81DfOdryfzg
   NYQWL37w169YaN0imnb+6nL+Xq+gcfwClRqNa4la82y5XX8wI2g/guvwt
   9Oaya/yuJGFyJq2qMzDa7C2Pty0Rnkvgr2vptPX82P/cTS05pHS7NihPU
   piM7JJjVnfBaPTYgNB//rXDnVt+/Jvd+HAxT0JtC/ZbEjsoDt+vrT0mXe
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10488"; a="289719268"
X-IronPort-AV: E=Sophos;i="5.93,364,1654585200"; 
   d="scan'208";a="289719268"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2022 23:11:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10488"; a="656618044"
X-IronPort-AV: E=Sophos;i="5.93,364,1654585200"; 
   d="scan'208";a="656618044"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga001.jf.intel.com with ESMTP; 02 Oct 2022 23:11:34 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 64BDDD0; Mon,  3 Oct 2022 09:11:53 +0300 (EEST)
Date: Mon, 3 Oct 2022 09:11:53 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Tudor.Ambarus@microchip.com
Cc: pratyush@kernel.org, michael@walle.cc, miquel.raynal@bootlin.com,
	richard@nod.at, vigneshr@ti.com, Takahiro.Kuwano@infineon.com,
	hongyu.ning@intel.com, linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2] mtd: spi-nor: core: Ignore -ENOTSUPP in spi_nor_init()
Message-ID: <Yzp9KR91q2yHeoTa@black.fi.intel.com>
References: <20220923093441.3178-1-mika.westerberg@linux.intel.com>
 <1da83197-fa6c-8cd9-1e81-c317db1bccf3@microchip.com>
 <Yzpxcrgynprx75wQ@black.fi.intel.com>
 <94b93c10-7f81-d6a8-f2b3-cb54b3976517@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <94b93c10-7f81-d6a8-f2b3-cb54b3976517@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221002_231139_835542_B735B82F 
X-CRM114-Status: GOOD (  52.78  )
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

On Mon, Oct 03, 2022 at 05:52:42AM +0000, Tudor.Ambarus@microchip.com wrote:
> On 10/3/22 08:21, Mika Westerberg wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > 
> > Hi,
> > 
> > On Mon, Oct 03, 2022 at 05:04:26AM +0000, Tudor.Ambarus@microchip.com wrote:
> >> On 9/23/22 12:34, Mika Westerberg wrote:
> >>
> >> Hi, Mika,
> >>
> >>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> >>>
> >>> The Intel SPI-NOR controller does not support the 4-byte address opcode
> >>> so ->set_4byte_addr_mode() ends up returning -ENOTSUPP and the SPI flash
> >>> chip probe fail like this:
> >>>
> >>>   [ 12.291082] spi-nor: probe of spi0.0 failed with error -524
> >>>
> >>> Whereas previously before commit 08412e72afba ("mtd: spi-nor: core:
> >>> Return error code from set_4byte_addr_mode()") it worked just fine.
> >>>
> >>> Fix this by ignoring -ENOTSUPP in spi_nor_init().
> >>>
> >>> Fixes: 08412e72afba ("mtd: spi-nor: core: Return error code from set_4byte_addr_mode()")
> >>> Cc: stable@vger.kernel.org
> >>> Reported-by: Hongyu Ning <hongyu.ning@intel.com>
> >>> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> >>> ---
> >>> The previous version of the patch (the revert) can be found here:
> >>>
> >>>   https://lore.kernel.org/linux-mtd/20220922134824.46758-1-mika.westerberg@linux.intel.com/
> >>>
> >>> In this version we ignore -ENOTSUPP but the other error codes will be
> >>> passed to the caller.
> >>>
> >>>  drivers/mtd/spi-nor/core.c | 4 +++-
> >>>  1 file changed, 3 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> >>> index f2c64006f8d7..bee8fc4c9f07 100644
> >>> --- a/drivers/mtd/spi-nor/core.c
> >>> +++ b/drivers/mtd/spi-nor/core.c
> >>> @@ -2724,7 +2724,9 @@ static int spi_nor_init(struct spi_nor *nor)
> >>>                  */
> >>>                 WARN_ONCE(nor->flags & SNOR_F_BROKEN_RESET,
> >>>                           "enabling reset hack; may not recover from unexpected reboots\n");
> >>> -               return nor->params->set_4byte_addr_mode(nor, true);
> >>> +               err = nor->params->set_4byte_addr_mode(nor, true);
> >>> +               if (err && err != -ENOTSUPP)
> >>> +                       return err;
> >>>         }
> >>
> >> So as of now if you use a flash larger than 16 MBytes, you can't
> >> access above 16 MBytes, right? What happens at the controller side
> >> when it receives a nor->addr_nbytes of value 4?
> > 
> > The Intel controller does not really expose any of these operations to
> > the CPU so the only thing the driver can do is to tell the SPI-NOR core
> > that this is not supported.
> 
> That would be good. And you'll get a non-working flash anyway. But I was
> asking something else. There should be an address register in the controller.
> If you write 4 address bytes, the forth is ignored, or why does it work? You'll
> at least get inconsistent results and always write in the first 16 Mbytes regardless
> of the value of the 4th byte of address.

It works because the Intel SPI controller is not a real "SPI" controller
so instead of all the low lever operations it simply exposes bunch of
high-level commands such as read and write. All the rest is handled
internally by the controller so it knows (I think based on the SFDP
information and possibly something else part of the BIOS image) the
supported address length.

> >>
> >> Shouldn't spi_mem_supports_op() trim the 4-byte ops?
> >>
> >> The better fix to me would be to extend the SPI NOR core to support the Extended Address
> >> Register which consists of the 4th byte of memory address when the flash is operated
> >> in 3-byte address mode.
> > 
> > This is also something the Intel controller does not expose to the CPU
> > so I'm not sure if I have any means to test this approach.
> 
> would you please remind me what you mean with "expose to the CPU"? I thought about
> that the intel-spi controller can inform the SPI NOR core that it doesn't support
> 4-byte addresses and then the core to take that information and use the EAR register.
> Would that be possible?

The controller only exposes a couple of high-level operations that we
can perform in software through the register interface. There is no way
to access EAR register or anything like that. This high-level commands
to read and write status register but that's pretty much all.

For completeness here are all the possible commands it supports (in
hardware sequencig mode which is the one used with the modern chips):

0 Read (1 up to 64 bytes by setting FDBC)
1 Reserved
2 Write (1 up to 64 bytes by setting FDBC)
3 4k Block Erase
4 64k Sector erase
5 Read SFDP
6 Read JEDEC ID
7 write status
8 read status
9 RPMC Op1
A RPMC Op2

> > 
> > My point is that currently all the Intel SPI users are basically broken
> > in v6.0 because of the commit 08412e72afba so shouldn't that be dealt
> > first and then look at any possible improments?
> 
> Right, I got you from the first time, I just wanted to highlight that the intel-spi
> controller and the SPI NOR core behave badly, and they should be fixed.
> Your patch fixes a regression of a somewhat working flash, so probably it should be
> applied for the time being. But I'd really love a proper fix.

I'm fine to have a "proper" fix but just wanted to mention that this is
real regression that is currently visible to users.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
