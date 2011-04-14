Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QANKt-00061N-Pv
	for linux-mtd@lists.infradead.org; Thu, 14 Apr 2011 14:15:56 +0000
Received: by eyh6 with SMTP id 6so542514eyh.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 14 Apr 2011 07:15:54 -0700 (PDT)
Subject: Re: mtd-utils: "flash_erase -j" failes with "unable to get NAND
	oobinfo" on large flash chips.
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Daid <daid303@gmail.com>
In-Reply-To: <BANLkTikgzbGGNg7AXYt89MvM4whvKxXHiQ@mail.gmail.com>
References: <BANLkTinozqCrqaDGsAX-gWWUg2G3bvg_Rg@mail.gmail.com>
	<1302761383.2796.4.camel@localhost>
	<BANLkTikgzbGGNg7AXYt89MvM4whvKxXHiQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 14 Apr 2011 17:12:58 +0300
Message-ID: <1302790378.2796.45.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2011-04-14 at 13:43 +0200, Daid wrote:
> On Thu, Apr 14, 2011 at 8:09 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> > On Tue, 2011-04-12 at 11:58 +0200, Daid wrote:
> >> I've made a patch to fix flash_erase with large flash chips.
> >> flash_erase uses MEMGETOOBSEL which no longer works if the ECC area is
> >> larger then 32 bytes. ECCGETLAYOUT is the replacement ioctl.
> >>
> >> This patch is based on the work of Stanley Miao, he made a patch in
> >> June 2010 for flash_eraseall.
> >> http://lists.infradead.org/pipermail/linux-mtd/2010-June/031981.html
> >> I've implemented the backwards compatibility differently, checking
> >> kernel versions doesn't feel correct.
> >
> > Hi Daid, would you please use libmtd instead? If libmtd does not have
> > some functionality you need - just add it there.
> >
> > The thing is that we are trying to unify this stuff a little.
> >
> > --
> > Best Regards,
> > Artem Bityutskiy (Артём Битюцкий)
> >
> >
> 
> Hi Artem, libmtd didn't have the functionality I needed. I've made a new patch
> with the functionality build into libmtd.
> 
> I've added the extra information to struct mtd_dev_info, however, the
> info needed is
> only available with ioctls, so even with the sysfs interface it needs
> to open /dev/mtdXX.
> When you use mtd_get_dev_info, it reads all the information, which simple for
> the user of libmtd, but sort of mixes legacy and the sysfs interface.

Could you please split this on 2 patches:
1. Add new functionality to libmtd
2. Start using it in mkfs.jffs2.

This way it is easier to review, and if you screw up mkfs.jffs2 we can
always revert patch #2 without reverting libmtd.

> +/**
> + * mtd_get_oob_info - fill the mtd_dev_info structure with information
> + *  about the OOB data.
> + */
> +static int mtd_get_oob_info(struct mtd_dev_info *mtd)
> +{
> +	int i, fd;
> +	char node[sizeof(MTD_DEV_PATT) + 20];
> +
> +	sprintf(node, MTD_DEV_PATT, mtd->mtd_num);
> +	fd = open(node, O_RDWR);
> +	if (fd == -1)
> +		return sys_errmsg("cannot open \"%s\"", node);
> +		
> +	if (mtd->type == MTD_NANDFLASH) {
> +		/* get ECC/OOB information for NAND flash */
> +#if defined(ECCGETLAYOUT)

Where does this define come from?

> +		struct nand_ecclayout ecclayout;
> +		memset(&ecclayout, 0, sizeof(ecclayout));
> +		if (ioctl(fd, ECCGETLAYOUT, &ecclayout) == 0) {
> +			mtd->eccbytes = ecclayout.eccbytes;
> +			for(i=0; i<64; i++) {
> +				mtd->eccpos[i] = ecclayout.eccpos[i];
> +			}
> +			mtd->oob_available = ecclayout.oobavail;
> +			for (i=0; i<MTD_NAND_MAX_OOBFREE_ENTRIES; i++) {
> +				mtd->oob_free[i].offset = ecclayout.oobfree[i].offset;
> +				mtd->oob_free[i].length = ecclayout.oobfree[i].length;
> +			}
> +		} else {
> +#endif/*defined(ECCGETLAYOUT)*/


> +			/* new ECC interface failed or not available, fall back to old OOB
> interface, which does not support large flash */
> +			struct nand_oobinfo oobinfo;
> +			if (ioctl(fd, MEMGETOOBSEL, &oobinfo) == 0)

The legacy piece of code should be handled in libmtd_legacy.c There are
already some things you can re-use.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
