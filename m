Return-Path: <SRS0=oU9n=QV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29050C43381
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Feb 2019 13:00:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EBA09222D4
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Feb 2019 13:00:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qrOfalo1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EBA09222D4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nMYapwww1qWixieOBc90PjfuHHZX4CMJVMVhZrB458w=; b=qrOfalo1rWcwJ3
	E2v08Xntx4kLevlavbp8gflRsDWHt8GrjwCaWI+/95vS2C35hEyoVsagrSPEZDtzqzcUGsgAsbTnJ
	ISfnt8xm35sBPVg68vH/qdj9hCZz0tCLKamyeLV0r9Zx0FsxEt8LIXrA/reRJhBkeBiTNv2aA7UYN
	0HF8rL0GVvUMo+4RZPHTslCJfq0ptNWMUQ/Vx9447AIYQWmNNTdbWOI3F3wh6Bk0ZdReQvd+WaGnp
	WbAu8pWekaZ6cV/UJ+tVMtBRMsahtkun2hWc1r8uSWIGjzr6k9tZdAeP5Deq/lZj371ikjtSbSJnU
	XrvwUUOE2MlbZyVABCAA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1guGcm-0006TB-LN; Thu, 14 Feb 2019 13:00:20 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1guGcd-0005qC-8V
 for linux-mtd@lists.infradead.org; Thu, 14 Feb 2019 13:00:18 +0000
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id E754727D7F6;
 Thu, 14 Feb 2019 13:00:07 +0000 (GMT)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Vignesh R <vigneshr@ti.com>, Boris Brezillon <bbrezillon@kernel.org>,
 Tudor.Ambarus@microchip.com
Subject: Re: [v6, 2/2] mtd: spi-nor: cadence-quadspi: Add support for Octal SPI
 controller
Date: Thu, 14 Feb 2019 14:00:03 +0100
Message-Id: <20190214130003.29783-1-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190212083809.6534-3-vigneshr@ti.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: 2cc788387497d1bee981f7bee3b82b6c5b2a79a3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190214_050012_777766_C6F0FBDA 
X-CRM114-Status: UNSURE (   7.85  )
X-CRM114-Notice: Please train this message.
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
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Marek Vasut <marek.vasut@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Boris Brezillon <bbrezillon@kernel.org>

On Tue, 2019-02-12 at 08:38:09 UTC, Vignesh R wrote:
> Cadence OSPI controller IP supports Octal IO (x8 IO lines),
> It also has an integrated PHY. IP register layout is very
> similar to existing QSPI IP except for additional bits to support Octal
> and Octal DDR mode. Therefore, extend current driver to support Octal
> mode. Only Octal SDR read (1-1-8)mode is supported for now.
> 
> Tested with mt35xu512aba Octal flash on TI's AM654 EVM.
> 
> Signed-off-by: Vignesh R <vigneshr@ti.com>
> Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>

Applied to http://git.infradead.org/linux-mtd.git spi-nor/next, thanks.

Boris

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
