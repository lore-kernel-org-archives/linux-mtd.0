Return-Path: <SRS0=7qTJ=LM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94084C48BDF
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Jun 2021 09:45:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD0C0613CB
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Jun 2021 09:45:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD0C0613CB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xv4dX6ktCzwg4+Aq8/7t9kk3Bfs63OsCV2bEk9GJ35c=; b=nLiB1CMqLgjeT7w+eTcvIJw8T7
	WtvYSSO8u8HPzyizLifyjXUmUlTqK1+/2Ct+1Vqs+Ufk2Q7g3FsMUKCu9A/i9Iq0JxZ2Zql0Z0vDw
	6NEZuJdo0+mZelGRXHNJ9vQNypVwWZnHwui02fbf+xe+sihpObXdzcEZyYlpTsolM1A31mLmyMVhf
	8JbrswOFvolaOemysB/HSdO6iENn14lu1hR0ARsxjVNFfTqF+RiwG/yZEDjE5BSuXAypkC6BLvgA/
	1fuYx/I/xCDBSaGyDQPI8P/OchBnLQM9a7WNGTkTs0sx7xSDZK3Ydn8sYxbFFC2J/Wv8kx+lChj1L
	b8y0OuEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1luB3X-00Db5A-AW; Fri, 18 Jun 2021 09:44:56 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1luAz2-00DYqv-RK
 for linux-mtd@lists.infradead.org; Fri, 18 Jun 2021 09:40:18 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 50AAB22239;
 Fri, 18 Jun 2021 11:40:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1624009207;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BjckcDOMY6ny4V2/ZL/9WmTbYDu5KRR7Z/WfGf4tNs8=;
 b=Qh6pFvpHLi1cg1EvHgs3SyWCmNuIS1mbrMjc09p/kCZrrSj0M4OIrqk8DkrEHQQACU0xsN
 tWDXENHlqTYhMbvVjyOe+WegaFKRtOg6gdJ1syJc4LvbuZ1PRok6C7zYfgX4erat+FSMVX
 xQjqC/uWYb5jnJPYE9DV8ozdASCk9Qw=
MIME-Version: 1.0
Date: Fri, 18 Jun 2021 11:40:06 +0200
From: Michael Walle <michael@walle.cc>
To: Colin King <colin.king@canonical.com>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>, Pratyush Yadav
 <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH]  mtd: spi-nor: remove redundant continue statement
In-Reply-To: <20210618093331.100006-1-colin.king@canonical.com>
References: <20210618093331.100006-1-colin.king@canonical.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <59bfda9fc1040ecd1be3f57aa436cce6@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210618_024017_133334_7E010B1D 
X-CRM114-Status: UNSURE (   6.82  )
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

Am 2021-06-18 11:33, schrieb Colin King:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The continue statement at the end of a for-loop has no effect,
> invert the if expression and remove the continue.
> 
> Addresses-Coverity: ("Continue has no effect")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Michael Walle <michael@walle.cc>

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
