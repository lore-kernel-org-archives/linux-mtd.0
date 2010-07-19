Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Oahcd-0000me-LS
	for linux-mtd@lists.infradead.org; Mon, 19 Jul 2010 04:06:32 +0000
Received: by fxm3 with SMTP id 3so2210683fxm.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 18 Jul 2010 21:06:30 -0700 (PDT)
Subject: Re: [PATCH 1/4] mtd: add new ioctl structures to be used for
	repartitioning
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
In-Reply-To: <201007182022.59590.arnd@arndb.de>
References: <1276855711-18570-1-git-send-email-roman.tereshonkov@nokia.com>
	<1276855711-18570-2-git-send-email-roman.tereshonkov@nokia.com>
	<1279472431.16247.67.camel@localhost.localdomain>
	<201007182022.59590.arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 19 Jul 2010 07:06:26 +0300
Message-Id: <1279512386.16247.70.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org,
	Roman Tereshonkov <roman.tereshonkov@nokia.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2010-07-18 at 20:22 +0000, Arnd Bergmann wrote:
> > > +#define MTD_MAX_PARTITION_NAME_LEN	64
> > > +struct mtd_partition_user {
> > > +	__u64 size;
> > > +	__u64 offset;
> > > +	__u32 mask_flags;
> > > +	char name[MTD_MAX_PARTITION_NAME_LEN];
> > > +	__u8 padding[128];	/* reserved for future, must be zero! */
> > > +};
> > > +
> > > +struct mtd_partitions {
> > > +	__u32 nparts;
> > > +	struct mtd_partition_user __user *parts;
> > > +};
> > 
> > Hmm, I think nowadays pointers should be passed as __u64 and
> > compat_ioctl() should be avoided.
> 
> Yes, that's generally true. It would be nice if the BLKPG ioctl
> definition could be reused for this. It is more complicated
> than it should be, but not more than this suggestion, and
> it's an existing ioctl.

Thanks for reply.

MTD devices do not support BLKPG, do you mean we should you the same
data-structures and names as block devices?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
