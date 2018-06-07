Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fQwQa-0001NW-F9
 for linux-mtd@lists.infradead.org; Thu, 07 Jun 2018 15:02:19 +0000
Date: Thu, 7 Jun 2018 17:01:53 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Richard
 Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org, Mark Brown
 <broonie@kernel.org>, linux-spi@vger.kernel.org, Cyrille Pitchen
 <cyrille.pitchen@microchip.com>, Vignesh R <vigneshr@ti.com>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [RFC PATCH 1/2] spi: spi-mem: Add a new API to support direct
 mapping
Message-ID: <20180607170153.757ca102@xps13>
In-Reply-To: <20180601143603.4047-2-boris.brezillon@bootlin.com>
References: <20180601143603.4047-1-boris.brezillon@bootlin.com>
 <20180601143603.4047-2-boris.brezillon@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris,

On Fri,  1 Jun 2018 16:36:02 +0200, Boris Brezillon
<boris.brezillon@bootlin.com> wrote:

> Most modern QSPI controllers support can directly map a SPI memory (or

s/support// ?

> a portion of the SPI memory) in the CPU address space. Most of the time
> this brings significant performance improvements as it automates the
> whole process of sending SPI memory operations every time a new region
> is accessed.
>=20
> This new API allow SPI memory driver to create direct mappings and then

s/allow/allows/
s/driver/drivers/ ?

> use them to access the memory instead of using spi_mem_exec_op().
>=20
> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> ---
>  drivers/spi/spi-mem.c       | 267 ++++++++++++++++++++++++++++++++++++++=
++----
>  include/linux/spi/spi-mem.h |  72 ++++++++++++
>  2 files changed, 318 insertions(+), 21 deletions(-)
>=20
> diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
> index 990770dfa5cf..90ea0c5263a7 100644
> --- a/drivers/spi/spi-mem.c
> +++ b/drivers/spi/spi-mem.c
> @@ -175,6 +175,44 @@ bool spi_mem_supports_op(struct spi_mem *mem, const =
struct spi_mem_op *op)
>  }
>  EXPORT_SYMBOL_GPL(spi_mem_supports_op);
> =20
> +static int spi_mem_access_start(struct spi_mem *mem)
> +{
> +	struct spi_controller *ctlr =3D mem->spi->controller;
> +
> +	/*
> +	 * Flush the message queue before executing our SPI memory
> +	 * operation to prevent preemption of regular SPI transfers.
> +	 */
> +	spi_flush_queue(ctlr);
> +
> +	if (ctlr->auto_runtime_pm) {
> +		int ret;
> +
> +		ret =3D pm_runtime_get_sync(ctlr->dev.parent);
> +		if (ret < 0) {
> +			dev_err(&ctlr->dev, "Failed to power device: %d\n",
> +				ret);
> +			return ret;
> +		}
> +	}
> +
> +	mutex_lock(&ctlr->bus_lock_mutex);
> +	mutex_lock(&ctlr->io_mutex);
> +
> +	return 0;
> +}
> +
> +static void spi_mem_access_end(struct spi_mem *mem)
> +{
> +	struct spi_controller *ctlr =3D mem->spi->controller;
> +
> +	mutex_unlock(&ctlr->io_mutex);
> +	mutex_unlock(&ctlr->bus_lock_mutex);
> +
> +	if (ctlr->auto_runtime_pm)
> +		pm_runtime_put(ctlr->dev.parent);
> +}
> +
>  /**
>   * spi_mem_exec_op() - Execute a memory operation
>   * @mem: the SPI memory
> @@ -200,30 +238,13 @@ int spi_mem_exec_op(struct spi_mem *mem, const stru=
ct spi_mem_op *op)
>  		return -ENOTSUPP;
> =20
>  	if (ctlr->mem_ops) {
> -		/*
> -		 * Flush the message queue before executing our SPI memory
> -		 * operation to prevent preemption of regular SPI transfers.
> -		 */
> -		spi_flush_queue(ctlr);
> -
> -		if (ctlr->auto_runtime_pm) {
> -			ret =3D pm_runtime_get_sync(ctlr->dev.parent);
> -			if (ret < 0) {
> -				dev_err(&ctlr->dev,
> -					"Failed to power device: %d\n",
> -					ret);
> -				return ret;
> -			}
> -		}
> +		ret =3D spi_mem_access_start(mem);
> +		if (ret)
> +			return ret;
> =20
> -		mutex_lock(&ctlr->bus_lock_mutex);
> -		mutex_lock(&ctlr->io_mutex);
>  		ret =3D ctlr->mem_ops->exec_op(mem, op);
> -		mutex_unlock(&ctlr->io_mutex);
> -		mutex_unlock(&ctlr->bus_lock_mutex);
> =20
> -		if (ctlr->auto_runtime_pm)
> -			pm_runtime_put(ctlr->dev.parent);
> +		spi_mem_access_end(mem);

As this is something you tell me on a weekly basis: would you mind to
separate the direct mapping support and the
spi_mem_access_start/end() helpers introduction in different
patches? :)

