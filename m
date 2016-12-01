Received: from mail-io0-x244.google.com ([2607:f8b0:4001:c06::244])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cCWkT-0008Bp-U8
 for linux-mtd@lists.infradead.org; Thu, 01 Dec 2016 19:10:27 +0000
Received: by mail-io0-x244.google.com with SMTP id h133so3623044ioe.2
 for <linux-mtd@lists.infradead.org>; Thu, 01 Dec 2016 11:10:05 -0800 (PST)
Date: Thu, 1 Dec 2016 11:10:01 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Marek Vasut <marek.vasut@gmail.com>
Cc: Sandeep Jain <Sandeep_Jain@mentor.com>, dwmw2@infradead.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Subject: Re: [PATCH v1 1/2] mtd: m25p80: lock module while used
Message-ID: <20161201191001.GA50438@google.com>
References: <Sandeep_Jain@mentor.com>
 <1470320194-9602-1-git-send-email-Sandeep_Jain@mentor.com>
 <1470320194-9602-2-git-send-email-Sandeep_Jain@mentor.com>
 <20161103113926.GB4873@mentor.com>
 <8472764e-c72f-ad3c-35e4-d590386c1ad1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8472764e-c72f-ad3c-35e4-d590386c1ad1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Sat, Nov 05, 2016 at 08:24:24AM +0100, Marek Vasut wrote:
> On 11/03/2016 12:39 PM, Sandeep Jain wrote:
> > On Thu, Aug 04, 2016 at 07:46:33PM +0530, Sandeep Jain wrote:
> >> From: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
> >>
> >> The change controls module users counter, which prevents to get
> >> accidental oops on module unload while it is in use by mtd subsystem:
> >>
> >> % dd if=/dev/mtd0 of=/dev/null &
> >> % rmmod m25p80
> >>
> >> Removing MTD device #0 (spi32766.0) with use count 1
> >> Unable to handle kernel paging request at virtual address 7f4fb7f8
> >> pgd = bd094000
> >> [7f4fb7f8] *pgd=4cb66811, *pte=00000000, *ppte=00000000
> >> Internal error: Oops: 80000007 [#1] PREEMPT SMP ARM
> >>
> >> Signed-off-by: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
> >> Signed-off-by: Sandeep Jain <Sandeep_Jain@mentor.com>
> >> ---
> >>  drivers/mtd/devices/m25p80.c |   15 +++++++++++++++
> >>  1 file changed, 15 insertions(+)
> >>
> >> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
> >> index 9cf7fcd..2eb1530 100644
> >> --- a/drivers/mtd/devices/m25p80.c
> >> +++ b/drivers/mtd/devices/m25p80.c
> >> @@ -185,6 +185,19 @@ static ssize_t m25p80_read(struct spi_nor *nor, loff_t from, size_t len,
> >>  	return ret;
> >>  }
> >>  
> >> +static void m25p80_put(struct mtd_info *mtd)
> >> +{
> >> +	module_put(THIS_MODULE);
> >> +}
> >> +
> >> +static int m25p80_get(struct mtd_info *mtd)
> >> +{
> >> +	if (!try_module_get(THIS_MODULE))
> >> +		return -ENODEV;
> >> +
> >> +	return 0;
> >> +}
> >> +
> >>  /*
> >>   * board specific setup should have ensured the SPI clock used here
> >>   * matches what the READ command supports, at least until this driver
> >> @@ -212,6 +225,8 @@ static int m25p_probe(struct spi_device *spi)
> >>  	nor->write = m25p80_write;
> >>  	nor->write_reg = m25p80_write_reg;
> >>  	nor->read_reg = m25p80_read_reg;
> >> +	nor->mtd._put_device = m25p80_put;
> >> +	nor->mtd._get_device = m25p80_get;
> >>  
> >>  	nor->dev = &spi->dev;
> >>  	spi_nor_set_flash_node(nor, spi->dev.of_node);
> 
> This makes me ponder how many other drivers suffer from this issue and
> whether you shouldn't fix this in the core code instead. What do you think?

I'm a bit confused; the owner is already set as mtd->owner
(spi_register_driver() assigns the driver.owner, and the MTD core code
finds it via mtd->dev.parent), and I think we grab the appropriate
references. But I wouldn't be surprised if there was a bug lurking in
there somewhere still. Certainly the removal/cleanup logic might still
have some issues.

But I also notice that your supposed test case actually works just fine
for me:

# dd if=/dev/mtd0 of=/dev/null bs=2M & rmmod m25p80
[1] 8781
rmmod: ERROR: Module m25p80 is in use

Maybe this has already been fixed in the meantime?

And anyway, if there is a problem like this, I expect we'll want to
handle it in the core code, as Marek suggested.

Brian
