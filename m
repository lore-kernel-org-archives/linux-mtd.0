Received: from smtp.osdl.org ([65.172.181.25])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1GpBlc-0001bJ-4j
	for linux-mtd@lists.infradead.org; Tue, 28 Nov 2006 17:49:37 -0500
Date: Tue, 28 Nov 2006 14:49:07 -0800
From: Andrew Morton <akpm@osdl.org>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [-mm patch] drivers/mtd/nand/rtc_from4.c: use lib/bitrev.c
Message-Id: <20061128144907.a9f4bb21.akpm@osdl.org>
In-Reply-To: <1164752376.14595.22.camel@pmac.infradead.org>
References: <20061114014125.dd315fff.akpm@osdl.org>
	<20061122043811.GG5200@stusta.de>
	<1164752376.14595.22.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	Akinobu Mita <akinobu.mita@gmail.com>, Adrian Bunk <bunk@stusta.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 28 Nov 2006 22:19:36 +0000
David Woodhouse <dwmw2@infradead.org> wrote:

> On Wed, 2006-11-22 at 05:38 +0100, Adrian Bunk wrote:
> > This patch converts drivers/mtd/nand/rtc_from4.c to use the new 
> > lib/bitrev.c
> > 
> > Signed-off-by: Adrian Bunk <bunk@stusta.de>
> 
> Applied; thanks.
> 

Won't compile - you don't have the bitrev library patches.

I'll take that as an ack and shall merge this once
crc32-replace-bitreverse-by-bitrev32.patch is merged ;)
