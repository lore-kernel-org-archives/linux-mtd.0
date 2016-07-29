Received: from mail-pf0-x244.google.com ([2607:f8b0:400e:c00::244])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bTCTC-0004XC-1q
 for linux-mtd@lists.infradead.org; Fri, 29 Jul 2016 18:25:14 +0000
Received: by mail-pf0-x244.google.com with SMTP id y134so5829385pfg.3
 for <linux-mtd@lists.infradead.org>; Fri, 29 Jul 2016 11:24:53 -0700 (PDT)
Date: Fri, 29 Jul 2016 11:24:49 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Richard Weinberger <richard@nod.at>, Artem Bityutskiy <dedekind1@gmail.com>
Cc: Rajeev Kumar <rajeev_kumar@mentor.com>, dwmw2@infradead.org,
 dedekind1@gmail.com, linux-mtd@lists.infradead.org, stable@vger.kernel.org
Subject: Re: [PATCH 2/2] ubi: attach: do not return -EINVAL if the
 mtd->numeraseregions is 1
Message-ID: <20160729182449.GA124841@google.com>
References: <1469440019-29358-1-git-send-email-rajeev_kumar@mentor.com>
 <1469440019-29358-2-git-send-email-rajeev_kumar@mentor.com>
 <5795EA8B.2040209@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5795EA8B.2040209@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

(Artem, any opinions, since you had the most opinion last time this came
up?)

On Mon, Jul 25, 2016 at 12:31:39PM +0200, Richard Weinberger wrote:
> Am 25.07.2016 um 11:46 schrieb Rajeev Kumar:
> > If the master mtd does not have any slave mtd partitions,
> > and its numeraseregions is one(only has one erease block), and
> > we attach the master mtd with : ubiattach -m 0 -d 0
> > 
> > We will meet the error:
> > -------------------------------------------------------
> > root ~$ ubiattach /dev/ubi_ctrl -m 0 -d 0
> > UBI: attaching mtd0 to ubi0
> > UBI error: io_init: multiple regions, not implemented
> > ubiattach: error!: cannot attach mtd0
> >            error 22 (Invalid argument)
> > -------------------------------------------------------
> > 
> > In fact, if there is only one "erase block", we should not
> > prevent the attach.
> > 
> > This patch is tested against 3.14 kernel and only build test is
> > performed against current upstream master branch.
> 
> The more interesting question is, why is ->numeraseregions not 0?
> 
> The comment in the header says:
>         /* Data for variable erase regions. If numeraseregions is zero,
>          * it means that the whole device has erasesize as given above.
>          */
> 
> So, if your MTD erase regions with the same size, it should be 0.
> 
> IIRC we had such a discussion already on linux-mtd and it was not clear
> whether numeraseregions of 0 and 1 are equal or not.

I think 0 and 1 are essentially equal. But there's some potential room
for error (e.g., if the driver doesn't configure mtd->erasesize ==
mtd->eraseregions[0].erasesize, and similar). Also, I see some
problematic code like this in cfi_cmdset_0001.c:

	mtd->numeraseregions = cfi->cfiq->NumEraseRegions * cfi->numchips;

So, if there are two chips, but both have a single erase region, with
the same erasesize, we'll still end up with ->numeraseregions == 2. We
can't hack all MTD users to start searching the eraseregions[] array to
see if the device is actually uniform, even if it reports
numeraseregions > 0.

I'm inclined, then, to outlaw numeraseregions == 1 (to make it simpler for MTD
users to handle), and put code either in drivers or in mtdcore.c to be slightly
more intelligent (e.g., if the driver left numeraseregions == 1, then just do
some sanity checking and re-set numeraseregions to 0). It might be good to move
code like this from cfi_cmdset_0001.c into mtdcore.c at the same time too:

	if (offset != devsize) {
		/* Argh */
		printk(KERN_WARNING "Sum of regions (%lx) != total size of set of interleaved chips (%lx)\n", offset, devsize);
		goto setup_err;
	}

BTW, Rajeev, what devices are you testing? Just curious.

Regards,
Brian
