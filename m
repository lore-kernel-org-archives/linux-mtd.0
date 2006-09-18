Subject: Re: [-mm patch 2/3] AVR32 MTD: Unlock flash if necessary (try 2)
From: David Woodhouse <dwmw2@infradead.org>
To: Haavard Skinnemoen <hskinnemoen@atmel.com>
In-Reply-To: <20060918102131.1e210276@cad-250-152.norway.atmel.com>
References: <20060915163102.73bf171d@cad-250-152.norway.atmel.com>
	<20060915163554.4f326bf6@cad-250-152.norway.atmel.com>
	<20060915163711.10d19763@cad-250-152.norway.atmel.com>
	<1158334346.24527.94.camel@pmac.infradead.org>
	<20060918101224.12508491@cad-250-152.norway.atmel.com>
	<1158567260.24527.313.camel@pmac.infradead.org>
	<20060918102131.1e210276@cad-250-152.norway.atmel.com>
Content-Type: text/plain
Date: Mon, 18 Sep 2006 09:21:37 +0100
Message-Id: <1158567697.24527.314.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Andrew Morton <akpm@osdl.org>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2006-09-18 at 10:21 +0200, Haavard Skinnemoen wrote:
> Fine with me. The stuff that depends on this (and that I care about)
> is definitely not 2.6.18 material. There could of course be other
> boards where this matters, but they have to speak up for themselves. 

Largely, they have hacks in their own board drivers (or userspace) to
deal with the problem.

-- 
dwmw2
