Return-Path: <SRS0=kjCr=7L=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB454C433DF
	for <linux-mtd@archiver.kernel.org>; Fri, 29 May 2020 11:26:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BBC512074D
	for <linux-mtd@archiver.kernel.org>; Fri, 29 May 2020 11:26:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dja+fn34"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BBC512074D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DuWYURIOXsYzEvf/B3by8KC8HiNlmpevxpwxF3XaIT0=; b=dja+fn34upr6xW
	ZtGg6tqi77a7E3Hm9CqaapCkDugEMoE5Eiu1c3pidJICpf7grhADNv/vqBrbDbLReQ41BNbCLSnrF
	5TAwOLIMXLhdSjudZU7G1HAO4traR4J3ZUpMnUOmN8vcgdXzpZKcUuApQgEcVi89vpbqpsX9gzrTt
	k/H5ZQAOqZ5a04st7Bs5lh6E+YJRXa89jPjf/OM4TSeGhbdH0ZKJzCxq0MyHuTLZmyY7f0VFX0fjt
	PMTOJzhaw6dYQ4pDCOYjYR2PGkMfj8PVdWpYfk2lBR6qANjFeKj8iLXRKBBZH1g/O7Ns97yHfP6RI
	aXhjjwEmcBQEepjI6d9A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jed9r-0002Zm-MN; Fri, 29 May 2020 11:26:39 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jed9o-0002Z5-0Q
 for linux-mtd@lists.infradead.org; Fri, 29 May 2020 11:26:38 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id B44062A433F;
 Fri, 29 May 2020 12:26:34 +0100 (BST)
Date: Fri, 29 May 2020 13:26:31 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v7 18/28] mtd: rawnand: Hide the chip->data_interface
 indirection
Message-ID: <20200529132631.38e802cc@collabora.com>
In-Reply-To: <20200529111322.7184-19-miquel.raynal@bootlin.com>
References: <20200529111322.7184-1-miquel.raynal@bootlin.com>
 <20200529111322.7184-19-miquel.raynal@bootlin.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200529_042636_318345_66700642 
