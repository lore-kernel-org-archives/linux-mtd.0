Return-Path: <SRS0=rnzE=K3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0386C47080
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Jun 2021 12:37:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F0ED61396
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Jun 2021 12:37:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F0ED61396
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JgYT7z0gtu7fe/MprjTr9WUl0iBrSO21m4HneJ19a3A=; b=ptnN9jUsuWPDdziXKSyQxQ/gTC
	WjIRTbTWxPoX5Duefp7o1EXFmYFvJwfAMgxnQn11moKke7go1NI1IQUyRrAWnwS5o68cgrik4mXdj
	G7ohp6l47iPcWUY3k7jDQbd52es2i+wT2mwwvUEXT1m0i37xsSnSFqNomOGYJyKsatopJqBbITxZQ
	HviDucUytvXnRroBV+RYxSWwp4EZ0zRJnFlvMqdlqO9BCp2VC3vk7bhXT3zn68/ODRzELlW9PqWsw
	ZHEQ/sh+l/Ll5CyyUWgv4Zdcrj4ZigiXiCO+Gebg7JmQ1AUjX9kFcqWhDzP3NRENFjfJ3HS4cLM7L
	XK6MlEow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lo3dO-00GXtz-3M; Tue, 01 Jun 2021 12:36:38 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lo3dK-00GXsP-39
 for linux-mtd@lists.infradead.org; Tue, 01 Jun 2021 12:36:35 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 7214222236;
 Tue,  1 Jun 2021 14:36:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1622550988;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KbCr62UBWzd91uPGhP19/e09ZyrN+lS6g3DQdq64C/A=;
 b=DN6N48S0t7BUy1ObG3XMDfSA+JSidH0Pet1iGzTVl/ITZ1mOik8TV+mZvxe5mw9NlrHi5r
 JyZ882Z4uCKn5v1ZFBnQVfLUehdWVE5GZOS0Z35Lz999CanT3O3Yw8dSz36x4N1Z7xba70
 l2zgKKY6GjVHld5Sj00fW0xdwNRH7vI=
MIME-Version: 1.0
Date: Tue, 01 Jun 2021 14:36:28 +0200
From: Michael Walle <michael@walle.cc>
To: Pratyush Yadav <p.yadav@ti.com>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Mark Brown <broonie@kernel.org>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org
Subject: Re: [PATCH v2 1/6] mtd: spi-nor: core: use 2 data bytes for template
 ops
In-Reply-To: <20210531181757.19458-2-p.yadav@ti.com>
References: <20210531181757.19458-1-p.yadav@ti.com>
 <20210531181757.19458-2-p.yadav@ti.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <543350e0bc25f84a0ba9f464dcfa15bf@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210601_053634_322488_6BDAC26D 
X-CRM114-Status: GOOD (  13.66  )
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

Am 2021-05-31 20:17, schrieb Pratyush Yadav:
> The template ops used in spi_nor_spimem_check_pp() and
> spi_nor_spimem_check_readop() currently set the data phase to 1 byte
> long. This is problematic for 8D-8D-8D protocol where odd length data
> phase is invalid since one cycle transfers 2 bytes and odd number of
> bytes would mean half a cycle is left over. This could result in a
> controller rejecting the op as "not supported" even though it actually
> supports the protocol.
> 
> Change the data length to 2 bytes in these templates. One might argue
> that this should only be done for 8D-8D-8D operations but when talking
> about these templates, there is no functional difference between one 
> and
> two bytes, even in STR modes.
> 
> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> ---

Reviewed-by: Michael Walle <michael@walle.cc>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
