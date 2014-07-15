Received: from mail-qc0-x236.google.com ([2607:f8b0:400d:c01::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X6rpq-0001Iz-1V
 for linux-mtd@lists.infradead.org; Tue, 15 Jul 2014 01:47:14 +0000
Received: by mail-qc0-f182.google.com with SMTP id r5so3513587qcx.41
 for <linux-mtd@lists.infradead.org>; Mon, 14 Jul 2014 18:46:52 -0700 (PDT)
Date: Mon, 14 Jul 2014 18:46:49 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Dinh Nguyen <dinguyen@altera.com>
Subject: Re: [PATCH V2] In the Denali NAND controller driver, use 8 bytes for
 READID command.
Message-ID: <20140715014649.GT7537@ld-irv-0074>
References: <1403551270-31873-1-git-send-email-grmoore@altera.com>
 <1403553015.9081.7.camel@linux-builds1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1403553015.9081.7.camel@linux-builds1>
Cc: ggrahammoore@gmail.com, Graham Moore <grmoore@altera.com>,
 linux-kernel@vger.kernel.org, Yves Vandervennet <rocket.yvanderv@gmail.com>,
 linux-mtd@lists.infradead.org, Alan Tull <atull@altera.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jun 23, 2014 at 02:50:15PM -0500, Dinh Nguyen wrote:
> On Mon, 2014-06-23 at 14:21 -0500, Graham Moore wrote:
> > The Denali NAND driver reads only 5 bytes of ID, but some Hynix and Samsung
> > have size parameters in the 6th byte.  As a result, the page and oob size
> > for a Hynix H27UAG8T2B were calculated incorrectly and the driver failed to
> > load.
> > 
> > The solution is to read 8 bytes of ID, as expected by the nand framework.
> > 
> > Signed-off-by: Graham Moore <grmoore@altera.com>
> > --
> > V2: Increase size of id_bytes array to 8.
> > ---
> >  drivers/mtd/nand/denali.c |    6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> Your commit header should have "mtd: denali:"
> 
> i.e: "mtd: denali: use 8 bytes for READID command"

Modified the subject and pushed to l2-mtd.git. Thanks!

Brian
