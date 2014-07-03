Received: from mail-pa0-x234.google.com ([2607:f8b0:400e:c03::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X2Vi2-0007rw-2Z
 for linux-mtd@lists.infradead.org; Thu, 03 Jul 2014 01:21:10 +0000
Received: by mail-pa0-f52.google.com with SMTP id eu11so13514542pac.39
 for <linux-mtd@lists.infradead.org>; Wed, 02 Jul 2014 18:20:48 -0700 (PDT)
Date: Thu, 3 Jul 2014 11:20:42 +1000
From: Matt Hevern <matt.hevern@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: UBIFS becomes read-only when written, then fails to mount
Message-ID: <20140703012041.GB19950@gmail.com>
References: <20140618044434.GA9331@gmail.com>
 <1404222952.6841.92.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1404222952.6841.92.camel@sauron.fi.intel.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jul 01, 2014 at 04:55:52PM +0300, Artem Bityutskiy wrote:
> On Wed, 2014-06-18 at 14:44 +1000, Matt Hevern wrote:
> > Hi All,
> > 
> > 
> > I am running UBIFS on freescale i.MX28, kernel 2.6.35.3, based on
> > freescale's IMX tree:
> > http://git.freescale.com/git/cgit.cgi/imx/linux-2.6-imx.git/?h=imx_2.6.35_maintain
> > The flash is NAND, Micron 256MiB (MT29F2G08)
> 
> In your dumps I see that there are errors related to UBIFS not being
> able to find an LEB for the garbage collector. And I remember we fixed
> bugs in this area.
> 
> For example, "6fb4374 UBIFS: fix GC LEB recovery", and there were more.
> Search for 'ubifs_rcvry_gc_commit' in 'git log -p fs/ubifs/recovery.c'.


Thanks for your response. I can see that I don't currently have this commit.
I'll attempt to pull in this and any others that look relevant.

Thanks,


Matt
