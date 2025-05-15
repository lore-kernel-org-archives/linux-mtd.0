Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33073C3ABD8
	for <linux-mtd@archiver.kernel.org>; Thu, 15 May 2025 01:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:
	Subject:Message-ID:Date:MIME-Version:In-Reply-To:References:From:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v5f1j09R7lsukyzjd5Ss8Hpt2kbaX3l5Tk5EYUD1cr4=; b=xd8aS2W6PDCiUevUG1NFC9VwGy
	Bz0oKxTauZ2CygiF+VjaScpJBvD+NOSKYiJCxlh/+mpK99EXJAjM+cYyb7vbYFwALtOvbI08elR9z
	5ncuQacyTlbJ2IpnM2ey4EDwovCsTy2MfRqSo/bJAsmDlHIbixwDDBfYKieKBQUi+6ZhZ68RutLL9
	/RxMvUBE1rZEBT8KIe3JzIsm8nxa8k83QqCijybn4HKdYrMG8OYVqQtKAh+UWpqatQfkbGXB8TUML
	J5+Z1FVwzYZ9OyzWyobhpi2IhKACjBJMA5eQyBv8bIRGgzBP27P1tpDOtmlr8X8VwneU2P69SVwTg
	1WrjHQBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFNcF-0000000GmgH-2QA1;
	Thu, 15 May 2025 01:42:31 +0000
Received: from mail-ua1-x931.google.com ([2607:f8b0:4864:20::931])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFNcC-0000000Gmfr-1gpR
	for linux-mtd@lists.infradead.org;
	Thu, 15 May 2025 01:42:30 +0000
Received: by mail-ua1-x931.google.com with SMTP id a1e0cc1a2514c-879b7ea69d2so211833241.0
        for <linux-mtd@lists.infradead.org>; Wed, 14 May 2025 18:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1747273346; x=1747878146; darn=lists.infradead.org;
        h=to:subject:message-id:date:thread-index:mime-version:in-reply-to
         :references:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DtvVKUUTOkks2NRa0o5OIijwcaFiTIglKXOthOQEJK0=;
        b=AqXe82yjPTjA4iZNfVW1F524EqpKONXVZ4fcX6zpv0A+OSnWQk1Xz3Gg8AqrO1uI8j
         RUlImzJwUSFAn5C44KkcPDLapDUH3CrZhf+FRSgQNijV0fC70vz3NNajNOXPd8vJyzHx
         UK7xbi6viIfQCHOSsXnDLKmxL1X37aLEqbgeg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747273346; x=1747878146;
        h=to:subject:message-id:date:thread-index:mime-version:in-reply-to
         :references:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DtvVKUUTOkks2NRa0o5OIijwcaFiTIglKXOthOQEJK0=;
        b=FF9Qz/Ag3O9hxXCRLqW9jCp2qstLGDzBAWiyNZoRz3GePA0ZWSImA/cpp4/ik93Lsj
         b4R8irHi5nrX4+JTog8Kx24cg/30r1sVpB2ZI/l7Je26PU/jXWsZ+WFNDCyUeYB1KnIH
         3bcye1F5akvzY9zdRUti71kXg2gB5eLpfpYWqEpOzaXeCRquWHsWSFuxjG2qRdfY46DB
         z/TFow8uyxCwgXC5tdTHQgYMrhag+/ID81DxJNaryFliuwS5/8YqamqErPNGMh4eks7w
         ABxrLkaH6WJ5SSDscmEfLIuE9afG7kzHVvbnymDChrF7PcNUM3nPZvHExbt9FoC9mjNh
         6xsQ==
X-Forwarded-Encrypted: i=1; AJvYcCXyHCi/t9U9lW0veA7dJnrCkweWpCIZyYctsZ4gL7xgbQU6d859BqV/2LWQSO/AXEz1MNZMQTiIXow=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5IhWkLJNJW2z3YteGKR9SepNqO7H9cnFFxKhrg2BR+QCC99en
	BCe60Z21Ce4udn2fMQYgKfQMro03rupqIH3miOuQ/LAHNf7QR5DonTJVTXp5dk+ihDUrufGfWOj
	Myb61nweuxdDmNaAACz1AN33hIEmGxdQXcXa0
