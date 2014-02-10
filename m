Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WCmaB-0003bD-LT
 for linux-mtd@lists.infradead.org; Mon, 10 Feb 2014 08:51:16 +0000
Message-ID: <1392022233.32363.13.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 1/1] ubi: Introduce block devices for UBI volumes
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Date: Mon, 10 Feb 2014 10:50:33 +0200
In-Reply-To: <20140210082714.GB10872@localhost>
References: <52F6B602.3030905@nod.at> <20140208230159.GC22376@1wt.eu>
 <52F6BA07.60707@nod.at> <20140208231501.GG22376@1wt.eu>
 <52F6BCCD.5070302@nod.at> <20140208233758.GH22376@1wt.eu>
 <52F6C916.2030506@nod.at> <20140209075157.GJ22376@1wt.eu>
 <20140210024827.GB9643@localhost>
 <1392017750.31031.8.camel@sauron.fi.intel.com>
 <20140210082714.GB10872@localhost>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Mike Frysinger <vapier@gentoo.org>, Richard Weinberger <richard@nod.at>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Michael Opdenacker <michael.opdenacker@free-electrons.com>,
 Piergiorgio Beruto <piergiorgio.beruto@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Willy Tarreau <w@1wt.eu>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2014-02-10 at 05:27 -0300, Ezequiel Garcia wrote:
> > WRT to DANGEROUS sign, people do not read Kconfig help. Some distro
> will
> > just enable this, people will start using this, and then start
> sending
> > unappy e-mails. We have this with MTD block. No matter how many
> times I
> > wrote to people that this is just a debugging module, they still
> kept
> > using it.
> > 
> 
> If you really think distros will enable it and users will "just it",
> without
> thinking about the consequences, then I'd say let's just remove it.

I do not think everyone would do this, of course not. But if there were
many users, some would, I think, yes.

-- 
Best Regards,
Artem Bityutskiy
