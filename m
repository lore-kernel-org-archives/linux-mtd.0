Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3896C76196
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Apr 2023 12:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1RmA5juZrJEDlf5S9+Gaa3HB1nvmb52P+2Sid/ih5Os=; b=IAAl2o08CTapPa4CQj60/Pzkho
	8IKSstYVoP/HgMOXwXmpiR/j1cf4YoCYRJwXsvckdF2eGs9rI1UA9F6vwuHqPUAcPaE1/P5QeeiQY
	fhAYgLutTpxn45CmJf4ryKxKYeT2Q5TOLQHNGITX94iSsaXps+bQ3JwaElqmsro+5t4LO14T794PR
	f5/C/RXJSyjDGhccDMVHZmjgpjKpNysWgxaOdIIfmP5Y6gOPFIT1TI6j7GtN8SnlnaRZ7CXVh1RaA
	/geqt2Wsi5D8IHtRl2oe2rE50EeTR1A5V3K85o2sB4KgA8eK6KDXHVWRSWOZAM6rS+KEtfYTH+dz9
	HfvN1tfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjJYC-00FK7z-02;
	Mon, 03 Apr 2023 12:44:44 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjJY8-00FK5N-0j
	for linux-mtd@lists.infradead.org;
	Mon, 03 Apr 2023 12:44:42 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 22186124;
	Mon,  3 Apr 2023 14:44:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1680525875;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PS5zXyKmp/pONxWxlIy1KQeGd0IEY5iGQxDKSs2hay8=;
	b=dhicINKyLgUs72UM0k+RZBxseLhFW2AmbfN8e94tEDp3LzyeFj9Mp9KInvdbaAmZG+Um0R
	LGPll5iDFWenq5R90F/NKSrl9wvxBFkSH9XzfS1hB1V8b+cqbTZHRmQALGRjg65kfdjRx5
	IgltzmuojeAmy+cxzrtp6kJ7yPiUUo9qO8dzQHTxvFTK+ccIp0gp+oQQh4fDQ+5XJXlpsL
	RzEX8yYU9ZI7upb8x7ccWeUZZ43Q4tEwF7KtFCXvIUUeGFOUBt8p1IjQBQUlHvQM8j2AJL
	gFsCOPInGMigPiDxD/0tUpPNYPQyge6sJzGuzOs5q+7fYdKhUtHzam1t0GvVyg==
MIME-Version: 1.0
Date: Mon, 03 Apr 2023 14:44:35 +0200
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: pratyush@kernel.org, miquel.raynal@bootlin.com, richard@nod.at,
 Takahiro.Kuwano@infineon.com, bacem.daassi@infineon.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 02/10] mtd: spi-nor: core: Update name and description
 of micron_st_nor_set_4byte_addr_mode
In-Reply-To: <20230331074606.3559258-3-tudor.ambarus@linaro.org>
References: <20230331074606.3559258-1-tudor.ambarus@linaro.org>
 <20230331074606.3559258-3-tudor.ambarus@linaro.org>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <0324c2ebe574e4e3239054594cddffda@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_054440_417442_58E749C2 
X-CRM114-Status: UNSURE (   4.99  )
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

Am 2023-03-31 09:45, schrieb Tudor Ambarus:
> Rename method to spi_nor_set_4byte_addr_mode_wren_en4b_ex4b and extend
> its description. This method is described in JESD216 
> BFPT[SFDP_DWORD(16)],
> BIT(30) and BIT(22).
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>

Reviewed-by: Michael Walle <michael@walle.cc>

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
