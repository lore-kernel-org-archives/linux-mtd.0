Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1alHdT-0002mb-3c
 for linux-mtd@lists.infradead.org; Wed, 30 Mar 2016 15:02:22 +0000
Date: Wed, 30 Mar 2016 17:01:56 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Harvey Hunt <harvey.hunt@imgtec.com>
Cc: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>,
 <alex@alex-smith.me.uk>, <linux-mtd@lists.infradead.org>,
 <computersforpeace@gmail.com>, <dwmw2@infradead.org>, Ezequiel Garcia
 <ezequiel@vanguardiasur.com.ar>
Subject: Re: [PATCH] mtd: nand: jz4780: fixup, device structure assigned at
 probe
Message-ID: <20160330170156.612f0acd@bbrezillon>
In-Reply-To: <56FBE483.2010407@imgtec.com>
References: <1458784407-12908-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <20160330163432.29c3864c@bbrezillon> <56FBE483.2010407@imgtec.com>
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

On Wed, 30 Mar 2016 15:36:51 +0100
Harvey Hunt <harvey.hunt@imgtec.com> wrote:

> Hi,
> 
> On 30/03/16 15:34, Boris Brezillon wrote:
> > On Wed, 23 Mar 2016 21:53:27 -0400
> > Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org> wrote:
> >
> > How about adding the following message:
> >
> > "
> > bch->dev is already assigned to &pdev->dev in the probe function.
> > Remove the duplicate assignment done in jz4780_bch_get().
> > "
> >
> > If you agree I'll add this commit message while applying (no need to
> > resend).
> 
> That sounds good to me. Congrats on the maintainership btw. :-)

Thanks.

> 
> >
> > Harvey, can I have your ack on this patch?
> 
> Acked-by: Harvey Hunt <harvey.hunt@imgtec.com>

Applied to nand/next.

Thanks,

Boris


-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
