From: Marek Vasut <marex@denx.de>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH v1 1/7] mtd: spi-nor: fix the wrong dummy value
Date: Thu, 24 Apr 2014 15:45:42 +0200
References: <a> <201404232141.27005.marex@denx.de>
 <20140424045027.GA29664@localhost>
In-Reply-To: <20140424045027.GA29664@localhost>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201404241545.42877.marex@denx.de>
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org,
 computersforpeace@gmail.com, dwmw2@infradead.org,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday, April 24, 2014 at 06:50:29 AM, Huang Shijie wrote:
> On Wed, Apr 23, 2014 at 09:41:26PM +0200, Marek Vasut wrote:
> > On Wednesday, April 23, 2014 at 12:16:49 PM, Huang Shijie wrote:
> > > For the DDR Quad read, the dummy cycles maybe 3 or 6 which is less then
> > > 8. The dummy cycles is actually 8 for SPI fast/dual/quad read.
> > > 
> > > This patch makes preparations for the DDR quad read, it fixes the wrong
> > > dummy value for both the spi-nor.c and m25p80.c.
> > > 
> > > Signed-off-by: Huang Shijie <b32955@freescale.com>
> > 
> > This patch is actually V2, right ?
> 
> yes.
> 
> I mentioned it in the cover letter. Since other patches are the V1.
> I did not change it to v2.

So next one is V3 ;-)

Best regards,
Marek Vasut
