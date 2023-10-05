Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CF17E9370C
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Oct 2023 11:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P/rmq9N0rW5OPk5Gidt3jN5ZTCGAe6mbQ0arn6a8Q+c=; b=UqSoYrIrHCJbQU5tvw0fYw92r9
	NiNMH1QqscntXWnfL8lb23nEqtMUEdkKZYD94ti4BCpzYxNmn51fgPq35sUNmuZcYmKTcSc+B+0lg
	md6GVZeK6H41d7zC+YCPpel0ZDFaTwtOWL1SQDxbzuL6TXxBKecJVagAYJZ2XxPngGcHvcjB1Wihv
	432jUT9BASY+pCkVJkyHnZ6opgw+nkh2bgjv/GX7VtE9jOF21jutkWSMUIekQEuPM3zSgAFhUoPmm
	eI0Rm3bTg0a6F6UaCFzjv9bJfjAeBBq0BzR2RF6iN6a4wWuk3cjhtjDRn+heR/TlvdVcCwsohFEOQ
	+0U0fT4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qoMl8-002NhL-1Z;
	Thu, 05 Oct 2023 11:43:14 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qoMl3-002Ncp-2c
	for linux-mtd@lists.infradead.org;
	Thu, 05 Oct 2023 11:43:11 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 43D316EE;
	Thu,  5 Oct 2023 13:43:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1696506185;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bId9U1jnoY53vhhZ1ZvcSNYvIS2RcxwFhWTU7L9MhVs=;
	b=o5RvGFjKrhvuRM4MUDWdSZteM0W5FsZ/3+Tz6HbHVQ9oYlrsrfV5cwHKjoHtaQXqgWF7+j
	orSjAuNmXbXi366dgLH+5pkiOgL3JJzEcOzakWqSY+D3sHa3fU7vfRM4ONGOZnC7Z8Ca7m
	igVaXJQ3t2fQ3Dghxx9ahBJOdTlOrMQlBazKL6qVJKbtH13cUzIhyGYTl4PapnXB4N3SJ0
	ZkNqK0NiKuCkkUOL3mVLFquNQP8nNyue3A8FNE8yB9bUIEJO4/nTTd+3zgw4Xlyfb0JF0/
	P89JRJ5jNnG2SavvOeMELin/zLR3K6sl5Yn+6l/tY/B1LejsLNP2+Dm3hXI7pw==
MIME-Version: 1.0
Date: Thu, 05 Oct 2023 13:43:05 +0200
From: Michael Walle <michael@walle.cc>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Jaime Liao
 <jaimeliao.tw@gmail.com>, linux-mtd@lists.infradead.org,
 pratyush@kernel.org, miquel.raynal@bootlin.com, leoyu@mxic.com.tw,
 jaimeliao@mxic.com.tw
Subject: Re: [PATCH v4 1/6] mtd: spi-nor: Add manufacturer read id function
In-Reply-To: <mafs034yppc28.fsf@kernel.org>
References: <20230908064304.27757-1-jaimeliao.tw@gmail.com>
 <20230908064304.27757-2-jaimeliao.tw@gmail.com>
 <b998ea18-8ce9-83b0-f42f-18e5ea08175b@linaro.org>
 <mafs034yppc28.fsf@kernel.org>
Message-ID: <f60995d3d02d7639204c2c16abf9bfd7@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231005_044310_013462_54F7A33F 
X-CRM114-Status: UNSURE (   9.06  )
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

>> I see this flash supports 1-1-1, 8-8-8, and 8d-8d-8d, there are no 
>> mixed
>> modes supported, thus a 8d-8d-8s mode seems just like a hardware bug 
>> to
>> me. So my proposal is to leave the core away and to handle the read id
>> hack just in the macronix driver.
> 
> +1

I've looked at the xspi spec. There is no RDID specified. So I'd argue,
the only pseudo standard is that RDID was only ever used with 1s1s1s. 
But
we added spi_nor_read_id() with parameters suited for the "unusual" 
8d8d8d
case with additional address and dummy cycles. Just for checking whether 
the
octal-dtr switch was successful. Therefore, we've already added 
parameters to
spi_nor_read_id() which are not standard. Then we can just add one more. 
It's
just how macronix is doing it. Again there is no standard.
If we'd only put standard (or for the 9F pseudo standard) things in the 
core,
then spi_nor_read_id() would need to check whether the flash is in 
1s1s1s
mode. And no I wouldn't prefer that ;)

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
