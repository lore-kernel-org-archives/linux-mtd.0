Date: Mon, 21 Jul 2008 11:03:51 -0500
From: Scott Wood <scottwood@freescale.com>
To: Anton Vorontsov <avorontsov@ru.mvista.com>
Subject: Re: [PATCH] [MTD] [NAND] fsl_elbc_nand: fix section mismatch with
	CONFIG_MTD_OF_PARTS=y
Message-ID: <20080721160351.GB13185@loki.buserror.net>
References: <20080714152037.GA21062@polina.dev.rtsoft.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20080714152037.GA21062@polina.dev.rtsoft.ru>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jul 14, 2008 at 07:20:37PM +0400, Anton Vorontsov wrote:
> With CONFIG_MTD_OF_PARTS=y I'm getting this new section mismatch in reference
> from the function fsl_elbc_chip_probe() to the function
> .devinit.text:of_mtd_parse_partitions()
> 
> This patch fixes the mismatch by providing __devinit annotation to the
> fsl_elbc_chip_probe() function.
> 
> Signed-off-by: Anton Vorontsov <avorontsov@ru.mvista.com>

ACK

-Scott
