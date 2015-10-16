Received: from mail-pa0-x22f.google.com ([2607:f8b0:400e:c03::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zn7yp-0002EX-4J
 for linux-mtd@lists.infradead.org; Fri, 16 Oct 2015 16:35:43 +0000
Received: by pacez2 with SMTP id ez2so9165624pac.1
 for <linux-mtd@lists.infradead.org>; Fri, 16 Oct 2015 09:35:21 -0700 (PDT)
Date: Fri, 16 Oct 2015 09:35:19 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [PATCH 2/2] mtd: pxa3xx_nand: switch to device PM
Message-ID: <20151016163519.GC108923@google.com>
References: <1444681992-4208-1-git-send-email-computersforpeace@gmail.com>
 <1444681992-4208-2-git-send-email-computersforpeace@gmail.com>
 <20151012210741.GN107187@google.com>
 <CAAEAJfDWY2ztYK5y=cBsrntztP+Hm_cDFovPY2YeyRS4XXrr8w@mail.gmail.com>
 <20151016152416.GA14509@laptop.cereza>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20151016152416.GA14509@laptop.cereza>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Oct 16, 2015 at 12:24:17PM -0300, Ezequiel Garcia wrote:
> On 15 Oct 03:32 PM, Ezequiel Garcia wrote:
> > +Robert
> > 
> > On 12 October 2015 at 18:07, Brian Norris <computersforpeace@gmail.com> wrote:
> > > On Mon, Oct 12, 2015 at 01:33:12PM -0700, Brian Norris wrote:
> > >> The old PM model is deprecated. This is equivalent.
> > >>
> > >> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> > >
> > > Sorry, this patch was garbage. Below is the correct one:
> > >
> 
> Tested on Armada XP-GP using standby and checking nandtest
> continues to work after a resume.
> 
> Tested-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
> 
> Patch looks good, so:
> 
> Acked-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
> 
> Thanks!

Pushed to l2-mtd.git
