Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WCfgv-00054E-BI
 for linux-mtd@lists.infradead.org; Mon, 10 Feb 2014 01:29:45 +0000
Date: Sun, 9 Feb 2014 22:29:14 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Richard Weinberger <richard.weinberger@gmail.com>
Subject: Re: [PATCH 1/1] ubi: Introduce block devices for UBI volumes
Message-ID: <20140210012913.GA9505@localhost>
References: <1391027881-8354-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1391027881-8354-2-git-send-email-ezequiel.garcia@free-electrons.com>
 <CAFLxGvyPUTg+4SLAyN8UYGr8DmjdyjUmQOP++t_JVRM5Usd1yQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFLxGvyPUTg+4SLAyN8UYGr8DmjdyjUmQOP++t_JVRM5Usd1yQ@mail.gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Mike Frysinger <vapier@gentoo.org>, Artem Bityutskiy <dedekind1@gmail.com>,
 Michael Opdenacker <michael.opdenacker@free-electrons.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Piergiorgio Beruto <piergiorgio.beruto@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Willy Tarreau <w@1wt.eu>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Richard,

First of all, thanks for reviewing!

<nitpick>
If at all possible, it would be better if you could [snip]
the parts of the e-mail unrelated to the discussion.
It's a bit harder to follow when you include the whole patch
in your reply. Not a big deal, of course.
</nitpick>

On Sat, Feb 08, 2014 at 10:37:19PM +0100, Richard Weinberger wrote:
> On Wed, Jan 29, 2014 at 9:38 PM, Ezequiel Garcia
> <ezequiel.garcia@free-electrons.com> wrote:
[..]
> > +
> > +config MTD_UBI_BLOCK_WRITE_SUPPORT
> > +       bool "Enable write support (DANGEROUS)"
> > +       default n
> > +       depends on MTD_UBI_BLOCK
> > +       select MTD_UBI_BLOCK_CACHED
> > +       help
> > +          This is a *very* dangerous feature. Using a regular block-oriented
> > +          filesystem might impact heavily on a flash device wear.
> > +          Use with extreme caution.
> > +
> > +          If in doubt, say "N".
> 
> I really vote for dropping write support at all.
> 

I'll reply to this later.

[..]
> > +
> > +static int ubiblock_fill_cache(struct ubiblock *dev, int leb_num,
> > +                              struct ubiblock_cache *cache)
> > +{
> > +       int ret;
> > +
> > +       /* Warn if we fill cache while being dirty */
> > +       WARN_ON(cache->state == STATE_DIRTY);
> > +
> > +       cache->leb_num = leb_num;
> > +       cache->state = STATE_CLEAN;
> > +
> > +       ret = ubi_read(dev->desc, leb_num, cache->buffer, 0,
> > +                      dev->leb_size);
> > +       if (ret) {
> > +               ubi_err("%s ubi_read error %d", dev->gd->disk_name, ret);
> > +               return ret;
> > +       }
> 
> If read fails we still end up with a valid cache entry?
> Please set STATE_CLEAN only after a successful read.
> 

Good catch. I'll fix that.

[..]
> > +
> > +               mutex_lock(&dev->vol_mutex);
> > +               res = do_ubiblock_request(dev, req);
> > +               mutex_unlock(&dev->vol_mutex);
> 
> This means that you can never do parallel IO?
> 

Indeed. Feel free to prepare a follow-up patch improving it,
once this is merged.

-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
