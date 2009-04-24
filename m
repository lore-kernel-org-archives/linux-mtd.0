Message-ID: <39788.192.168.10.89.1240571078.squirrel@dbdmail.itg.ti.com>
Date: Fri, 24 Apr 2009 16:34:38 +0530 (IST)
Subject: Re: [PATCH] [MTD] [NAND] Add OMAP2 / OMAP3 NAND driver
From: "vimal singh" <vimalsingh@ti.com>
To: dedekind@infradead.org
MIME-Version: 1.0
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit
References: 
In-Reply-To: 
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Apr 24, 2009 at 1:43 PM, Artem Bityutskiy <dedekind@infradead.org> wrote:
> Few comments of stylistic nature are below.
> On Mon, 2009-04-06 at 14:31 +0530, vimal singh wrote:
>> +/*
>> + * drivers/mtd/nand/omap2.c
> Would it be possible to remove the above?
Sure, I'll do this.

>> +#define GPMC_IRQ_STATUS              0x18
>> +#define GPMC_ECC_CONFIG              0x1F4
>> +#define GPMC_ECC_CONTROL     0x1F8
>> +#define GPMC_ECC_SIZE_CONFIG 0x1FC
>> +#define GPMC_ECC1_RESULT     0x200
>> +
>> +#define      DRIVER_NAME     "omap2-nand"
> Are you going to change driver name often? If not, do not
> define this.
This seems ok to me. Removing this macro has no benefit. But have
to replace 'DRIVER_NAME' with '"omap2-nand"' 2-3 places.

>> +#define      NAND_IO_SIZE    SZ_4K
> Confusing variable, can you please add a comment?
This is the size which will be IO remapped for the device.
I'll add the comment in code.

>> +
>> +#define      NAND_WP_ON      1
>> +#define      NAND_WP_OFF     0
> I think these defines should be killed.
Since 'NAND_WP_ON' is not being used in code, I can remove this macro. But
'NAND_WP_OFF' is used and it makes code more readable. I can still remove  this
if really required.


>> +#define TF(value)    (value ? 1 : 0)\
> Could this define be killed please?
Humm.. This is being used in so many places. Lets it be there.
Anyway, I have planes to change this HW ECC correction method, where I'll
remove all these macros.

>> +
>> +/*
>> + * omap_nand_wp - This function enable or disable the Write Protect feature on
>> + * NAND device
>> + * @mtd: MTD device structure
>> + * @mode: WP ON/OFF
>> + */
> Kerneldoc comments should start with /**
I'll correct this.

>> +/*
>> + * hardware specific access to control-lines
>> + * NOTE: boards may use different bits for these!!
>> + *
>> + * ctrl:
>> + * NAND_NCE: bit 0 - don't care
>> + * NAND_CLE: bit 1 -> Command Latch
>> + * NAND_ALE: bit 2 -> Address Latch
>> + */
> If you try to use kerneldoc comments, use them everywhere,
> be consistent please.
> Documentation/kernel-doc-nano-HOWTO.txt
> Glance at all comments.
I'll correct these.

>> +static int omap_verify_buf(struct mtd_info *mtd, const u_char * buf, int
len)
>> +{
>> +     struct omap_nand_info *info = container_of(mtd, struct omap_nand_info,
+                                                     mtd);
> It is less ugly to do:
> struct omap_nand_info *info;
> info = container_of(mtd, struct omap_nand_info, mtd);
I do not think it is too ugly. Rather doing this will just increase number of
lines of code.

>> +     u16 *p = (u16 *) buf;
>> +
>> +     len >>= 1;
>> +
>> +     while (len--) {
>> +
>> +             if (*p++ != cpu_to_le16(readw(info->nand.IO_ADDR_R)))
>> +                      return -EFAULT;
>> +     }
>> +
>> +     return 0;
>> +}
> Very sparse code, too many blank lines...
OK, I'll remove extra blank lines.

---
Regards,
\/ | |\/| /-\ |_

____      __o
------   -\<,
-----  ( )/ ( )
