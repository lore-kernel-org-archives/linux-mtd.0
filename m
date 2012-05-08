Received: from co202.xi-lite.net ([149.6.83.202])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SRpQ6-000161-TB
 for linux-mtd@lists.infradead.org; Tue, 08 May 2012 18:45:59 +0000
Date: Tue, 8 May 2012 20:45:16 +0200
From: Ivan Djelic <ivan.djelic@parrot.com>
To: "Philip, Avinash" <avinashphilip@ti.com>
Subject: Re: mtd oob test is failing consistently at same places in NAND flash
Message-ID: <20120508184516.GA16380@parrot.com>
References: <518397C60809E147AF5323E0420B992E3E934BF1@DBDE01.ent.ti.com>
 <20120508132354.GA16164@parrot.com>
 <518397C60809E147AF5323E0420B992E3E934DD0@DBDE01.ent.ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <518397C60809E147AF5323E0420B992E3E934DD0@DBDE01.ent.ti.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, May 08, 2012 at 04:09:46PM +0100, Philip, Avinash wrote:
> On Tue, May 08, 2012 at 18:53:54, Ivan Djelic wrote:
> > On Tue, May 08, 2012 at 01:33:06PM +0100, Philip, Avinash wrote:
> > > Hi,
> > > 
> > > We are having an 8-bit NAND part (MT29F2G08ABAEAWP from Micron) 
> > > connected to GPMC Module (General purpose memory controller) from TI.
> > 
> > Hi,
> > How is ecc performed ?
> > Using NAND internal ecc ? or with GPMC 1-bit Hamming ? 4-bit/8-bit BCH ?
> > Which version of omap2 driver are you using ?
> > Is OOB also ECC-protected ?
> 
> Hardware ECC is performing.
> 4-bit BCH ECC scheme is used.
> I am using omap2 driver in Linux 3.2.0 Kernel. Don't know omap2 driver version.

You are probably using a patched kernel, since 3.2.0 does not have GPMC BCH support ?!
What is your ecc layout ? Does it expose oobfree regions ?

> No, OOB is not ECC protected.

Well, in that case, isn't it normal that mtd_oobtest should fail if there happens to be
a single bitflip in the available OOB area ? (of size mtd->ecclayout->oobavail for each page)

BR,
--
Ivan
