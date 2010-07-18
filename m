Received: from moutng.kundenserver.de ([212.227.17.10])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OaaOG-0007MO-Ly
	for linux-mtd@lists.infradead.org; Sun, 18 Jul 2010 20:23:13 +0000
From: Arnd Bergmann <arnd@arndb.de>
To: dedekind1@gmail.com
Subject: Re: [PATCH 1/4] mtd: add new ioctl structures to be used for
	repartitioning
Date: Sun, 18 Jul 2010 20:22:58 +0000
References: <1276855711-18570-1-git-send-email-roman.tereshonkov@nokia.com>
	<1276855711-18570-2-git-send-email-roman.tereshonkov@nokia.com>
	<1279472431.16247.67.camel@localhost.localdomain>
In-Reply-To: <1279472431.16247.67.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <201007182022.59590.arnd@arndb.de>
Cc: linux-mtd@lists.infradead.org,
	Roman Tereshonkov <roman.tereshonkov@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sunday 18 July 2010, Artem Bityutskiy wrote:
> CCing Arnd to review the ioctl interface.
> 
> One thing just struck me, see below.
> 
> On Fri, 2010-06-18 at 13:08 +0300, Roman Tereshonkov wrote:
> > Signed-off-by: Roman Tereshonkov <roman.tereshonkov@nokia.com>
> > ---
> >  include/mtd/mtd-abi.h |   15 +++++++++++++++
> >  1 files changed, 15 insertions(+), 0 deletions(-)
> > 
> > diff --git a/include/mtd/mtd-abi.h b/include/mtd/mtd-abi.h
> > index be51ae2..c2c6b41 100644
> > --- a/include/mtd/mtd-abi.h
> > +++ b/include/mtd/mtd-abi.h
> > @@ -88,6 +88,20 @@ struct otp_info {
> >  	__u32 locked;
> >  };
> >  
> > +#define MTD_MAX_PARTITION_NAME_LEN	64
> > +struct mtd_partition_user {
> > +	__u64 size;
> > +	__u64 offset;
> > +	__u32 mask_flags;
> > +	char name[MTD_MAX_PARTITION_NAME_LEN];
> > +	__u8 padding[128];	/* reserved for future, must be zero! */
> > +};
> > +
> > +struct mtd_partitions {
> > +	__u32 nparts;
> > +	struct mtd_partition_user __user *parts;
> > +};
> 
> Hmm, I think nowadays pointers should be passed as __u64 and
> compat_ioctl() should be avoided.

Yes, that's generally true. It would be nice if the BLKPG ioctl
definition could be reused for this. It is more complicated
than it should be, but not more than this suggestion, and
it's an existing ioctl.

	Arnd
