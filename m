Subject: Re: [-mm patch] drivers/mtd/nand/rtc_from4.c: use lib/bitrev.c
From: David Woodhouse <dwmw2@infradead.org>
To: Andrew Morton <akpm@osdl.org>
In-Reply-To: <20061128144907.a9f4bb21.akpm@osdl.org>
References: <20061114014125.dd315fff.akpm@osdl.org>
	<20061122043811.GG5200@stusta.de>
	<1164752376.14595.22.camel@pmac.infradead.org>
	<20061128144907.a9f4bb21.akpm@osdl.org>
Content-Type: text/plain
Date: Tue, 28 Nov 2006 22:52:16 +0000
Message-Id: <1164754336.14595.29.camel@pmac.infradead.org>
Mime-Version: 1.0
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

On Tue, 2006-11-28 at 14:49 -0800, Andrew Morton wrote:
> Won't compile - you don't have the bitrev library patches.

Hm, yeah -- I'd just come to that conclusion :)

> I'll take that as an ack and shall merge this once
> crc32-replace-bitreverse-by-bitrev32.patch is merged ;)

I assume the bitrev thing will be going in as soon as 2.6.19 is actually
released, so there's no point in me reverting it from the mtd tree?

-- 
dwmw2
