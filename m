Received: from co202.xi-lite.net ([149.6.83.202])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SRkP6-0004TT-R6
 for linux-mtd@lists.infradead.org; Tue, 08 May 2012 13:24:37 +0000
Date: Tue, 8 May 2012 15:23:54 +0200
From: Ivan Djelic <ivan.djelic@parrot.com>
To: "Philip, Avinash" <avinashphilip@ti.com>
Subject: Re: mtd oob test is failing consistently at same places in NAND flash
Message-ID: <20120508132354.GA16164@parrot.com>
References: <518397C60809E147AF5323E0420B992E3E934BF1@DBDE01.ent.ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <518397C60809E147AF5323E0420B992E3E934BF1@DBDE01.ent.ti.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, May 08, 2012 at 01:33:06PM +0100, Philip, Avinash wrote:
> Hi,
> 
> We are having an 8-bit NAND part (MT29F2G08ABAEAWP from Micron) connected to GPMC
> Module (General purpose memory controller) from TI.

Hi,
How is ecc performed ?
Using NAND internal ecc ? or with GPMC 1-bit Hamming ? 4-bit/8-bit BCH ?
Which version of omap2 driver are you using ?
Is OOB also ECC-protected ?

> We have been seeing mtd_oobtest failure on a partition size of 248 MB. Most of
> the time, test case 2 of mtd_oobtest is failing. On debugging further it seems
> that bit flip is happening on the test case 2 in OOB area. It is observed that
> the failure locations are consistent. 

If you are able to reproduce failures, then you should be able to tell which bits
in OOB are failing, by adding a few debugging lines in the code.

> To verify further we had tried writing zeros to OOB area and read it back. 
> This test is passing and confirms that all OOB bits (that are programmable)
> are not bad.

It does not confirm anything, bits can fail by remaining stuck at 0.

BR,
--
Ivan
