Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C58A0EE14D0
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Sep 2023 08:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UuQMJcsa1b3NDtlzOdDvateps9pseaQQIWY+7s9zJ00=; b=EL+Dn6lxf0BrQTteUhsB85ttaU
	UA/Cn9Omkhitdfk7OI17p+/fTFeN1z6pvtyjfo9g9Kxeaec10hZuG8w2vagtWVJUjI7+9Z+fnWzzG
	RpKFqOCWXwSTRwO2Txrwav853tK1cNfeKAljswXqNKSbziGC3ZW9+3lxwJwaxPK3EhE+cPO7Uyzzu
	ZsU7rWEGarMNsFfe5TngE8EtGvFPp37jm6QJHhl42+M7SAvfrPqY6fgewkD27l8aFor5x3NHi0877
	ydJHBf0KtkTwOBU2QpQk6GXDRyG+JklPrSL3+nlEcFzs5rChXNWc0gI2+J7y5RbaAgEZCHbYrH5ya
	hNq465Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeAA4-00BZHY-3D;
	Thu, 07 Sep 2023 08:14:49 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeAA2-00BZH0-1Y
	for linux-mtd@lists.infradead.org;
	Thu, 07 Sep 2023 08:14:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id E3EA2B81A2B;
	Thu,  7 Sep 2023 08:14:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1454CC43395;
	Thu,  7 Sep 2023 08:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694074483;
	bh=OCuI7TmziokJl+2qmcXoAZYq+Z4TxTENE+xPQbRlpe4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=T+8XOhDhwD7p0xPIzG3ezpJZO97yux9KetgNiwIoOGm87MpiCf5Mi/aw0sL9tq3yV
	 qkTttaL7MqnqKlnlhPb0f+NdQpmdYDoyhR7PYaPa7dOUbNZumdKvoXhNwzuwN0UEdv
	 FprJGaBHgR4k2rjWLIPoXZ/UVtuDOb8VBv+YD8zaLH/L6CaggHv0Lv9tVTMKl9sW9T
	 xMqiJEpmVH8L/YHNfsHOa+nI6pFUL3AQyZouS9Tr3ItVOfPsShvO4qrvHEt9mqUqrj
	 P6vdX70Us2dFsxQvxBa+KOi+i03OrOcF2yJS/QXN+3GaRdJc03cO38cLVpba4i1qGL
	 DZ8Zz5N8sFmtg==
MIME-Version: 1.0
Date: Thu, 07 Sep 2023 10:14:39 +0200
From: Michael Walle <mwalle@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Pratyush Yadav <pratyush@kernel.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2 39/41] mtd: spi-nor: winbond: sort flash_info entries
In-Reply-To: <eec52fd8-663d-7e56-3627-2b33259027b6@linaro.org>
References: <20230807-mtd-flash-info-db-rework-v2-0-291a0f39f8d8@kernel.org>
 <20230807-mtd-flash-info-db-rework-v2-39-291a0f39f8d8@kernel.org>
 <eec52fd8-663d-7e56-3627-2b33259027b6@linaro.org>
Message-ID: <c55604322b8b5bb74ce293885599810c@kernel.org>
X-Sender: mwalle@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230907_011446_663556_CB2412DF 
X-CRM114-Status: UNSURE (   5.78  )
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

> I'm fine with the sorting by ID.
> 
> 
> Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

Also here, should I convert this to an Acked-by: for all the
sorting patches?

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
