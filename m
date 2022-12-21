Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26EF7C4332F
	for <linux-mtd@archiver.kernel.org>; Wed, 21 Dec 2022 08:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CCTyvJO8v631vNAp2OQCuX7P+A/JXqwuDJpHIbCMmcQ=; b=pDUpMPUaGYg61ecHmykYrVgu9D
	OARbQAeYo1LN/OsIcYwsUqWQyItRYH66PYvwSZ4u3W4HKLqwAm8C3uLcUxTON7GlfVQ7QwMe+d/Oy
	qbML+nBqU1sPBozOPOVffv5v+UByO2R7y6fQJskcqqK2QDsLJHSgAe4OfifbUcBDY9vG718Nq34/l
	FKH8goZ3etUu3m98Xzn6KyCTeMV4eQo2dFwhC2AxC0zA11mQSR1THeuoCMDruo9MHnm+NgVJvQW8t
	LMQwo9OVmds8zbfLK/oiPeaMPiPXV9+tuTkzvXdqFvF0YXn9meypS7CABFWibLGOJXr/N6AZgabPf
	1eSozYJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7uPg-00C7gi-M8; Wed, 21 Dec 2022 08:25:20 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7uMd-00C62N-Fi
	for linux-mtd@lists.infradead.org; Wed, 21 Dec 2022 08:22:14 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 15BB19EF;
	Wed, 21 Dec 2022 09:22:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1671610925;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CrOp+4yXKStdKI6+nRU+X23Qjw/ID5T0E5jOpfRWtV0=;
	b=ebDXBQ81UhX36K5+JykVoeqLlqKwYvyJG7BblORAz7657NNNDLDTwQVcwQW1xV3jaMIFH1
	whATaOEgA1wsrqXp2nrOzjKWEeTk07LvfDq9EzXxyLoMj/oiKp6WTtfnj30AFS2GMNTMfD
	z1oQ+CbUGK1kb0a48kVOO2Dfm/zytRsAdwJUOc48frxWkCPZPzaAwtdEgwipu0NQlGZqkr
	17ye63O+02ttuLp+XqMnNgNHMopnzKT4eb468ZGg/Nd7hpUM32FnFDNAw0R70Up4j4TFms
	GWr6DdxRbDdt0BCTwrOQZDDuqBmmXPlDoxMG/q1yLhfqoK4Hx7UySKY5FmWaoA==
MIME-Version: 1.0
Date: Wed, 21 Dec 2022 09:22:04 +0100
From: Michael Walle <michael@walle.cc>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Sudip Mukherjee <sudip.mukherjee@sifive.com>, Tudor Ambarus
 <tudor.ambarus@microchip.com>, Pratyush Yadav <pratyush@kernel.org>, Miquel
 Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, greentime.hu@sifive.com,
 jude.onyenegecha@sifive.com, william.salmon@sifive.com,
 adnan.chowdhury@sifive.com, ben.dooks@sifive.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] mtd: spi-nor: issi: is25wp256: Init flash based on
 SFDP
In-Reply-To: <20221221003009.GA280250@roeck-us.net>
References: <20220920184808.44876-1-sudip.mukherjee@sifive.com>
 <20221221003009.GA280250@roeck-us.net>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <9cf53ca3bfb39c85da968f9b46dbe6d7@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221221_002211_802372_C7C553A2 
X-CRM114-Status: UNSURE (   8.27  )
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

Hi,

Am 2022-12-21 01:30, schrieb Guenter Roeck:
> With this patch in place, qemu emulations with is25wp256 fail to
> instantiate the flash. Specifically, this affects the qemu sifive_u
> emulation. The resulting error message is:
> 
> spi-nor spi0.0: BFPT parsing failed. Please consider using
> SPI_NOR_SKIP_SFDP when declaring the flash
> spi-nor: probe of spi0.0 failed with error -22

qemu is to blame here. It doesn't fully emulate the flash. Esp. not
the SFDP tables. See also [1]. Adding the .sfdp_read hook with the
corresponding binary [2] should fix your issue.

[1] 
https://lore.kernel.org/qemu-devel/7827c791b7f91f4eb216b33473dd6103@walle.cc/
[2] 
https://lore.kernel.org/linux-mtd/CAHyZL-ch=mr0x_19e6P9G+Z4sW2iJXW9nTnXUNAhn+pTptN2ww@mail.gmail.com/

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
