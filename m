Return-Path: <SRS0=IAjr=6J=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48778C55186
	for <linux-mtd@archiver.kernel.org>; Sat, 25 Apr 2020 09:11:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 16C4A2064A
	for <linux-mtd@archiver.kernel.org>; Sat, 25 Apr 2020 09:11:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YvY8k7at"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 16C4A2064A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=45zd9MuLdDMI/LdJxSlq15HQzpVuZ8mYmHhfRt0H1gk=; b=YvY8k7atOTYeM+
	25RFUqNMqa5LCPZv1uxlTQaFKCcy/ylTqVvuLl7kh4CcHEQf0+aFYnE6aLuFpNasEcTXiZ/o1MwQh
	tk+tM6aB0kSUNXVEl2JEiq0CHME6n0/UM07ZjGVwPTG3Q8f5ZogYHe/Ze/ul+yxZzJn7ztKCLbv3f
	mmqC3MLMs2Ivd9+Y+LttoQoqaL74IJN3nv78XBW/qAVr6Pa9Git/yF93eeF6lefCCsdMjuRxjZNM1
	hA0gnYe1TrtRbw8d+44c5ORIfyhtc6GeO6F9yRAVXbVZyUZ4+/nu64Km/dUOK8PvcdEREdLS+Ov6I
	K+TI2YeJ8e9RY6Vjjk6g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jSGqB-0001SQ-VM; Sat, 25 Apr 2020 09:11:15 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jSGq8-0001RQ-5V
 for linux-mtd@lists.infradead.org; Sat, 25 Apr 2020 09:11:13 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id EF79A2A2F95;
 Sat, 25 Apr 2020 10:11:09 +0100 (BST)
Date: Sat, 25 Apr 2020 11:11:05 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 07/10] mtd: rawnand: Help supporting controllers that
 are not able to split operations
Message-ID: <20200425111105.4a5a7861@collabora.com>
In-Reply-To: <20200424173631.14311-8-miquel.raynal@bootlin.com>
References: <20200424173631.14311-1-miquel.raynal@bootlin.com>
 <20200424173631.14311-8-miquel.raynal@bootlin.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200425_021112_468557_A2F4A6A0 
X-CRM114-Status: GOOD (  27.99  )
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
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, 24 Apr 2020 19:36:28 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> While performing any NAND operation is as simple as following the
> cores order and send "command", "address" and "data" cycles as
> provided in a list of instructions, certain controllers are "too
> clever" and are not able to split the sending of these cycles.
> 
> Try to find out at boot time if the controller will be problematic and
> flag it. Additional changes will make use of this flag to workaround
> the capricious controllers by proposing "packed" operations as an
> alternative.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/mtd/nand/raw/internals.h |  5 ++++
>  drivers/mtd/nand/raw/nand_base.c | 44 ++++++++++++++++++++++++++++++++
>  include/linux/mtd/rawnand.h      |  8 ++++++
>  3 files changed, 57 insertions(+)
> 
> diff --git a/drivers/mtd/nand/raw/internals.h b/drivers/mtd/nand/raw/internals.h
> index 9d0caadf940e..38898b8639ee 100644
> --- a/drivers/mtd/nand/raw/internals.h
> +++ b/drivers/mtd/nand/raw/internals.h
> @@ -130,6 +130,11 @@ static inline bool nand_has_setup_data_iface(struct nand_chip *chip)
>  	return true;
>  }
>  
> +static inline bool nand_pack_ops(struct nand_chip *chip)
> +{
> +	return (chip->options & NAND_PACK_OPS);
> +}
> +
>  /* BBT functions */
>  int nand_markbad_bbt(struct nand_chip *chip, loff_t offs);
>  int nand_isreserved_bbt(struct nand_chip *chip, loff_t offs);
> diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
> index 15a9189b2307..6e4eabb9dc11 100644
> --- a/drivers/mtd/nand/raw/nand_base.c
> +++ b/drivers/mtd/nand/raw/nand_base.c
> @@ -5031,6 +5031,44 @@ static int nand_dt_init(struct nand_chip *chip)
>  	return 0;
>  }
>  
> +/**
> + * nand_controller_needs_packed_op - Check the controller habilities to perform
> + *                                   a set of split operations that the core is
> + *                                   very likely to try. If one of them do not
> + *                                   pass, then try to pack operations together.
> + * @chip: The NAND chip
> + *
> + * Returns @true if packing is needed, false otherwise.
> + */
> +static bool nand_controller_needs_packed_op(struct nand_chip *chip)
> +{
> +	u8 tmp[8];
> +	struct nand_op_instr data_in_instrs[] = {
> +		NAND_OP_DATA_IN(8, tmp, 0),
> +	};
> +	struct nand_op_instr data_out_instrs[] = {
> +		NAND_OP_DATA_OUT(8, tmp, 0),
> +	};
> +	struct nand_operation ops[] = {
> +		NAND_OPERATION(0, data_in_instrs),
> +		NAND_OPERATION(0, data_out_instrs),
> +	};
> +	int ret, i;
> +
> +	if (!nand_has_exec_op(chip))
> +		return false;
> +
> +	for (i = 0; i < ARRAY_SIZE(ops); i++) {
> +		ret = chip->controller->ops->exec_op(chip, &ops[i], true);
> +		if (ret) {
> +			pr_debug("Using ->exec_op() packed operations only\n");
> +			return true;
> +		}
> +	}

Hm, I'm not sure that's enough to detect all weird cases that the
controller might support or not. The check should really be done on
actual operations with accurate sizes instead of using a randomly chosen
8byte data in/out pattern to decide whether all ops need to be
monolithic or not.

So, let's take a step back and analyze your use cases. You seem to have
3 here:

1/ read param page
2/ program page
3/ read page

For #1, we can just do the check before executing the operation because
it's only done once at init time (not in the read/write/erase path
where we care about perfs). For that one I'd suggest extending the
nand_read_param_page_op() function to take a check_only parameter and
doing the check directly in nand_{onfi,jedec}_detect().

For #2 and #3, I'd rather have per operation flags to pick the right
variant, but maybe a simpler option would be to add new helpers for
those monolithic read/write until we come up with a generic way to
determine which variants of each perf-sensitive sequences should be
used based on exec_op() checks.

int nand_monolithic_read_page_raw(struct nand_chip *chip, u8 *buf,
				  int oob_required, int page)
{
	struct mtd_info *mtd = nand_to_mtd(chip);
	unsigned int size = mtd->writesize;
	u8 *read_buf = buf;
	int ret;

	if (oob_required) {
		size += mtd->oobsize;

		if (buf != chip->data_buf) {
			chip->pagecache.page = -1;
			read_buf = chip->data_buf;
		}
	}

	ret = nand_read_page_op(chip, page, 0, read_buf, size);
	if (ret)
		return ret;

	if (buf != read_buf)
		memcpy(buf, read_buf, mtd->writesize)

	return 0;
}

int nand_monolithic_write_page_raw(struct nand_chip *chip, const u8 *buf,
				   int oob_required, int page)
{
	struct mtd_info *mtd = nand_to_mtd(chip);
	unsigned int size = mtd->writesize;
	const u8 *write_buf = buf;
	int ret;

	if (oob_required) {
		size += mtd->oobsize;

		if (buf != chip->data_buf) {
			chip->pagecache.page = -1;
			memcpy(chip->data_buf, buf, mtd->writesize);
			write_buf = chip->data_buf;
		}
	}

	return nand_prog_page_op(chip, page, 0, write_buf, size);
}

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
