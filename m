Subject: Re: [PATCH] OneNAND: Runtime badblock check support
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Kyungmin Park <kmpark@infradead.org>
In-Reply-To: <9c9fda240907211939ud11b9adiae68c076bfbbe36f@mail.gmail.com>
References: <20090721025303.GA3693@july> <4A659ED4.9040702@gmail.com>
	<9c9fda240907210405p7d6982a5yc6db5eca42bfc1e@mail.gmail.com>
	<9c9fda240907211939ud11b9adiae68c076bfbbe36f@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 22 Jul 2009 09:19:50 +0300
Message-Id: <1248243590.24676.17.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2009-07-22 at 11:39 +0900, Kyungmin Park wrote:
> Hi,
> 
> On Tue, Jul 21, 2009 at 8:05 PM, Kyungmin Park<kmpark@infradead.org> wrote:
> > Hi
> >
> > On Tue, Jul 21, 2009 at 7:56 PM, Artem Bityutskiy<dedekind1@gmail.com> wrote:
> >> Hi,
> >>
> >> On 07/21/2009 05:53 AM, Kyungmin Park wrote:
> >>>
> >>> At bootloader, we don't need to read full page. It takes too long time.
> >>> Instead it only read pages required for boot.
> >>>
> >>> Signed-off-by: Kyungmin Park<kyungmin.park@samsung.com>
> >>> ---
> >>
> >> I do not understand the commit message. Could you please provide a better
> >> one which explains what the patch is really doing and why.
> >
> > Right, the page means all blocks. It doesn't scan all blocks at boot
> > time. only some block contains kernel part are read and boot.
> >
> > The goal is simple, Avoid double scanning at boot time. One time for
> > bootloader, Another is kernel.
> > As you know at bootloader, only load kernel in normal case. it means
> > we only read the kernel bad blocks and handle it.
> > and jump to the kernel. that's all
> >

I understand the double-scanning issue. But I still do not understand
how your patch is avoiding it? If the boot-loader has scanned the
flash, it should pass the bad-block bitmap to the kernel. If you have
on-flash BBT, then probably this is not a problem.

> Experimental idea.
> How about to integrate the bbt scan and ubi scan?

It is possible, but isn't it better to just have on-flash BBT and
forget about any scanning for bad blocks at all?

We could go even further: If the boot-loader supports ubi, it could do
the scanning and pass all UBI data to the kernel, in which case UBI
would not need to do any scanning.

> At ubi scan time. it scans all ubi blocks. In different from NAND,
> OneNAND read main page and spare page both.
> So if runtime badblock check enabled, read the page and check oob
> first and if it's valid. use main page. If not, set it's badblock.
> I'm not sure how much codes are modified. :)
> 
> How to you think?

It is possible, but I think the implementation will add more ugliness...
Why not to just use on-flash BBT instead?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