X-Gm-Gg: ASbGncsJbr7NtxZ+EelTD4Y+1h9ic/N3bt2r4XLStVhQWoR90DEgi9WkZ54ujsHMigl
	0QXZfhwpCa25MNUWbznhfQB3IEGR1ymLuFqZyffGh85ZN89AlmG+yd2kUK93vBeRVWOf/VZDNAp
	P1VvkBaBNifFkBsyOY6/fmAXAc9mlo1wSgiQ==
X-Google-Smtp-Source: AGHT+IH4ZnnDcNsfa/HazW1NG+wTxLQemMEOEVrkY3njBoad81DbcCMd0lKzEcZJI8cr7TMT3mUKiz/Kpv/tOTnZ9oo=
X-Received: by 2002:a05:6102:8012:b0:4bb:e36f:6a35 with SMTP id
 ada2fe7eead31-4df7dcc656bmr6036040137.14.1747273346063; Wed, 14 May 2025
 18:42:26 -0700 (PDT)
From: William Zhang <william.zhang@broadcom.com>
References: <20250514062341.774919-1-noltari@gmail.com>
In-Reply-To: <20250514062341.774919-1-noltari@gmail.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQEyR7O2AelOVVeBIx+IoDUsWG0J4bUl5FUA
Date: Wed, 14 May 2025 18:42:24 -0700
X-Gm-Features: AX0GCFvH3IRqeknKMlzIVn-JtZbJ_ZkCjBBwJ0PD9V8PYHv0cJ-vKOJOhYHB4BA
Message-ID: <b11623aeea01338715215084fc34107d@mail.gmail.com>
Subject: RE: [PATCH v3] mtd: rawnand: brcmnand: legacy exec_op implementation
To: =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>, 
	linux-mtd@lists.infradead.org, dregan@broadcom.com, miquel.raynal@bootlin.com, 
	bcm-kernel-feedback-list@broadcom.com, 
	Florian Fainelli <florian.fainelli@broadcom.com>, rafal@milecki.pl, 
	computersforpeace@gmail.com, Kamal Dasu <kamal.dasu@broadcom.com>, 
	Dan Beygelman <dan.beygelman@broadcom.com>, frieder.schrempf@kontron.de, 
	linux-kernel@vger.kernel.org, vigneshr@ti.com, richard@nod.at, 
	bbrezillon@kernel.org, kdasu.kdev@gmail.com, jaimeliao.tw@gmail.com, 
	kilobyte@angband.pl, jonas.gorski@gmail.com, dgcbueu@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_184228_605894_385F8EE8 
