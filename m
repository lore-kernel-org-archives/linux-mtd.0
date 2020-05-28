Return-Path: <SRS0=EQmy=7K=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52EFDC433E0
	for <linux-mtd@archiver.kernel.org>; Thu, 28 May 2020 08:26:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1CCB9208DB
	for <linux-mtd@archiver.kernel.org>; Thu, 28 May 2020 08:26:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dXZgZIzH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1CCB9208DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ap2ARDMH6PJ4PMrg3WXC9tvTeQusy17OvW7mmjU3Mpo=; b=dXZgZIzHJJEgBg
	2cqdf/d4hNWmHHtk8k1u7PFZfEcGzdeCXMO77atAOpwcxkkl0kDup4zgfSI/aKgwUWymIRSCfBXgM
	NKJhgFeOlxfN0jfETcMFoVX0k7PaeXHBANjDtZLlWy54YDJ/qH1AtlwC9SVJD3YloUtbM9DamEbBK
	yVoOVoGOKqzWeyEiL5Bue1btJAwYEcIcAT4skOsLjEEz+jZPUx1LlvsxEgVDgGQ/gWvODE79ZbfJ6
	xZqykANE4FECEziabEPud2l7egOudBZ8wLp66KzMkMdW0GHEKDF+mqhqFfHiPfB4f/Wz9SrsW9Jsk
	9Zk9dCBRY7Kw7SrD30dg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jeDru-0000GM-6d; Thu, 28 May 2020 08:26:26 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jeDrj-0008Tx-Mj
 for linux-mtd@lists.infradead.org; Thu, 28 May 2020 08:26:17 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 3A37B2A3D3D;
 Thu, 28 May 2020 09:26:12 +0100 (BST)
Date: Thu, 28 May 2020 10:26:09 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Mason Yang <masonccyang@mxic.com.tw>
Subject: Re: [PATCH v3 00/14] mtd: spi-nor: add xSPI Octal DTR support
Message-ID: <20200528102609.0dbb59a5@collabora.com>
In-Reply-To: <1590652696-8844-1-git-send-email-masonccyang@mxic.com.tw>
References: <1590652696-8844-1-git-send-email-masonccyang@mxic.com.tw>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200528_012615_892403_B096E0D2 
X-CRM114-Status: GOOD (  18.60  )
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
Cc: vigneshr@ti.com, tudor.ambarus@microchip.com, juliensu@mxic.com.tw,
 richard@nod.at, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 broonie@kernel.org, linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 matthias.bgg@gmail.com, p.yadav@ti.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, 28 May 2020 15:58:02 +0800
Mason Yang <masonccyang@mxic.com.tw> wrote:

> Hello,
> 
> JESD216C has defined specification for Octal 8S-8S-8S and 8D-8D-8D.
> Based on JEDEC216C Basic Flash Parameter Table (BFPT) driver extract
> DWORD-18: command and command extension type.
> DWORD-20: Maximum operation speed of device in Octal mode.
> 
> xSPI profile 1.0 table:
> DWORD-1: Read Fast command, the number of dummy cycles and address nbytes
> 	 for Read Status Register command.
> DWORD-2: Read/Write volatile Register command for CFG Reg2.
> DWORD-4 and DWORD-5: dummy cycles used for various frequencies based on
> maximum speed of device from BFPT 20th DWORD.
> 
> Ccommand sequences to change to octal DTR mode:
> The length of each command sequence is 8 per byte for single SPI mode and
> patching driver to parse and execute these sequences for octal DTR mode.
> 
> By Vignesh's comments to patch these drivers based on Pratyush's patches
> set [1].
> 
> This series adds support for Macronix mx25uw51245g works in octal DTR mode.
> 
> Tested on Macronix's Zynq PicoZed board with Macronix's SPI controller
> (spi-mxic.c) driver patched on mx25uw51245g Octal flash.
> 
> 
> [1] https://patchwork.ozlabs.org/project/linux-mtd/cover/20200525091544.17270-1-p.yadav@ti.com/
> 
> 
> Summary of change log
> v3:
> Add support command sequences to change octal DTR mode and based on
> part of Pratyush's patches set.
> 
> v2: 
> Parse BFPT & xSPI table for Octal 8D-8D-8D mode parameters and enable Octal
> mode in spi_nor_late_init_params().
> Using Macros in spi_nor_spimem_read_data, spi_nor_spimem_write_data and
> so on by Vignesh comments.
> 
> v1:
> Without parsing BFPT & xSPI profile 1.0 table and enter Octal 8D-8D-8D
> mode directly in spi_nor_fixups hooks.
> 
> 
> thnaks for your time and review.
> best regards,
> Mason
> 
> --
> Mason Yang (7):
>   mtd: spi-nor: sfdp: get octal mode maximum speed from BFPT
>   mtd: spi-nor: sfdp: parse xSPI Profile 1.0 table
>   mtd: spi-nor: sfdp: parse command sequences to change octal DTR mode
>   mtd: spi-nor: core: add configuration register 2 read & write support
>   spi: mxic: patch for octal DTR mode support
>   mtd: spi-nor: core: execute command sequences to change octal DTR mode
>   mtd: spi-nor: macronix: Add Octal 8D-8D-8D supports for Macronix
>     mx25uw51245g
> 
> Pratyush Yadav (7):
>   spi: spi-mem: allow specifying whether an op is DTR or not
>   spi: spi-mem: allow specifying a command's extension
>   mtd: spi-nor: add support for DTR protocol
>   mtd: spi-nor: sfdp: prepare BFPT parsing for JESD216 rev D
>   mtd: spi-nor: sfdp: get command opcode extension type from BFPT
>   mtd: spi-nor: core: use dummy cycle and address width info from SFDP
>   mtd: spi-nor: core: enable octal DTR mode when possible

Why are you doing that?! This series is being actively worked on by
Pratyush, and all you gain by sending it on your own is more
confusion. If you have patches on top of a series that's not been
merged yet, mention the dependency in the cover letter, but don't
resend patches that have already been sent and are being reviewed.

I think it's time you spend a bit of time learning about the submission
process, because that's not the first mistake you do, and I'm pretty
sure I already mentioned that in my previous reviews.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
