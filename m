Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WCgk3-0005uX-4m
 for linux-mtd@lists.infradead.org; Mon, 10 Feb 2014 02:37:03 +0000
Date: Sun, 9 Feb 2014 23:36:35 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Richard Weinberger <richard.weinberger@gmail.com>
Subject: Re: [PATCH 1/1] ubi: Introduce block devices for UBI volumes
Message-ID: <20140210023634.GA9643@localhost>
References: <1391027881-8354-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1391027881-8354-2-git-send-email-ezequiel.garcia@free-electrons.com>
 <CAFLxGvyzWhMHjxM=0kgsEOx82qAGBWE1WbyLJt2-6P7Cd9i+nQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFLxGvyzWhMHjxM=0kgsEOx82qAGBWE1WbyLJt2-6P7Cd9i+nQ@mail.gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Mike Frysinger <vapier@gentoo.org>, Artem Bityutskiy <dedekind1@gmail.com>,
 Michael Opdenacker <michael.opdenacker@free-electrons.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Tim Bird <tim.bird@am.sony.com>,
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

On Sun, Feb 09, 2014 at 11:56:24PM +0100, Richard Weinberger wrote:
> On Wed, Jan 29, 2014 at 9:38 PM, Ezequiel Garcia
> <ezequiel.garcia@free-electrons.com> wrote:
[..]
> > +
> > +static int ubiblock_read_to_buf(struct ubiblock *dev, char *buffer,
> > +                               int leb, int offset, int len)
> > +{
> > +       int ret;
> > +       char *cache_buffer;
> > +       /*
> > +        * First try in cache, if it's not there load this leb.
> > +        * Note that reading never flushes to disk!
> > +        */
> > +       if (leb_in_cache(&dev->cache, leb)) {
> > +               cache_buffer = dev->cache.buffer;
> > +       } else {
> 
> I think you have to flush the cache here too.
> With RW support enabled you can end up with a dirty cache here.
> 

Yes, right. This is a left-over from the two-cache design. Now that we
have just one cache, it's possible to flush it before filling it.

Good catch!
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
