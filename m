Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cqofd-0006G3-Hx
 for linux-mtd@lists.infradead.org; Wed, 22 Mar 2017 22:24:00 +0000
Date: Wed, 22 Mar 2017 23:23:33 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 linux-mtd@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>,
 Stefan Roese <sr@denx.de>
Subject: Re: [PATCH 02/13] mtd: nand: fsmc: rework fsmc_nand_setup() to use
 ->setup_data_interface()
Message-ID: <20170322232333.23ae18ab@bbrezillon>
In-Reply-To: <20170322230553.5daf0562@free-electrons.com>
References: <1490090645-8576-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1490090645-8576-3-git-send-email-thomas.petazzoni@free-electrons.com>
 <20170322225617.313aa805@bbrezillon>
 <20170322230553.5daf0562@free-electrons.com>
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

On Wed, 22 Mar 2017 23:05:53 +0100
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> Hello,
> 
> On Wed, 22 Mar 2017 22:56:17 +0100, Boris Brezillon wrote:
> 
> > I'm not sure this is such a good idea to move default and DT timings
> > setting in the ->setup_data_interface() hook.
> > 
> > ONFI NANDs are changing an internal parameter to switch to a specific
> > timing mode. If you let the core think that you configured the
> > controller to support this timing mode, while you actually configured
> > it with the default or DT timings it might not work as expected.  
> 
> So what do you suggest to keep the compatibility with the existing DT
> binding for this NAND controller?

We have 2 choices here:
1/ drop the old/static timings config and only rely on the dynamic
   config. This is a bit risky, because we've only tested the new
   timing conversion logic on one board.
2/ keep both solutions around until all boards have switched to the new
   solution. In this case, you'll only set the ->setup_data_interface()
   hook if timings are not defined in the DT

> 
> We also need to take into account that the timings need to be
> reconfigured upon ->resume().

Yes, I know, and I also know how painful it is to add extra code for
backward compat, but I think abusing ->setup_data_interface() is even
worse.

To sum-up, if we go for solution #2, in your resume you'll have to
conditionally call the legacy timing setup logic (only if timings are
defined in the DT) in addition to the nand_reset() call.
