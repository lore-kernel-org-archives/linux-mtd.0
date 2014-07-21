Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X9KbH-0002Xw-PG
 for linux-mtd@lists.infradead.org; Mon, 21 Jul 2014 20:54:24 +0000
Date: Mon, 21 Jul 2014 17:53:06 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH] ubiblock: Support UBI volume name or volume ID parameter
 passing
Message-ID: <20140721205306.GA24056@arch.cereza>
References: <1397141020-6363-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1397472124.3287.6.camel@karhu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1397472124.3287.6.camel@karhu>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Guido =?iso-8859-1?Q?Mart=EDnez?= <guido@vanguardiasur.com.ar>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Sorry for the delay on this one.

On 14 Apr 01:42 PM, Artem Bityutskiy wrote:
> On Thu, 2014-04-10 at 11:43 -0300, Ezequiel Garcia wrote:
> > +static int ubi_open_volume_by_id(libubi_t desc, const char *node, int vol_id, int mode)
> >  {
> > +       char file[256];
> > +       struct ubi_dev_info dev_info;
> >         int err, fd;
> > -       libubi_t libubi;
> >  
> > -       err = parse_opt(argc, argv);
> > +       err = ubi_get_dev_info(desc, node, &dev_info);
> >         if (err)
> > +               return errmsg("cannot get information about UBI device \"%s\"", node);
> > +
> > +       sprintf(file, "/dev/ubi%d_%d", dev_info.dev_num, vol_id);
> 
> Device node names may ve anything. Please, do not rely on the "/dev/ubi%
> d_%d" naming scheme in the tool.
> 
> I think device node can be found out by scanning "/dev" and looking at
> the device node major/minor numbers. This is more work of course.
> 

Yeah, but the UBI major is allocated dynamically so we can't rely on that.
We would have to call an ioctl on each /dev device, which seems like a bit
heavy to me.

How about scanning out the sysfs and associate a name to the UBI device
and volume ID?

# ls -la /sys/class/ubi/
total 0
drwxr-xr-x  2 root root    0 Jul 21 20:23 .
drwxr-xr-x 37 root root    0 Jul 21 20:23 ..
lrwxrwxrwx  1 root root    0 Jul 21 20:23 ubi0 -> ../../devices/virtual/ubi/ubi0
lrwxrwxrwx  1 root root    0 Jul 21 20:23 ubi0_0 -> ../../devices/virtual/ubi/ubi0/ubi0_0
lrwxrwxrwx  1 root root    0 Jul 21 20:23 ubi0_1 -> ../../devices/virtual/ubi/ubi0/ubi0_1
lrwxrwxrwx  1 root root    0 Jul 21 20:23 ubi0_2 -> ../../devices/virtual/ubi/ubi0/ubi0_2
lrwxrwxrwx  1 root root    0 Jul 21 20:23 ubi0_3 -> ../../devices/virtual/ubi/ubi0/ubi0_3

Each /sys/class/ubiX_Y/name file can be related to the UBI device ${X},
and UBI volume ID ${Y}.

Based in this idea, we could make some ubifindvol tool that can find
an UBI volume ID from the UBI name.

> However, libubi does exactly the same assumption about UBI volume names
> as you do, so if you move this function to libubi, I think it will be
> good enough. At least if someone wants to change this in the future,
> then it will only require changing the library, but not its users.
> 
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
