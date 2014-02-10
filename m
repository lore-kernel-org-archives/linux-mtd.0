Received: from 1wt.eu ([62.212.114.60])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WCtWu-0001ff-Kf
 for linux-mtd@lists.infradead.org; Mon, 10 Feb 2014 16:16:21 +0000
Date: Mon, 10 Feb 2014 17:15:45 +0100
From: Willy Tarreau <w@1wt.eu>
To: "Bityutskiy, Artem" <artem.bityutskiy@intel.com>
Subject: Re: [PATCH 1/1] ubi: Introduce block devices for UBI volumes
Message-ID: <20140210161545.GE28464@1wt.eu>
References: <20140208233758.GH22376@1wt.eu> <52F6C916.2030506@nod.at>
 <20140209075157.GJ22376@1wt.eu> <20140210024827.GB9643@localhost>
 <1392017750.31031.8.camel@sauron.fi.intel.com>
 <20140210082714.GB10872@localhost> <20140210084616.GP22376@1wt.eu>
 <20140210142026.GB15607@localhost>
 <1392043814.32363.49.camel@sauron.fi.intel.com>
 <1392043932.32363.50.camel@sauron.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1392043932.32363.50.camel@sauron.fi.intel.com>
Cc: "thomas.petazzoni@free-electrons.com"
 <thomas.petazzoni@free-electrons.com>, "vapier@gentoo.org" <vapier@gentoo.org>,
 "michael.opdenacker@free-electrons.com"
 <michael.opdenacker@free-electrons.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "ezequiel.garcia@free-electrons.com" <ezequiel.garcia@free-electrons.com>,
 "richard@nod.at" <richard@nod.at>,
 "piergiorgio.beruto@gmail.com" <piergiorgio.beruto@gmail.com>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Feb 10, 2014 at 02:52:12PM +0000, Bityutskiy, Artem wrote:
> On Mon, 2014-02-10 at 16:50 +0200, Artem Bityutskiy wrote:
> > Or mark R/W as experimental and make your module to be R/O by default.
> > Force people to use 'blockdev --setro' if they want R/W. Run-time.
> 
> Err, here I did not mean the Kconfig experimental. I am asking for no
> Kconfig options for this. I more meant like tell people where the docs
> are, and tell there that write support is experimental.

I'd rather have no option either and have it naturally support the
features. Build-time options are always annoying, you disable them
at the beginning believing they're useless, then you regret this
when you try to use them...

Willy
