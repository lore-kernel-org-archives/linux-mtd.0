Date: Mon, 22 Oct 2018 15:56:35 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Eugeniy Paltsev <eugeniy.paltsev@synopsys.com>, Tudor Ambarus
 <tudor.ambarus@microchip.com>
Cc: "marek.vasut@gmail.com" <marek.vasut@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 Alexey Brodkin <alexey.brodkin@synopsys.com>, Vineet Gupta
 <vineet.gupta1@synopsys.com>, "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "richard@nod.at" <richard@nod.at>
Subject: Re: [PATCH v2 0/2] MTD: spi-nor: add support for sst26wf016,
 sst26wf032
Message-ID: <20181022155635.2175a595@bbrezillon>
In-Reply-To: <1540216028.19916.6.camel@synopsys.com>
References: <20180910114628.19156-1-Eugeniy.Paltsev@synopsys.com>
 <1540216028.19916.6.camel@synopsys.com>
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

+Tudor

Hi Eugeniy,

On Mon, 22 Oct 2018 13:47:09 +0000
Eugeniy Paltsev <eugeniy.paltsev@synopsys.com> wrote:

> Hi!
> 
> Maybe you have any comments or remarks about this patch?And if you don't could you please apply it. Thanks!

Sorry, it's already too late for 4.20, and I won't apply patches to the
spi-nor/next branch before 4.20-rc1 is out.

Tudor, Marek, can I have a Reviewed-by/Acked-by on this patchset?

Thanks,

Boris

> 
> On Mon, 2018-09-10 at 14:46 +0300, Eugeniy Paltsev wrote:
> > Add support for the SST sst26wf016 and sst26wf032 flash IC:
> > 
> > sst26wf*** flash series block protection implementation differs from other
> > SST series, so we add implementation for sst26wf*** lock/unlock/is_locked
> > functions.
> > 
> > Add sst26wf016 and sst26wf032 flash IC info to spi_flash_ids list.
> > 
> > NOTE:
> > these patches is basically following mine u-boot commits port:
> > http://git.denx.de/?p=u-boot.git;a=commitdiff;h=3d4fed87a5fa3ffedf64ff2811cd95c5ac4503ac
> > http://git.denx.de/?p=u-boot.git;a=commitdiff;h=a19e97157c3721ef9c4b15c68c1773467a3b4a98
> > 
> > Changes v1->v2:
> >  * Check return value of {read | write}_reg callbacks.
> > 
> > Eugeniy Paltsev (2):
> >   mtd: spi-nor: Add support of sst26wf* flash ICs protection ops
> >   mtd: spi-nor: add support for sst26wf016, sst26wf032
> > 
> >  drivers/mtd/spi-nor/spi-nor.c | 179 ++++++++++++++++++++++++++++++++++++++++++
> >  include/linux/mtd/spi-nor.h   |   4 +
> >  2 files changed, 183 insertions(+)
> >   
