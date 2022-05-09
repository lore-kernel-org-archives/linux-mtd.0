Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B7C2C433EF
	for <linux-mtd@archiver.kernel.org>; Mon,  9 May 2022 07:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ODdt83UTs9zEiXNjzXjxJYeJgQ/tfX/V89baHYFeMw4=; b=rm8NZQ88O6F44EA3qCCFxV+uiF
	wvH9+JP2bHD+7lISZhKn2Pu5vSRsWi6D1paZt8ERLLjnCeRSml7iwd+EhO+dVUULfFHauJhgAagI3
	QQMEQpiNXmfV0wwDAYNftFl6IuQjUpFNrpw1bE33BuZV17mEGUZtboC2/tcCcsoAf1rBONWp1K9vs
	ujngqc25I3Lm3DR6R+keBXee3Oi7mJh6W3MNKGpojqT/FC9ZBkpNz/AU9h8/u/XVbBAZhgvCJ8Mls
	Q9heqdLjTFdMZxYGzTZpVAOpDOVP5eHIClD3wTiqUvoRGj5Egxnei9yrMgI9NSAcQoKP5/GvKiRy3
	hbK+y7ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nnxZK-00Cne8-5N; Mon, 09 May 2022 07:12:34 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nnxZG-00CndL-Lk
 for linux-mtd@lists.infradead.org; Mon, 09 May 2022 07:12:32 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 9E25722239;
 Mon,  9 May 2022 09:12:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1652080342;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XafJzL0P+cvyza/G/OmHQfkLbNsQg1YLUDi2wyhJZyU=;
 b=Bi/EEMNFJas3a7tBSkiEAnNWw8rzCcCMbXInhdU6kgvY2mFo9lGuqg30WUiFkCjfdTxfgA
 De4u4PppUXNtDzuBoSQc5KyM2jNUveOXGcIL/R4mlVIllaGwBV4+5ZzyQj2ofMwlznCoxO
 BDJKGDcNo454jeM7ZNvUVzQdFzZKEhU=
MIME-Version: 1.0
Date: Mon, 09 May 2022 09:12:17 +0200
From: Michael Walle <michael@walle.cc>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>, Pratyush Yadav
 <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: spi-nor: micron-st: Skip FSR reading if SPI
 controller does not support it
In-Reply-To: <20220506105158.43613-1-mika.westerberg@linux.intel.com>
References: <20220506105158.43613-1-mika.westerberg@linux.intel.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <ad148cd90c1abd391f9014471a555307@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220509_001231_413028_97E8BA3E 
X-CRM114-Status: UNSURE (   9.95  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Am 2022-05-06 12:51, schrieb Mika Westerberg:
> The Intel SPI controller does not support low level operations, like
> reading the flag status register (FSR). It only exposes a set of high
> level operations for software to use. For this reason check the return
> value of micron_st_nor_read_fsr() and if the operation was not
> supported, use the status register value only. This allows the chip to
> work even when attached to Intel SPI controller (there are such systems
> out there).
> 
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Reviewed-by: Michael Walle <michael@walle.cc>

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
