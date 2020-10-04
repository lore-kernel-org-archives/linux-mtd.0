Return-Path: <SRS0=8K5C=DL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85DFEC4363C
	for <linux-mtd@archiver.kernel.org>; Sun,  4 Oct 2020 04:02:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 226C5206DB
	for <linux-mtd@archiver.kernel.org>; Sun,  4 Oct 2020 04:02:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tYi0xVET"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 226C5206DB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M4ZKCJRVWcKJs9duyR8IxRTaILsNCb095zBnHCo+tSk=; b=tYi0xVETVf+7ZfQL85pblW0JGt
	QY66wUkwvjKSN4folCy/mKXkY69qM7b5m0eMdVzDfGzbyzT6zARIFwZXkAK5loM7GhL1XLZ7Kb8VW
	UfJnOMr+0QRmoPzF//xabaBA6qeB87u8daTXcZlhHAANdVzsZv8vQii+JuxO1eDz+Cjk1AWi1r9nZ
	TM33TeYM8sdjwFu7GB8Z9j8yRWqZPcxLSYxRtyMklYHoljMsihMwlhfX6fExFasT+HNNKRtEFrJaj
	okatxe8iqGV99RW+WiUlv+CmE09QA3XEs6mSDkR/Z+H37FDuMhkX1f9OJQlarC2vw4LsjWHYomhST
	5Paajurw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kOvDM-0004wW-PL; Sun, 04 Oct 2020 04:01:36 +0000
Received: from [2601:1c0:6280:3f0::2c9a]
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kOvDJ-0004vu-1m; Sun, 04 Oct 2020 04:01:33 +0000
Subject: Re: [PATCH 2/2] Platform integrity information in sysfs (version 9)
To: Daniel Gutson <daniel.gutson@eclypsium.com>,
 Derek Kiernan <derek.kiernan@xilinx.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-kernel@vger.kernel.org, Richard Hughes <hughsient@gmail.com>,
 Alex Bazhaniuk <alex@eclypsium.com>, linux-mtd@lists.infradead.org
References: <20200930163714.12879-1-daniel.gutson@eclypsium.com>
 <20200930163714.12879-3-daniel.gutson@eclypsium.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <82bb95bd-988f-3cc2-40f7-8ebfd20b09d9@infradead.org>
Date: Sat, 3 Oct 2020 21:01:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200930163714.12879-3-daniel.gutson@eclypsium.com>
Content-Language: en-US
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 9/30/20 9:37 AM, Daniel Gutson wrote:
> diff --git a/drivers/mtd/spi-nor/controllers/Kconfig b/drivers/mtd/spi-nor/controllers/Kconfig
> index 5c0e0ec2e6d1..e7eaef506fc2 100644
> --- a/drivers/mtd/spi-nor/controllers/Kconfig
> +++ b/drivers/mtd/spi-nor/controllers/Kconfig
> @@ -29,6 +29,7 @@ config SPI_NXP_SPIFI
>  
>  config SPI_INTEL_SPI
>  	tristate
> +	depends on PLATFORM_INTEGRITY_DATA

So SPI_INTEL_SPI_PCI selects SPI_INTEL_SPI:

config SPI_INTEL_SPI_PCI
	tristate "Intel PCH/PCU SPI flash PCI driver (DANGEROUS)"
	depends on X86 && PCI
	select SPI_INTEL_SPI

without checking that PLATFORM_INTEGRITY_DATA is set/enabled.

"select" does not follow any kconfig dependency chains, so when
PLATFORM_INTEGRITY_DATA is not enabled, this should be causing
a kconfig warning, which is not OK.


-- 
~Randy


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
