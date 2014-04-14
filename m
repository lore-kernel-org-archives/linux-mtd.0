Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WZlu5-0005OZ-KE
 for linux-mtd@lists.infradead.org; Mon, 14 Apr 2014 18:46:50 +0000
Date: Mon, 14 Apr 2014 15:45:51 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH] ubiblock: Support UBI volume name or volume ID parameter
 passing
Message-ID: <20140414184551.GC23722@arch.cereza>
References: <1397141020-6363-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1397472124.3287.6.camel@karhu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1397472124.3287.6.camel@karhu>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Apr 14, Artem Bityutskiy wrote:
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

Yeah, I know this sucks.

> I think device node can be found out by scanning "/dev" and looking at
> the device node major/minor numbers. This is more work of course.
>

Ah, that's a good idea. Let me give it a try.

> However, libubi does exactly the same assumption about UBI volume names
> as you do, so if you move this function to libubi, I think it will be
> good enough. At least if someone wants to change this in the future,
> then it will only require changing the library, but not its users.
> 

OK, I will.
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
