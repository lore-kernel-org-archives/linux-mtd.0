Return-Path: <SRS0=GAYx=BO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BC55C433DF
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Aug 2020 18:46:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5528E206DA
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Aug 2020 18:46:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ke/sF/bV";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Ur3LNGRq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5528E206DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=iVYghuzQm0bvrohotpGzn46DAEGmDmkVcH8XfogMv8g=; b=Ke/sF/bVQ1GI/fVLPEq3lh0UW
	cG6nfJEy5Vop9+IQkrQo+tVsPzj5AWPBCgWYOio5pQvq+RwDJtlyTIaBSWrPsbqclWmoaqAuUCyrx
	nFCouBfzqKMlMJBekwcMxdwJ67pBmQCwCixLo8KDnRlVspHgGJHoo8QBdk9JwVLhb3sNvJeoCoUnp
	s2ot2eULR5L9KmxbYoDNr9ANndQDzHfJzGPa+G3lv026iG1W3qdG+NaoPqRA8cG2PxGUUJbavOjCS
	KY7Jiz33JH3jFkLyCBupXi7P4UnbjKFsObiKBIq/p5YR2GwBX0wMcj9CqugErJnDPY5ju6+Ut7iLT
	BQJCHt3Aw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k31w0-0007e6-1d; Tue, 04 Aug 2020 18:45:12 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k31vt-0007dI-Hj
 for linux-mtd@lists.infradead.org; Tue, 04 Aug 2020 18:45:06 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 074Iirre039823;
 Tue, 4 Aug 2020 13:44:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1596566693;
 bh=R8NKxr6VjX1SzsfirGV4kfB50RR0A+y8dBuqMUbdoHk=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=Ur3LNGRqsEj2D4wgjUhEpGFIjPYJWJmTdg7L8kmajz+d88j8H1JapsMFyKc20WhTJ
 7bT+bi35ug5LXMsrORVse2vcEQ3guhyDESnWz3bjFgCYPMWkldM7p+bOhe2zXZbtr2
 a43fv3RltnOvdJvRKFi3DJhpcyR/bWZxQMJwuO0w=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 074Iirum107976;
 Tue, 4 Aug 2020 13:44:53 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 4 Aug
 2020 13:44:53 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 4 Aug 2020 13:44:53 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 074Iiq5N025914;
 Tue, 4 Aug 2020 13:44:53 -0500
