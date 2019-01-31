Return-Path: <SRS0=cI5g=QH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CFF5C169C4
	for <linux-mtd@archiver.kernel.org>; Thu, 31 Jan 2019 12:02:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CADC9218D3
	for <linux-mtd@archiver.kernel.org>; Thu, 31 Jan 2019 12:02:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZFJmTFIv";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="FOsADNr6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CADC9218D3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hizrqhTkySAgjgC4IMK/mzCbY70wO7BjIiC142jVZjE=; b=ZFJmTFIvOY0PyO
	A7u8YURj3FlqwqZNOp0mU86nYx14mg4lG+wSjIeCCKFlfrS/r0xDSLP1Vc1LzRQOTFIyIDBglDunv
	htfV/be7uZoLVoNsNi9xsmaJBIPTNOLhqyFNJ6BMmjr4iWe6UcEOw0kgsIqx5kdVwq55pxxo7aemj
	zjZcXcf7r+Ljfo3GNaYx9u5crCbf24LOc5IV+eCcz0QXQqLkMzmtNELITb1uDLzUek/BrCyt41qiB
	muYpzOg0HflOKSQRLmoflaX08q9tIQwCU6NbmtCXSkOcq+gzDe6iTOhArmDcHW1JJBwLIB0SKnW53
	muw4wmzYofWOPydoFh2Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gpB2s-00016t-3J; Thu, 31 Jan 2019 12:02:14 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gpB2f-0000xQ-GR; Thu, 31 Jan 2019 12:02:03 +0000
Received: from bbrezillon (91-160-177-164.subs.proxad.net [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 201E5218D3;
 Thu, 31 Jan 2019 12:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1548936120;
 bh=v5FmM8JMbGh8lLfo05d49HXT0Cuq7wm2UMkiebkM2nY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=FOsADNr6TrMlOSRO3YV0Heb0SOnP/CszRRKPRbnhhiVRUWq5kJIku8UMIW+cxbW1D
 VlNh2HWmTpyuNLAnFZAcfXdIRxavzOmIbRyGTxmn8cEL8cpG5Zc6TKHhKBnVVxIQo8
 9au9Q6uYnHrmAxG0uKtHhhYdCAgqUMMXlxQ3jkGM=
Date: Thu, 31 Jan 2019 13:01:50 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: <Tudor.Ambarus@microchip.com>
Subject: Re: [PATCH 9/9] spi: atmel-quadspi: add support for sam9x60 qspi
 controller
Message-ID: <20190131130137.52b592f8@bbrezillon>
In-Reply-To: <20190130150818.24902-10-tudor.ambarus@microchip.com>
References: <20190130150818.24902-1-tudor.ambarus@microchip.com>
 <20190130150818.24902-10-tudor.ambarus@microchip.com>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190131_040201_576935_DEE724A2 
X-CRM114-Status: GOOD (  11.01  )
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
Cc: alexandre.belloni@bootlin.com, Nicolas.Ferre@microchip.com,
 linux-kernel@vger.kernel.org, Ludovic.Desroches@microchip.com,
 broonie@kernel.org, linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, 30 Jan 2019 15:08:47 +0000
<Tudor.Ambarus@microchip.com> wrote:

> +/*
> + * atmel_qspi_set_address_mode() - set address mode.
> + * @cfg:	contains register values
> + * @op:		describes a SPI memory operation
> + *
> + * The controller allows 24 and 32-bit addressing while NAND-flash requires
> + * 16-bit long. Handling 8-bit long addresses is done using the option field.
> + * For the 16-bit addresses, the workaround depends of the number of requested
> + * dummy bits. If there are 8 or more dummy cycles, the address is shifted and
> + * sent with the first dummy byte. Otherwise opcode is disabled and the first
> + * byte of the address contains the command opcode (works only if the opcode and
> + * address use the same buswidth). The limitation is when the 16-bit address is
> + * used without enough dummy cycles and the opcode is using a different buswidth
> + * than the address.

Too bad they didn't patch the IP to support 1 to 4 address bytes
instead of only 3 or 4 :-(.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
