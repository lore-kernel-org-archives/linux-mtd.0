Return-Path: <SRS0=5ASP=MT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78F23C4320A
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Jul 2021 07:56:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A8A0610D0
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Jul 2021 07:56:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3A8A0610D0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JnpKOQxtO1Elh4EhtI4fbHoPianafizvccmxs/icciY=; b=mSlJDvr4MO53IGLxh2Vi/BDWop
	+FQrb2Kieqz0tOLE/RchGeI67Vv1/AfxXvr6WMi3EKzSs7OOngiHr/VTgbzNATzbBIczxhW4DPsMg
	/LkkrInvlxnd20Rgts5LCOD0WcgkX2UcazrTjn6BdIBUICXgi+VFwSv5fKVN4sCRJbyfNGZM1B+Xl
	lgmMQJLVdgUW7XA2YpcSOfohDVRV0Oaz0S27lGMMHgRD1Fhw9HUU2KfNIL+MQDc/tq5vYoa0bXSNJ
	61HDSeSrWad+7pWE34h3P0LG3c8ZhCqgJsscEH6Gr1hLRCsMMht5afIUrDKndmBYMH4usQq5GXGkL
	TwPBg7rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8Hw7-00DwHT-NH; Tue, 27 Jul 2021 07:55:35 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8HQb-00Do7d-LQ; Tue, 27 Jul 2021 07:23:03 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 8E5F222234;
 Tue, 27 Jul 2021 09:22:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1627370577;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZE7PP7jjj8OQ4JAYKbD9ubTL9GvyZE9qZYOEL4q7x9o=;
 b=GPOiBqBITDBSdipDCOBepbLEfQ7Fni1ghpsV7QVdski0qT4+Yr1F4ngV1sZ7YwJ4uE1/TM
 8fnpS7UMrrZxsY7jeFi9YlrECrhBt249qF1TgN8vmMNtzc8DoIe2fQX9v7njDZRo1X0WOC
 AOOSe/GFunq2hTyD5IDsvvBkz7TyXuw=
MIME-Version: 1.0
Date: Tue, 27 Jul 2021 09:22:54 +0200
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
Cc: vigneshr@ti.com, p.yadav@ti.com, figgyc@figgyc.uk, mail@david-bauer.net,
 linux@rasmusvillemoes.dk, esben@geanix.com, knaerzche@gmail.com,
 code@reto-schneider.ch, zhengxunli@mxic.com.tw, jaimeliao@mxic.com.tw,
 heiko.thiery@gmail.com, macromorgan@hotmail.com, sr@denx.de,
 miquel.raynal@bootlin.com, richard@nod.at, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, nicolas.ferre@microchip.com
Subject: Re: [PATCH v2 35/35] docs: mtd: spi-nor: Add details about how to
 propose a new flash addition
In-Reply-To: <20210727045222.905056-36-tudor.ambarus@microchip.com>
References: <20210727045222.905056-1-tudor.ambarus@microchip.com>
 <20210727045222.905056-36-tudor.ambarus@microchip.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <4304e19f3399a0a6e856119d01ccabe0@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210727_002301_932850_ED867EA9 
X-CRM114-Status: GOOD (  13.63  )
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

Am 2021-07-27 06:52, schrieb Tudor Ambarus:
> Add some guideliness on how to propose a new flash addition.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
>  Documentation/driver-api/mtd/spi-nor.rst | 65 ++++++++++++++++++++++++
>  1 file changed, 65 insertions(+)
> 
> diff --git a/Documentation/driver-api/mtd/spi-nor.rst
> b/Documentation/driver-api/mtd/spi-nor.rst
> index 4a3adca417fd..ffb8d97a2766 100644
> --- a/Documentation/driver-api/mtd/spi-nor.rst
> +++ b/Documentation/driver-api/mtd/spi-nor.rst
[..]
> +Every new flash addition that define the SFDP tables, should hexdump 
> its SFDP
> +tables in the patch's comment section below the --- line, so that we 
> can
> +reference it in case of ID collisions.

Nice, but could you add some guidelines how to do it? That is the exact
commands, maybe with a notice one should use these whenever possible. I
want to prevent having all sorts of variations of the output and I want
to be able to reverse the operation and verify it.

# xxd -p /path/to/sfdp
# md5sum /path/to/sfdp
# cat /path/to/jedec_id
# cat /path/to/partname
# cat /path/to/manufacturer

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