Date: Wed, 5 Aug 2020 00:14:52 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: <tkuw584924@gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: spansion: Add support for s25hl-t/s25hs-t
Message-ID: <20200804184452.7adjlf6xwxij2emk@ti.com>
References: <20200804084837.1014-1-Takahiro.Kuwano@cypress.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200804084837.1014-1-Takahiro.Kuwano@cypress.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200804_144505_722502_CC1E66F8 
X-CRM114-Status: GOOD (  42.87  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: vigneshr@ti.com, tudor.ambarus@microchip.com, richard@nod.at,
 Takahiro Kuwano <Takahiro.Kuwano@cypress.com>, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com, Bacem.Daassi@cypress.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Takahiro,

On 04/08/20 05:48PM, tkuw584924@gmail.com wrote:
> From: Takahiro Kuwano <Takahiro.Kuwano@cypress.com>
> 
> The S25HL-T/S25HS-T family is the Cypress Semper Flash with Quad SPI. 
> The datasheet can be found in https://community.cypress.com/docs/DOC-15165
> 
> The fixup overwrites setup() and quad_enable(). The setup() sets read,
> erase map, and page size settings as substitute for SFDP. It also updates
> mtd_info to support transparent ECC feature. The quad_enable() sets the
> Quad Enable bit in the volatile register. The Read/Write Any Register
> commands are added for these fixup hooks.
> 
> Tested on Xilinx Zynq-7000 FPGA board.
> 
> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@cypress.com>
> ---
>  drivers/mtd/spi-nor/core.c     |   4 +-
>  drivers/mtd/spi-nor/core.h     |   3 +
>  drivers/mtd/spi-nor/spansion.c | 418 +++++++++++++++++++++++++++++++++
>  include/linux/mtd/spi-nor.h    |  15 ++
>  4 files changed, 438 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 0369d98b2d12..cd84f6d2785c 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -2602,8 +2602,8 @@ static int spi_nor_select_erase(struct spi_nor *nor)
>  	return 0;
>  }
>  
> -static int spi_nor_default_setup(struct spi_nor *nor,
> -				 const struct spi_nor_hwcaps *hwcaps)
> +int spi_nor_default_setup(struct spi_nor *nor,
> +			  const struct spi_nor_hwcaps *hwcaps)
>  {
>  	struct spi_nor_flash_parameter *params = nor->params;
>  	u32 ignored_mask, shared_mask;
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index 6f2f6b27173f..1d27b6f2a8d1 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -433,6 +433,9 @@ int spi_nor_post_bfpt_fixups(struct spi_nor *nor,
>  			     const struct sfdp_bfpt *bfpt,
>  			     struct spi_nor_flash_parameter *params);
>  
> +int spi_nor_default_setup(struct spi_nor *nor,
> +			  const struct spi_nor_hwcaps *hwcaps);
> +

I have already sent a patch [0] that does this. I think it should be 
merged in soon so maybe you can drop this.

>  static struct spi_nor __maybe_unused *mtd_to_spi_nor(struct mtd_info *mtd)
>  {
>  	return mtd->priv;
> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
> index e550cd5c9d3a..bf19b92410fa 100644
> --- a/drivers/mtd/spi-nor/spansion.c
> +++ b/drivers/mtd/spi-nor/spansion.c
> @@ -8,6 +8,386 @@
>  
>  #include "core.h"
>  
> +/**
> + * spansion_read_any_reg() - Read Any Register.
> + * @nor:	pointer to a 'struct spi_nor'
> + * @reg_addr:	register address
> + * @reg_dummy:	number of dummy cycles for register read
> + * @reg_val:	pointer to a buffer where the register value is copied into
> + *
> + * 1 dummy clock cycle is required to read volatile register when CFR3[7:6]=01,
> + * while the spimem takes number of dummy 'bytes'. Since the Flash repeats

s/the spimem/SPI MEM/

> + * outputting the same register contents as long as clock keeps toggling, we can
> + * restore the original register content by reading two bytes

Hmm, I just realized that SPI MEM has a major limitation here. In 
1S-1S-1S mode you can only tell it to use dummy cycles that are 
multiples of 8, but in 8S-8S-8S mode you can specify with multiples of 
1. I wonder how no one ran into any problems with this before.

> + *
> + * Return: 0 on success, -errno otherwise.
> + */
> +static int spansion_read_any_reg(struct spi_nor *nor, u32 reg_addr,
> +				 u8 reg_dummy, u8 *reg_val)
> +{
> +	u8 read_opcode, read_dummy, dummy_rem;
> +	enum spi_nor_protocol read_proto;
> +	size_t len;
> +	ssize_t ret;
> +
> +	read_opcode = nor->read_opcode;
> +	read_dummy = nor->read_dummy;
> +	read_proto = nor->read_proto;
> +
> +	nor->read_opcode = SPINOR_OP_RDAR;
> +	nor->read_dummy = reg_dummy & ~7;
> +	nor->read_proto = SNOR_PROTO_1_1_1;
> +
> +	dummy_rem = reg_dummy - nor->read_dummy;
> +	len = dummy_rem ? 2 : 1;
> +
> +	ret = spi_nor_read_data(nor, reg_addr, len, nor->bouncebuf);
> +
> +	nor->read_opcode = read_opcode;
> +	nor->read_dummy = read_dummy;
> +	nor->read_proto = read_proto;
> +
> +	if (ret == len) {
> +		if (dummy_rem)
> +			*reg_val = (nor->bouncebuf[0] << dummy_rem) |
> +				   (nor->bouncebuf[1] >> (8 - dummy_rem));

*sigh* what a convoluted hack! But I don't see any way to avoid it so it 
will have to stay I guess.

> +		else
> +			*reg_val = nor->bouncebuf[0];
> +
> +		return 0;
> +	}
> +
> +	return ret < 0 ? ret : -EIO;
> +}
> +
> +/**
> + * spansion_write_any_reg() - Write Any Register.
> + * @nor:	pointer to a 'struct spi_nor'
> + * @reg_addr:	register address
> + * @reg_val:	register value to be written
> + *
> + * Function is for writing volatile registers that will be effective immediately
> + * after the operation (status polling is not needed).

Maybe reword to this?

  Register write will be effective immediately after the operation so 
  status polling is not needed.

> + *
> + * Return: 0 on success, -errno otherwise.
> + */
> +static int spansion_write_any_reg(struct spi_nor *nor, u32 reg_addr, u8 reg_val)
> +{
> +	u8 program_opcode;
> +	enum spi_nor_protocol write_proto;
> +	ssize_t ret;
> +
> +	ret = spi_nor_write_enable(nor);
> +	if (ret)
> +		return ret;
> +
> +	program_opcode = nor->program_opcode;
> +	write_proto = nor->write_proto;
> +
> +	nor->program_opcode = SPINOR_OP_WRAR;
> +	nor->write_proto = SNOR_PROTO_1_1_1;
> +
> +	nor->bouncebuf[0] = reg_val;
> +	ret = spi_nor_write_data(nor, reg_addr, 1, nor->bouncebuf);
> +
> +	nor->program_opcode = program_opcode;
> +	nor->write_proto = write_proto;
> +
> +	return ret == 1 ? 0 : (ret < 0 ? ret : -EIO);
> +}
> +
[...]
> +
> +/**
> + * spansion_quad_enable_volatile() - enable Quad I/O mode in volatile register.
> + * @nor:		pointer to a 'struct spi_nor'
> + * @reg_addr_base:	base address of register (can be >0 in multi-die parts)
> + * @reg_dummy:		number of dummy cycles for register read
> + *
> + * It is recommended to update volatile registers in the field application due
> + * to a risk of the non-volatile registers corruption by power interrupt. This
> + * function sets Quad Enable bit in CFR1 volatile. If users set the Quad Enable
> + * bit in the CFR1 non-volatile in advance (typically by a Flash programmer
> + * before mounting Flash on PCB), the Quad Enable bit in the CFR1 volatile is
> + * also set during Flash power-up.
> + *
> + * Return: 0 on success, -errno otherwise.
> + */
> +static int spansion_quad_enable_volatile(struct spi_nor *nor, u32 reg_addr_base,
> +					 u8 reg_dummy)
> +{
> +	u32 reg_addr = reg_addr_base + SPINOR_REG_ADDR_CFR1V;
> +	u8 cfr1v, cfr1v_written;
> +	int ret;
> +
> +	/* Check current Quad Enable bit value. */
> +	ret = spansion_read_any_reg(nor, reg_addr, reg_dummy, &cfr1v);
> +	if (ret)
> +		return ret;
> +	if (cfr1v & CFR1_QUAD_EN)
> +		return 0;
> +
> +	/* Update the Quad Enable bit. */
> +	cfr1v |= CFR1_QUAD_EN;
> +
> +	ret = spansion_write_any_reg(nor, reg_addr, cfr1v);
> +	if (ret)
> +		return ret;
> +
> +	cfr1v_written = cfr1v;
> +
> +	/* Read back and check it. */
> +	ret = spansion_read_any_reg(nor, reg_addr, reg_dummy, &cfr1v);
> +	if (ret)
> +		return ret;
> +
> +	if (cfr1v != cfr1v_written) {
> +		dev_dbg(nor->dev, "CFR1: Read back test failed\n");

In what situation would we _not_ read the same value back? Wouldn't it 
be an indication that something has gone horribly wrong with the device 
reads? So IMO it would be a good idea change it to dev_err(). I think we 
should fail loudly here.

> +		return -EIO;
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * s25hx_t_set_read_settings() - read settings for s25hx-t family
> + * @params:	pointer to the 'struct spi_nor_flash_parameter'
> + *
> + * Function assumes the opcodes will be converted to 4B opcodes
> + */
> +static void s25hx_t_set_read_settings(struct spi_nor_flash_parameter *params)
> +{
> +	struct spi_nor_read_command *read;
> +
> +	/* Fast Read 4B requires mode cycles */
> +	read = &params->reads[SNOR_CMD_READ_FAST];
> +	read->num_mode_clocks = 8;
> +
> +	/* Dual Output Read is not supported */
> +	params->hwcaps.mask &= ~SNOR_HWCAPS_READ_1_1_2;
> +
> +	/* Add Dual I/O Read */
> +	params->hwcaps.mask |= SNOR_HWCAPS_READ_1_2_2;
> +	read = &params->reads[SNOR_CMD_READ_1_2_2];
> +	read->num_mode_clocks = 4;
> +	read->num_wait_states = 8;
> +	read->opcode = SPINOR_OP_READ_1_2_2;
> +	read->proto = SNOR_PROTO_1_2_2;
> +
> +	/* Add Quad I/O Read */
> +	params->hwcaps.mask |= SNOR_HWCAPS_READ_1_4_4;
> +	read = &params->reads[SNOR_CMD_READ_1_4_4];
> +	read->num_mode_clocks = 2;
> +	read->num_wait_states = 8;
> +	read->opcode = SPINOR_OP_READ_1_4_4;
> +	read->proto = SNOR_PROTO_1_4_4;

Use spi_nor_set_read_settings() for both. It is currently declared as 
static but I don't think there is any harm in exposing it. In fact, 
spi_nor_set_pp_settings() is already exposed.

> +}
> +
> +/**
> + * s25hx_t_setup() - configure s25hx_t device.
> + * @nor:	pointer to a 'struct spi_nor'
> + * @hwcaps:	pointer to a 'struct spi_nor_hwcaps'
> + *
> + * Read, Program, and Erase settings in place of SFDP
> + *
> + * Return: 0 on success, -errno otherwise.
> + */
> +static int s25hx_t_setup(struct spi_nor *nor,
> +			 const struct spi_nor_hwcaps *hwcaps)
> +{
> +	int err;
> +	u8 cfr3_written, reg;
> +
> +	s25hx_t_set_read_settings(nor->params);
> +
> +	/* Address mode affects Read/Write Any Register operations */
> +	nor->addr_width = 4;

Nitpick: Shouldn't we set the address width to 4 _after_ the address 
mode is actually enabled?

> +	err = spi_nor_set_4byte_addr_mode(nor, true);
> +	if (err)
> +		return err;
> +
> +	/**
> +	 * Optimal CFR3V settings
> +	 *   CFR3[7:6] = 01: RDAR for v-regs works ~133MHz with 1 dummy cycle
> +	 *   CFR3[5] = 1: Erase operation is skipped on already erased sectors
> +	 *   CFR3[4] = 1: 512 byte page size (better throughput than 256 byte)
> +	 *   CFR3[3] = x: Read-Only for volatile register
> +	 *   CFR3[2] = 0: CLSR(30h) is enabled (default)
> +	 *   CFR3[1] = 0: Reserved
> +	 *   CFR3[0] = 0: Legacy SW reset is disabled (default)
> +	 *
> +	 * At this point, we don't know the volatile register latency setting in
> +	 * CFR3[7:6]. Therefore, just write the optimal settings to CFR3 instead
> +	 * of Read-Modify-Write.
> +	 */
> +	cfr3_written = CFR3_VREG_LTCY_01 | CFR3_BLANK_CHECK_EN |
> +		       CFR3_512B_PAGE_SIZE;
> +
> +	err = spansion_write_any_reg(nor, SPINOR_REG_ADDR_CFR3V, cfr3_written);
> +	if (err)
> +		return err;
> +
> +	/* Read back CFR3V with 1 dummy cycle */
> +	err = spansion_read_any_reg(nor, SPINOR_REG_ADDR_CFR3V, 1, &reg);
> +	if (err)
> +		return err;
> +	if ((reg & ~CFR3_UNIFORM_SECTORS) != cfr3_written)
> +		return -EIO;
> +
> +	/* Update page size */
> +	nor->page_size = 512;
> +	nor->mtd.writebufsize = nor->page_size;
> +
> +	/**
> +	 * The s25hx_t family has transparent ECC. To preserve ECC enabled,
> +	 * multi-pass programming within the same 16-byte ECC data unit needs
> +	 * to be avoided. Setting writesize to the multiples of 16 and removing
> +	 * the MTD_BIT_WRITEABLE flags in mtd_info let JFFS2 enable write-
> +	 * buffering that prevents multi-pass programming
> +	 * (CONFIG_JFFS2_FS_WRITEBUFFER needs to be enabled). To achieve the
> +	 * best write throughput, assign 512-byte page size to writesize.
> +	 */
> +	nor->mtd.writesize = nor->page_size;

I tried doing this for S28HS flash and I remember UBIFS not respecting 
this.

*goes and looks*

I see this in drivers/mtd/ubi/build.c::io_init()

  if (ubi->mtd->type == MTD_NORFLASH) {
	ubi_assert(ubi->mtd->writesize == 1);
	...
  }

Have you tested with UBIFS? If not, maybe leave a note here that it will 
not work properly until UBIFS is patched.

> +	nor->mtd.flags = MTD_CAP_NORFLASH & ~MTD_BIT_WRITEABLE;
> +
> +	/* Uniform Sectors: use erase map set in spi_nor_info_init_params() */
> +	if (reg & CFR3_UNIFORM_SECTORS)
> +		return spi_nor_default_setup(nor, hwcaps);
> +
> +	/* Hybrid Sectors: check CFR1 bits */
> +	err = spansion_read_any_reg(nor, SPINOR_REG_ADDR_CFR1V, 1, &reg);
> +	if (err)
> +		return err;
> +
> +	if (reg & CFR1_SPLIT_4K_SECTORS)
> +		err = spansion_init_sp4k_erase_map(nor, SZ_256K, 32);
> +	else if (reg & CFR1_TOP_4K_SECTORS)
> +		err = spansion_init_tb4k_erase_map(nor, SZ_256K, 32, true);
> +	else
> +		err = spansion_init_tb4k_erase_map(nor, SZ_256K, 32, false);
> +
> +	return err ? err : spi_nor_default_setup(nor, hwcaps);
> +}
> +
> +static int s25hx_t_quad_enable(struct spi_nor *nor)

Commit be192209d5a3 (mtd: spi-nor: Add capability to disable flash quad 
mode, 2020-07-06) allows disabling quad mode as well. You should 
implement that in your quad enable hook.

> +{
> +	return spansion_quad_enable_volatile(nor, 0, 1);
> +}
> +
> +static void s25hx_t_default_init(struct spi_nor *nor)
> +{
> +	nor->params->setup = s25hx_t_setup;
> +	nor->params->quad_enable = s25hx_t_quad_enable;
> +}
> +
> +static struct spi_nor_fixups s25hx_t_fixups = {
> +	.default_init = s25hx_t_default_init,
> +};
> +
>  static int
>  s25fs_s_post_bfpt_fixups(struct spi_nor *nor,
>  			 const struct sfdp_parameter_header *bfpt_header,
> @@ -104,6 +484,44 @@ static const struct flash_info spansion_parts[] = {
>  			     SPI_NOR_4B_OPCODES) },
>  	{ "cy15x104q",  INFO6(0x042cc2, 0x7f7f7f, 512 * 1024, 1,
>  			      SPI_NOR_NO_ERASE) },
> +
> +	/**

This is not a docstring so remove the extra '*'.

> +	 * S25HL/HS-T (Semper Flash with Quad SPI) Family
> +	 *
> +	 *   For the faster clock speed than 133MHz (max 166MHz), the Flash
> +	 *   requires 2 dummy cycles before data output in RDID(9fh) and
> +	 *   RDSR(05h) operations. As complex fixups are needed to handle that,
> +	 *   this driver supports up to 133MHz clock speed at this point.
> +	 *
> +	 *   The Read SFDP operation is supported up to 50MHz. Since most of the
> +	 *   modern QSPI controllers are assumed to run at faster clock speed
> +	 *   than 50MHz, SFDP parsing is skiped then equivalent setup and some
> +	 *   optimization are done by spi_nor_fixups hooks.

Are those modern controllers capable of running at lower speeds if told 
to do so? For example, if during SFDP reads we tell the controller to 
run at a maximum of 50MHz, will most controllers be able to do that?

If yes, I think we should tell controllers the speed they should run at 
otherwise we just ignore the entire SFDP table for all the modern 
controllers and platforms, shifting all the burden to the software. That 
defeats the purpose of having SFDP.

I was recently experimenting with this, and managed to make the Cadence 
QSPI controller run at lower speeds for SFDP commands, but I'm not sure 
if other controllers will be able to do that.

> +	 */
> +	{ "s25hl256t",  INFO6(0x342a19, 0x0f0390, 256 * 1024, 128,
> +			     SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR |
> +			     SPI_NOR_SKIP_SFDP)
> +	  .fixups = &s25hx_t_fixups },
> +	{ "s25hl512t",  INFO6(0x342a1a, 0x0f0390, 256 * 1024, 256,
> +			     SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR |
> +			     SPI_NOR_SKIP_SFDP)
> +	  .fixups = &s25hx_t_fixups },
> +	{ "s25hl01gt",  INFO6(0x342a1b, 0x0f0390, 256 * 1024, 512,
> +			     SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR |
> +			     SPI_NOR_SKIP_SFDP)
> +	  .fixups = &s25hx_t_fixups },
> +	{ "s25hs256t",  INFO6(0x342b19, 0x0f0390, 256 * 1024, 128,
> +			     SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR |
> +			     SPI_NOR_SKIP_SFDP)
> +	  .fixups = &s25hx_t_fixups },
> +	{ "s25hs512t",  INFO6(0x342b1a, 0x0f0390, 256 * 1024, 256,
> +			     SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR |
> +			     SPI_NOR_SKIP_SFDP)
> +	  .fixups = &s25hx_t_fixups },
> +	{ "s25hs01gt",  INFO6(0x342b1b, 0x0f0390, 256 * 1024, 512,
> +			     SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR |
> +			     SPI_NOR_SKIP_SFDP)
> +	  .fixups = &s25hx_t_fixups },
>  };
>  
>  static void spansion_post_sfdp_fixups(struct spi_nor *nor)
> diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
> index 60bac2c0ec45..760a1ee14516 100644
> --- a/include/linux/mtd/spi-nor.h
> +++ b/include/linux/mtd/spi-nor.h
> @@ -99,6 +99,21 @@
>  /* Used for Spansion flashes only. */
>  #define SPINOR_OP_BRWR		0x17	/* Bank register write */
>  #define SPINOR_OP_CLSR		0x30	/* Clear status register 1 */
> +#define SPINOR_OP_RDAR		0x65	/* Read Any Register */
> +#define SPINOR_OP_WRAR		0x71	/* Write Any Register */
> +
> +#define SPINOR_REG_ADDR_CFR1V	0x00800002	/* Config Reg 1 volatile */
> +#define SPINOR_REG_ADDR_CFR3V	0x00800004	/* Config Reg 3 volatile */
> +
> +#define CFR3_VREG_LTCY_01	BIT(6)	/* 1 dummy for v-reg read at 133MHz */
> +#define CFR3_BLANK_CHECK_EN	BIT(5)	/* Skip erase on erased sectors */
> +#define CFR3_512B_PAGE_SIZE	BIT(4)	/* 512 byte page size */
> +#define CFR3_UNIFORM_SECTORS	BIT(3)	/* Uniform sector is selected */
> +
> +#define CFR1_SPLIT_4K_SECTORS	BIT(6)	/* 4KB sectors at top and bottom */
> +#define CFR1_TOP_4K_SECTORS	BIT(2)	/* 4KB sectors at top */
> +#define CFR1_QUAD_EN		BIT(1)	/* Quad Enable */
> +

These registers are specific to Spansion flashes so I think the defines 
should be moved to spansion.c

>  
>  /* Used for Micron flashes only. */
>  #define SPINOR_OP_RD_EVCR      0x65    /* Read EVCR register */

I took a quick look through the patch. Most of it looks good to me, but 
I am not convinced that simply skipping SFDP is a good idea.

[0] https://lore.kernel.org/linux-mtd/20200723131203.40916-13-me@yadavpratyush.com/

-- 
Regards,
Pratyush Yadav
Texas Instruments India

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
