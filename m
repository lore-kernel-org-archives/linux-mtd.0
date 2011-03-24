Subject: Re: Hit BUG_ON in dma-mapping.c:425 (RFC)
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
In-Reply-To: <20110324092732.GA19935@n2100.arm.linux.org.uk>
References: <4D24A108.2080609@atmel.com> <4D8AFE45.8050609@atmel.com>
	<20110324082521.GB9844@n2100.arm.linux.org.uk>
	<1300955778.2735.68.camel@localhost>
	<20110324092732.GA19935@n2100.arm.linux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 24 Mar 2011 13:08:07 +0200
Message-ID: <1300964887.2735.84.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Hong XU <hong.xu@atmel.com>, Nicolas Ferre <nicolas.ferre@atmel.com>,
	Patrice VILCHEZ <patrice.vilchez@atmel.com>,
	Linux Kernel list <linux-kernel@vger.kernel.org>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>,
	Andrew Victor <linux@maxim.org.za>,
	"'linux-arm-kernel@lists.infradead.org'"
	<linux-arm-kernel@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2011-03-24 at 09:27 +0000, Russell King - ARM Linux wrote:
> The only real answer I can give is: if you want to deal with DMA, you
> absolutely must conform to the restrictions on DMA which means that you
> can't pass vmalloc addresses to the DMA API.

I see, thanks. Well, I do not see any issues with changing MTD-related
SW (JFFS2, UBI, UBIFS, etc) to use kmalloc. But this would require som
non-trivial efforts, although I believe this is doable.

Basically, we have to work with entire eraseblocks often, which may be
128KiB or 256KiB or even 512KiB nowadays. And we vmalloc the
eraseblock-sized buffers in these cases.

We could instead work with arrays of pages (or multiple pages), and then
do things like readv/writev. But this requires a brave knight who'd come
and just implemented this, or a company who'd fund someone to work on
this.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
