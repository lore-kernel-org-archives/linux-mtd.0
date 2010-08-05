Subject: Re: [PATCH v1 2/2]nand/denali Update get_nand_para functions
From: David Woodhouse <dwmw2@infradead.org>
To: Chuanxiao <chuanxiao.dong@gmail.com>
In-Reply-To: <20100805162800.GC3160@infernal>
References: <20100805162800.GC3160@infernal>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 05 Aug 2010 17:34:55 +0100
Message-ID: <1281026095.8720.29.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: chuanxiao.dong@intel.com, hang.yuan@intel.com,
	linux-mtd@lists.infradead.org, yunpeng.gao@intel.com, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2010-08-06 at 00:28 +0800, Chuanxiao wrote:
> @@ -1732,24 +1699,18 @@ static void denali_cmdfunc(struct mtd_info *mtd, unsigned int cmd, int col,
>                 break;
>         case NAND_CMD_READID:
>                 reset_buf(denali);
> -               if (denali->flash_bank < denali->total_used_banks) {
> -                       /* write manufacturer information into nand
> -                          buffer for NAND subsystem to fetch.
> -                          */
> -                       write_byte_to_buf(denali,
> -                                       denali->dev_info.wDeviceMaker);
> -                       write_byte_to_buf(denali,
> -                                       denali->dev_info.wDeviceID);
> -                       write_byte_to_buf(denali,
> -                                       denali->dev_info.bDeviceParam0);
> -                       write_byte_to_buf(denali,
> -                                       denali->dev_info.bDeviceParam1);
> -                       write_byte_to_buf(denali,
> -                                       denali->dev_info.bDeviceParam2);
> -               } else {
> -                       int i;
> -                       for (i = 0; i < 5; i++)
> -                               write_byte_to_buf(denali, 0xff);
> +               /*sometimes ManufactureId read from register is not right
> +                * e.g. some of Micron MT29F32G08QAA MLC NAND chips
> +                * So here we send READID cmd to NAND insteand
> +                * */
> +               addr = (uint32_t)MODE_11 | BANK(denali->flash_bank); 

drivers/mtd/nand/denali.c: In function ‘denali_cmdfunc’:
drivers/mtd/nand/denali.c:1706: error: ‘addr’ undeclared (first use in this function)
drivers/mtd/nand/denali.c:1706: error: (Each undeclared identifier is reported only once
drivers/mtd/nand/denali.c:1706: error: for each function it appears in.)
drivers/mtd/nand/denali.c:1709: error: ‘i’ undeclared (first use in this function)
drivers/mtd/nand/denali.c:1712: error: ‘id’ undeclared (first use in this function)
make[3]: *** [drivers/mtd/nand/denali.o] Error 1

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
