Received: from mail-pa0-x22a.google.com ([2607:f8b0:400e:c03::22a])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WKknW-0002mg-54
 for linux-mtd@lists.infradead.org; Tue, 04 Mar 2014 08:33:59 +0000
Received: by mail-pa0-f42.google.com with SMTP id fb1so3444618pad.1
 for <linux-mtd@lists.infradead.org>; Tue, 04 Mar 2014 00:33:30 -0800 (PST)
Date: Tue, 4 Mar 2014 00:33:25 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Leon Pollak <leonp@plris.com>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org, Linux Kernel <linux-kernel@vger.kernel.org>,
 Al Viro <viro@zeniv.linux.org.uk>, Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: What is wrong?
Message-ID: <20140304083325.GJ13420@norris-Latitude-E6410>
References: <4315632.KkRm7kzq26@leonp.plris.com>
 <20140227011148.GI4194@ld-irv-0074>
 <1553411.O1igofskp7@leonp.plris.com>
 <20140227212208.GG13420@norris-Latitude-E6410>
 <20140303211336.GA7369@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20140303211336.GA7369@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Mar 03, 2014 at 03:13:36PM -0600, Andrew Ruder wrote:
> On Thu, Feb 27, 2014 at 01:22:08PM -0800, Brian Norris wrote:
> > Perhaps Richard or Andrew can comment on whether this patch should help
> > you. But I think JFFS2 on NAND uses write-buffered support which can be
> > affected by this bug.
> 
> Definitely sounds like the same issue and I'm kind of glad to see it
> crop up in another filesystem.

We haven't confirmed that the *patch* actually affects Leon's problem;
just that if he runs an additional 'sync' it solves his problem. Leon,
did you get to try the patch?

Anyway, should commit 807612db2f9940b9fa6deaef054eb16d51bd3e00 be marked
for -stable? 

Brian
