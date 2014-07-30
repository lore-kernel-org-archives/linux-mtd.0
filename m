Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XCUnP-0004v4-CK
 for linux-mtd@lists.infradead.org; Wed, 30 Jul 2014 14:24:00 +0000
Date: Wed, 30 Jul 2014 11:22:28 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH] ubiblock: Support UBI volume name or volume ID parameter
 passing
Message-ID: <20140730142228.GA3576@arch.cereza>
References: <1397141020-6363-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1397472124.3287.6.camel@karhu>
 <20140721205306.GA24056@arch.cereza>
 <1406565071.23376.44.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1406565071.23376.44.camel@sauron.fi.intel.com>
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

On 28 Jul 07:31 PM, Artem Bityutskiy wrote:
> On Mon, 2014-07-21 at 17:53 -0300, Ezequiel Garcia wrote:
> > Sorry for the delay on this one.
> > 
> > On 14 Apr 01:42 PM, Artem Bityutskiy wrote:
> > > On Thu, 2014-04-10 at 11:43 -0300, Ezequiel Garcia wrote:
> > > > +static int ubi_open_volume_by_id(libubi_t desc, const char *node, int vol_id, int mode)
> > > >  {
> > > > +       char file[256];
> > > > +       struct ubi_dev_info dev_info;
> > > >         int err, fd;
> > > > -       libubi_t libubi;
> > > >  
> > > > -       err = parse_opt(argc, argv);
> > > > +       err = ubi_get_dev_info(desc, node, &dev_info);
> > > >         if (err)
> > > > +               return errmsg("cannot get information about UBI device \"%s\"", node);
> > > > +
> > > > +       sprintf(file, "/dev/ubi%d_%d", dev_info.dev_num, vol_id);
> > > 
> > > Device node names may ve anything. Please, do not rely on the "/dev/ubi%
> > > d_%d" naming scheme in the tool.
> > > 
> > > I think device node can be found out by scanning "/dev" and looking at
> > > the device node major/minor numbers. This is more work of course.
> > > 
> > 
> > Yeah, but the UBI major is allocated dynamically so we can't rely on that.
> > We would have to call an ioctl on each /dev device, which seems like a bit
> > heavy to me.
> > 
> > How about scanning out the sysfs and associate a name to the UBI device
> > and volume ID?
> 
> What I meant is that you have these:
> 
> /sys/class/ubi/ubiX/dev
> 
> and these
> 
> /sys/class/ubi/ubiX/ubiX_Y/dev
> 
> containing the "major:minor" pairs.
> 
> For for any X:Y you can find major:minor. Then you scan "/dev" and find
> the device nodes, if they exist. If they do not exist, you may ask the
> user to create a device node with these major:minor in your error
> message.
> 

Right. That sounds a nice solution. I'll implement something upstreamable
as time permits.

Thanks!
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
