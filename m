Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBD0410F3DCD
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Mar 2026 14:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QcXdRXAUvgnt4lYGEL/KViYgv5crl1EDty/BOyUs4Eg=; b=vJWlcQARIbgoJJ
	VFPcSXeI8AlrXiyETmbjCQ8XHNaVe1bjSIBWf8a2x+3zqEIadhujVfKBtE6/7jTx7EzRxigbxBE1/
	eVKLFUk2IaFHFHbVi5X7y4bFn7mX2K//oYhEJSQCyggak24Bmp4wkFw/NSTA1sbRZq6mFl1M0gf/J
	p1U7PLxoTcBbnZl8vfggQgtQKv7wX+40i7noArjp/EzVBPEy+ShJmR6xjUhhjaw9P7m5EnHbShzK5
	F7xgIdl7jhV4YNOqK3EUPNTmzOTBZpmFPVQ2JR1yy3xAGls/hXuvHO8rUm0Bo9pst8Kg6ls4sJ8KT
	0yL7NOZftFX3EAeQ8bRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7DWc-0000000BPli-2dr3;
	Mon, 30 Mar 2026 14:23:30 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7DWc-0000000BPla-02jG
	for linux-mtd@lists.infradead.org;
	Mon, 30 Mar 2026 14:23:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 66A5260054;
	Mon, 30 Mar 2026 14:23:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAF42C4CEF7;
	Mon, 30 Mar 2026 14:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774880609;
	bh=e0hg5eoopMhTtmpcjcSal5SyT8XCUR+mbUqFsFXPDKI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=FrzkimvWMG+nbVM5UKZb8g2tqwoHEWNuBqtaU1Ez05sztLuk4jBmqLk2SrgOdMVF7
	 0ZBNil9YLv6aaSdfMYRhuAn80iO/4c6Qlf51GLOM8jpNpufcS7+9DAIKdFYyeExIIb
	 LaiWclnLZjomd7StJ8369lyc9AJxTpIlnxMzoEKIpKhm8dqew1uPctyWVIiCB0Pcel
	 +oFJs2MRQlJo5FlSeOCCn6MUyF3wW5ntzPQz1m8Bsn0lILROxGb5KRc8vWwvZ13zuB
	 YviYP/boG8rjOg1MW2uyNEQC4KsCrT20XOlEFBfQx590iW0mMN3cQyswoqFVYeBePj
	 vn4ukvlL9t7sA==
From: Pratyush Yadav <pratyush@kernel.org>
To: Sanjaikumar V S <sanjaikumarvs@gmail.com>
Cc: mwalle@kernel.org,  linux-kernel@vger.kernel.org,
  linux-mtd@lists.infradead.org,  miquel.raynal@bootlin.com,
  pratyush@kernel.org,  richard@nod.at,  sanjaikumar.vs@dicortech.com,
  stable@vger.kernel.org,  tudor.ambarus@linaro.org,  vigneshr@ti.com
Subject: Re: [PATCH v4 2/2] mtd: spi-nor: core: Fix AAI mode when dirmap is
 not available
In-Reply-To: <20260311103057.29-3-sanjaikumarvs@gmail.com> (Sanjaikumar V.
	S.'s message of "Wed, 11 Mar 2026 10:30:57 +0000")
References: <20260311103057.29-1-sanjaikumarvs@gmail.com>
	<20260311103057.29-3-sanjaikumarvs@gmail.com>
Date: Mon, 30 Mar 2026 14:23:25 +0000
Message-ID: <2vxz1ph11jmq.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Mar 11 2026, Sanjaikumar V S wrote:

> From: Sanjaikumar V S <sanjaikumar.vs@dicortech.com>
>
> When the SPI controller lacks direct mapping support, the fallback path
> in spi_nor_spimem_write_data() uses nor->write_proto based operation
> template. However, this template uses the standard page program opcode
> set during probe, not the AAI opcode required for SST flash.

But if the controller does support direct mapping, won't it end up using
the wrong opcode? Would it be a better idea to update the dirmap_info
with the right opcodes?

>
> Add check for nodirmap flag to ensure the code falls through to
> spi_nor_spimem_exec_op() path which builds the operation at runtime
> with the correct program_opcode set by sst_nor_write_data().
>
> Fixes: df5c21002cf4 ("mtd: spi-nor: use spi-mem dirmap API")
> Cc: stable@vger.kernel.org
> Signed-off-by: Sanjaikumar V S <sanjaikumar.vs@dicortech.com>
> ---
>  drivers/mtd/spi-nor/core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 8ffeb41c3e08..cb7f4d447156 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -281,7 +281,7 @@ static ssize_t spi_nor_spimem_write_data(struct spi_nor *nor, loff_t to,
>  	if (spi_nor_spimem_bounce(nor, &op))
>  		memcpy(nor->bouncebuf, buf, op.data.nbytes);
>  
> -	if (nor->dirmap.wdesc) {
> +	if (nor->dirmap.wdesc && !nor->dirmap.wdesc->nodirmap) {
>  		nbytes = spi_mem_dirmap_write(nor->dirmap.wdesc, op.addr.val,
>  					      op.data.nbytes, op.data.buf.out);
>  	} else {

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
