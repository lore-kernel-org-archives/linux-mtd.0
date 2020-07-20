Return-Path: <SRS0=lrxf=A7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBCE4C433E7
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Jul 2020 11:53:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9AB022070A
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Jul 2020 11:53:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tbTvVdxx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9AB022070A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kawvA9FpkEnkYosSzKBTx8qC5e5RC9aIumxFdu86c6E=; b=tbTvVdxxoS0PX03n7XJ8bMVVL
	P2jLwXt0LVXaX6Koz6J/525vHUuEw8qzk2kCAlHigojTdjKmo4B3+6NBFzdxHb6wscbkccWvScgL6
	aHAKjQW7wb56I2X9DyMEgKeGZ4qiGLRqBwxb05DTMCEBUeUrc+pl2f7dSU8KhjTyxCjnR8kbsKGdd
	a8uXAYkdf/x77TcUUGVyIyezW6ukjimM1Rj4Wj71U0XlbVJb5r45zLALjuwNAe88EY/Wt5a79h61a
	szKNO1hRMNyGnXDJADbHPvoc1cZUErzH7IkwnISJK/Cc6z/2I7fuulTKStJyfft93r6VP9clfAbgo
	SUNPVxdWw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxULu-0004i3-MU; Mon, 20 Jul 2020 11:53:02 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxULs-0004hi-LL
 for linux-mtd@lists.infradead.org; Mon, 20 Jul 2020 11:53:01 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 54C3028FD56;
 Mon, 20 Jul 2020 12:52:58 +0100 (BST)
Date: Mon, 20 Jul 2020 13:52:54 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: Re: [PATCH v4 5/6] mtd: rawnand: atmel: Convert the driver to
 exec_op()
Message-ID: <20200720135254.7475dc96@collabora.com>
In-Reply-To: <20200720042759.1482341-6-tudor.ambarus@microchip.com>
References: <20200720042759.1482341-1-tudor.ambarus@microchip.com>
 <20200720042759.1482341-6-tudor.ambarus@microchip.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200720_075300_809600_3F169BEF 
X-CRM114-Status: GOOD (  12.53  )
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
Cc: alexandre.belloni@bootlin.com, ludovic.desroches@microchip.com,
 linux-mtd@lists.infradead.org, nicolas.ferre@microchip.com,
 miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, 20 Jul 2020 07:27:58 +0300
Tudor Ambarus <tudor.ambarus@microchip.com> wrote:

> +static int atmel_smc_nand_exec_op(struct atmel_nand *nand,
> +				  const struct nand_operation *op,
> +				  bool check_only)
> +{
> +	struct atmel_nand_controller *nc;
> +	unsigned int i;
> +	int ret = 0;
> +
> +	if (check_only)
> +		return 0;
> +
> +	nc = to_nand_controller(nand->base.controller);

0day bots complained about this unused var when I submitted v3.

> +	atmel_nand_select_target(nand, op->cs);
> +	gpiod_set_value(nand->activecs->csgpio, 0);
> +	for (i = 0; i < op->ninstrs; i++) {
> +		ret = atmel_smc_nand_exec_instr(nand, &op->instrs[i]);
> +		if (ret)
> +			break;
> +	}
> +	gpiod_set_value(nand->activecs->csgpio, 1);
> +
> +	return ret;
> +}

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
