Date: Fri, 23 Aug 2013 17:44:42 +0100
From: Mark Brown <broonie@kernel.org>
To: Huang Shijie <b32955@freescale.com>
Message-ID: <20130823164442.GA30359@sirena.org.uk>
References: <1376885403-12156-1-git-send-email-b32955@freescale.com>
 <1376885403-12156-5-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="uAKRQypu60I7Lcqm"
Content-Disposition: inline
In-Reply-To: <1376885403-12156-5-git-send-email-b32955@freescale.com>
Subject: Re: [PATCH V1 4/5] spi: Add Freescale QuadSpi driver
Cc: shawn.guo@linaro.org, b44548@freescale.com, dedekind1@gmail.com,
 b18965@freescale.com, linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org,
 kernel@pengutronix.de, computersforpeace@gmail.com, dwmw2@infradead.org,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--uAKRQypu60I7Lcqm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 19, 2013 at 12:10:02PM +0800, Huang Shijie wrote:

Looks good apart from the issues people identified already and a few
small things below:

> +/* Instruction set for the LUT register. */
> +#define CMD			1
> +#define ADDR			2
> +#define DUMMY			3
> +#define MODE			4
> +#define MODE2			5
> +#define MODE4			6
> +#define READ			7
> +#define WRITE			8
> +#define JMP_ON_CS		9
> +#define ADDR_DDR		10
> +#define MODE_DDR		11
> +#define MODE2_DDR		12
> +#define MODE4_DDR		13

Most of the defines in the driver ought to be namespaced to avoid
collisions with other things defining them.  FSL_QSPI_ or something for
example.

> +	default:
> +		dev_err(q->dev, "Unsupported cmd 0x%.2x\n", cmd);
> +		break;
> +	}
> +	return -1;

Return a proper error code.

> +static int fsl_qspi_wait_till_ready(struct fsl_qspi *q)
> +{
> +	unsigned long deadline;
> +	u32 sr;
> +
> +	deadline = jiffies + msecs_to_jiffies(40000);
> +
> +	do {
> +		if ((sr = fsl_qspi_read_sr(q)) < 0)
> +			break;
> +		else if (!(sr & SR_WIP))
> +			return 0;
> +
> +		cond_resched();
> +
> +	} while (!time_after_eq(jiffies, deadline));
> +
> +	return 1;
> +}

Return an error code if we time out?

> +static int fsl_qspi_nor_do_one_msg(struct spi_master *master,
> +		struct spi_message *m)
> +{
> +	struct fsl_qspi *q = spi_master_get_devdata(master);
> +	struct spi_transfer *t;
> +	int ret = 0;
> +
> +	list_for_each_entry(t, &m->transfers, transfer_list) {
> +		if (t->rx_buf && t->tx_buf) {
> +			dev_err(q->dev,
> +				"Can't send and receive simultaneously\n");
> +			ret = -EINVAL;
> +			break;
> +		}
> +
> +		if (t->tx_buf) {
> +			ret = fsl_qspi_nor_tx(q, t);
> +			if (!ret)
> +				m->actual_length += t->len;
> +			continue;
> +		}
> +
> +		if (t->rx_buf) {
> +			ret = fsl_qspi_nor_rx(q, t);
> +			if (!ret)
> +				m->actual_length += t->len;
> +		}
> +	}

The driver should flag SPI_HALF_DUPLEX since it doesn't support
simultaneous RX and TX.

> +	q->clk_en = devm_clk_get(&pdev->dev, "qspi_en");
> +	q->clk = devm_clk_get(&pdev->dev, "qspi");
> +	if (IS_ERR(q->clk_en) || IS_ERR(q->clk)) {
> +		dev_err(&pdev->dev, "failed to get clocks\n");
> +		ret = -ENOENT;
> +		goto map_failed;
> +	}

Should use the actual returned error value from devm_clk_get().

--uAKRQypu60I7Lcqm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJSF5F3AAoJELSic+t+oim9yBAP/2i6P4lmhRQfWO4ToMmx9lfM
QT1e+fwcl+bZZ2VgyzVxmpl9LSRVHNicYVX+7mQiMVNGaW4YoK0J5JGLfkhCLQNr
Yim5nU7gowAEiYFkUWL/SNxrsTg/VU49YEJ4ubbv8C+eT3aScdaquiQ1S5NjLxU1
bo7iLCS4kiR60V2oiRMhgCitv4r39NPsjyApm3HErK6pYnqRsxL9C3n69ntt+oPE
SQtob59wr4kYtdP9+jojXQJW7ZwYdcDT2Od742yFf2oVaKpCyb2r/WUOaoQaYVqc
d45A0gWSoqu551S8WAiMi7V9fgM5unhdiVKnBsvwZJ4+DUvE1UMH/TCZCbsf/VRc
nDNu78ocoWuzah8gO9xK44valxocT9407kXCnxZRZ53HsMespXCZKVi74u9WQFlN
lVXcDblyn/Oko4PkUpL4fkXM9q0z+db96BaRWgrAAvlBSK2HqvKfvfzAG3Z639dO
uRy5Olv7JeLMq8ZKDYRGs/LmTslLH6tBEQRI4JVCbFqA3OZzv9PN5/yXrWp4LIWK
tieaZBcClkoCJIuwbKWG1ghvdabpmg5aUL1O4bN23ivWpszePNaHBeSafZ9WANv8
IMRXcwOHG4fRehWEtAKVZCnZZLnUQYziZVMDxY2GJwUKYRz3KFYYUxUd8okZMZ21
Gr38AfzuErwNqE22DmBz
=oNDj
-----END PGP SIGNATURE-----

--uAKRQypu60I7Lcqm--
