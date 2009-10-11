Subject: Re: [PATCH] MTD: Add nand_ecc test module
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Akinobu Mita <akinobu.mita@gmail.com>
In-Reply-To: <1255082095-22158-1-git-send-email-akinobu.mita@gmail.com>
References: <>  <1255082095-22158-1-git-send-email-akinobu.mita@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 11 Oct 2009 16:39:41 +0300
Message-Id: <1255268381.16942.74.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2009-10-09 at 18:54 +0900, Akinobu Mita wrote:
> This module tests NAND ECC functions.
> 
> The test is simple.
> 
> 1. Create a 256 or 512 bytes block of data filled with random bytes (data)
> 2. Duplicate the data block and inject single bit error (error_data)
> 3. Try to correct error_data
> 4. Compare data and error_data

So you want to test the built-in 256/512 software ECC calculation
and correction functions?

> If the test fails, this creates create these files in debugfs:
> 
> /sys/kernel/debug/nand-ecc-test-crashers/
> 
>         <testname>
>         <testname>-error
> 
> <testname> contains data
> <testname>-error contains error_data

Why you need these files? This looks like overkill. Please, remove
them.

> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: linux-mtd@lists.infradead.org
> Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
> ---
>  drivers/mtd/nand/nand_ecc.c       |   25 ++++-
>  drivers/mtd/tests/Makefile        |    1 +
>  drivers/mtd/tests/nand_ecc-test.c |  200 +++++++++++++++++++++++++++++++++++++
>  include/linux/mtd/nand_ecc.h      |    6 +
>  4 files changed, 227 insertions(+), 5 deletions(-)
>  create mode 100644 drivers/mtd/tests/nand_ecc-test.c

Could you please split this on 2 patches - one is changing the generic
code, one is the test itself.

