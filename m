Received: from co202.xi-lite.net ([149.6.83.202])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S4Tic-0001om-7n
 for linux-mtd@lists.infradead.org; Mon, 05 Mar 2012 08:56:34 +0000
Message-ID: <4F547FBE.4030805@parrot.com>
Date: Mon, 5 Mar 2012 09:56:30 +0100
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: Orjan Friberg <of@flatfrog.com>
Subject: Re: Spurious ECC errors with mtd_subpagetest (OMAP3, NAND)
References: <4F50F2AB.10209@flatfrog.com>
 <CANOLnOM6X=29r7_aMs=z4eiDtw0kvWZ-jSeds_NO0KdZ3E8Ouw@mail.gmail.com>
 <4F5475A8.3050600@flatfrog.com>
In-Reply-To: <4F5475A8.3050600@flatfrog.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 8bit
Cc: "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Grazvydas Ignotas <notasas@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Orjan Friberg a écrit :
> On 03/02/2012 06:17 PM, Grazvydas Ignotas wrote:
>> IIRC NAND in mainline was broken for very long time on OMAP3, I think
>> it was only fixed in 2.6.39.1.
> 
> That seems to be the case; the 2.6.39.1 diff contains the OMAP NAND sub 
> page write fix (applied locally).
> 
Note that the omap driver is still broken :
http://article.gmane.org/gmane.linux.drivers.mtd/36079/match=

We detected this when stressing a board.

Because all of these bugs in omap driver, I wonder how many people really use
the mainline version.


Also if you use a nand that need 4-bit ECC, you need a better ecc than hamming.
You can use the bch code (
http://article.gmane.org/gmane.linux.drivers.mtd/37864/match=omap )

Matthieu

PS : why omap driver use in omap_dev_ready GPMC*IRQ_STATUS instead of GPMC_STATUS.

PS2 : ecc hamming look strange. Weird isEccFF code. Doesn't seem to handle bit
flip in ecc.
