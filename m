Return-Path: <SRS0=bx7I=26=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A999C282DD
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jan 2020 19:29:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C2A920721
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jan 2020 19:29:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UKl+tbnB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1C2A920721
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z7Yk03IkccB3W53e3y1jDqsozCep/RrPC3vY5oBJes8=; b=UKl+tbnBvgJClj
	lMavkUE9PFF8xGOjw6ohhuZo0RVT+CFJlAEJ9A/2w7nBS0R2xe4rZQkvXSQFf6PDVAZttbux/e15x
	oUe2konKBrrD9kqbiBZ1dUq/O+UmNP9wceNygx4Y1G/z6yPEMYO3JRZ3SbKkzLhCFR17PjvUCfhXI
	pfR6xkxyCYxF+GioBqMajJE4jcmx6qrTnX+qAS/jYL0Eg21YmnuEefqd/pOBiRCMrd/mCTedAmCL7
	DqV2LFBMI3PkYZEfFvz9oWNkihgokJA3wk2Kn5OhWnUDAJRLOTIAOqLHLVA6l5owUqnfPLS0t03I2
	73ABreDSoyvkkPnuD1bQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ipdUn-00086W-Lq; Thu, 09 Jan 2020 19:29:29 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ipdUk-00085Z-Ud
 for linux-mtd@lists.infradead.org; Thu, 09 Jan 2020 19:29:28 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 8E24D29389F;
 Thu,  9 Jan 2020 19:29:25 +0000 (GMT)
Date: Thu, 9 Jan 2020 20:29:22 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Chuanhong Guo <gch981213@gmail.com>
Subject: Re: [PATCH] mtd: nand: spi: rework detect procedure for different
 read id op
Message-ID: <20200109202922.744a6739@collabora.com>
In-Reply-To: <20200109075551.357179-1-gch981213@gmail.com>
References: <20200109075551.357179-1-gch981213@gmail.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200109_112927_120685_9950E539 
X-CRM114-Status: UNSURE (   9.62  )
X-CRM114-Notice: Please train this message.
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu,  9 Jan 2020 15:54:00 +0800
Chuanhong Guo <gch981213@gmail.com> wrote:

> @@ -215,15 +204,22 @@ struct spinand_manufacturer_ops {
>   * struct spinand_manufacturer - SPI NAND manufacturer instance
>   * @id: manufacturer ID
>   * @name: manufacturer name
> + * @devid_len: number of bytes in device ID
> + * @spinand_table: array with info for spi nands under current manufacturer
> + * @nchips: number of chips available in spinand_table
>   * @ops: manufacturer operations
>   */
>  struct spinand_manufacturer {
>  	u8 id;
>  	char *name;
> +	u8 devid_len;

IIRC, some manufacturers support more than one scheme which means you
can't really take this decision at the manufacturer level. How about
adding a readid_method field to spinand_info?

enum spinand_readid_method {
	SPINAND_READID_METHOD_OPCODE,
	SPINAND_READID_METHOD_OPCODE_ADDR,
	SPINAND_READID_METHOD_OPCODE_DUMMY,
};

> +	const struct spinand_info *spinand_table;

s/spinand_table/chips/

> +	size_t nchips;
>  	const struct spinand_manufacturer_ops *ops;
>  };


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
