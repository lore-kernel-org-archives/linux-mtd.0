Received: from mail-ee0-f49.google.com ([74.125.83.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rfe55-0007Ov-Oe
 for linux-mtd@lists.infradead.org; Tue, 27 Dec 2011 20:57:08 +0000
Received: by eekc13 with SMTP id c13so11723435eek.36
 for <linux-mtd@lists.infradead.org>; Tue, 27 Dec 2011 12:57:03 -0800 (PST)
Subject: Re: [PATCH] MTD: drivers return bitlip info to mtd on read
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Dunn <mikedunn@newsguy.com>
Date: Tue, 27 Dec 2011 22:57:00 +0200
In-Reply-To: <4EFA29E4.1020803@newsguy.com>
References: <1324928293-17905-1-git-send-email-mikedunn@newsguy.com>
 <1324974817.1165.51.camel@sauron.fi.intel.com>
 <4EFA29E4.1020803@newsguy.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1325019422.2292.8.camel@koala>
Mime-Version: 1.0
Cc: Scott Branden <sbranden@broadcom.com>, Joern Engel <joern@logfs.org>,
 Kyungmin Park <kyungmin.park@samsung.com>, linux-mtd@lists.infradead.org,
 Jiandong Zheng <jdzheng@broadcom.com>, Robert Jarzmik <robert.jarzmik@free.fr>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-12-27 at 12:26 -0800, Mike Dunn wrote:
> On 12/27/2011 12:33 AM, Artem Bityutskiy wrote:
> > On Mon, 2011-12-26 at 11:38 -0800, Mike Dunn wrote:
> >> This patch changes the meaning of the value returned by the read() and
> >> read_oob() mtd driver methods.  Previously, absent a hard error, these functions
> >> returned either -EUCLEAN (one or more bitflips were corrected) or 0 (no
> >> bitflips).  Drivers now return, absent a hard error, the maximum number of
> >> bitflips that were corrected on any one page.  
> >>
> >> This change is made possible by the fact that all calls to the driver methods
> >> now go through mtd wrapper functions.  The values returned by those wrapper
> >> functions have not changed, nor have their meaning.  Only the values returned to
> >> the mtd wrappers by the driver have changed.
> >>
> >> Tested with nandsim and onenand_sim.  The two drivers that were modified were
> >> compile-tested only.
> >>
> >> Signed-off-by: Mike Dunn <mikedunn@newsguy.com>
> > Hi, I am not sure using the return code is a good way for this.
> 
> 
> OK.  It was a little kludgey, but had the advantage of touching very few drivers
> and leaving the existing function prototypes unchanged.

May be you are right, I need to think. But this is only true when you
are 100% sure no one uses the function pointers directly. The very
reliable way is to rename them, so the offenders would end up with a
compilation error. I am also thinking about out-of-tree drivers.

But I am planning to add leading "_" symbol to the function pointers
(e.g., mtd->read() => mtd->_read()). So this anyway will touch a lot of
code. And then this argument is probably not too strong anymore.

Anyway, let me emphasize that this should not be a show-stopper for
you - proceed with your DoC work meanwile. I'll try to come up with the
changes this week, but no promises, then I'll create a temporary branch
in my tree and we can use it till the end of the 3.3 merge window.

Artem.