X-CRM114-Status: GOOD (  23.12  )
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
Cc: Michal Simek <monstr@monstr.eu>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, 29 May 2020 13:13:12 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> As a preparation for allocating the data interface structure
> dynamically (and rename it), let's avoid accessing
> chip->data_interface directly.
> 
> Instead, we introduce a helper, nand_get_interface_config(), and use
> it to retrieve the current data interface configuration out of a
> nand_chip object.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/mtd/nand/raw/marvell_nand.c    |  9 ++++---
>  drivers/mtd/nand/raw/meson_nand.c      |  8 +++---
>  drivers/mtd/nand/raw/nand_base.c       | 34 +++++++++++++-------------
>  drivers/mtd/nand/raw/nand_legacy.c     |  5 +++-
>  drivers/mtd/nand/raw/nand_toshiba.c    |  2 +-
>  drivers/mtd/nand/raw/stm32_fmc2_nand.c |  2 +-
>  include/linux/mtd/rawnand.h            | 11 +++++++++
>  7 files changed, 44 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/marvell_nand.c b/drivers/mtd/nand/raw/marvell_nand.c
> index 260a0430313e..df859889e4eb 100644
> --- a/drivers/mtd/nand/raw/marvell_nand.c
> +++ b/drivers/mtd/nand/raw/marvell_nand.c
> @@ -1096,6 +1096,8 @@ static int marvell_nfc_hw_ecc_hmg_do_write_page(struct nand_chip *chip,
>  						const u8 *oob_buf, bool raw,
>  						int page)
>  {
> +	const struct nand_sdr_timings *sdr =
> +		nand_get_sdr_timings(nand_get_interface_config(chip));
>  	struct marvell_nand_chip *marvell_nand = to_marvell_nand(chip);
>  	struct marvell_nfc *nfc = to_marvell_nfc(chip->controller);
>  	const struct marvell_hw_ecc_layout *lt = to_marvell_nand(chip)->layout;
> @@ -1141,7 +1143,7 @@ static int marvell_nfc_hw_ecc_hmg_do_write_page(struct nand_chip *chip,
>  		return ret;
>  
>  	ret = marvell_nfc_wait_op(chip,
> -				  PSEC_TO_MSEC(chip->data_interface.timings.sdr.tPROG_max));
> +				  PSEC_TO_MSEC(sdr->tPROG_max));
>  	return ret;
>  }
>  
> @@ -1562,6 +1564,8 @@ static int marvell_nfc_hw_ecc_bch_write_page(struct nand_chip *chip,
>  					     const u8 *buf,
>  					     int oob_required, int page)
>  {
> +	const struct nand_sdr_timings *sdr =
> +		nand_get_sdr_timings(nand_get_interface_config(chip));
>  	struct mtd_info *mtd = nand_to_mtd(chip);
>  	const struct marvell_hw_ecc_layout *lt = to_marvell_nand(chip)->layout;
>  	const u8 *data = buf;
> @@ -1598,8 +1602,7 @@ static int marvell_nfc_hw_ecc_bch_write_page(struct nand_chip *chip,
>  		marvell_nfc_wait_ndrun(chip);
>  	}
>  
> -	ret = marvell_nfc_wait_op(chip,
> -				  PSEC_TO_MSEC(chip->data_interface.timings.sdr.tPROG_max));
> +	ret = marvell_nfc_wait_op(chip, PSEC_TO_MSEC(sdr->tPROG_max));
>  
>  	marvell_nfc_disable_hw_ecc(chip);
>  
> diff --git a/drivers/mtd/nand/raw/meson_nand.c b/drivers/mtd/nand/raw/meson_nand.c
> index 3f376471f3f7..580b7be0719f 100644
> --- a/drivers/mtd/nand/raw/meson_nand.c
> +++ b/drivers/mtd/nand/raw/meson_nand.c
> @@ -573,10 +573,10 @@ static int meson_nfc_write_buf(struct nand_chip *nand, u8 *buf, int len)
>  static int meson_nfc_rw_cmd_prepare_and_execute(struct nand_chip *nand,
>  						int page, bool in)
>  {
> +	const struct nand_sdr_timings *sdr =
> +		nand_get_sdr_timings(nand_get_interface_config(nand));
>  	struct mtd_info *mtd = nand_to_mtd(nand);
>  	struct meson_nfc *nfc = nand_get_controller_data(nand);
> -	const struct nand_sdr_timings *sdr =
> -		nand_get_sdr_timings(&nand->data_interface);
>  	u32 *addrs = nfc->cmdfifo.rw.addrs;
>  	u32 cs = nfc->param.chip_select;
>  	u32 cmd0, cmd_num, row_start;
> @@ -626,9 +626,9 @@ static int meson_nfc_rw_cmd_prepare_and_execute(struct nand_chip *nand,
>  static int meson_nfc_write_page_sub(struct nand_chip *nand,
>  				    int page, int raw)
>  {
> -	struct mtd_info *mtd = nand_to_mtd(nand);
>  	const struct nand_sdr_timings *sdr =
> -		nand_get_sdr_timings(&nand->data_interface);
> +		nand_get_sdr_timings(nand_get_interface_config(nand));
> +	struct mtd_info *mtd = nand_to_mtd(nand);
>  	struct meson_nfc_nand_chip *meson_chip = to_meson_nand(nand);
>  	struct meson_nfc *nfc = nand_get_controller_data(nand);
>  	int data_len, info_len;
> diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
> index b4de85794e07..7d393e1d0252 100644
> --- a/drivers/mtd/nand/raw/nand_base.c
> +++ b/drivers/mtd/nand/raw/nand_base.c
> @@ -773,7 +773,7 @@ int nand_soft_waitrdy(struct nand_chip *chip, unsigned long timeout_ms)
>  		return -ENOTSUPP;
>  
>  	/* Wait tWB before polling the STATUS reg. */
> -	timings = nand_get_sdr_timings(&chip->data_interface);
> +	timings = nand_get_sdr_timings(nand_get_interface_config(chip));
>  	ndelay(PSEC_TO_NSEC(timings->tWB_max));
>  
>  	ret = nand_status_op(chip, NULL);
> @@ -1119,9 +1119,9 @@ static int nand_sp_exec_read_page_op(struct nand_chip *chip, unsigned int page,
>  				     unsigned int offset_in_page, void *buf,
>  				     unsigned int len)
>  {
> -	struct mtd_info *mtd = nand_to_mtd(chip);
>  	const struct nand_sdr_timings *sdr =
> -		nand_get_sdr_timings(&chip->data_interface);
> +		nand_get_sdr_timings(nand_get_interface_config(chip));
> +	struct mtd_info *mtd = nand_to_mtd(chip);
>  	u8 addrs[4];
>  	struct nand_op_instr instrs[] = {
>  		NAND_OP_CMD(NAND_CMD_READ0, 0),
> @@ -1163,7 +1163,7 @@ static int nand_lp_exec_read_page_op(struct nand_chip *chip, unsigned int page,
>  				     unsigned int len)
>  {
>  	const struct nand_sdr_timings *sdr =
> -		nand_get_sdr_timings(&chip->data_interface);
> +		nand_get_sdr_timings(nand_get_interface_config(chip));
>  	u8 addrs[5];
>  	struct nand_op_instr instrs[] = {
>  		NAND_OP_CMD(NAND_CMD_READ0, 0),
> @@ -1260,7 +1260,7 @@ int nand_read_param_page_op(struct nand_chip *chip, u8 page, void *buf,
>  
>  	if (nand_has_exec_op(chip)) {
>  		const struct nand_sdr_timings *sdr =
> -			nand_get_sdr_timings(&chip->data_interface);
> +			nand_get_sdr_timings(nand_get_interface_config(chip));
>  		struct nand_op_instr instrs[] = {
>  			NAND_OP_CMD(NAND_CMD_PARAM, 0),
>  			NAND_OP_ADDR(1, &page, PSEC_TO_NSEC(sdr->tWB_max)),
> @@ -1315,7 +1315,7 @@ int nand_change_read_column_op(struct nand_chip *chip,
>  
>  	if (nand_has_exec_op(chip)) {
>  		const struct nand_sdr_timings *sdr =
> -			nand_get_sdr_timings(&chip->data_interface);
> +			nand_get_sdr_timings(nand_get_interface_config(chip));
>  		u8 addrs[2] = {};
>  		struct nand_op_instr instrs[] = {
>  			NAND_OP_CMD(NAND_CMD_RNDOUT, 0),
> @@ -1389,9 +1389,9 @@ static int nand_exec_prog_page_op(struct nand_chip *chip, unsigned int page,
>  				  unsigned int offset_in_page, const void *buf,
>  				  unsigned int len, bool prog)
>  {
> -	struct mtd_info *mtd = nand_to_mtd(chip);
>  	const struct nand_sdr_timings *sdr =
> -		nand_get_sdr_timings(&chip->data_interface);
> +		nand_get_sdr_timings(nand_get_interface_config(chip));
> +	struct mtd_info *mtd = nand_to_mtd(chip);
>  	u8 addrs[5] = {};
>  	struct nand_op_instr instrs[] = {
>  		/*
> @@ -1514,7 +1514,7 @@ int nand_prog_page_end_op(struct nand_chip *chip)
>  
>  	if (nand_has_exec_op(chip)) {
>  		const struct nand_sdr_timings *sdr =
> -			nand_get_sdr_timings(&chip->data_interface);
> +			nand_get_sdr_timings(nand_get_interface_config(chip));
>  		struct nand_op_instr instrs[] = {
>  			NAND_OP_CMD(NAND_CMD_PAGEPROG,
>  				    PSEC_TO_NSEC(sdr->tWB_max)),
> @@ -1621,7 +1621,7 @@ int nand_change_write_column_op(struct nand_chip *chip,
>  
>  	if (nand_has_exec_op(chip)) {
>  		const struct nand_sdr_timings *sdr =
> -			nand_get_sdr_timings(&chip->data_interface);
> +			nand_get_sdr_timings(nand_get_interface_config(chip));
>  		u8 addrs[2];
>  		struct nand_op_instr instrs[] = {
>  			NAND_OP_CMD(NAND_CMD_RNDIN, 0),
> @@ -1676,7 +1676,7 @@ int nand_readid_op(struct nand_chip *chip, u8 addr, void *buf,
>  
>  	if (nand_has_exec_op(chip)) {
>  		const struct nand_sdr_timings *sdr =
> -			nand_get_sdr_timings(&chip->data_interface);
> +			nand_get_sdr_timings(nand_get_interface_config(chip));
>  		struct nand_op_instr instrs[] = {
>  			NAND_OP_CMD(NAND_CMD_READID, 0),
>  			NAND_OP_ADDR(1, &addr, PSEC_TO_NSEC(sdr->tADL_min)),
> @@ -1715,7 +1715,7 @@ int nand_status_op(struct nand_chip *chip, u8 *status)
>  {
>  	if (nand_has_exec_op(chip)) {
>  		const struct nand_sdr_timings *sdr =
> -			nand_get_sdr_timings(&chip->data_interface);
> +			nand_get_sdr_timings(nand_get_interface_config(chip));
>  		struct nand_op_instr instrs[] = {
>  			NAND_OP_CMD(NAND_CMD_STATUS,
>  				    PSEC_TO_NSEC(sdr->tADL_min)),
> @@ -1784,7 +1784,7 @@ int nand_erase_op(struct nand_chip *chip, unsigned int eraseblock)
>  
>  	if (nand_has_exec_op(chip)) {
>  		const struct nand_sdr_timings *sdr =
> -			nand_get_sdr_timings(&chip->data_interface);
> +			nand_get_sdr_timings(nand_get_interface_config(chip));
>  		u8 addrs[3] = {	page, page >> 8, page >> 16 };
>  		struct nand_op_instr instrs[] = {
>  			NAND_OP_CMD(NAND_CMD_ERASE1, 0),
> @@ -1843,7 +1843,7 @@ static int nand_set_features_op(struct nand_chip *chip, u8 feature,
>  
>  	if (nand_has_exec_op(chip)) {
>  		const struct nand_sdr_timings *sdr =
> -			nand_get_sdr_timings(&chip->data_interface);
> +			nand_get_sdr_timings(nand_get_interface_config(chip));
>  		struct nand_op_instr instrs[] = {
>  			NAND_OP_CMD(NAND_CMD_SET_FEATURES, 0),
>  			NAND_OP_ADDR(1, &feature, PSEC_TO_NSEC(sdr->tADL_min)),
> @@ -1890,7 +1890,7 @@ static int nand_get_features_op(struct nand_chip *chip, u8 feature,
>  
>  	if (nand_has_exec_op(chip)) {
>  		const struct nand_sdr_timings *sdr =
> -			nand_get_sdr_timings(&chip->data_interface);
> +			nand_get_sdr_timings(nand_get_interface_config(chip));
>  		struct nand_op_instr instrs[] = {
>  			NAND_OP_CMD(NAND_CMD_GET_FEATURES, 0),
>  			NAND_OP_ADDR(1, &feature, PSEC_TO_NSEC(sdr->tWB_max)),
> @@ -1947,7 +1947,7 @@ int nand_reset_op(struct nand_chip *chip)
>  {
>  	if (nand_has_exec_op(chip)) {
>  		const struct nand_sdr_timings *sdr =
> -			nand_get_sdr_timings(&chip->data_interface);
> +			nand_get_sdr_timings(nand_get_interface_config(chip));
>  		struct nand_op_instr instrs[] = {
>  			NAND_OP_CMD(NAND_CMD_RESET, PSEC_TO_NSEC(sdr->tWB_max)),
>  			NAND_OP_WAIT_RDY(PSEC_TO_MSEC(sdr->tRST_max), 0),
> @@ -3226,7 +3226,7 @@ static void nand_wait_readrdy(struct nand_chip *chip)
>  	if (!(chip->options & NAND_NEED_READRDY))
>  		return;
>  
> -	sdr = nand_get_sdr_timings(&chip->data_interface);
> +	sdr = nand_get_sdr_timings(nand_get_interface_config(chip));
>  	WARN_ON(nand_wait_rdy_op(chip, PSEC_TO_MSEC(sdr->tR_max), 0));
>  }
>  
> diff --git a/drivers/mtd/nand/raw/nand_legacy.c b/drivers/mtd/nand/raw/nand_legacy.c
> index 848403dcae03..fe769762e1d8 100644
> --- a/drivers/mtd/nand/raw/nand_legacy.c
> +++ b/drivers/mtd/nand/raw/nand_legacy.c
> @@ -354,6 +354,9 @@ static void nand_command(struct nand_chip *chip, unsigned int command,
>  
>  static void nand_ccs_delay(struct nand_chip *chip)
>  {
> +	const struct nand_sdr_timings *sdr =
> +		nand_get_sdr_timings(nand_get_interface_config(chip));
> +
>  	/*
>  	 * The controller already takes care of waiting for tCCS when the RNDIN
>  	 * or RNDOUT command is sent, return directly.
> @@ -366,7 +369,7 @@ static void nand_ccs_delay(struct nand_chip *chip)
>  	 * (which should be safe for all NANDs).
>  	 */
>  	if (nand_controller_can_setup_data_iface(chip))
> -		ndelay(chip->data_interface.timings.sdr.tCCS_min / 1000);
> +		ndelay(sdr->tCCS_min / 1000);
>  	else
>  		ndelay(500);
>  }
> diff --git a/drivers/mtd/nand/raw/nand_toshiba.c b/drivers/mtd/nand/raw/nand_toshiba.c
> index ae069905d7e4..333037bdca41 100644
> --- a/drivers/mtd/nand/raw/nand_toshiba.c
> +++ b/drivers/mtd/nand/raw/nand_toshiba.c
> @@ -33,7 +33,7 @@ static int toshiba_nand_benand_read_eccstatus_op(struct nand_chip *chip,
>  
>  	if (nand_has_exec_op(chip)) {
>  		const struct nand_sdr_timings *sdr =
> -			nand_get_sdr_timings(&chip->data_interface);
> +			nand_get_sdr_timings(nand_get_interface_config(chip));
>  		struct nand_op_instr instrs[] = {
>  			NAND_OP_CMD(TOSHIBA_NAND_CMD_ECC_STATUS_READ,
>  				    PSEC_TO_NSEC(sdr->tADL_min)),
> diff --git a/drivers/mtd/nand/raw/stm32_fmc2_nand.c b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
> index 65c9d17b25a3..7320c0fc19ec 100644
> --- a/drivers/mtd/nand/raw/stm32_fmc2_nand.c
> +++ b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
> @@ -1308,7 +1308,7 @@ static int stm32_fmc2_nfc_waitrdy(struct nand_chip *chip,
>  		dev_warn(nfc->dev, "Waitrdy timeout\n");
>  
>  	/* Wait tWB before R/B# signal is low */
> -	timings = nand_get_sdr_timings(&chip->data_interface);
> +	timings = nand_get_sdr_timings(nand_get_interface_config(chip));
>  	ndelay(PSEC_TO_NSEC(timings->tWB_max));
>  
>  	/* R/B# signal is low, clear high level flag */
> diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
> index 544ec8736793..0852df941130 100644
> --- a/include/linux/mtd/rawnand.h
> +++ b/include/linux/mtd/rawnand.h
> @@ -1203,6 +1203,17 @@ static inline struct device_node *nand_get_flash_node(struct nand_chip *chip)
>  	return mtd_get_of_node(nand_to_mtd(chip));
>  }
>  
> +/**
> + * nand_get_interface_config - Retrieve the current interface configuration
> + *                             of a NAND chip
> + * @chip: The NAND chip
> + */
> +static inline const struct nand_data_interface *
> +nand_get_interface_config(struct nand_chip *chip)
> +{
> +	return &chip->data_interface;
> +}
> +
>  /*
>   * A helper for defining older NAND chips where the second ID byte fully
>   * defined the chip, including the geometry (chip size, eraseblock size, page


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
