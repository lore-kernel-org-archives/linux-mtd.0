Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gUaO1-0005qv-SX
 for linux-mtd@lists.infradead.org; Wed, 05 Dec 2018 16:50:59 +0000
Date: Wed, 5 Dec 2018 17:50:46 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: <Tudor.Ambarus@microchip.com>
Cc: <marek.vasut@gmail.com>, <alexandre.belloni@bootlin.com>,
 <richard@nod.at>, <linux-mtd@lists.infradead.org>,
 <alexander.sverdlin@nokia.com>, <computersforpeace@gmail.com>,
 <dwmw2@infradead.org>
Subject: Re: [PATCH v4 3/3] mtd: spi-nor: Add a post BFPT fixup for MX25L25635E
Message-ID: <20181205175046.1554cf61@bbrezillon>
In-Reply-To: <ff941bc1-8165-a188-1814-8eede77f3daf@microchip.com>
References: <20181129144143.26079-1-boris.brezillon@bootlin.com>
 <20181129144143.26079-4-boris.brezillon@bootlin.com>
 <ff941bc1-8165-a188-1814-8eede77f3daf@microchip.com>
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

On Wed, 5 Dec 2018 16:41:05 +0000
<Tudor.Ambarus@microchip.com> wrote:

> On 11/29/2018 04:41 PM, Boris Brezillon wrote:
> > MX25L25635F and MX25L25635E share the same JEDEC-ID, but the F variant
> > supports 4-byte opcodes while the E variant doesn't. We need a way to
> > differentiate those 2 chips and set the SNOR_F_4B_OPCODES flag only for
> > the F variant.
> > 
> > Luckily, 4-byte opcode support is not the only difference: Fast Read
> > 4-4-4 is only supported by the F variant, and this feature is
> > advertised in the BFPT table. Use this to decide when to set the
> > SNOR_F_4B_OPCODES flag.
> > 
> > Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>  
> 
> Looks good. I'm not very keen of seeing yet another style when declaring spi nor
> ids, but I can live with it.

Oops. Will fix that in v2.
