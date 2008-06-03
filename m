Received: from smtpauth04.prod.mesa1.secureserver.net ([64.202.165.95])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1K3O8X-00064Q-JB
	for linux-mtd@lists.infradead.org; Tue, 03 Jun 2008 04:28:42 +0000
From: "Mark Roths" <mroths@softairmicro.com>
To: "'James'" <jamessteward@optusnet.com.au>
Subject: RE: u-boot reports ecc error on blocks written by nandwrite
Date: Mon, 2 Jun 2008 21:28:39 -0700
Message-ID: <01ca01c8c532$4ccdc6d0$6601a8c0@mrothsduo>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <1212445139.6121.19.camel@Ubuntu-Desktop>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I haven't had a plethora of problems, just this one.  It is also extremely
reproducible leading me to not suspect any kind of timing problem. 

Everything else works find, JFFS2, boot partition etc.

But when I write a block with nandwrite, u-boot chokes on it.

	-Mark

> -----Original Message-----
> From: James [mailto:jamessteward@optusnet.com.au]
> Sent: Monday, June 02, 2008 3:19 PM
> To: Mark Roths
> Cc: linux-mtd@lists.infradead.org
> Subject: RE: u-boot reports ecc error on blocks written by nandwrite
> 
> 
> On Mon, 2008-06-02 at 14:56 -0700, Mark Roths wrote:
> > Yes, u-boot can erase, write, and read with no problems on its own.
> > I use the u-boot nand utilities to build my flash with bootloader, u-
> boot,
> > linux and initrd.  All that works fantastically.
> >
> > The only time I have problems is when I write a block in my boot
> partition
> > using nandwrite, and then subsequently read it with u-boot on the next
> boot.
> > And the completely strange behavior is that if I request 1 byte using
> 'nand
> > read', it fails the 1st time and then succeeds - all reads succeed after
> > that with no ecc errors.
> 
> Sounds almost like a cache problem.
> 
> > Both the mtdchar driver and u-boot are configured for soft ecc, or so I
> > believe from my reading of the code.
> 
> Likely.
> 
> I've had a plethora of problems using the NAND MT29F2G08AACWP on some
> AT91SAM9263-EK boards.  I now feel it might be a timing issue.  Maybe
> yours is too!
> 
> Regards,
> James.
