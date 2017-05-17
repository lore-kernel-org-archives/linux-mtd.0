Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dB1Pz-0005hL-4D
 for linux-mtd@lists.infradead.org; Wed, 17 May 2017 16:03:21 +0000
Date: Wed, 17 May 2017 18:02:56 +0200
From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Cyrille
 Pitchen <cyrille.pitchen@wedev4u.fr>
Subject: Re: [PATCH] mtd: nand: Support 'EXIT GET STATUS' command in
 nand_command_lp()
Message-ID: <20170517180256.0b2abafd@free-electrons.com>
In-Reply-To: <1494952545-5089-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1494952545-5089-1-git-send-email-boris.brezillon@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

On Tue, 16 May 2017 18:35:45 +0200, Boris Brezillon wrote:
> READ0 is sometimes used to exit GET STATUS mode. When this is the case
> no address cycles are requested, and we can use this information to
> detect that READSTART should not be issued after READ0 or that we
> shouldn't wait for the chip to be ready.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>

Tested-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

On Spear600, which has the FSMC NAND controller, on a platform with a
Micron SLC NAND with on-die ECC.

Tested both mtd_speedtest.ko and mtd_nandbiterrs.ko. The speedtest
shows a nice read speed improvements.

Before:

mtd_speedtest: eraseblock read speed is 8545 KiB/s
mtd_speedtest: page read speed is 8428 KiB/s
mtd_speedtest: 2 page read speed is 8486 KiB/s

After:

mtd_speedtest: eraseblock read speed is 9834 KiB/s
mtd_speedtest: page read speed is 9682 KiB/s
mtd_speedtest: 2 page read speed is 9756 KiB/s

The write and erase speeds are unchanged.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
