Return-Path: <SRS0=zJhW=IB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0E8BC433DB
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 18:49:35 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3483264ED4
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 18:49:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3483264ED4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=e58vCwBI0gUzFwyDPyvRTdtnt+fEBFpm/YXQLlrmCKI=; b=qcrOcoQw/ay5hS6RFxIJfNvAd
	RZLNuJfXYbxNjGkkIyNgNfp5MptRor56XxuYCd8nEPcY8uSdzNLZyBOOh1ec4+rosxxulZMj00PwX
	usvbBaNgZCKEEsdJHcFNkWdUVuDJjt9B4jbQBZ9G7JoktsT33Z7+pbhU60bhTM3iS4B4gILSeWqua
	61fqAPQW5KH8jLg4IDyntc7QdgwjrnBjFA7ao5+gsHvjZTCZE/rOCTeLcXlEoXYPDgZPvxO2N0Y7J
	jUsX34KPTOozU+qWhZ6MzrXLuTj0YQvoyFB9bwIfE6zEBbkwM111uNV7xcwL4mGSyhmmZtykOYWVq
	/JI2dTVzQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHWXk-0065O1-H3; Wed, 03 Mar 2021 18:48:20 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHT1c-005HQt-Pb
 for linux-mtd@desiato.infradead.org; Wed, 03 Mar 2021 15:02:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=n3LjNuE2ZekfBN9xjwuVfk9VGdSDItzNPjirEaGpjSQ=; b=WYv7cYNgbhOTuTDLw+k34ot/e4
 EwfbpppEi1XeLVFW8EU5BgI3VaQ8BDeaw4VPA0AH94u23SEerkjm7txByggBJmrgemT6Dgktt82tn
 ZTFWb6pI/YAl0JBZ/HbbuBv3QeK8EpIxqkDieCw5dxBGNjWhCkbSVBjTVnxLtrgxTp7wZD3S1zcK+
 zghwExloQ6byL9z5zC9IeBUeWbla8pz7g9dNfutN7lMlp8d+FeVL6t/YKo21t5pKC1bQxwg34nRAr
 PccrTRF1RUcCFpZQjFXKhY9bAUXez3Qnuivm5vWkBa4CFrBTxkbaXJ9EuGi3E7GycwjfEL2T/iZaE
 Zsfy631w==;
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lH7xR-00HSEI-PT
 for linux-mtd@lists.infradead.org; Tue, 02 Mar 2021 16:33:17 +0000
X-Originating-IP: 86.206.8.148
Received: from xps13.stephanxp.local
 (lfbn-tou-1-491-148.w86-206.abo.wanadoo.fr [86.206.8.148])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 109741BF215;
 Tue,  2 Mar 2021 16:32:50 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Reto Schneider <code@reto-schneider.ch>, miquel.raynal@bootlin.com,
 richard@nod.at, linux-mtd@lists.infradead.org
Cc: Stefan Roese <sr@denx.de>,
 Reto Schneider <reto.schneider@husqvarnagroup.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>
Subject: Re: [PATCH v2] mtd: spinand: gigadevice: Support GD5F1GQ5UExxG
Date: Tue,  2 Mar 2021 17:32:50 +0100
Message-Id: <20210302163250.23455-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210211113619.3502-1-code@reto-schneider.ch>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: 8c599a0d89d91693945b25c112ba48a9db7775f7
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210302_163317_575173_4095D056 
X-CRM114-Status: GOOD (  12.52  )
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

On Thu, 2021-02-11 at 11:36:19 UTC, Reto Schneider wrote:
> From: Reto Schneider <reto.schneider@husqvarnagroup.com>
> 
> The relevant changes to the already existing GD5F1GQ4UExxG support has
> been determined by consulting the GigaDevice product change notice
> AN-0392-10, version 1.0 from November 30, 2020.
> 
> As the overlaps are huge, variable names have been generalized
> accordingly.
> 
> Apart from the lowered ECC strength (4 instead of 8 bits per 512 bytes),
> the new device ID, and the extra quad IO dummy byte, no changes had to
> be taken into account.
> 
> New hardware features are not supported, namely:
>  - Power on reset
>  - Unique ID
>  - Double transfer rate (DTR)
>  - Parameter page
>  - Random data quad IO
> 
> The inverted semantic of the "driver strength" register bits, defaulting
> to 100% instead of 50% for the Q5 devices, got ignored as the driver has
> never touched them anyway.
> 
> The no longer supported "read from cache during block erase"
> functionality is not reflected as the current SPI NAND core does not
> support it anyway.
> 
> Implementation has been tested on MediaTek MT7688 based GARDENA smart
> Gateways using both, GigaDevice GD5F1GQ5UEYIG and GD5F1GQ4UBYIG.
> 
> Signed-off-by: Reto Schneider <reto.schneider@husqvarnagroup.com>
> Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> Reviewed-by: Stefan Roese <sr@denx.de>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
