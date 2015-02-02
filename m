Received: from mail-pa0-x232.google.com ([2607:f8b0:400e:c03::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YI9Jj-0002lR-MT
 for linux-mtd@lists.infradead.org; Mon, 02 Feb 2015 05:13:00 +0000
Received: by mail-pa0-f50.google.com with SMTP id rd3so77550902pab.9
 for <linux-mtd@lists.infradead.org>; Sun, 01 Feb 2015 21:12:37 -0800 (PST)
Date: Sun, 1 Feb 2015 21:12:28 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Aaron Sierra <asierra@xes-inc.com>
Subject: Re: [PATCH 1/2 v2] nand_base: SOFT_BCH: Request strength over bytes
Message-ID: <20150202051228.GB3523@norris-Latitude-E6410>
References: <1048272995.147101.1421278891164.JavaMail.zimbra@xes-inc.com>
 <391096737.68264.1422549968500.JavaMail.zimbra@xes-inc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <391096737.68264.1422549968500.JavaMail.zimbra@xes-inc.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jan 29, 2015 at 10:46:08AM -0600, Aaron Sierra wrote:
> ----- Original Message -----
> > From: "Aaron Sierra" <asierra@xes-inc.com>
> > Sent: Wednesday, January 14, 2015 5:41:31 PM
> > 
> > Previously, we requested that drivers pass ecc.size and ecc.bytes when
> > using NAND_ECC_SOFT_BCH. However, a driver is likely to only know the ECC
> > strength required for its NAND, so each driver would need to perform a
> > strength-to-bytes calculation.
> > 
> > Avoid duplicating this calculation in each driver by asking drivers to
> > pass ecc.size and ecc.strength so that the strength-to-bytes calculation
> > need only be implemented once.
> > 
> > This reverts/generalizes this commit:
> >     mtd: nand: Base BCH ECC bytes on required strength
> > 
> > Signed-off-by: Aaron Sierra <asierra@xes-inc.com>
> > Reviewed-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> > ---
> > v2:
> >     * nandsim: Set ECC strength to chip->ecc.strength
> >     * nand_base: Don't provide ECC bytes-to-strength backward compat
> > 
> >  drivers/mtd/nand/nand_base.c  | 14 ++++++++------
> >  drivers/mtd/nand/nandsim.c    |  1 +
> >  drivers/mtd/nand/sunxi_nand.c |  2 --
> >  3 files changed, 9 insertions(+), 8 deletions(-)
> > 
> 
> Is this patch still being considered despite the changes requested for
> the 2nd patch in this series?

Sorry, I thought I had queued it up. Pushed this patch to l2-mtd.git
now. Thanks.

Brian
