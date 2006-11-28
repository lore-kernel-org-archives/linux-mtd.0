Subject: Re: [-mm patch] drivers/mtd/nand/rtc_from4.c: use lib/bitrev.c
From: David Woodhouse <dwmw2@infradead.org>
To: Adrian Bunk <bunk@stusta.de>
In-Reply-To: <20061122043811.GG5200@stusta.de>
References: <20061114014125.dd315fff.akpm@osdl.org>
	<20061122043811.GG5200@stusta.de>
Content-Type: text/plain
Date: Tue, 28 Nov 2006 22:19:36 +0000
Message-Id: <1164752376.14595.22.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Andrew Morton <akpm@osdl.org>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, Akinobu Mita <akinobu.mita@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2006-11-22 at 05:38 +0100, Adrian Bunk wrote:
> This patch converts drivers/mtd/nand/rtc_from4.c to use the new 
> lib/bitrev.c
> 
> Signed-off-by: Adrian Bunk <bunk@stusta.de>

Applied; thanks.

-- 
dwmw2
