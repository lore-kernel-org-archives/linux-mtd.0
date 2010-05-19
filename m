Received: from mho-02-ewr.mailhop.org ([204.13.248.72])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1OEnrX-0001gT-6W
	for linux-mtd@lists.infradead.org; Wed, 19 May 2010 18:19:23 +0000
Date: Wed, 19 May 2010 11:19:12 -0700
From: Tony Lindgren <tony@atomide.com>
To: Vimal Singh <vimal.newwork@gmail.com>
Subject: Re: [PATCH v3 2/3] omap3 nand: cleanup virtual address usages
Message-ID: <20100519181912.GF5818@atomide.com>
References: <s-ghorai@ti.com>
	<1274181389-7488-1-git-send-email-s-ghorai@ti.com>
	<1274181389-7488-2-git-send-email-s-ghorai@ti.com>
	<1274181389-7488-3-git-send-email-s-ghorai@ti.com>
	<AANLkTinEaP9cN5A24K9Zwd4L9Fq4pzxQqqY44r7NSl4-@mail.gmail.com>
	<2A3DCF3DA181AD40BDE86A3150B27B6B030D991D43@dbde02.ent.ti.com>
	<AANLkTikh1c3tgtO5TvOnNzJKXz7oTnna1WfLiWU67C_5@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AANLkTikh1c3tgtO5TvOnNzJKXz7oTnna1WfLiWU67C_5@mail.gmail.com>
Cc: "Artem.Bityutskiy@nokia.com" <Artem.Bityutskiy@nokia.com>, "Ghorai,
	Sukumar" <s-ghorai@ti.com>, "sakoman@gmail.com" <sakoman@gmail.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

* Vimal Singh <vimal.newwork@gmail.com> [100519 11:02]:
> On Wed, May 19, 2010 at 10:54 PM, Ghorai, Sukumar <s-ghorai@ti.com> wrote:
> >> >        /* take care of subpage reads */
> >> >        for (; len % 4 != 0; ) {
> >> >                *buf++ = __raw_readb(info->nand.IO_ADDR_R);
> >> >                len--;
> >> >        }
> >> > -       p = (u32 *) buf;
> >>
> >> Above code had an issue, which was fixed by this commit:
> >> http://git.infradead.org/mtd-
> >> 2.6.git/commitdiff/c3341d0ceb4de1680572024f50233403c6a8b10d
> >>
> >> I would suggest you to prepare your patch on MTD tree.
> > [Ghorai] Patches started posting on lo. And lets continue the same.
> 
> Not sure about this. Its your/Tony's call.

I'd assume that fix is on it's way to the mainline kernel,
looks like a trivial rebase after the merge window is over.

Anyways, this will not make it this merge window, we're
out of time.

Regards,

Tony 
