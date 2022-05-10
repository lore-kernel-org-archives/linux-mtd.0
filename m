Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61DC4C4332F
	for <linux-mtd@archiver.kernel.org>; Tue, 10 May 2022 14:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=30oaZypQQ6m6jQUa3BBbU16SxJxDgH8fkvaxS3w81yM=; b=1VwzUQnL/k1VUDsOlWOc08BSNN
	Owc3Bt3L/5tO4KpYe5Gh1N9Ycv8HjTBFw54LpVjmnbCz2hetwr5+pCTNur4+BqURlayN5QuBRZAgS
	7z84gIUBT9eNdK1IHDEYZ5V+q31Qw2wVpLeCOZsjBBKZ5Fu+aBD4dejUZiby4BXifsMGAGlAsJbmh
	epSMlZNYdy4AmXWc3TXIw4iKFJGCO1VLNnw6Gj6kHocbsLvZWDwTia15ThtBJ5qmHTt8DzhW3iXCB
	SgaoAXLEJxsSl9reax4qjYZ7vcYeiwwEkReUBYfqxvwRd2PHt4RdNa7yRmXtwWZyokF4XNZyGEGFb
	A3LtqZEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noQSw-002OV9-VC; Tue, 10 May 2022 14:03:55 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noQSq-002ORJ-BY
 for linux-mtd@lists.infradead.org; Tue, 10 May 2022 14:03:50 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id B5F9022238;
 Tue, 10 May 2022 16:03:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1652191426;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RneOi143x1oW2qLY0RCSAR2GeweFwG1lLPobOCmEojI=;
 b=vLyveiHk5oYcSMt7YvhXCKxnsHE30H+jVO8oHxHYIuDtA0HFM63hW0kfSUH7loksBbhzRM
 FJQEdfJhIVr80sFRLMKbDKB9Ivmuq+fpc3p568wA0kfwuXVMPgbHmEWtooLo1uhGxIEi6U
 UH6fjSq+3iO4TacK6Mq03VK9eG2JFT8=
MIME-Version: 1.0
Date: Tue, 10 May 2022 16:03:46 +0200
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@microchip.com>, Pratyush Yadav
 <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Shaik
 Sajida Bhanu <quic_c_sbhanu@quicinc.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] mtd: spi-nor: introduce SNOR_ID3()
In-Reply-To: <20220510140232.3519184-1-michael@walle.cc>
References: <20220510140232.3519184-1-michael@walle.cc>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <966de7ad5f563f9a29db91c5309a71c6@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220510_070348_604377_48109673 
X-CRM114-Status: GOOD (  20.94  )
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

[proper subject]

Am 2022-05-10 16:02, schrieb Michael Walle:
> For support which rely solely on the SFDP data, all we need to know is 
> its
> JEDEC ID. All further information should be fetched from SFDP. For 
> this,
> introduce a SNOR_ID3() macro which should be used for all new flashes 
> with
> SFDP.
> 
> The dropped information are page size, number of sectors and sector 
> size.
> The number of sectors (together with sector size) is only used to 
> calculate
> the total flash size. In case of SFDP, this is read from there. The 
> sector
> size is also used to select a proper erase opcode. We can just keep 
> that
> one zero and the selection algorithm will select the same erase opcode;
> that is the opcode for the largest erase size (which is btw rather 
> odd..).
> The page size is also taken from SFDP. There is one exception: older 
> SFDP
> tables. These doesn't contain this data. So if there will be flashes 
> with
> that, we should assume some sane value.
> 
> Shaik, could you please re-test your w25q512nwm support with this 
> patch. I
> read through the SFDP data and it should behave exactly the same as 
> before.
> 
> Michael Walle (2):
>   mtd: spi-nor: introduce SNOR_ID3()
>   mtd: spi-nor: winbond: use SNOR_ID3() for w25q512nwm
> 
>  drivers/mtd/spi-nor/core.c    | 7 +++++--
>  drivers/mtd/spi-nor/core.h    | 9 +++++++++
>  drivers/mtd/spi-nor/winbond.c | 3 +--
>  3 files changed, 15 insertions(+), 4 deletions(-)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
