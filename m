Subject: Re: [Uclinux-dist-devel] [PATCH 1/2] mtd: physmap: add
	physmap_unmapped_area() for no-mmu XIP
From: David Woodhouse <dwmw2@infradead.org>
To: Mike Frysinger <vapier.adi@gmail.com>
In-Reply-To: <AANLkTikMrbK4B22Q=aa1zWmx_M-f_eqnKHcaZZb7qj9i@mail.gmail.com>
References: <1274599824-17530-1-git-send-email-vapier@gentoo.org>
	<1276352794.19028.122.camel@localhost>
	<1280914408.19499.8.camel@localhost>
	<AANLkTikMrbK4B22Q=aa1zWmx_M-f_eqnKHcaZZb7qj9i@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 08 Aug 2010 12:33:20 +0100
Message-ID: <1281267200.19967.246.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: David@blackfin.uclinux.org, uclinux-dev@uclinux.org, dedekind1@gmail.com,
	Paul@blackfin.uclinux.org, Schmidt <bernds_cb1@t-online.de>,
	David Howells <dhowells@redhat.com>, Mundt <lethal@linux-sh.org>,
	linux-mtd@lists.infradead.org, Greg Ungerer <gerg@uclinux.org>,
	uclinux-dist-devel@blackfin.uclinux.org,
	Bernd@blackfin.uclinux.org, McCullough <davidm@snapgear.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2010-08-07 at 19:26 -0400, Mike Frysinger wrote:
> can you can safely do XIP on writable flash devices ?  with nommu, you
> certainly cant.  plus, it is only possible with certain filesystems
> right ?  like ROMFS ?  and that's already r/o ...

As long as you don't allow any process to run that has part of the flash
chip mapped, you ought to be able to do it.

You might not want to use XIP for *everything* in that case -- but you
could imagine a situation where your critical processes are in RAM but
optional extra apps are XIP.

It's hard to implement though, because you'd have to keep track of which
processes need to be blocked and have some way to ensure it happens.

> if we delve a bit, what you're referring to is only possible i think
> if this change is merged (we posted this back in Jan w/no feedback):
>   mtd-physmap: add support users can assign the probe type in board files
> 
> otherwise, there's no way of declaring a physmap of a parallel nor
> flash and having it end up with read-only capabilities ...

Hm, yeah -- that one looks sane enough. I can merge that, although part
1 of that 2-part series I still object to because I don't *want*
different architectures to use different config symbols for the same
thing. Driver code shouldn't have to cope with that.

-- 
dwmw2