> =20
>  		/*
>  		 * Some controllers only optimize specific paths (typically the
> @@ -336,6 +357,210 @@ int spi_mem_adjust_op_size(struct spi_mem *mem, str=
uct spi_mem_op *op)
>  }
>  EXPORT_SYMBOL_GPL(spi_mem_adjust_op_size);
> =20

[...]

> +
> +/**
> + * struct spi_mem_dirmap_desc - Direct mapping descriptor
> + * @mem: the SPI memory device this direct mapping is attached to
> + * @info: information passed at direct mapping creation time
> + * @nodirmap: set to true if the SPI controller does not implement
> + *	      ->mem_ops->dirmap_create() or when this function returned an

s/returned/returns/

> + *	      error. If dirmap is true, all spi_mem_dirmap_{read,write}()
> + *	      calls will use spi_mem_exec_op() to access the memory. This is a
> + *	      degraded mode that allows higher spi_mem drivers to use the same
> + *	      code no matter if the controller supports direct mapping or not
> + * @priv: field pointing to controller specific data
> + *
> + * Common part of a direct mapping descriptor. This object is created by
> + * spi_mem_dirmap_create() and controller implementation of ->create_dir=
map()
> + * can create/attach direct mapping resources to the descriptor in the -=
>priv
> + * field.
> + */
> +struct spi_mem_dirmap_desc {
> +	struct spi_mem *mem;
> +	struct spi_mem_dirmap_info info;
> +	bool nodirmap;
> +	void *priv;
> +};
> +
>  /**
>   * struct spi_mem - describes a SPI memory device
>   * @spi: the underlying SPI device
> @@ -167,10 +210,24 @@ static inline void *spi_mem_get_drvdata(struct spi_=
mem *mem)
>   *		    limitations)
>   * @supports_op: check if an operation is supported by the controller
>   * @exec_op: execute a SPI memory operation
> + * @dirmap_create: create a direct mapping descriptor that can later be =
used to
> + *		   access the memory device. This method is optional

Only *dirmap_create() is marked as optional while all are.

> + * @dirmap_destroy: destroy a memory descriptor previous created by
> + *		    ->dirmap_create()

s/previous/previously/

> + * @dirmap_read: read data from the memory device using the direct mappi=
ng
> + *		 created by ->dirmap_create().
> + * @dirmap_write: write data to the memory device using the direct mappi=
ng
> + *		  created by ->dirmap_create().

I think there is a better kernel-doc way to reference dirmap_create(),
maybe with '@' (I don't remember exactly).

>   *
>   * This interface should be implemented by SPI controllers providing an
>   * high-level interface to execute SPI memory operation, which is usuall=
y the
>   * case for QSPI controllers.
> + *
> + * Note on ->dirmap_{read,write}(): drivers should avoid accessing the d=
irect
> + * mapping from the CPU because doing that can stall the CPU waiting for=
 the
> + * SPI mem transaction to finish, and this will make real-time maintaine=
rs
> + * unhappy and might make your system less reactive. Instead, drivers sh=
ould
> + * use DMA to access this direct mapping.
>   */
>  struct spi_controller_mem_ops {
>  	int (*adjust_op_size)(struct spi_mem *mem, struct spi_mem_op *op);
> @@ -178,6 +235,12 @@ struct spi_controller_mem_ops {
>  			    const struct spi_mem_op *op);
>  	int (*exec_op)(struct spi_mem *mem,
>  		       const struct spi_mem_op *op);
> +	int (*dirmap_create)(struct spi_mem_dirmap_desc *desc);
> +	void (*dirmap_destroy)(struct spi_mem_dirmap_desc *desc);
> +	ssize_t (*dirmap_read)(struct spi_mem_dirmap_desc *desc,
> +			       u64 offs, size_t len, void *buf);
> +	ssize_t (*dirmap_write)(struct spi_mem_dirmap_desc *desc,
> +				u64 offs, size_t len, const void *buf);
>  };
> =20
>  /**
> @@ -236,6 +299,15 @@ bool spi_mem_supports_op(struct spi_mem *mem,
>  int spi_mem_exec_op(struct spi_mem *mem,
>  		    const struct spi_mem_op *op);
> =20
> +struct spi_mem_dirmap_desc *
> +spi_mem_dirmap_create(struct spi_mem *mem,
> +		      const struct spi_mem_dirmap_info *info);
> +void spi_mem_dirmap_destroy(struct spi_mem_dirmap_desc *desc);
> +ssize_t spi_mem_dirmap_read(struct spi_mem_dirmap_desc *desc,
> +			    u64 offs, size_t len, void *buf);
> +ssize_t spi_mem_dirmap_write(struct spi_mem_dirmap_desc *desc,
> +			     u64 offs, size_t len, const void *buf);
> +
>  int spi_mem_driver_register_with_owner(struct spi_mem_driver *drv,
>  				       struct module *owner);
> =20

The rest is clear for me.

Thanks,
Miqu=C3=A8l
