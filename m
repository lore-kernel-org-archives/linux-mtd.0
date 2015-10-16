Received: from mail-pa0-x232.google.com ([2607:f8b0:400e:c03::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zn80a-0002PX-ME
 for linux-mtd@lists.infradead.org; Fri, 16 Oct 2015 16:37:33 +0000
Received: by pacez2 with SMTP id ez2so9202160pac.1
 for <linux-mtd@lists.infradead.org>; Fri, 16 Oct 2015 09:37:11 -0700 (PDT)
Date: Fri, 16 Oct 2015 09:37:09 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [PATCH 1/2] mtd: pxa3xx_nand: don't duplicate MTD suspend/resume
Message-ID: <20151016163709.GD108923@google.com>
References: <1444681992-4208-1-git-send-email-computersforpeace@gmail.com>
 <CAAEAJfCzVxCEA3opQU2B-wS0U+L-yK3R724W68f=95r+uMPAxg@mail.gmail.com>
 <20151016152654.GB14509@laptop.cereza>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20151016152654.GB14509@laptop.cereza>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Oct 16, 2015 at 12:26:54PM -0300, Ezequiel Garcia wrote:
> On 15 Oct 03:33 PM, Ezequiel Garcia wrote:
> > Robert:
> > 
> > Can you test this on a platform with PM support, and make sure
> > the NAND works fine after a resume?
> > 
> > On 12 October 2015 at 17:33, Brian Norris <computersforpeace@gmail.com> wrote:
> > > mtd_{suspend,resume}() get called from mtdcore in a class suspend/resume
> > > callback. We don't need to call them again here. In practice, this would
> > > actually work OK, as nand_base actually handles nesting OK -- it just
> > > might print warnings.
> > >
> > > Untested, but there are few (no?) users of PM for this driver AFAIK.
> > >
> 
> Brian,
> 
> We discussed this on IRC, but I completely forgot about it :/

No problem.

> Without this patch nand_{suspend, resume} is called twice
> (which seems harmless), tested on Armada XP-GP using nandtest.

Right, I think it's incidentally harmless. But you do get this warning
without the patch set, right?

	nand_resume called for a chip which is not in suspended state

> Tested-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
> Acked-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

Pushed to l2-mtd.git
