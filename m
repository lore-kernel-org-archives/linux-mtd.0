Received: from mail-pa0-x230.google.com ([2607:f8b0:400e:c03::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZSH4l-0004dE-QF
 for linux-mtd@lists.infradead.org; Thu, 20 Aug 2015 04:03:40 +0000
Received: by padfo6 with SMTP id fo6so11995159pad.0
 for <linux-mtd@lists.infradead.org>; Wed, 19 Aug 2015 21:03:15 -0700 (PDT)
Date: Wed, 19 Aug 2015 21:03:12 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH RESEND 0/2] mtd: nand: pxa3xx-nand: fixes
Message-ID: <20150820040312.GB74600@google.com>
References: <1440009015-3765-1-git-send-email-robert.jarzmik@free.fr>
 <CAAEAJfAuV7shpbp=k_dd4L6cSJcu4E+WVRcRpipXKBq0aGwT3w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAEAJfAuV7shpbp=k_dd4L6cSJcu4E+WVRcRpipXKBq0aGwT3w@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Aug 19, 2015 at 06:18:57PM -0300, Ezequiel Garcia wrote:
> On 19 August 2015 at 15:30, Robert Jarzmik <robert.jarzmik@free.fr> wrote:
> > Hi Brian,
> >
> > As promised, here are the remaining fixes I have on pxa3xx-nand I'd like you to
> > queue up. The other changes I have submitted are under review and not of "fixes" type.
> >
> > Cheers.
> >
> > --
> > Robert
> >
> > Robert Jarzmik (2):
> >   mtd: nand: pxa3xx_nand: fix early spurious interrupt
> >   mtd: nand: pxa3xx-nand: fix random command timeouts
> >
> 
> For both patches:
> 
> Acked-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
> 
> I tested this on Armada 370:
> 
> Tested-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

Pushed both to l2-mtd.git, with Ezequiel's tags. Thanks for collecting
the patches, testing, and reviewing.

Brian
