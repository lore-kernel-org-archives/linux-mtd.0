Return-Path: <SRS0=+O2D=RP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0514EC43381
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Mar 2019 09:03:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C73F32147C
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Mar 2019 09:03:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WUqgZIlY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C73F32147C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qviJln7vUb8/HIumFwDTfIO2kg64j7fXxwYMK3uRrDI=; b=WUqgZIlYHInSs/
	mx7m3Z0lm81ZGOCh3wltFFV80OSlgYpuocbxYovg7egNqGbOGzqPHJD+DfzNcLii5zqreVX//VYzn
	9v1+ubZJlN4Fc4N+xY92fBCu/KLQHqkm27/6FWeCy/Nl6pdg5yJM0j4vrvGUS9Vh6MPaJ46wW1F3u
	QlVw+R2LqoEA5N317VYbH+/zXXUzPG9oXvrNPUoXm2dDKaoxsDXmak1VgS8u4655VOdsv3jEDaNmW
	ICuARJXscyqq3CKxYiWJhriJZOdcNLfalYOl/s3LnAp4eTmNd3fiTsGybIIiOQU2UCvDecwyRCGVP
	xtXJ3VKgZhVHxNDuyjBQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h3dJU-0007Tj-4O; Tue, 12 Mar 2019 09:03:08 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h3dJR-0007Sw-3H
 for linux-mtd@lists.infradead.org; Tue, 12 Mar 2019 09:03:06 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 8EE67280794;
 Tue, 12 Mar 2019 09:03:01 +0000 (GMT)
Date: Tue, 12 Mar 2019 10:02:57 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH v3 4/9] mtd: rawnand: denali: switch over to ->exec_op()
 from legacy hooks
Message-ID: <20190312100257.4fa142d1@collabora.com>
In-Reply-To: <1552380290-19951-5-git-send-email-yamada.masahiro@socionext.com>
References: <1552380290-19951-1-git-send-email-yamada.masahiro@socionext.com>
 <1552380290-19951-5-git-send-email-yamada.masahiro@socionext.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190312_020305_270203_BCE5C408 
X-CRM114-Status: GOOD (  13.41  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, 12 Mar 2019 17:44:45 +0900
Masahiro Yamada <yamada.masahiro@socionext.com> wrote:


> +
> +static int denali_exec_instr(struct nand_chip *chip,
> +			     const struct nand_op_instr *instr)
> +{
> +	struct denali_nand_info *denali = to_denali(chip);
> +	bool width16 = chip->options & NAND_BUSWIDTH_16;
> +
> +	switch (instr->type) {
> +	case NAND_OP_CMD_INSTR:
> +		denali_exec_out8(denali, DENALI_MAP11_CMD,
> +				 &instr->ctx.cmd.opcode, 1);
> +		return 0;
> +	case NAND_OP_ADDR_INSTR:
> +		denali_exec_out8(denali, DENALI_MAP11_ADDR,
> +				 instr->ctx.addr.addrs,
> +				 instr->ctx.addr.naddrs);
> +		return 0;
> +	case NAND_OP_DATA_IN_INSTR:
> +		(!instr->ctx.data.force_8bit && width16 ?
> +		 denali_exec_in16 :
> +		 denali_exec_in8)(denali, DENALI_MAP11_DATA,
> +				  instr->ctx.data.buf.in,
> +				  instr->ctx.data.len);

I agree with Miquel, this statement tends to obfuscate the code, and
it's not like an extra if will make a huge difference in term of LOC.
	

> +		return 0;
> +	case NAND_OP_DATA_OUT_INSTR:
> +		(!instr->ctx.data.force_8bit && width16 ?
> +		 denali_exec_out16 :
> +		 denali_exec_out8)(denali, DENALI_MAP11_DATA,
> +				   instr->ctx.data.buf.out,
> +				   instr->ctx.data.len);

Ditto.

> +		return 0;
> +	case NAND_OP_WAITRDY_INSTR:
> +		return denali_exec_waitrdy(denali);
> +	default:
> +		WARN_ONCE(1, "unsupported NAND instruction type: %d\n",
> +			  instr->type);
> +
> +		return -EINVAL;
> +	}
> +}

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
