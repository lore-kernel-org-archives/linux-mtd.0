Subject: Re: [-mm patch 3/4] AVR32 MTD: Mapping driver for the ATSTK1000 board
From: David Woodhouse <dwmw2@infradead.org>
To: Haavard Skinnemoen <hskinnemoen@atmel.com>
In-Reply-To: <20060914163259.068abe6d@cad-250-152.norway.atmel.com>
References: <20060914162926.6c117b36@cad-250-152.norway.atmel.com>
	<20060914163026.49766346@cad-250-152.norway.atmel.com>
	<20060914163121.241dec3e@cad-250-152.norway.atmel.com>
	<20060914163259.068abe6d@cad-250-152.norway.atmel.com>
Content-Type: text/plain
Date: Thu, 14 Sep 2006 21:11:28 +0100
Message-Id: <1158264688.4312.82.camel@pmac.infradead.org>
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

On Thu, 2006-09-14 at 16:32 +0200, Haavard Skinnemoen wrote:
> Add mapping driver for the AT49BV6416 NOR flash chip on the ATSTK1000
> development board. 

Hm, can't you set it up in advance and just register a platform_device
for physmap to drive?

-- 
dwmw2
