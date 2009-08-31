Received: from mx1.redhat.com ([209.132.183.28])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MiENK-0003Dk-Ez
	for linux-mtd@lists.infradead.org; Mon, 31 Aug 2009 21:25:23 +0000
Date: Mon, 31 Aug 2009 23:25:10 +0200
From: Karel Zak <kzak@redhat.com>
To: Corentin Chary <corentincj@iksaif.net>
Subject: Re: [PATCH 0/3] Add support for UBI and UBIFS
Message-ID: <20090831212510.GG1466@nb.net.home>
References: <1251112316-18971-1-git-send-email-corentincj@iksaif.net>
	<200908312103.59906.corentincj@iksaif.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <200908312103.59906.corentincj@iksaif.net>
Cc: Theodore Ts'o <tytso@mit.edu>, util-linux-ng@vger.kernel.org,
	linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Aug 31, 2009 at 09:03:59PM +0200, Corentin Chary wrote:
> On Monday 24 August 2009 13:11:53 Corentin Chary wrote:
> > Hi,
> > Here is some patchs to add support for UBI and UBIFS in libblkid.
> >
> > UBIFS works on top of UBI volumes, there are 3 subsystems involved:
> >   * MTD subsystem, which provides uniform interface to access flash chips.
> >     MTD provides an notion of MTD devices (e.g., /dev/mtd0) which basically
> > represents raw flash; * UBI subsystem, which is a wear-leveling and volume
> > management system for flash devices; UBI works on top of MTD devices and
> > provides a notion of UBI volumes (e.g.m /dev/ubi0_0); * UBIFS file system,
> > which works on top of UBI volumes.
> >
> > The first patch add support for UBI volumes, which are represented as char
> > devices in /dev/. This allow to probe for UBIFS filesystem on UBI volumes.
> >
> > Thanks,
> 
> Hi,
> No feedback, but I forgot to CC Karel and Theodore.

 Sorry, I had vacation last week. I'll review your patches this week.

    Karel

-- 
 Karel Zak  <kzak@redhat.com>
