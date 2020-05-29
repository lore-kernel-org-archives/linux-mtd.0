Return-Path: <SRS0=kjCr=7L=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB867C433E4
	for <linux-mtd@archiver.kernel.org>; Fri, 29 May 2020 07:38:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD066207D4
	for <linux-mtd@archiver.kernel.org>; Fri, 29 May 2020 07:38:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PDz/7Hur"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD066207D4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YbS5m1m7qsrnocNAqv5ZDFlRzQeJf7vQNP/tzyR+gmg=; b=PDz/7HurS+pN8i
	8kOxZ9G5CpW9tH8ibNTbaMSuImJe2Pn4FosFyVZ0+U4ilQiYBOvjqdpYv5m0GkYpsZ8nX7/6rrxq8
	g3cdTzvd+FGukGjkjbqHx0JNhnxRzBGZfnw4DHWPOpspI4tLawPIznrenxJPEg6ukk7F7/aLbByUR
	s4l54L4G4HkBOPFB2hdcSSnfvGvHdzWqukSR6U9YnHwoGNxhF8ieuay8jCGbWudmpb0ioH2brqlQL
	IapjQq8Xal6LNf7smX1UBRGa+VePQcR6BumgyG8FXhzqCE1bAwaa2gh/FQxQse/bfpDS2vjM8BzzZ
	qbkjN426afIPl+29LGhg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jeZbT-00034Y-GD; Fri, 29 May 2020 07:38:55 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jeZZp-0001Hk-IA
 for linux-mtd@lists.infradead.org; Fri, 29 May 2020 07:37:17 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id F13372A42E5;
 Fri, 29 May 2020 08:37:11 +0100 (BST)
Date: Fri, 29 May 2020 09:37:08 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v6 22/30] mtd: rawnand: Hide the chip->interface_config
 indirection
Message-ID: <20200529093708.600fa291@collabora.com>
In-Reply-To: <20200528231612.8958-23-miquel.raynal@bootlin.com>
References: <20200528231612.8958-1-miquel.raynal@bootlin.com>
 <20200528231612.8958-23-miquel.raynal@bootlin.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200529_003713_890067_6699518C 
X-CRM114-Status: GOOD (  21.02  )
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
Cc: Rickard Andersson <rickaran@axis.com>, Michal Simek <monstr@monstr.eu>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, 29 May 2020 01:16:04 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> As a preparation for allocating the data interface structure
> dynamically (and rename it), let's avoid calling it directly.

					    ^accessing the
					    chip->interface_config
					    directly.

> 
> Instead, we introduce a helper, nand_get_interface_config(), and use
> it to retrieve the current interface configuration out of a nand_chip
> object.


Would have been much better to have that patch before patch 19 so you
can modify drivers only once.

> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/mtd/nand/raw/marvell_nand.c    |  6 ++-
>  drivers/mtd/nand/raw/meson_nand.c      |  8 ++--
>  drivers/mtd/nand/raw/nand_base.c       | 56 +++++++++++++-------------
>  drivers/mtd/nand/raw/nand_legacy.c     |  3 +-
>  drivers/mtd/nand/raw/nand_toshiba.c    |  4 +-
>  drivers/mtd/nand/raw/stm32_fmc2_nand.c |  2 +-
>  include/linux/mtd/rawnand.h            | 11 +++++
>  7 files changed, 52 insertions(+), 38 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/marvell_nand.c b/drivers/mtd/nand/raw/marvell_nand.c
> index 59609f680cbf..46d5c0a71e89 100644
> --- a/drivers/mtd/nand/raw/marvell_nand.c
> +++ b/drivers/mtd/nand/raw/marvell_nand.c
> @@ -1096,7 +1096,8 @@ static int marvell_nfc_hw_ecc_hmg_do_write_page(struct nand_chip *chip,
>  						const u8 *oob_buf, bool raw,
>  						int page)
>  {
> -	const struct nand_sdr_timings *sdr = nand_get_sdr_timings(&chip->interface_config);
> +	const struct nand_interface_config *config = nand_get_interface_config(chip);
> +	const struct nand_sdr_timings *sdr = nand_get_sdr_timings(config);
>  	struct marvell_nand_chip *marvell_nand = to_marvell_nand(chip);
>  	struct marvell_nfc *nfc = to_marvell_nfc(chip->controller);
>  	const struct marvell_hw_ecc_layout *lt = to_marvell_nand(chip)->layout;
> @@ -1563,7 +1564,8 @@ static int marvell_nfc_hw_ecc_bch_write_page(struct nand_chip *chip,
>  					     const u8 *buf,
>  					     int oob_required, int page)
>  {
> -	const struct nand_sdr_timings *sdr = nand_get_sdr_timings(&chip->interface_config);
> +	const struct nand_interface_config *config = nand_get_interface_config(chip);
> +	const struct nand_sdr_timings *sdr = nand_get_sdr_timings(config);
>  	struct mtd_info *mtd = nand_to_mtd(chip);
>  	const struct marvell_hw_ecc_layout *lt = to_marvell_nand(chip)->layout;
>  	const u8 *data = buf;
> diff --git a/drivers/mtd/nand/raw/meson_nand.c b/drivers/mtd/nand/raw/meson_nand.c
> index c9b9594efa4f..42174915d074 100644
> --- a/drivers/mtd/nand/raw/meson_nand.c
> +++ b/drivers/mtd/nand/raw/meson_nand.c
> @@ -573,10 +573,10 @@ static int meson_nfc_write_buf(struct nand_chip *nand, u8 *buf, int len)
>  static int meson_nfc_rw_cmd_prepare_and_execute(struct nand_chip *nand,
>  						int page, bool in)
>  {
> +	const struct nand_interface_config *config = nand_get_interface_config(nand);
> +	const struct nand_sdr_timings *sdr = nand_get_sdr_timings(config);
>  	struct mtd_info *mtd = nand_to_mtd(nand);
>  	struct meson_nfc *nfc = nand_get_controller_data(nand);
> -	const struct nand_sdr_timings *sdr =
> -		nand_get_sdr_timings(&nand->interface_config);
>  	u32 *addrs = nfc->cmdfifo.rw.addrs;
>  	u32 cs = nfc->param.chip_select;
>  	u32 cmd0, cmd_num, row_start;
> @@ -626,9 +626,9 @@ static int meson_nfc_rw_cmd_prepare_and_execute(struct nand_chip *nand,
>  static int meson_nfc_write_page_sub(struct nand_chip *nand,
>  				    int page, int raw)
>  {
> +	const struct nand_interface_config *config = nand_get_interface_config(nand);
> +	const struct nand_sdr_timings *sdr = nand_get_sdr_timings(config);
>  	struct mtd_info *mtd = nand_to_mtd(nand);
> -	const struct nand_sdr_timings *sdr =
> -		nand_get_sdr_timings(&nand->interface_config);
>  	struct meson_nfc_nand_chip *meson_chip = to_meson_nand(nand);
>  	struct meson_nfc *nfc = nand_get_controller_data(nand);
>  	int data_len, info_len;
> diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
> index 4a72ec221262..14d003062fa6 100644
> --- a/drivers/mtd/nand/raw/nand_base.c
> +++ b/drivers/mtd/nand/raw/nand_base.c
> @@ -773,7 +773,7 @@ int nand_soft_waitrdy(struct nand_chip *chip, unsigned long timeout_ms)
>  		return -ENOTSUPP;
>  
>  	/* Wait tWB before polling the STATUS reg. */
> -	timings = nand_get_sdr_timings(&chip->interface_config);
> +	timings = nand_get_sdr_timings(nand_get_interface_config(chip));
>  	ndelay(PSEC_TO_NSEC(timings->tWB_max));
>  
>  	ret = nand_status_op(chip, NULL);
> @@ -1116,9 +1116,9 @@ static int nand_sp_exec_read_page_op(struct nand_chip *chip, unsigned int page,
>  				     unsigned int offset_in_page, void *buf,
>  				     unsigned int len)
>  {
> +	const struct nand_interface_config *config = nand_get_interface_config(chip);
> +	const struct nand_sdr_timings *sdr = nand_get_sdr_timings(config);
>  	struct mtd_info *mtd = nand_to_mtd(chip);
> -	const struct nand_sdr_timings *sdr =
> -		nand_get_sdr_timings(&chip->interface_config);
>  	u8 addrs[4];
>  	struct nand_op_instr instrs[] = {
>  		NAND_OP_CMD(NAND_CMD_READ0, 0),
> @@ -1159,8 +1159,8 @@ static int nand_lp_exec_read_page_op(struct nand_chip *chip, unsigned int page,
>  				     unsigned int offset_in_page, void *buf,
>  				     unsigned int len)
>  {
> -	const struct nand_sdr_timings *sdr =
> -		nand_get_sdr_timings(&chip->interface_config);
> +	const struct nand_interface_config *config = nand_get_interface_config(chip);
> +	const struct nand_sdr_timings *sdr = nand_get_sdr_timings(config);
>  	u8 addrs[5];
>  	struct nand_op_instr instrs[] = {
>  		NAND_OP_CMD(NAND_CMD_READ0, 0),
> @@ -1256,8 +1256,8 @@ int nand_read_param_page_op(struct nand_chip *chip, u8 page, void *buf,
>  		return -EINVAL;
>  
>  	if (nand_has_exec_op(chip)) {
> -		const struct nand_sdr_timings *sdr =
> -			nand_get_sdr_timings(&chip->interface_config);
> +		const struct nand_interface_config *config = nand_get_interface_config(chip);
> +		const struct nand_sdr_timings *sdr = nand_get_sdr_timings(config);
>  		struct nand_op_instr instrs[] = {
>  			NAND_OP_CMD(NAND_CMD_PARAM, 0),
>  			NAND_OP_ADDR(1, &page, PSEC_TO_NSEC(sdr->tWB_max)),
> @@ -1311,8 +1311,8 @@ int nand_change_read_column_op(struct nand_chip *chip,
>  		return -ENOTSUPP;
>  
>  	if (nand_has_exec_op(chip)) {
> -		const struct nand_sdr_timings *sdr =
> -			nand_get_sdr_timings(&chip->interface_config);
> +		const struct nand_interface_config *config = nand_get_interface_config(chip);
> +		const struct nand_sdr_timings *sdr = nand_get_sdr_timings(config);
>  		u8 addrs[2] = {};
>  		struct nand_op_instr instrs[] = {
>  			NAND_OP_CMD(NAND_CMD_RNDOUT, 0),
> @@ -1386,9 +1386,9 @@ static int nand_exec_prog_page_op(struct nand_chip *chip, unsigned int page,
>  				  unsigned int offset_in_page, const void *buf,
>  				  unsigned int len, bool prog)
>  {
> +	const struct nand_interface_config *config = nand_get_interface_config(chip);
> +	const struct nand_sdr_timings *sdr = nand_get_sdr_timings(config);
>  	struct mtd_info *mtd = nand_to_mtd(chip);
> -	const struct nand_sdr_timings *sdr =
> -		nand_get_sdr_timings(&chip->interface_config);
>  	u8 addrs[5] = {};
>  	struct nand_op_instr instrs[] = {
>  		/*
> @@ -1510,8 +1510,8 @@ int nand_prog_page_end_op(struct nand_chip *chip)
>  	u8 status;
>  
>  	if (nand_has_exec_op(chip)) {
> -		const struct nand_sdr_timings *sdr =
> -			nand_get_sdr_timings(&chip->interface_config);
> +		const struct nand_interface_config *config = nand_get_interface_config(chip);
> +		const struct nand_sdr_timings *sdr = nand_get_sdr_timings(config);
>  		struct nand_op_instr instrs[] = {
>  			NAND_OP_CMD(NAND_CMD_PAGEPROG,
>  				    PSEC_TO_NSEC(sdr->tWB_max)),
> @@ -1617,8 +1617,8 @@ int nand_change_write_column_op(struct nand_chip *chip,
>  		return -ENOTSUPP;
>  
>  	if (nand_has_exec_op(chip)) {
> -		const struct nand_sdr_timings *sdr =
> -			nand_get_sdr_timings(&chip->interface_config);
> +		const struct nand_interface_config *config = nand_get_interface_config(chip);
> +		const struct nand_sdr_timings *sdr = nand_get_sdr_timings(config);
>  		u8 addrs[2];
>  		struct nand_op_instr instrs[] = {
>  			NAND_OP_CMD(NAND_CMD_RNDIN, 0),
> @@ -1672,8 +1672,8 @@ int nand_readid_op(struct nand_chip *chip, u8 addr, void *buf,
>  		return -EINVAL;
>  
>  	if (nand_has_exec_op(chip)) {
> -		const struct nand_sdr_timings *sdr =
> -			nand_get_sdr_timings(&chip->interface_config);
> +		const struct nand_interface_config *config = nand_get_interface_config(chip);
> +		const struct nand_sdr_timings *sdr = nand_get_sdr_timings(config);
>  		struct nand_op_instr instrs[] = {
>  			NAND_OP_CMD(NAND_CMD_READID, 0),
>  			NAND_OP_ADDR(1, &addr, PSEC_TO_NSEC(sdr->tADL_min)),
> @@ -1711,8 +1711,8 @@ EXPORT_SYMBOL_GPL(nand_readid_op);
>  int nand_status_op(struct nand_chip *chip, u8 *status)
>  {
>  	if (nand_has_exec_op(chip)) {
> -		const struct nand_sdr_timings *sdr =
> -			nand_get_sdr_timings(&chip->interface_config);
> +		const struct nand_interface_config *config = nand_get_interface_config(chip);
> +		const struct nand_sdr_timings *sdr = nand_get_sdr_timings(config);
>  		struct nand_op_instr instrs[] = {
>  			NAND_OP_CMD(NAND_CMD_STATUS,
>  				    PSEC_TO_NSEC(sdr->tADL_min)),
> @@ -1780,8 +1780,8 @@ int nand_erase_op(struct nand_chip *chip, unsigned int eraseblock)
>  	u8 status;
>  
>  	if (nand_has_exec_op(chip)) {
> -		const struct nand_sdr_timings *sdr =
> -			nand_get_sdr_timings(&chip->interface_config);
> +		const struct nand_interface_config *config = nand_get_interface_config(chip);
> +		const struct nand_sdr_timings *sdr = nand_get_sdr_timings(config);
>  		u8 addrs[3] = {	page, page >> 8, page >> 16 };
>  		struct nand_op_instr instrs[] = {
>  			NAND_OP_CMD(NAND_CMD_ERASE1, 0),
> @@ -1839,8 +1839,8 @@ static int nand_set_features_op(struct nand_chip *chip, u8 feature,
>  	int i, ret;
>  
>  	if (nand_has_exec_op(chip)) {
> -		const struct nand_sdr_timings *sdr =
> -			nand_get_sdr_timings(&chip->interface_config);
> +		const struct nand_interface_config *config = nand_get_interface_config(chip);
> +		const struct nand_sdr_timings *sdr = nand_get_sdr_timings(config);
>  		struct nand_op_instr instrs[] = {
>  			NAND_OP_CMD(NAND_CMD_SET_FEATURES, 0),
>  			NAND_OP_ADDR(1, &feature, PSEC_TO_NSEC(sdr->tADL_min)),
> @@ -1886,8 +1886,8 @@ static int nand_get_features_op(struct nand_chip *chip, u8 feature,
>  	int i;
>  
>  	if (nand_has_exec_op(chip)) {
> -		const struct nand_sdr_timings *sdr =
> -			nand_get_sdr_timings(&chip->interface_config);
> +		const struct nand_interface_config *config = nand_get_interface_config(chip);
> +		const struct nand_sdr_timings *sdr = nand_get_sdr_timings(config);
>  		struct nand_op_instr instrs[] = {
>  			NAND_OP_CMD(NAND_CMD_GET_FEATURES, 0),
>  			NAND_OP_ADDR(1, &feature, PSEC_TO_NSEC(sdr->tWB_max)),
> @@ -1943,8 +1943,8 @@ static int nand_wait_rdy_op(struct nand_chip *chip, unsigned int timeout_ms,
>  int nand_reset_op(struct nand_chip *chip)
>  {
>  	if (nand_has_exec_op(chip)) {
> -		const struct nand_sdr_timings *sdr =
> -			nand_get_sdr_timings(&chip->interface_config);
> +		const struct nand_interface_config *config = nand_get_interface_config(chip);
> +		const struct nand_sdr_timings *sdr = nand_get_sdr_timings(config);
>  		struct nand_op_instr instrs[] = {
>  			NAND_OP_CMD(NAND_CMD_RESET, PSEC_TO_NSEC(sdr->tWB_max)),
>  			NAND_OP_WAIT_RDY(PSEC_TO_MSEC(sdr->tRST_max), 0),
> @@ -3221,7 +3221,7 @@ static void nand_wait_readrdy(struct nand_chip *chip)
>  	if (!(chip->options & NAND_NEED_READRDY))
>  		return;
>  
> -	sdr = nand_get_sdr_timings(&chip->interface_config);
> +	sdr = nand_get_sdr_timings(nand_get_interface_config(chip));
>  	WARN_ON(nand_wait_rdy_op(chip, PSEC_TO_MSEC(sdr->tR_max), 0));
>  }
>  
> diff --git a/drivers/mtd/nand/raw/nand_legacy.c b/drivers/mtd/nand/raw/nand_legacy.c
> index 8f3644ca2ea0..32601f91d375 100644
> --- a/drivers/mtd/nand/raw/nand_legacy.c
> +++ b/drivers/mtd/nand/raw/nand_legacy.c
> @@ -354,7 +354,8 @@ static void nand_command(struct nand_chip *chip, unsigned int command,
>  
>  static void nand_ccs_delay(struct nand_chip *chip)
>  {
> -	const struct nand_sdr_timings *sdr = nand_get_sdr_timings(&chip->interface_config);
> +	const struct nand_interface_config *config = nand_get_interface_config(chip);
> +	const struct nand_sdr_timings *sdr = nand_get_sdr_timings(config);
>  
>  	/*
>  	 * The controller already takes care of waiting for tCCS when the RNDIN
> diff --git a/drivers/mtd/nand/raw/nand_toshiba.c b/drivers/mtd/nand/raw/nand_toshiba.c
> index f99c9cc5ffa5..2712f4e95798 100644
> --- a/drivers/mtd/nand/raw/nand_toshiba.c
> +++ b/drivers/mtd/nand/raw/nand_toshiba.c
> @@ -32,8 +32,8 @@ static int toshiba_nand_benand_read_eccstatus_op(struct nand_chip *chip,
>  	u8 *ecc_status = buf;
>  
>  	if (nand_has_exec_op(chip)) {
> -		const struct nand_sdr_timings *sdr =
> -			nand_get_sdr_timings(&chip->interface_config);
> +		const struct nand_interface_config *config = nand_get_interface_config(chip);
> +		const struct nand_sdr_timings *sdr = nand_get_sdr_timings(config);
>  		struct nand_op_instr instrs[] = {
>  			NAND_OP_CMD(TOSHIBA_NAND_CMD_ECC_STATUS_READ,
>  				    PSEC_TO_NSEC(sdr->tADL_min)),
> diff --git a/drivers/mtd/nand/raw/stm32_fmc2_nand.c b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
> index 749ac1044006..a4140af43ed4 100644
> --- a/drivers/mtd/nand/raw/stm32_fmc2_nand.c
> +++ b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
> @@ -1308,7 +1308,7 @@ static int stm32_fmc2_nfc_waitrdy(struct nand_chip *chip,
>  		dev_warn(nfc->dev, "Waitrdy timeout\n");
>  
>  	/* Wait tWB before R/B# signal is low */
> -	timings = nand_get_sdr_timings(&chip->interface_config);
> +	timings = nand_get_sdr_timings(nand_get_interface_config(chip));
>  	ndelay(PSEC_TO_NSEC(timings->tWB_max));
>  
>  	/* R/B# signal is low, clear high level flag */
> diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
> index b37eb5ee11c8..03b62f900d20 100644
> --- a/include/linux/mtd/rawnand.h
> +++ b/include/linux/mtd/rawnand.h
> @@ -1205,6 +1205,17 @@ static inline struct device_node *nand_get_flash_node(struct nand_chip *chip)
>  /* Default/reset data interface */
>  const struct nand_interface_config *nand_get_reset_interface(void);
>  
> +/**
> + * nand_get_interface_config - Retrieve the current interface configuration
> + *                             of a NAND chip
> + * @chip: The NAND chip
> + */
> +static inline const struct nand_interface_config *
> +nand_get_interface_config(struct nand_chip *chip)
> +{
> +	return &chip->interface_config;
> +}
> +
>  /*
>   * A helper for defining older NAND chips where the second ID byte fully
>   * defined the chip, including the geometry (chip size, eraseblock size, page


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
