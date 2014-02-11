Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WD9kv-0004eK-7D
 for linux-mtd@lists.infradead.org; Tue, 11 Feb 2014 09:35:53 +0000
Date: Tue, 11 Feb 2014 06:35:28 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH 1/1] ubi: Introduce block devices for UBI volumes
Message-ID: <20140211093527.GD3687@localhost>
References: <1392017750.31031.8.camel@sauron.fi.intel.com>
 <20140210082714.GB10872@localhost> <20140210084616.GP22376@1wt.eu>
 <20140210142026.GB15607@localhost>
 <1392043814.32363.49.camel@sauron.fi.intel.com>
 <20140210184858.GA6484@localhost>
 <a86d653a-9e3b-46dc-9ec8-94a9c1099bec@email.android.com>
 <20140210214333.GH28464@1wt.eu>
 <CAMuHMdW0LHpWmyHUaAviSBDk87=wu8dkzATS9qOB5mDcR=SkSA@mail.gmail.com>
 <20140211090533.GA5414@1wt.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20140211090533.GA5414@1wt.eu>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Mike Frysinger <vapier@gentoo.org>, Artem Bityutskiy <dedekind1@gmail.com>,
 Richard Weinberger <richard@nod.at>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Michael Opdenacker <michael.opdenacker@free-electrons.com>,
 Piergiorgio Beruto <piergiorgio.beruto@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
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

On Tue, Feb 11, 2014 at 10:05:33AM +0100, Willy Tarreau wrote:
> On Tue, Feb 11, 2014 at 09:37:25AM +0100, Geert Uytterhoeven wrote:
> > On Mon, Feb 10, 2014 at 10:43 PM, Willy Tarreau <w@1wt.eu> wrote:
> > > On Mon, Feb 10, 2014 at 10:39:18PM +0100, Piergiorgio Beruto wrote:
> > >> Hi all,
> > >> Please, the possibility to disable at compile time unneeded code to save
> > >> memory and/or cpu speed would make the life of embedded developers much more
> > >> easier.
> > >>
> > >> Ubiblk was exactly what we were looking for, in my personal opinion the
> > >> possibility to disable caching and rw feature is of very high value.
> > >
> > > Reminds me the happy days of CONFIG_TINY :-)
> > > So in practice it's probably just a matter of turning the options to :
> > >
> > >     Disable Caching (default N, say Y to save memory)
> > >     Disable Write support (default N, say Y to reduce code size)
> > 
> > But then allmodconfig builds will not exercise those code paths.
> > 
> > Don't you want:
> > 
> >     bool "Enable Caching" if !EXPERT
> >     default y
> > 
> >     bool "Enable Write support" if !EXPERT
> >     default y
> > 
> > ?
> 
> Sounds like an excellent idea!
> 

FWIW, we can also use CONFIG_EMBEDDED. However, most distros seem to
enable this by default.

Artem: What do you say about Geert's suggestion?
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
