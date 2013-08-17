Received: from mail-pb0-f51.google.com ([209.85.160.51])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VAlhw-000154-Nf
 for linux-mtd@lists.infradead.org; Sat, 17 Aug 2013 18:58:41 +0000
Received: by mail-pb0-f51.google.com with SMTP id jt11so3315818pbb.10
 for <linux-mtd@lists.infradead.org>; Sat, 17 Aug 2013 11:58:15 -0700 (PDT)
Date: Sat, 17 Aug 2013 11:58:04 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: "Gupta, Pekon" <pekon@ti.com>
Subject: Re: [PATCH v3 3/6] mtd: set the ecc step size for master/slave
 mtd_info
Message-ID: <20130817185804.GA11210@norris.computersforpeace.net>
References: <1376285092-19683-1-git-send-email-b32955@freescale.com>
 <1376285092-19683-4-git-send-email-b32955@freescale.com>
 <20980858CB6D3A4BAE95CA194937D5E73E9F2A32@DBDE04.ent.ti.com>
 <52089C91.4090903@freescale.com>
 <20980858CB6D3A4BAE95CA194937D5E73E9F2B57@DBDE04.ent.ti.com>
 <5208AE99.6020508@freescale.com>
 <20130813002512.GC7267@brian-ubuntu>
 <20980858CB6D3A4BAE95CA194937D5E73E9F4173@DBDE04.ent.ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73E9F4173@DBDE04.ent.ti.com>
Cc: Huang Shijie <b32955@freescale.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Aug 13, 2013 at 04:29:46AM +0000, Gupta, Pekon wrote:
> > On Mon, Aug 12, 2013 at 05:44:57PM +0800, Huang Shijie wrote:
> > > 于 2013年08月12日 17:24, Gupta, Pekon 写道:
> > > >In addition, chip->ecc.bytes should also be helpful for userspace
> > > >utility to determine how much bytes to reserve in spare-area for ECC.
> > > >So exposing that as sysfs entry is also good.
> > > >
> > > I do not need the chip->ecc.bytes. :)
> > > For me, export the chip->ecc.size is enough.
> > 
> > A better argument against this is that ecc.bytes does not necessarily
> > have utility across many types of NAND drivers by itself, since ECC
> > layouts differ. And at that point, we're trying to duplicate the
> > behavior of ioctl(ECCGETLAYOUT) (which notably has run out of room and
> > isn't 100% informative anymore).
> > 
> > > So you can submit a patch if you need this field.
> > 
> > Yes, if you have good reason for exporting it, send a patch and a good
> > argument. And it would need to explain why we can't just use
> > ECCGETLAYOUT.
> > 
> Thanks for the info..
> I wasn't fully aware of ioctl(ECCGETLAYOUT), I'll explore it further.

Just to be clear, there may be good reason to duplicate features between
ECCGETLAYOUT and sysfs (for instance, because we've grown beyond the
size of ECCGETLAYOUT, or simply so that modern, useful parameters are
all in one place).

> Also, is there any documentation or URL explaining all ioctl for MTD?

That's a good question. As far as I know, the best reference is
include/uapi/mtd/mtd-abi.h. There's some old documentation for UBI
ioctls on:

  http://linux-mtd.infradead.org/
  http://linux-mtd.infradead.org/doc/ubidesign/ubidesign.pdf

I don't really see anything like that for MTD. But you are free to write
up such documentation! You can send patches against mtd-www.git:

  http://linux-mtd.infradead.org/faq/general.html#L_mtdwww

Or perhaps we could use something within the kernel Documentation/mtd/
directory? I would consult Artem/David for that one.

Brian
