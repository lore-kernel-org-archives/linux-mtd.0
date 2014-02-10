Date: Mon, 10 Feb 2014 22:43:33 +0100
From: Willy Tarreau <w@1wt.eu>
To: Piergiorgio Beruto <piergiorgio.beruto@gmail.com>
Subject: Re: [PATCH 1/1] ubi: Introduce block devices for UBI volumes
Message-ID: <20140210214333.GH28464@1wt.eu>
References: <52F6C916.2030506@nod.at> <20140209075157.GJ22376@1wt.eu>
 <20140210024827.GB9643@localhost>
 <1392017750.31031.8.camel@sauron.fi.intel.com>
 <20140210082714.GB10872@localhost> <20140210084616.GP22376@1wt.eu>
 <20140210142026.GB15607@localhost>
 <1392043814.32363.49.camel@sauron.fi.intel.com>
 <20140210184858.GA6484@localhost>
 <a86d653a-9e3b-46dc-9ec8-94a9c1099bec@email.android.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a86d653a-9e3b-46dc-9ec8-94a9c1099bec@email.android.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Mike Frysinger <vapier@gentoo.org>, Artem Bityutskiy <dedekind1@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Michael Opdenacker <michael.opdenacker@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Feb 10, 2014 at 10:39:18PM +0100, Piergiorgio Beruto wrote:
> Hi all,
> Please, the possibility to disable at compile time unneeded code to save
> memory and/or cpu speed would make the life of embedded developers much more
> easier.
> 
> Ubiblk was exactly what we were looking for, in my personal opinion the
> possibility to disable caching and rw feature is of very high value.

Reminds me the happy days of CONFIG_TINY :-)
So in practice it's probably just a matter of turning the options to :

    Disable Caching (default N, say Y to save memory)
    Disable Write support (default N, say Y to reduce code size)

Thanks,
Willy
