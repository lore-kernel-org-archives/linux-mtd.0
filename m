Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fxATh-0006cV-9e
 for linux-mtd@lists.infradead.org; Tue, 04 Sep 2018 12:30:42 +0000
Date: Tue, 4 Sep 2018 14:30:28 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "juliensu@mxic.com.tw" <juliensu@mxic.com.tw>, "zhengxunli@mxic.com.tw"
 <zhengxunli@mxic.com.tw>, "masonccyang@mxic.com.tw"
 <masonccyang@mxic.com.tw>
Subject: Re: Query: spi-nor: dummy buswidth calculation
Message-ID: <20180904143028.4629fe10@bbrezillon>
In-Reply-To: <VI1PR04MB1038E10EBE458DD72A1070C499030@VI1PR04MB1038.eurprd04.prod.outlook.com>
References: <VI1PR04MB1038E10EBE458DD72A1070C499030@VI1PR04MB1038.eurprd04.prod.outlook.com>
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

+Macronix team

On Tue, 4 Sep 2018 09:28:11 +0000
Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com> wrote:

> Hi Boris,
> 
> I have query regarding dummy bus width calculation for the read commands, added in the patch series [1]
> 
> In func m25p80_read(), dummy.buswidth is being assigned as
> +       op.dummy.buswidth = op.addr.buswidth;
> 
> Above, buswidth for dummy commands are being assigned and are marked equal to the buswidth of the address command.
> This is true for case when we are doing operation in 1-4-4 or 1-2-2 protocol where data as well as address are running on same data lines and having same buswidth.
> 
> I am adding support of octal commands in framework and for this needs to add support for 1-1-8 protocol for Micron flash MT35XU512ABA1G12.
> For octal command, 7Ch, flash is sending data and the dummy on the 8 data lines and address on 1 data line.

Interesting. Macronix is also working on octo-mode support. I think we
should sync instead of duplicating the work.

> 
> If I do below code change, then I am getting correct data else there is data corruption only in the first byte read.
> -       op.dummy.buswidth = op.addr.buswidth;
> +       op.dummy.buswidth = spi_nor_get_protocol_data_nbits(nor->read_proto);

Regarding this particular aspect, I just followed what was done before
the conversion to spi_mem_exec_op(). Maybe it was not correct though.

Regards,

Boris
