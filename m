Return-Path: <SRS0=UGcd=OV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BDF9C433F5
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Oct 2021 17:21:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 299ED60F57
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Oct 2021 17:21:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 299ED60F57
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V9V6SrNL7fdYYQuiOvvcKGymkGKLU5mr5AhovGNnD0A=; b=RaGdaqaXZE353I
	febJGMMUvOBUtKJgIomn6p7oRUwwZvvxsAd1EYCMoFNhSPzZj/qS4hwscO42JjfDJ86kg4eEUYyr7
	gRFipHyBIhnvc7ZfQCk9XW5JkLvg4zUw9r+jGy7r0AQS01hOG+ZnMEgCBpXu43IWcsYIFe8x36daD
	3uow+9PiFkzVa595qOeeigDnH78nuRmksd/bju4xqPgEEY3MuCGH47nMK5JoPxxR6I35ckGStmwAC
	mFpVHh/Vxfy4Zi7uCG7xmuJ4zV6cH49KFRrk39ET3LFNbRC+sZBCf4z/1m9OFl5AkMPXPeO/eWMii
	j6CnJY1GfzptY/7U7isw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mWMDq-001078-DV; Fri, 01 Oct 2021 17:21:22 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mWMDl-00104N-NX
 for linux-mtd@lists.infradead.org; Fri, 01 Oct 2021 17:21:21 +0000
Received: from [IPv6:::1] (unknown
 [IPv6:2a02:810c:c240:2017:3906:69b3:d142:6568])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 6977522234;
 Fri,  1 Oct 2021 19:21:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1633108870;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uT4IrMsFOFQcqRXXi3oqr7oTQ371TNfLR3LPEAjuufA=;
 b=QUvHiYQGy6zKy1u/CsjnMQYpK8SWtxe79VSYO2yQEC/kmULU3OoKlYSTtx1+Fe9MpX2j1h
 UYVd6sPEQ4FNMgv5b4bU+aINqg0OJ97v066RTgJWYKsBB8G68b6SGCqKOQnak7qq1QL4zl
 eHfS62zqqyD7O5pqlB28IWKhvlHy0hE=
Date: Fri, 01 Oct 2021 19:21:08 +0200
From: Michael Walle <michael@walle.cc>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
CC: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v1_1/1=5D_mtd=3A_spi-nor=3A_intel-spi=3A_Ad?=
 =?US-ASCII?Q?d_support_for_Intel_Ice_Lake-N_SPI_serial_flash?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20211001171530.15283-1-andriy.shevchenko@linux.intel.com>
References: <20211001171530.15283-1-andriy.shevchenko@linux.intel.com>
Message-ID: <0D47CDDE-0F9E-4D5D-8524-1D911BF52CEF@walle.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211001_102118_814346_743FF743 
X-CRM114-Status: UNSURE (   5.54  )
X-CRM114-Notice: Please train this message.
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

Am 1. Oktober 2021 19:15:30 MESZ schrieb Andy Shevchenko <andriy.shevchenko@linux.intel.com>:
>Intel Ice Lake-N has the same SPI serial flash controller as Ice Lake-LP.
>Add Ice Lake-N PCI ID to the driver list of supported devices.
>
>The device can be found on MacBookPro16,2 [1].
>
>[1]: https://linux-hardware.org/?probe=f1c5cf0c43
>
>Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Hi Andy, 

there is currently a rewrite of this driver (to use spi-mem)
in progress:

https://lore.kernel.org/linux-mtd/20210930100719.2176-1-mika.westerberg@linux.intel.com/

Could you try that series with your hardware? 

-michael 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
