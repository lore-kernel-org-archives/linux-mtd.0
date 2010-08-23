Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OnVvl-000811-Sl
	for linux-mtd@lists.infradead.org; Mon, 23 Aug 2010 12:15:14 +0000
Received: by fxm12 with SMTP id 12so3506520fxm.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 23 Aug 2010 05:15:12 -0700 (PDT)
Subject: Re: MTD Flash Partition: change possible?
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Arno Steffen <arno.steffen@googlemail.com>
In-Reply-To: <AANLkTikc13g+5Q3YFMhgfJ1LWq_aMLUK1M9AFr2G1WSP@mail.gmail.com>
References: <AANLkTikgBKD4yku0fF_WaatNaOsRWwPf-VLKrWXByk1a@mail.gmail.com>
	<1282560805.24044.5.camel@localhost>
	<AANLkTikc13g+5Q3YFMhgfJ1LWq_aMLUK1M9AFr2G1WSP@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 23 Aug 2010 15:13:42 +0300
Message-ID: <1282565622.24044.20.camel@localhost>
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

On Mon, 2010-08-23 at 14:11 +0200, Arno Steffen wrote:
> 2010/8/23 Artem Bityutskiy <dedekind1@gmail.com>:
> > On Mon, 2010-08-23 at 12:23 +0200, Arno Steffen wrote:
> >> In my embedded system the Flash-partition table is compiled into kernel.
> >> Is there a way to change partition table without booting a new kernel? How?
> >>
> >> Background: I want to update an embedded system and change the size of
> >> partitions. But tools as flash_eraseall and nandwrite use partitions
> >> of the current kernel. If I want to change the size of the partitions,
> >> this is impossible.
> >> If I first flash a new kernel with new partition table, I have to
> >> reboot and the system will not start, as the old partitioning scheme
> >> is still active.
> >
> > There were at least 2 patches. One from Nokia - it was ok, but a small
> > change was requested and the author disappeared. One was from Samsung -
> > I did not look at it so far. The patches were sent to the MTD mailing
> > list a month or 2 ago.
> >
> > --
> > Best Regards,
> > Artem Bityutskiy (Артём Битюцкий)
> >
> >
> 
> Spasibo, Artem.
> 
> I found the Nokia Patch
> http://lists.infradead.org/pipermail/linux-mtd/2010-June/030645.html
> This seems to be done for OneNand, while I am using Nand.

No, it is not OneNAND-specific!

> Regarding the pathes: That are requests to change, so it is not for
> sure that this is implemented in a new kernel?
> 
> I found this as an update to mtdutils.
> http://lists.infradead.org/pipermail/linux-mtd/2010-July/031200.html
>  Does this needs a new kernel to support this functions? I am using a 2.6.33.

Dunno, did not look at this.

> Reading this, I think there is no solution for my current system.
> Is there a way to show the startaddress of a partition? /proc/mtd
> shows just size, not start address.

I do not think we can change /proc/mtd, but isn't it easy to calculate
the start address using partition sizes?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
