Return-Path: <SRS0=Vrwx=JK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 838FBC433B4
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Apr 2021 12:29:27 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 17A2561278
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Apr 2021 12:29:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 17A2561278
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3oSCA4TIxavIH1I89i3UNXOpYDNxGBkc+wJfheOpIGE=; b=a+V6TZ4vsxnEdqngaoWSW00/L
	K+WYUXM4ZWE5XXd6XfU1oXBjglyjlSOT30M/bO8iVNqa/8IxFjXWHZ25HEHLzg8Oi0H78RTEtPAck
	ywAY8qEamamewzvV+U/QKs0gQZk1xw0esg13duxek+m6Bx5cRyjVhUES8BV8PUZF44exU0VzKGjrJ
	ZGTJlH4Ivm66zThNj3y2OvsPTeR5gCgKmQFw3oFtX/v/6zp+SZCTG7UB3w9f5P1mzksZDA/nDmiw0
	m/GqfmS6Xdm+2o+Zecn6xHYN7fw2FKnJzFOxjOT1EXMv8FOu9SC4QDOc4cE8RWjOcX8jrbXVGiVAF
	Pn+vEUAKg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWI9g-009EAM-Hq; Tue, 13 Apr 2021 12:28:32 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWI7w-009Diy-9S
 for linux-mtd@desiato.infradead.org; Tue, 13 Apr 2021 12:26:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Message-ID:References:In-Reply-To:
 Subject:Cc:To:From:Date:Content-Transfer-Encoding:Content-Type:MIME-Version:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=SWjqpxaDjBEgNZflrVYP73ahhMwX1Hw7GOz/1ERNy/U=; b=pW2jgiyEzDL95WtY4rCTNmT0lL
 9fZpSoOhL9NF6I5kiwafPHodTpoTITDLmeEmyzKSGOQNVDxBAFWg5BPyhZeU+44hd+YtjEeV1bCTI
 z3BcFy1a3Ur0A2CyGCmi99CqQgB+WZP21JjaHeJYpWaViDTAnyv6wqvWK50XXi1zcCqO3c+49URJ7
 xY5Fhj8wkCQtlKYEhgUx75jAltGxEOPeB4sPkop7BJhvb8e0lLKim02zr0mhsgXZPk94rwA6mRgGj
 DwAgCsb1MPjhh28G1R25TZdF/k1rMFT7YPAJVANsUPaymCokuSS+MdQnsTuadEFvzYYIuCUgDVJfz
 4I3j9NAw==;
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWI7s-0071F6-8T
 for linux-mtd@lists.infradead.org; Tue, 13 Apr 2021 12:26:43 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 507C322234;
 Tue, 13 Apr 2021 14:26:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1618316796;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SWjqpxaDjBEgNZflrVYP73ahhMwX1Hw7GOz/1ERNy/U=;
 b=gtUln0MEqe5mYsb0ajXauJ4K9EeO/Nn020Z8jGHw+gadnSzP9DaBTsdDui/Q82OiW8r5PF
 U6Xz+LOKcPdVVWQoewfuQp3tX9lIQuGUserWkvxV0qgfcQrXxRcRdwpO0G7pZETseNFyDo
 6vb5TsrwEDtPaR08p6rmJcw9yNraXNM=
MIME-Version: 1.0
Date: Tue, 13 Apr 2021 14:26:36 +0200
From: Michael Walle <michael@walle.cc>
To: Ikjoon Jang <ikjn@chromium.org>
Cc: linux-mtd@lists.infradead.org, Miquel Raynal
 <miquel.raynal@bootlin.com>, Pratyush Yadav <p.yadav@ti.com>, Richard
 Weinberger <richard@nod.at>, Tudor Ambarus <tudor.ambarus@microchip.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: spi-nor: macronix: Add block protection support to
 mx25u6435f
In-Reply-To: <20210413120210.3671536-1-ikjn@chromium.org>
References: <20210413120210.3671536-1-ikjn@chromium.org>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <51761f1db840c51bad17f5f275b4ce1a@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210413_052640_486136_18115FA3 
X-CRM114-Status: GOOD (  10.49  )
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

Hi Ikjoon,

Am 2021-04-13 14:02, schrieb Ikjoon Jang:
> This patch adds block protection support to Macronix mx25u6432f and
> mx25u6435f. Two different chips share the same JEDEC ID while only
> mx25u6423f support section protections. And two chips have slightly
> different definitions of BP bits than generic (ST Micro) 
> implementation.

What is different compared to the current implementation? Could you give
an example?

> So this patch defines a new spi_nor_locking_ops only for macronix
> until this could be merged into a generic swp implementation.

TBH, I don't really like the code duplication and I'd presume that it
won't ever be merged with the generic code.

You also assume that both the WPSEL and T/B bit are 0, which might not
be true. Please note that both are write-once, thus should only be read.

See also:
https://lore.kernel.org/linux-mtd/346332bf6ab0dd92b9ffd9e126b6b97c@walle.cc/

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
