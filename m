Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c8P8M-00074p-2R
 for linux-mtd@lists.infradead.org; Sun, 20 Nov 2016 10:14:03 +0000
Date: Sun, 20 Nov 2016 11:13:35 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Daniel Walter <dwalter@sigma-star.at>
Cc: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 computersforpeace@gmail.com, dwmw2@infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 19/46] mtd: nandsim: UAPI v1
Message-ID: <20161120111335.125f4a4b@bbrezillon>
In-Reply-To: <d7d9e926ff122be5801b6788b96adb8d24289ceb.1474450296.git.dwalter@sigma-star.at>
References: <cover.1474450295.git.dwalter@sigma-star.at>
 <d7d9e926ff122be5801b6788b96adb8d24289ceb.1474450296.git.dwalter@sigma-star.at>
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

Daniel, Richard,

On Wed, 21 Sep 2016 11:50:45 +0200
Daniel Walter <dwalter@sigma-star.at> wrote:

> From: Richard Weinberger <richard@nod.at>
> 
> Expose nandsim creation and delete functions
> to user-space

Did you consider using configfs for nandsim dev creation/removal. The
main benefit I see in using configfs is that you can extend the
parameters without breaking the ABI.

Here is an example of what I have in mind:

mtdsim subsystem:

 <configfs-mountpoint>/mtdsim

nand backend:

 <configfs-mountpoint>/mtdsim/nand

create and configure a new nandsim device:

 mkdir <configfs-mountpoint>/mtdsim/nand/<dev-name>
 echo xxx >  <configfs-mountpoint>/mtdsim/nand/<dev-name>/pagesize
 echo xxx >  <configfs-mountpoint>/mtdsim/nand/<dev-name>/oobsize
 ...

create and configure a partitition:

 mkdir <configfs-mountpoint>/mtdsim/nand/<dev-name>/<part-name>
 echo xxx > <configfs-mountpoint>/mtdsim/nand/<dev-name>/<part-name>/offset
 echo xxx > <configfs-mountpoint>/mtdsim/nand/<dev-name>/<part-name>/size

Once your done with the configuration of your nandsim device, you
can register it by doing:

 echo 1 >  <configfs-mountpoint>/mtdsim/nand/<dev-name>/enable

and unregister it with:

 echo 0 >  <configfs-mountpoint>/mtdsim/nand/<dev-name>/enable

This way, each time you need to add a new feature (bitflips emulation,
paired pages emulation, ...) or a new property, you can just add an
extra attribute to the configfs interface without breaking the previous
ABI.

I'd really prefer this solution over the nandsim_ctrl dev exposed in
/dev/.

What do you think.

> 
> Signed-off-by: Richard Weinberger <richard@nod.at>
> ---
>  include/uapi/mtd/nandsim-user.h | 102 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 102 insertions(+)
>  create mode 100644 include/uapi/mtd/nandsim-user.h
> 
> diff --git a/include/uapi/mtd/nandsim-user.h b/include/uapi/mtd/nandsim-user.h
> new file mode 100644
> index 0000000..b52d620
> --- /dev/null
> +++ b/include/uapi/mtd/nandsim-user.h
> @@ -0,0 +1,102 @@
> +#ifndef __NANDSIM_USER_H__
> +#define __NANDSIM_USER_H__
> +
> +#include <linux/types.h>
> +
> +#define NANDSIM_IOC_MAGIC 'n'
> +
> +#define NANDSIM_IOC_NEW_INSTANCE _IOW(NANDSIM_IOC_MAGIC, 0, struct ns_new_instance_req)
> +#define NANDSIM_IOC_DESTROY_INSTANCE _IOW(NANDSIM_IOC_MAGIC, 1, struct ns_destroy_instance_req)
> +
> +#define NANDSIM_MAX_DEVICES 32
> +#define NANDSIM_MAX_PARTS 32
> +
> +enum ns_backend_type {
> +	NANDSIM_BACKEND_RAM = 0,
> +	NANDSIM_BACKEND_CACHEFILE = 1,
> +	NANDSIM_BACKEND_FILE = 2,
> +	NANDSIM_BACKEND_MAX,
> +};
> +
> +/**
> + * struct ns_new_instance_req - Create a new nandsim instance.
> + *
> + * @id_bytes: NAND ID of the simulated NAND chip
> + * @bus_width: bus width to emulate, either 8 or 16
> + * @bbt_mode: bad block table mode, 0 OOB, 1 BBT with marker in OOB,
> + *            2 BBT with marker in data area
> + * @no_oob: backing file contains no OOB data
> + * @bch_strength: instead of hamming ECC use BCH with given strength
> + * @parts_num: number of MTD partitions to create
> + * @parts: partition sizes in physical erase blocks, used then @parts_num > 0
> + * @backend: backend type, see @ns_backend_type
> + * @file_fd: file describtor of backend, only for @NANDSIM_BACKEND_CACHEFILE
> + *           and @NANDSIM_BACKEND_FILE.
> + * @bitflips: maximum number of random bit flips per page
> + * @overridesize: specifies the NAND size overriding the ID bytes
> + * @access_delay: initial page access delay (microseconds)
> + * @program_delay: page program delay (microseconds)
> + * @erase_delay: sector erase delay (milliseconds)
> + * @output_cycle: word output, from flash, time (nanoseconds)
> + * @input_cycle: word input, to flash, time (nanoseconds)
> + * @simelem_num: number of simulation elements appened to this
> + *               data structure. see @ns_simelement_prop
> + *
> + * This struct is used with the @NANDSIM_IOC_NEW_INSTANCE ioctl command.
> + * It creates a new nandsim instance from the given parameter.
> + * The ioctl command returns in case of success the nandsim id of the new
> + * instance, in case of error a negative value.
> + *
> + * Not all fields in the struct have to be filled, if nandsim should
> + * use a default ignore the value, fill with 0.
> + * The only mandatory fields are @id_bytes and @bus_width.
> + * When @no_oob is non-zero @bch_strength cannot be used since
> + * @no_oob implies that no ECC is used.
> + */
> +struct ns_new_instance_req {
> +	__s8 id_bytes[8];
> +
> +	__s8 bus_width;
> +	__s8 bbt_mode;
> +	__s8 no_oob;
> +	__s32 bch_strength;
> +
> +	__s8 parts_num;
> +	__s32 parts[NANDSIM_MAX_PARTS];
> +
> +	__s8 backend;
> +	__s32 file_fd;
> +
> +	__s32 bitflips;
> +	__s32 overridesize;
> +	__s32 access_delay;
> +	__s32 program_delay;
> +	__s32 erase_delay;
> +	__s32 output_cycle;
> +	__s32 input_cycle;
> +
> +	__s32 padding[4];
> +
> +	__s32 simelem_num;
> +} __packed;
> +
> +enum {
> +	NANDSIM_SIMELEM_BADBLOCK = 0,
> +	NANDSIM_SIMELEM_WEAKBLOCK,
> +	NANDSIM_SIMELEM_WEAKPAGE,
> +	NANDSIM_SIMELEM_GRAVEPAGE,
> +};
> +
> +struct ns_simelement_prop {
> +	__s8 elem_type;
> +	__s32 elem_id;
> +	__s32 elem_attr;
> +	__s8 padding[7];
> +} __packed;
> +
> +struct ns_destroy_instance_req {
> +	__s8 id;
> +	__s8 padding[7];
> +} __packed;
> +
> +#endif /* __NANDSIM_USER_H__ */
