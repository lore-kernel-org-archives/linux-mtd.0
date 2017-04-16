Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1czsiC-0007lF-Dd
 for linux-mtd@lists.infradead.org; Sun, 16 Apr 2017 22:32:06 +0000
Received: by mail-wm0-x243.google.com with SMTP id d79so6518624wmi.2
 for <linux-mtd@lists.infradead.org>; Sun, 16 Apr 2017 15:31:44 -0700 (PDT)
Subject: Re: [PATCH v6 2/4] mtd: m25p80: add support of SPI 1-2-2 and 1-4-4
 protocols
To: Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 linux-mtd@lists.infradead.org, kdasu.kdev@gmail.com
References: <cover.1492374675.git.cyrille.pitchen@atmel.com>
 <48bacd7e2c6722789d15488f903a22abbac6a04a.1492374675.git.cyrille.pitchen@atmel.com>
Cc: computersforpeace@gmail.com, dwmw2@infradead.org,
 boris.brezillon@free-electrons.com, richard@nod.at,
 linux-kernel@vger.kernel.org, jartur@cadence.com, mar.krzeminski@gmail.com
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <86a7ceda-def7-dd3c-ad08-c17ecd363771@gmail.com>
Date: Mon, 17 Apr 2017 00:28:40 +0200
MIME-Version: 1.0
In-Reply-To: <48bacd7e2c6722789d15488f903a22abbac6a04a.1492374675.git.cyrille.pitchen@atmel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 04/16/2017 11:41 PM, Cyrille Pitchen wrote:
> Before this patch, m25p80_read() supported few SPI protocols:
> - regular SPI 1-1-1
> - SPI Dual Output 1-1-2
> - SPI Quad Output 1-1-4
> On the other hand, m25p80_write() only supported SPI 1-1-1.
> 
> This patch updates both m25p80_read() and m25p80_write() functions to let
> them support SPI 1-2-2 and SPI 1-4-4 protocols for Fast Read and Page
> Program SPI commands.
> 
> It adopts a conservative approach to avoid regressions. Hence the new
> implementations try to be as close as possible to the old implementations,
> so the main differences are:
> - the tx_nbits values now being set properly for the spi_transfer
>   structures carrying the (op code + address/dummy) bytes
> - and the spi_transfer structure being split into 2 spi_transfer
>   structures when the numbers of I/O lines are different for op code and
>   for address/dummy byte transfers on the SPI bus.
> 
> Besides, the current spi-nor framework supports neither the SPI 2-2-2 nor
> the SPI 4-4-4 protocols. So, for now, we don't need to update the
> m25p80_{read|write}_reg() functions as SPI 1-1-1 is the only one possible
> protocol.
> 
> Signed-off-by: Cyrille Pitchen <cyrille.pitchen@atmel.com>

Reviewed-by: Marek Vasut <marek.vasut@gmail.com>

-- 
Best regards,
Marek Vasut
