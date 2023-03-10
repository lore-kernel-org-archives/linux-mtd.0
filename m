Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82122C64EC4
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Mar 2023 11:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j9dlFaoHNs5iXG0O6rmiPUHsg+r7Qh6VneYLKhTVy8I=; b=i2mxOLTUlRMRF7g1eo0Uxm/1fE
	lx8i/8b5k+QUYPOKtA/qzcxPRMbQ9Dka3SIPoNbqsfCtqg96UZWv3oCyhQ6UJ7tNPYpG1yI3uUk7S
	CvtspOuEeK13la/ht6zgABo6wwU+hdp8foK9X29Y2PUtx/9rUG59bScUC+ilQeRZy2BSrSHfmA7FE
	DlpgauMVtW+AL8dvTssdZmkZVVu7WC74Nzaj1OkxjMlvHd/msvHo561h6Eu8TdUX+IjqBixIRfBRr
	eMhDJLl216cm4+K7AknImiNN4jnZstLOcOzM4tGvNPuWAkxa895xqJEP6GO9EntTRu5kPbLgZwFTM
	J3+yvIYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paapH-00ELK7-20; Fri, 10 Mar 2023 11:22:19 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paapD-00ELJ8-2D
	for linux-mtd@lists.infradead.org; Fri, 10 Mar 2023 11:22:17 +0000
Received: from kwepemm600013.china.huawei.com (unknown [172.30.72.57])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4PY3Xw1495zKmXd;
	Fri, 10 Mar 2023 19:21:52 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 10 Mar 2023 19:22:00 +0800
Subject: Re: [PATCH] mtd: rawnand: nandsim: Artificially prevent sequential
 page reads
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
	<richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Tudor Ambarus
	<tudor.ambarus@linaro.org>, Pratyush Yadav <pratyush@kernel.org>, Michael
 Walle <michael@walle.cc>, <linux-mtd@lists.infradead.org>
CC: Julien Su <juliensu@mxic.com.tw>, Jaime Liao <jaimeliao@mxic.com.tw>,
	Jaime Liao <jaimeliao.tw@gmail.com>, Alvin Zhou <alvinzhou@mxic.com.tw>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20230310085452.1368716-1-miquel.raynal@bootlin.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <27cd6524-07ad-28a3-966d-9bd543da15a4@huawei.com>
Date: Fri, 10 Mar 2023 19:21:58 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20230310085452.1368716-1-miquel.raynal@bootlin.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230310_032215_477071_A2FADDF3 
X-CRM114-Status: GOOD (  33.14  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Miquel,
> The continuous read support added recently makes nandsim
> unhappy. Indeed, all the supported commands should be re-encoded into
> internal commands, so of course there is currently no support for the
> commands and patterns needed for continuous reads to work.
> 
> I tried to add support for them but nandsim (which is more a tool to
> develop/debug upper layers rather than the raw NAND core) suffers from a
> big limitation: it's internal parser needs to know what exact operation
> is happening when the address cycles are performed. The research is then
> sequential from the start up to the address cycles, but does not check
> what's coming next even though the information is available. This is a
> limitation which is related to the old API used by the core which kind
> of forced the controllers to guess what operation was being performed
> rather early. Today the core uses a more transparent API called
> ->exec_op() which no longer requires controller drivers to do any more
> guessing, but despite being updated to ->exec_op(), nandsim is still a
> bit constrained on this regard and thus cannot handle sequential page
> reads because the start sequence beginning is identical to a regular
> page read.
> 
> If the internal algorithm is updated some day, it should be possible to
> make it support sequential page reads by adding something like:
> 
>         /* Large page devices continuous read page start */
>         {OPT_LARGEPAGE, {STATE_CMD_READ0, STATE_ADDR_PAGE, STATE_CMD_READSTART,
>                          STATE_CMD_READCACHESEQ | ACTION_CPY, STATE_DATAOUT,
>                          STATE_READY}},
>         /* Large page devices continuous read page continue */
>         {OPT_LARGEPAGE, {STATE_CMD_READCACHESEQ | ACTION_CPY_NEXT, STATE_DATAOUT,
>                          STATE_READY}},
>         /* Large page devices continuous read page end */
>         {OPT_LARGEPAGE, {STATE_CMD_READCACHEEND | ACTION_CPY_NEXT, STATE_DATAOUT,
>                          STATE_READY}},
> 
> For now, we just return -EOPNOTSUPP when the core asks controller
> drivers if they support the feature in order to prevent any further use
> of these opcodes.
> 
> Note: This is a hack, ->exec_op() is not supposed to check against the
> COMMAND opcodes unless _really_ needed.
> 
> Fixes: 003fe4b9545b ("mtd: rawnand: Support for sequential cache reads")
> Reported-by: Zhihao Cheng <chengzhihao1@huawei.com>
> Link: https://lore.kernel.org/linux-mtd/fd34fe55-7f4a-030d-8653-9bb9cf08410d@huawei.com/
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>   drivers/mtd/nand/raw/nandsim.c | 17 ++++++++++++++++-
>   1 file changed, 16 insertions(+), 1 deletion(-)
> 

This patch works! Thanks for you help.

Tested-by: Zhihao Cheng <chengzhihao1@huawei.com>
> diff --git a/drivers/mtd/nand/raw/nandsim.c b/drivers/mtd/nand/raw/nandsim.c
> index c21abf748948..179b28459b4b 100644
> --- a/drivers/mtd/nand/raw/nandsim.c
> +++ b/drivers/mtd/nand/raw/nandsim.c
> @@ -2160,8 +2160,23 @@ static int ns_exec_op(struct nand_chip *chip, const struct nand_operation *op,
>   	const struct nand_op_instr *instr = NULL;
>   	struct nandsim *ns = nand_get_controller_data(chip);
>   
> -	if (check_only)
> +	if (check_only) {
> +		/* The current implementation of nandsim needs to know the
> +		 * ongoing operation when performing the address cycles. This
> +		 * means it cannot make the difference between a regular read
> +		 * and a continuous read. Hence, this hack to manually refuse
> +		 * supporting sequential cached operations.
> +		 */
> +		for (op_id = 0; op_id < op->ninstrs; op_id++) {
> +			instr = &op->instrs[op_id];
> +			if (instr->type == NAND_OP_CMD_INSTR &&
> +			    (instr->ctx.cmd.opcode == NAND_CMD_READCACHEEND ||
> +			     instr->ctx.cmd.opcode == NAND_CMD_READCACHESEQ))
> +				return -EOPNOTSUPP;
> +		}
> +
>   		return 0;
> +	}
>   
>   	ns->lines.ce = 1;
>   
> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