X-CRM114-Status: GOOD (  33.24  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0438371280237033683=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============0438371280237033683==
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000232424063522c7c5"

--000000000000232424063522c7c5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alvaro,

> -----Original Message-----
> From: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
> Sent: Tuesday, May 13, 2025 11:24 PM
> To: linux-mtd@lists.infradead.org; dregan@broadcom.com;
> miquel.raynal@bootlin.com; bcm-kernel-feedback-list@broadcom.com;
> florian.fainelli@broadcom.com; rafal@milecki.pl;
> computersforpeace@gmail.com; kamal.dasu@broadcom.com;
> dan.beygelman@broadcom.com; william.zhang@broadcom.com;
> frieder.schrempf@kontron.de; linux-kernel@vger.kernel.org;
> vigneshr@ti.com;
> richard@nod.at; bbrezillon@kernel.org; kdasu.kdev@gmail.com;
> jaimeliao.tw@gmail.com; kilobyte@angband.pl; jonas.gorski@gmail.com;
> dgcbueu@gmail.com
> Cc: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
> Subject: [PATCH v3] mtd: rawnand: brcmnand: legacy exec_op implementation
>
> Commit 3c8260ce7663 ("mtd: rawnand: brcmnand: exec_op implementation")
> removed legacy interface functions, breaking < v5.0 controllers support.
> In order to fix older controllers we need to add an alternative exec_op
> implementation which doesn't rely on low level registers.
>
> Fixes: 3c8260ce7663 ("mtd: rawnand: brcmnand: exec_op implementation")
> Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
> ---
>  drivers/mtd/nand/raw/brcmnand/brcmnand.c | 178
> ++++++++++++++++++++++-
>  1 file changed, 172 insertions(+), 6 deletions(-)
>
>  v3: add changes requested by Florian and other improvements:
>   - Add associative array for native command conversion.
>   - Add function pointer to brcmnand_controller for exec_instr
>     functionality.
>   - Fix CMD_BLOCK_ERASE address.
>   - Drop NAND_CMD_READOOB support.
>
>  v2: multiple improvements:
>   - Use proper native commands for checks.
>   - Fix NAND_CMD_PARAM/NAND_CMD_RNDOUT addr calculation.
>   - Remove host->last_addr usage.
>   - Remove sector_size_1k since it only applies to v5.0+ controllers.
>   - Remove brcmnand_wp since it doesn't exist for < v5.0 controllers.
>   - Use j instead of i for flash_cache loop.
>
> diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
> b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
> index 17f6d9723df9..f4fabe7ffd9d 100644
> --- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
> +++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
> @@ -65,6 +65,7 @@ module_param(wp_on, int, 0444);
>  #define CMD_PARAMETER_READ		0x0e
>  #define CMD_PARAMETER_CHANGE_COL	0x0f
>  #define CMD_LOW_LEVEL_OP		0x10
> +#define CMD_NOT_SUPPORTED		0xff
>
>  struct brcm_nand_dma_desc {
>  	u32 next_desc;
> @@ -199,6 +200,30 @@ static const u16 flash_dma_regs_v4[] =3D {
>  	[FLASH_DMA_CURRENT_DESC_EXT]	=3D 0x34,
>  };
>
> +/* Native command conversion */
> +static const u8 native_cmd_conv[] =3D {
> +	[NAND_CMD_READ0]	=3D CMD_NOT_SUPPORTED,
> +	[NAND_CMD_READ1]	=3D CMD_NOT_SUPPORTED,
> +	[NAND_CMD_RNDOUT]	=3D CMD_PARAMETER_CHANGE_COL,
> +	[NAND_CMD_PAGEPROG]	=3D CMD_NOT_SUPPORTED,
> +	[NAND_CMD_READOOB]	=3D CMD_NOT_SUPPORTED,
> +	[NAND_CMD_ERASE1]	=3D CMD_BLOCK_ERASE,
> +	[NAND_CMD_STATUS]	=3D CMD_NOT_SUPPORTED,
Do we not need to support nand_status_op()?

> +	[NAND_CMD_SEQIN]	=3D CMD_NOT_SUPPORTED,
> +	[NAND_CMD_RNDIN]	=3D CMD_NOT_SUPPORTED,
> +	[NAND_CMD_READID]	=3D CMD_DEVICE_ID_READ,
> +	[NAND_CMD_ERASE2]	=3D CMD_NULL,
> +	[NAND_CMD_PARAM]	=3D CMD_PARAMETER_READ,
> +	[NAND_CMD_GET_FEATURES]	=3D CMD_NOT_SUPPORTED,
> +	[NAND_CMD_SET_FEATURES]	=3D CMD_NOT_SUPPORTED,
> +	[NAND_CMD_RESET]	=3D CMD_NOT_SUPPORTED,
> +	[NAND_CMD_READSTART]	=3D CMD_NOT_SUPPORTED,
> +	[NAND_CMD_READCACHESEQ]	=3D CMD_NOT_SUPPORTED,
> +	[NAND_CMD_READCACHEEND]	=3D CMD_NOT_SUPPORTED,
> +	[NAND_CMD_RNDOUTSTART]	=3D CMD_NULL,
> +	[NAND_CMD_CACHEDPROG]	=3D CMD_NOT_SUPPORTED,
> +};
> +
>  /* Controller feature flags */
>  enum {
>  	BRCMNAND_HAS_1K_SECTORS			=3D BIT(0),
> @@ -237,6 +262,10 @@ struct brcmnand_controller {
>  	/* List of NAND hosts (one for each chip-select) */
>  	struct list_head host_list;
>
> +	/* Function to be called from exec_op */
> +	int (*exec_instr)(struct nand_chip *chip,
> +			  const struct nand_operation *op);
> +
>  	/* EDU info, per-transaction */
>  	const u16               *edu_offsets;
>  	void __iomem            *edu_base;
> @@ -2490,14 +2519,149 @@ static int brcmnand_op_is_reset(const struct
> nand_operation *op)
>  	return 0;
>  }
>
> +static int brcmnand_exec_instructions(struct nand_chip *chip,
> +				      const struct nand_operation *op)
> +{
> +	struct brcmnand_host *host =3D nand_get_controller_data(chip);
> +	unsigned int i;
> +	int ret =3D 0;
> +
> +	for (i =3D 0; i < op->ninstrs; i++) {
> +		ret =3D brcmnand_exec_instr(host, i, op);
> +		if (ret)
> +			break;
> +	}
> +
> +	return ret;
> +}
> +
> +static int brcmnand_exec_instructions_legacy(struct nand_chip *chip,
> +					     const struct nand_operation *op)
> +{
> +	struct mtd_info *mtd =3D nand_to_mtd(chip);
> +	struct brcmnand_host *host =3D nand_get_controller_data(chip);
> +	struct brcmnand_controller *ctrl =3D host->ctrl;
> +	const struct nand_op_instr *instr;
> +	unsigned int i, j;
> +	u8 cmd =3D CMD_NULL, last_cmd =3D CMD_NULL;
> +	int ret =3D 0;
> +	u64 last_addr;
> +
> +	for (i =3D 0; i < op->ninstrs; i++) {
> +		instr =3D &op->instrs[i];
> +
> +		if (instr->type =3D=3D NAND_OP_CMD_INSTR) {
> +			cmd =3D native_cmd_conv[instr->ctx.cmd.opcode];
> +			if (cmd =3D=3D CMD_NOT_SUPPORTED) {
> +				dev_err(ctrl->dev, "unsupported cmd=3D%d\n",
> +					instr->ctx.cmd.opcode);
> +				ret =3D -EOPNOTSUPP;
> +				break;
> +			}
> +		} else if (instr->type =3D=3D NAND_OP_ADDR_INSTR) {
> +			u64 addr =3D 0;
> +
> +			if (cmd =3D=3D CMD_NULL)
> +				continue;
> +
> +			if (instr->ctx.addr.naddrs > 8) {
> +				dev_err(ctrl->dev, "unsupported naddrs=3D%u\n",
> +					instr->ctx.addr.naddrs);
> +				ret =3D -EOPNOTSUPP;
> +				break;
> +			}
> +
> +			for (j =3D 0; j < instr->ctx.addr.naddrs; j++)
> +				addr |=3D (instr->ctx.addr.addrs[j]) << (j << 3);
> +
> +			if (cmd =3D=3D CMD_BLOCK_ERASE)
> +				addr <<=3D chip->page_shift;
> +			else if (cmd =3D=3D CMD_PARAMETER_CHANGE_COL)
> +				addr &=3D ~((u64)(FC_BYTES - 1));
> +
> +			brcmnand_set_cmd_addr(mtd, addr);
> +			brcmnand_send_cmd(host, cmd);
> +			last_addr =3D addr;
> +			last_cmd =3D cmd;
> +			cmd =3D CMD_NULL;
> +			brcmnand_waitfunc(chip);
> +
> +			if (last_cmd =3D=3D CMD_PARAMETER_READ ||
> +			    last_cmd =3D=3D CMD_PARAMETER_CHANGE_COL) {
> +				/* Copy flash cache word-wise */
> +				u32 *flash_cache =3D (u32 *)ctrl->flash_cache;
> +
> +				brcmnand_soc_data_bus_prepare(ctrl->soc, true);
> +
> +				/*
> +				 * Must cache the FLASH_CACHE now, since
> changes in
> +				 * SECTOR_SIZE_1K may invalidate it
> +				 */
> +				for (j =3D 0; j < FC_WORDS; j++)
> +					/*
> +					 * Flash cache is big endian for parameter
> pages, at
> +					 * least on STB SoCs
> +					 */
> +					flash_cache[j] =3D
> be32_to_cpu(brcmnand_read_fc(ctrl, j));
> +
> +				brcmnand_soc_data_bus_unprepare(ctrl->soc,
> true);
> +			}
> +		} else if (instr->type =3D=3D NAND_OP_DATA_IN_INSTR) {
> +			u8 *in =3D instr->ctx.data.buf.in;
> +
> +			if (last_cmd =3D=3D CMD_DEVICE_ID_READ) {
> +				u32 val;
> +
> +				if (instr->ctx.data.len > 8) {
> +					dev_err(ctrl->dev, "unsupported
> len=3D%u\n",
> +						instr->ctx.data.len);
> +					ret =3D -EOPNOTSUPP;
> +					break;
> +				}
> +
> +				for (j =3D 0; j < instr->ctx.data.len; j++) {
> +					if (j =3D=3D 0)
> +						val =3D brcmnand_read_reg(ctrl,
> BRCMNAND_ID);
> +					else if (j =3D=3D 4)
> +						val =3D brcmnand_read_reg(ctrl,
> BRCMNAND_ID_EXT);
> +
> +					in[j] =3D (val >> (24 - ((j % 4) << 3))) & 0xff;
> +				}
> +			} else if (last_cmd =3D=3D CMD_PARAMETER_READ ||
> +				   last_cmd =3D=3D CMD_PARAMETER_CHANGE_COL) {
> +				u64 addr;
> +				u32 offs;
> +
> +				for (j =3D 0; j < instr->ctx.data.len; j++) {
> +					addr =3D last_addr + j;
> +					offs =3D addr & (FC_BYTES - 1);
> +
> +					if (j > 0 && offs =3D=3D 0)
> +
> 	nand_change_read_column_op(chip, addr, NULL, 0,
> +									   false);
> +
> +					in[j] =3D ctrl->flash_cache[offs];
> +				}
> +			}
> +		} else if (instr->type =3D=3D NAND_OP_WAITRDY_INSTR) {
> +			ret =3D bcmnand_ctrl_poll_status(host, NAND_CTRL_RDY,
> NAND_CTRL_RDY, 0);
> +		} else {
> +			dev_err(ctrl->dev, "unsupported instruction type: %d\n",
> instr->type);
> +			ret =3D -EINVAL;
> +		}
> +	}
> +
> +	return ret;
> +}
> +
>  static int brcmnand_exec_op(struct nand_chip *chip,
>  			    const struct nand_operation *op,
>  			    bool check_only)
>  {
>  	struct brcmnand_host *host =3D nand_get_controller_data(chip);
> +	struct brcmnand_controller *ctrl =3D host->ctrl;
>  	struct mtd_info *mtd =3D nand_to_mtd(chip);
>  	u8 *status;
> -	unsigned int i;
>  	int ret =3D 0;
>
>  	if (check_only)
> @@ -2525,11 +2689,7 @@ static int brcmnand_exec_op(struct nand_chip *chip=
,
>  	if (op->deassert_wp)
>  		brcmnand_wp(mtd, 0);
>
> -	for (i =3D 0; i < op->ninstrs; i++) {
> -		ret =3D brcmnand_exec_instr(host, i, op);
> -		if (ret)
> -			break;
> -	}
> +	ctrl->exec_instr(chip, op);
>
>  	if (op->deassert_wp)
>  		brcmnand_wp(mtd, 1);
> @@ -3142,6 +3302,12 @@ int brcmnand_probe(struct platform_device *pdev,
> struct brcmnand_soc *soc)
>  	if (ret)
>  		goto err;
>
> +	/* Only v5.0+ controllers have low level ops support */
> +	if (ctrl->nand_version >=3D 0x0500)
> +		ctrl->exec_instr =3D brcmnand_exec_instructions;
> +	else
> +		ctrl->exec_instr =3D brcmnand_exec_instructions_legacy;
> +
>  	/*
>  	 * Most chips have this cache at a fixed offset within 'nand' block.
>  	 * Some must specify this region separately.
> --
> 2.39.5

--000000000000232424063522c7c5
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
YDZuuBJwnyCzevMoPtVYPharioL5H3BRnQi8YoTXH7/uRo33dewYFm474yFjwwnt82TFtveVZkVq
6h4WIQ4wTcwFfET8zMkELnGzS5SHCl8sPD+lNxxJ1JDZYwIDAQABo4IB2zCCAdcwDgYDVR0PAQH/
BAQDAgWgMIGjBggrBgEFBQcBAQSBljCBkzBOBggrBgEFBQcwAoZCaHR0cDovL3NlY3VyZS5nbG9i
YWxzaWduLmNvbS9jYWNlcnQvZ3NnY2NyM3BlcnNvbmFsc2lnbjJjYTIwMjAuY3J0MEEGCCsGAQUF
BzABhjVodHRwOi8vb2NzcC5nbG9iYWxzaWduLmNvbS9nc2djY3IzcGVyc29uYWxzaWduMmNhMjAy
MDBNBgNVHSAERjBEMEIGCisGAQQBoDIBKAowNDAyBggrBgEFBQcCARYmaHR0cHM6Ly93d3cuZ2xv
YmFsc2lnbi5jb20vcmVwb3NpdG9yeS8wCQYDVR0TBAIwADBJBgNVHR8EQjBAMD6gPKA6hjhodHRw
Oi8vY3JsLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjNwZXJzb25hbHNpZ24yY2EyMDIwLmNybDAlBgNV
HREEHjAcgRp3aWxsaWFtLnpoYW5nQGJyb2FkY29tLmNvbTATBgNVHSUEDDAKBggrBgEFBQcDBDAf
BgNVHSMEGDAWgBSWM9HmWBdbNHWKgVZk1b5I3qGPzzAdBgNVHQ4EFgQUq65GzwZxydFHjjYEU/9h
xHhPWlwwDQYJKoZIhvcNAQELBQADggEBAA2hGG3JPAdGPH0ZdohGUCIVjKz+U+EFuIDbS6A/5jqX
VhYAxZlzj7tSjUIM7G7IhyfqPC46GKJ/4x+Amz1Z6YxNGy71L68kYD6hIbBcA5AM42QBUufly6Oa
/ppSz3WoflVyFFQ5YXniZ+eU+2/cdnYZg4aVUnFjimOF5o3NfMLzOkhQNxbaDjFUfUYD8hKmU6v4
0vUBj8KZ9Gi1LIagLKUREn8jku0lcLsRbnJ5Ey5ScajC/FESPyYWasOW8j8/1EoJksmhbYGKNS6C
urb/KlmDGfVrIRYDbL0ckhGQIP5c6L+kSQZ2sHnQK0e0WgIaZYxaPYeY5u0GLCOze+3vyRMxggJg
MIICXAIBATBrMFsxCzAJBgNVBAYTAkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMTEwLwYD
VQQDEyhHbG9iYWxTaWduIEdDQyBSMyBQZXJzb25hbFNpZ24gMiBDQSAyMDIwAgwxuh2XG3FXRL1W
JOEwDQYJYIZIAWUDBAIBBQCggccwLwYJKoZIhvcNAQkEMSIEIN0MBoE37dG/YxKBF7YvDSSt7u5U
l1yDVnePt0ZWMBAVMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI1
MDUxNTAxNDIyNlowXAYJKoZIhvcNAQkPMU8wTTALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsG
CWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQcwCwYJYIZIAWUDBAIBMA0GCSqGSIb3
DQEBAQUABIIBAJHRHMXuRlQKfP2C8uCkBZwUJKvlYD898yGAGpzYyJyS8h1OT6NAjGYmYSgCKEYi
o7SbqKoH1gR2DoUQoQfWFcS/lj6/w6rooF6yjJ1HhmhoSYSn0tgr8uodvP/XMhBM9ooG93+PyJ3Z
t2Iu4FEA3uwuJiPElEM01OZxF97KrA4TIK3tvxf9TETt+vjCqVbdRWVMtwpsKtU8m9L5V1NCnE88
N4lmG7ll6EE6yFce4gJNzDeshIjmH74eILim0fFNxnfRn3Zpx/uiMfPuQD6p9UWI0SJdZgSVSK3y
D0bFb/VXfDDC29ze68z5/ab0JXwoDUrzRNIIpFTR6AfdOKQjZig=
--000000000000232424063522c7c5--


--===============0438371280237033683==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============0438371280237033683==--

