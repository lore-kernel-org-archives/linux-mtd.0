Return-Path: <SRS0=sS6D=56=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EDF3C2BA19
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Apr 2020 07:21:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6CC6E206E9
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Apr 2020 07:21:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mVB+RFpt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6CC6E206E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uqaiLKjPVrd/ncvJ1/s0P7Wb1u6gIrKUhJqdiuOBVsA=; b=mVB+RFptw+WQb1
	2+bmNjByHFUdXp/2TvCv9ooPzzaVTioQKNTVMnxOIFVYfzRNXgALm2Q6mP8gxpzZd7bgSN6z/OCaw
	nW/aMs6esD856Evx0hV/KhvhiP044+uY4UoQDWYB8ZYa2JDpbj1PmNl7RsdHwu9En4mwOl4tezaWC
	2HbFOhsdzyPDLEtObpNbLoMiMhJ7OE0obCAAgb2XPkIUrOPvaP02H0uSOQsGXKtEjRwYaSqmRxvx+
	QmEd3d6DVHvgz2z+xDSqif+xbJbGI3A/9rhfwkiXezs03NwlbCbzqucMNxznqC2z9M4sxhPzy3Pyx
	Ne/nZRr3mg4Bz7vlAAyQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jOFt8-0001ic-3P; Tue, 14 Apr 2020 07:21:42 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jOFt4-0001iA-QW
 for linux-mtd@lists.infradead.org; Tue, 14 Apr 2020 07:21:40 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 147262A14A0;
 Tue, 14 Apr 2020 08:21:37 +0100 (BST)
Date: Tue, 14 Apr 2020 09:21:32 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: "Ramuthevar,Vadivel MuruganX" <vadivel.muruganx.ramuthevar@linux.intel.com>
Subject: Re: [PATCH v1 2/2] mtd: rawnand: Add NAND controller support on
 Intel LGM SoC
Message-ID: <20200414092132.525053f1@collabora.com>
In-Reply-To: <20200414022433.36622-3-vadivel.muruganx.ramuthevar@linux.intel.com>
References: <20200414022433.36622-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200414022433.36622-3-vadivel.muruganx.ramuthevar@linux.intel.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200414_002138_984295_FE303574 
X-CRM114-Status: UNSURE (   8.25  )
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
Cc: cheol.yong.kim@intel.com, devicetree@vger.kernel.org,
 andriy.shevchenko@intel.com, anders.roxell@linaro.org, vigneshr@ti.com,
 arnd@arndb.de, richard@nod.at, qi-ming.wu@intel.com, brendanhiggins@google.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com, tglx@linutronix.de,
 masonccyang@mxic.com.tw, piotrs@cadence.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello Ramuthevar,

On Tue, 14 Apr 2020 10:24:33 +0800
"Ramuthevar,Vadivel MuruganX"
<vadivel.muruganx.ramuthevar@linux.intel.com> wrote:

> +	lgm_host->chip.legacy.read_byte = lgm_read_byte;
> +	lgm_host->chip.legacy.read_buf = lgm_read_buf;
> +	lgm_host->chip.legacy.write_buf = lgm_write_buf;
> +	lgm_host->chip.legacy.select_chip = lgm_select_chip;
> +	lgm_host->chip.legacy.dev_ready = lgm_dev_ready;
> +	lgm_host->chip.legacy.cmd_ctrl = lgm_cmd_ctrl;
> +	lgm_host->chip.legacy.chip_delay = 30;
> +	lgm_host->chip.legacy.dummy_controller.ops = &lgm_nand_controller_ops;
> +

Seriously, what's not clear in [1]? Okay, let's say you overlooked this
comment, isn't the name of the field explicit enough? We received a
few other drivers implementing the legacy interface in the last few
months so maybe there's something to improve on our end (update the
doc, move legacy drivers to a legacy sub-dir?).

Back to more constructive comment now: please implement ->exec_op() to
replace those legacy hooks.

Regards,

Boris

[1]https://elixir.bootlin.com/linux/v5.7-rc1/source/include/linux/mtd/rawnand.h#L987

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
