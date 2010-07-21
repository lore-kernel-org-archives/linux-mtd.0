Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1ObWBm-0008IS-Tg
	for linux-mtd@lists.infradead.org; Wed, 21 Jul 2010 10:06:11 +0000
Received: from vaebh105.NOE.Nokia.com (vaebh105.europe.nokia.com
	[10.160.244.31])
	by mgw-mx09.nokia.com (Switch-3.3.3/Switch-3.3.3) with ESMTP id
	o6LA4Io2023700
	for <linux-mtd@lists.infradead.org>; Wed, 21 Jul 2010 05:06:09 -0500
Subject: Re: [PATCH 0/4] mtd: add mtd repartition ioctl
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Roman Tereshonkov <roman.tereshonkov@nokia.com>
In-Reply-To: <1278568257.12733.34.camel@localhost>
References: <1276855711-18570-1-git-send-email-roman.tereshonkov@nokia.com>
	<1278568257.12733.34.camel@localhost>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 21 Jul 2010 12:58:43 +0300
Message-ID: <1279706323.2306.2.camel@localhost>
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

On Thu, 2010-07-08 at 08:50 +0300, Artem Bityutskiy wrote:
> On Fri, 2010-06-18 at 13:08 +0300, Roman Tereshonkov wrote:
> > Adding mtd master device after all partitions should provide
> > minimum effect on the created partition enumeration.
> > 
> > The master mtd device can be repartitioned in runtime through
> > the mtd ioctl MTDREPARTITION. The ioctl passed argument is
> > the set of the new partitions defined by the structures:
> > struct mtd_partitions and struct mtd_partition_user.
> > 
> > All at once partition configuration is used and caused by
> > the all at once partition removing. Only unused partitions are deleted.
> > If any of the partitions for given mtd device is used then user gets error.
> > The care should be taken to close all applications which access
> > the partitions.
> > 
> > Roman Tereshonkov (4):
> >   mtd: add new ioctl structures to be used for repartitioning
> >   mtd: add the possibility to modify partitions in runtime
> >   mtd: add MTDREPARTITION ioctl
> >   mtd: create the mtd master device for given set of partitions
> > 
> >  drivers/mtd/mtdchar.c          |  110 +++++++++++++++++++++++++++++++++++++++-
> >  drivers/mtd/mtdpart.c          |   45 ++++++++++++++--
> >  drivers/mtd/onenand/omap2.c    |    8 ++-
> >  include/linux/mtd/partitions.h |    2 +
> >  include/mtd/mtd-abi.h          |   15 ++++++
> >  5 files changed, 170 insertions(+), 10 deletions(-)
> 
> I've pushed this to my l2-mtd-2.6.git / master, looks good to me.

Removed from l2-mtd-2.6 - please, address the comments from me and Arnd.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
