Subject: Re: [RFC] extending nand_ecclayout.eccpos once again
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Harald Welte <laforge@gnumonks.org>
In-Reply-To: <20090902093045.GB7377@prithivi.gnumonks.org>
References: <20090902093045.GB7377@prithivi.gnumonks.org>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 08 Sep 2009 09:13:35 +0300
Message-Id: <1252390415.5060.38.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Kukjin Kim <kgene.kim@samsung.com>, Jin-Sung Yang <jsgood.yang@samsung.com>,
	Ilho Lee <ilho215.lee@samsung.com>, Marc Zyngier <marc.zyngier@tomtom.com>,
	linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2009-09-02 at 18:30 +0900, Harald Welte wrote:
> Hi!
> 
> There are large page size (4k) NAND chips + corresponding controller that use
> quite a lot of ECC, more than the traditional 48 bytes.
> 
> Specifically, at a 4kB page size and a 8bit ECC, there is a ECC layout
> that uses 104 bytes ECC
> 
> Now the problem is that nand_ecclayout uses a static array of 64 entries,
> and it is part of the MTD ABI to userspace.  simply changing 64 to a bigger
> number will not do.
> 
> I am proposing something along the lines of the following patch, i.e.  add a
> new 'nand_ecclayout2' structure (plus corresponding ioctl).  Unfortunately
> this means that all the drivers also need to rename that structure now.
> 
> However, we cannot simply keep the old name and modify, since that again
> breaks the ABI.
> 
> I'm increasing the size to 1024 bytes, hopefully that will be enough for
> a long time.
> 
> Please provide some feedback on what you think, or ideas for different
> approahces to implement this.
> 
> [pleaes note that this patch is not tested, it's simply to be used for
>  discussion how to proceed. Once there is a decision, I'll provide
>  the final/tested patch together with a ecclayout structure that actually
>  usese this]

Can we instead assume that exposing ECC layout to user-space is jut bad
idea, deprecate current layout ABI, and do not do this anymore.

I mean, really, ECC layout is generally not user's concern. Just do not
expose it and problem is solved.

Is it absolutely necessary to have expose this stuff to user-space?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
