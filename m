Date: Sat, 24 Aug 2013 09:42:03 -0400
From: Huang Shijie <shijie8@gmail.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH V1 4/5] spi: Add Freescale QuadSpi driver
Message-ID: <20130824134201.GA7572@gmail.com>
References: <1376885403-12156-1-git-send-email-b32955@freescale.com>
 <1376885403-12156-5-git-send-email-b32955@freescale.com>
 <20130823164442.GA30359@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20130823164442.GA30359@sirena.org.uk>
Cc: computersforpeace@gmail.com, b44548@freescale.com, dedekind1@gmail.com,
 b18965@freescale.com, linux-spi@vger.kernel.org,
 Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
 kernel@pengutronix.de, shawn.guo@linaro.org, dwmw2@infradead.org,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Aug 23, 2013 at 05:44:42PM +0100, Mark Brown wrote:
> On Mon, Aug 19, 2013 at 12:10:02PM +0800, Huang Shijie wrote:
> 
> > +static int fsl_qspi_nor_do_one_msg(struct spi_master *master,
> > +		struct spi_message *m)
> > +{
> > +	struct fsl_qspi *q = spi_master_get_devdata(master);
> > +	struct spi_transfer *t;
> > +	int ret = 0;
> > +
> > +	list_for_each_entry(t, &m->transfers, transfer_list) {
> > +		if (t->rx_buf && t->tx_buf) {
> > +			dev_err(q->dev,
> > +				"Can't send and receive simultaneously\n");
> > +			ret = -EINVAL;
> > +			break;
> > +		}
> > +
> > +		if (t->tx_buf) {
> > +			ret = fsl_qspi_nor_tx(q, t);
> > +			if (!ret)
> > +				m->actual_length += t->len;
> > +			continue;
> > +		}
> > +
> > +		if (t->rx_buf) {
> > +			ret = fsl_qspi_nor_rx(q, t);
> > +			if (!ret)
> > +				m->actual_length += t->len;
> > +		}
> > +	}
> 
> The driver should flag SPI_HALF_DUPLEX since it doesn't support
> simultaneous RX and TX.
> 
okay, i will add the flag in the next version.


thanks
Huang Shijie
