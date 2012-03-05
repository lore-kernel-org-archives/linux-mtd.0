Received: from hd5b91d02.k46641.sta.perspektivbredband.net ([213.185.29.2]
 helo=fg-dc1.flatfrog.local)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S4TvO-0002Y8-Md
 for linux-mtd@lists.infradead.org; Mon, 05 Mar 2012 09:09:47 +0000
Message-ID: <4F5482D8.4040901@flatfrog.com>
Date: Mon, 5 Mar 2012 10:09:44 +0100
From: Orjan Friberg <of@flatfrog.com>
MIME-Version: 1.0
To: Matthieu CASTET <matthieu.castet@parrot.com>
Subject: Re: Spurious ECC errors with mtd_subpagetest (OMAP3, NAND)
References: <4F50F2AB.10209@flatfrog.com>
 <CANOLnOM6X=29r7_aMs=z4eiDtw0kvWZ-jSeds_NO0KdZ3E8Ouw@mail.gmail.com>
 <4F5475A8.3050600@flatfrog.com> <4F547FBE.4030805@parrot.com>
In-Reply-To: <4F547FBE.4030805@parrot.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
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

On 03/05/2012 09:56 AM, Matthieu CASTET wrote:
> Note that the omap driver is still broken :
> http://article.gmane.org/gmane.linux.drivers.mtd/36079/match=
>
> We detected this when stressing a board.
>
> Because all of these bugs in omap driver, I wonder how many people really use
> the mainline version.

Do you know any repo where this is working correctly (linux-omap, or one 
of the vendor trees etc)?

> Also if you use a nand that need 4-bit ECC, you need a better ecc than hamming.
> You can use the bch code (
> http://article.gmane.org/gmane.linux.drivers.mtd/37864/match=omap )

Yes, I've been looking at the BCH 4-bit code (both generic 
implementations and the OMAP GPMC-enabled one) in u-boot and linux.


-- 
Orjan Friberg
FlatFrog Laboratories AB
