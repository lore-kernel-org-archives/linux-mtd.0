Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cqp8L-0000Nn-Ro
 for linux-mtd@lists.infradead.org; Wed, 22 Mar 2017 22:53:39 +0000
Date: Wed, 22 Mar 2017 23:53:11 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 linux-mtd@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>,
 Stefan Roese <sr@denx.de>
Subject: Re: [PATCH 02/13] mtd: nand: fsmc: rework fsmc_nand_setup() to use
 ->setup_data_interface()
Message-ID: <20170322235311.0da031f3@bbrezillon>
In-Reply-To: <20170322233915.29bf2514@free-electrons.com>
References: <1490090645-8576-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1490090645-8576-3-git-send-email-thomas.petazzoni@free-electrons.com>
 <20170322225617.313aa805@bbrezillon>
 <20170322230553.5daf0562@free-electrons.com>
 <20170322232333.23ae18ab@bbrezillon>
 <20170322233915.29bf2514@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 22 Mar 2017 23:39:15 +0100
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> Hello,
> 
> On Wed, 22 Mar 2017 23:23:33 +0100, Boris Brezillon wrote:
> 
> > > So what do you suggest to keep the compatibility with the existing DT
> > > binding for this NAND controller?    
> > 
> > We have 2 choices here:
> > 1/ drop the old/static timings config and only rely on the dynamic
> >    config. This is a bit risky, because we've only tested the new
> >    timing conversion logic on one board.
> > 2/ keep both solutions around until all boards have switched to the new
> >    solution. In this case, you'll only set the ->setup_data_interface()
> >    hook if timings are not defined in the DT  
> 
> What about the "default" timings that are currently hardcoded in the
> driver, if no timings are specified in the DT? My patch currently does
> the following:
> 
>  - Use DT timings if provided
>  - Use NAND timings if provided
>  - Use "default" timing otherwise

Okay, I didn't notice the 'fallback to "default" timings' in patch 3.
This portion of code will actually never be reached, because the core
always provide valid SDR timings. If the NAND does not support ONFI
timing modes and nothing is specified in the NAND ids table (or the in
vendor specific init code), then the lowest timing mode is assumed
(timing mode 0), and if you implement ->setup_data_interface(), this is
what you will end-up with.

> 
> Should we drop the "default" timing thing?

I think so.

> If not, how does it fit in
> your proposal? Indeed your proposal is simply: if no timings in DT, use
> the NAND timings. But my patch does more than that.

If we really want to keep "default" timmings around, then we'll have to
add an extra Kconfig option, a kernel parameter (or a DT property :-)),
but I'm not a big fan of these solutions.
