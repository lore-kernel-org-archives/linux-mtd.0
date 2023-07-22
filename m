Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CFCAEB64DA
	for <linux-mtd@archiver.kernel.org>; Sat, 22 Jul 2023 12:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YUedyCBFVTCdCIG1TszWDJYxemXgb4g66bRDJ6JNhrc=; b=br07zv19wgiSUR5k/51BH/aj93
	znEbB3cmqyHil8C2rrcFPCK6jdJqwHw921Tyqf3pLjKCMvAePjbXl6FUUdyU7QsJkPcpHD8s0LaWk
	Hi/sv/DGGNZZzPLMaVOVs6MKu8iQvMLDQdxodykuoM1TOZ+qKRxROvA9L9gKRKZCF+1EzI1iuMn0r
	wkUXjcy4PYJz19KNUF3XvMJo9UXj5JABZ2cKym6AZnDYCI/1ldul3QcJL72Yo5APNAeHbBS38mIOv
	eSKeKEZhTwBEtmVU5kb5owqNm4zfGatgPoAh0mZDSnemn9OCzM0cQjB7k4xq0xbnOi1e3xwiQezGX
	MGwnZkew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNC9z-00Gjmf-2p;
	Sat, 22 Jul 2023 12:56:35 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNC9v-00GjlB-1l
	for linux-mtd@lists.infradead.org;
	Sat, 22 Jul 2023 12:56:33 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 25D8ED5D;
	Sat, 22 Jul 2023 14:56:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1690030581;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cY+GrMkoeu4t+Kjc7C8tGN4af1/bHwoNAXDrlL7QiTU=;
	b=dqozFwTzC3vGF8iiG+UQvWXSZGvdG1SK+BuYvJuHHFmGFXqp6+iEjkd9H0rSKfOTPF+DTC
	R6tK7HAGRu0XUOnGk9/aCkcaG/b9E5+jC703XG8TNtpr0+ie2D8ADJ2yFFfrCqSdzVs3xV
	bkOeQnqd5XN1/EMG/TLjdjhGd0yEtnUS1SGsHT2cYBgIppqW8aetwPMiuQXhSsQj2qD0pB
	wOiHgPRCRaULrYVQbrOyC3bH+/cw/8leNzCMViX6q+GjLMrXzZng3JZpzKYJxSgG26tSab
	fLzoJ6XZ2+EvyTd0QfxS4rxCbQ/fo8GYkF54TmlGGk8t8iqqLUw4t02a3KGgUA==
MIME-Version: 1.0
Date: Sat, 22 Jul 2023 14:56:20 +0200
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: tkuw584924@gmail.com, takahiro.kuwano@infineon.com, pratyush@kernel.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 bacem.daassi@infineon.com, miquel.raynal@bootlin.com, richard@nod.at, Tudor
 Ambarus <tudor.ambarus@linaro.org>
Subject: Re: [PATCH] mtd: spi-nor: let SFDP determine the flash and sector
 size
In-Reply-To: <20230722045901.9872-1-tudor.ambarus@linaro.org>
References: <20230722045901.9872-1-tudor.ambarus@linaro.org>
Message-ID: <56b679ea1b2424a55a8dc390ba23e7af@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230722_055632_227864_F05905F0 
X-CRM114-Status: UNSURE (   9.78  )
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

Am 2023-07-22 06:59, schrieb Tudor Ambarus:
> sector_size is used to determine the flash size and the erase size in
> case of uniform erase. n_sectors is used to determine the flash_size.
> But the flash size and the erase sizes are determined when parsing 
> SFDP,
> let SFDP determine them.

Great! I have a similar patch in my preparation for the flash info
cleanup, but for all the flashes.

The flash size is overwritten if PARSE_SFDP is set anyway. So
that's fine. The sector_size is used for the erase ops and the BP
locking. The erase ops should be initialized with the BFPT, too.
So whats left is the BP locking, which is just used for gd25q256.
For now we'd need to leave the sector_size there.

Would you also drop the size and sector size for all other
PARSE_SFDP flashes?

In any case:
Reviewed-by: Michael Walle <michael@walle.cc>

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