> 
> diff --git a/drivers/mtd/nand/nand_ecc.c b/drivers/mtd/nand/nand_ecc.c
> index db7ae9d..809fb53 100644
> --- a/drivers/mtd/nand/nand_ecc.c
> +++ b/drivers/mtd/nand/nand_ecc.c
> @@ -150,20 +150,19 @@ static const char addressbits[256] = {
>  };
>  
>  /**
> - * nand_calculate_ecc - [NAND Interface] Calculate 3-byte ECC for 256/512-byte
> + * __nand_calculate_ecc - [NAND Interface] Calculate 3-byte ECC for 256/512-byte
>   *			 block
> - * @mtd:	MTD block structure
>   * @buf:	input buffer with raw data
> + * @eccsize:	data bytes per ecc step (256 or 512)
>   * @code:	output buffer with ECC
>   */
> -int nand_calculate_ecc(struct mtd_info *mtd, const unsigned char *buf,
> +void __nand_calculate_ecc(const unsigned char *buf, unsigned int eccsize,
>  		       unsigned char *code)
>  {
>  	int i;
>  	const uint32_t *bp = (uint32_t *)buf;
>  	/* 256 or 512 bytes/ecc  */
> -	const uint32_t eccsize_mult =
> -			(((struct nand_chip *)mtd->priv)->ecc.size) >> 8;
> +	const uint32_t eccsize_mult = eccsize >> 8;
>  	uint32_t cur;		/* current value in buffer */
>  	/* rp0..rp15..rp17 are the various accumulated parities (per byte) */
>  	uint32_t rp0, rp1, rp2, rp3, rp4, rp5, rp6, rp7;
> @@ -412,6 +411,22 @@ int nand_calculate_ecc(struct mtd_info *mtd, const unsigned char *buf,
>  		    (invparity[par & 0x55] << 2) |
>  		    (invparity[rp17] << 1) |
>  		    (invparity[rp16] << 0);
> +}
> +EXPORT_SYMBOL(__nand_calculate_ecc);
> +
> +/**
> + * nand_calculate_ecc - [NAND Interface] Calculate 3-byte ECC for 256/512-byte
> + *			 block
> + * @mtd:	MTD block structure
> + * @buf:	input buffer with raw data
> + * @code:	output buffer with ECC
> + */
> +int nand_calculate_ecc(struct mtd_info *mtd, const unsigned char *buf,
> +		       unsigned char *code)
> +{
> +	__nand_calculate_ecc(buf,
> +			((struct nand_chip *)mtd->priv)->ecc.size, code);
> +
>  	return 0;
>  }
>  EXPORT_SYMBOL(nand_calculate_ecc);
> diff --git a/drivers/mtd/tests/Makefile b/drivers/mtd/tests/Makefile
> index c1d5013..0c23b29 100644
> --- a/drivers/mtd/tests/Makefile
> +++ b/drivers/mtd/tests/Makefile
> @@ -5,3 +5,4 @@ obj-$(CONFIG_MTD_TESTS) += mtd_speedtest.o
>  obj-$(CONFIG_MTD_TESTS) += mtd_stresstest.o
>  obj-$(CONFIG_MTD_TESTS) += mtd_subpagetest.o
>  obj-$(CONFIG_MTD_TESTS) += mtd_torturetest.o
> +obj-$(CONFIG_MTD_TESTS) += nand_ecc-test.o
> diff --git a/drivers/mtd/tests/nand_ecc-test.c b/drivers/mtd/tests/nand_ecc-test.c
> new file mode 100644
> index 0000000..143630c
> --- /dev/null
> +++ b/drivers/mtd/tests/nand_ecc-test.c
> @@ -0,0 +1,200 @@
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/debugfs.h>
> +#include <linux/list.h>
> +#include <linux/slab.h>
> +#include <linux/random.h>
> +#include <linux/string.h>
> +#include <linux/bitops.h>
> +#include <linux/jiffies.h>
> +
> +void inject_single_bit_error(void *data, size_t size)
> +{
> +	unsigned long offset = random32() % (size * BITS_PER_BYTE);
> +
> +	__change_bit(offset, data);
> +}
> +
> +static struct dentry *ecc_test_dir;
> +
> +struct ecc_test_blob {
> +	struct dentry *dir;
> +	struct debugfs_blob_wrapper blob;
> +};
> +
> +static struct ecc_test_blob *create_ecc_test_blob(const char *name, void *data,
> +						size_t size)
> +{
> +	struct ecc_test_blob *blob;
> +
> +	blob = kmalloc(sizeof(*blob), GFP_KERNEL);
> +	if (!blob)
> +		return NULL;
> +
> +	blob->blob.size = size;
> +	blob->blob.data = kmemdup(data, size, GFP_KERNEL);
> +	if (!blob->blob.data)
> +		goto err1;
> +
> +	blob->dir = debugfs_create_blob(name, S_IRUSR, ecc_test_dir,
> +						&blob->blob);
> +	if (!blob->dir)
> +		goto err2;
> +
> +	return blob;
> +err2:
> +	kfree(blob->blob.data);
> +err1:
> +	kfree(blob);
> +
> +	return NULL;
> +}
> +
> +static void remove_ecc_test_blob(struct ecc_test_blob *blob)
> +{
> +	debugfs_remove(blob->dir);
> +	kfree(blob->blob.data);
> +	kfree(blob);
> +}
> +
> +static LIST_HEAD(ecc_test_crashers);
> +
> +struct ecc_test_crasher {
> +	struct list_head list;
> +
> +	struct ecc_test_blob *data;
> +	struct ecc_test_blob *error_data;
> +};
> +
> +/*
> + * Create these files in debugfs:
> + *
> + * /sys/kernel/debug/nand-ecc-test-crashers/
> + *	<name>		binary blob specified with data
> + *	<name>-error	binary blob specified with error_data
> + */
> +static int register_ecc_test_crasher(const char *name, void *data,
> +				void *error_data, size_t size)
> +{
> +	struct ecc_test_crasher *crasher;
> +	char *error_name;
> +
> +	crasher = kmalloc(sizeof(*crasher), GFP_KERNEL);
> +	if (!crasher)
> +		return -ENOMEM;
> +
> +	crasher->data = create_ecc_test_blob(name, data, size);
> +	if (!crasher->data)
> +		goto err1;
> +
> +	error_name = kasprintf(GFP_KERNEL, "%s-error", name);
> +	if (!error_name)
> +		goto err2;
> +
> +	crasher->error_data = create_ecc_test_blob(error_name, error_data,
> +							size);
> +	kfree(error_name);
> +
> +	if (!crasher->error_data)
> +		goto err3;
> +
> +	list_add(&crasher->list, &ecc_test_crashers);
> +
> +	return 0;
> +err3:
> +	remove_ecc_test_blob(crasher->error_data);
> +err2:
> +	remove_ecc_test_blob(crasher->data);
> +err1:
> +	kfree(crasher);
> +
> +	return -ENOMEM;
> +}
> +
> +static void unregister_ecc_test_crasher(struct ecc_test_crasher *crasher)
> +{
> +	list_del(&crasher->list);
> +
> +	remove_ecc_test_blob(crasher->error_data);
> +	remove_ecc_test_blob(crasher->data);
> +	kfree(crasher);
> +}
> +
> +#if defined(CONFIG_MTD_NAND) || defined(CONFIG_MTD_NAND_MODULE)

This should not be needed. MTD tests are always compiled as modules,
so you should not have copilation errors. And if MTD NAND support is
not present, modprobe will just fail.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
