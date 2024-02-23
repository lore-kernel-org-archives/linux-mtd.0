Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 338A5C5478C
	for <linux-mtd@archiver.kernel.org>; Fri, 23 Feb 2024 10:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:Cc:Subject:
	To:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vllq7zcJQMc7Mjhn1TRZOjoIu5ipsV9axXwxIgtpu5U=; b=umKJJ7oqi1lMgS
	ZduWJNs9WeUesOz6LIjIkSUvJ2KeV2rcXP3ye9YwI/vdu6Cm2UPFr9fQ9+pEzS1pKuSHtgT1BLhLQ
	jrHinUPIC7u12EypmVLtSM9hzeRkkKZ27NSezIVFUfv/D2+bmvCO3xA9LP2cx5jDgKiugfDUr4XCk
	4ynYbCCXDSSdc1PdhDUhLK/nS0qev/jK1MONY/Rd+ArJ7l3VjKqYG6bEwvczPBKVNcyP1CY/lndvi
	fsVFCgSPWoAM0AbzBzoNg6QO7PstXqb3ar5lLWtBlyQfAmxd3hz8NGqZ/bKP2JyeoX6jL5WM8gv66
	ox6q+gEAsM2mHK5x5sRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdSe5-00000008sUq-2tvT;
	Fri, 23 Feb 2024 10:19:09 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdSe1-00000008sRb-3ewr
	for linux-mtd@lists.infradead.org;
	Fri, 23 Feb 2024 10:19:07 +0000
Received: from localhost (unknown [IPv6:2a02:810b:4340:6430:4685:ff:fe12:5967])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id B5DDE4CC;
	Fri, 23 Feb 2024 11:19:03 +0100 (CET)
Mime-Version: 1.0
Date: Fri, 23 Feb 2024 11:19:03 +0100
Message-Id: <CZCDRJENQR78.386XD2ZH2WGDU@kernel.org>
To: <tkuw584924@gmail.com>, <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v4 3/4] mtd: spi-nor: core: get rid of
 SNOR_OVERLAID_REGION flag
Cc: <tudor.ambarus@linaro.org>, <pratyush@kernel.org>,
 <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <Bacem.Daassi@infineon.com>, "Takahiro Kuwano"
 <Takahiro.Kuwano@infineon.com>
From: "Michael Walle" <mwalle@kernel.org>
X-Mailer: aerc 0.16.0
References: <cover.1708404584.git.Takahiro.Kuwano@infineon.com>
 <076416d5dc8328dec72d31db12b9bec96bf0ac66.1708404584.git.Takahiro.Kuwano@infineon.com>
In-Reply-To: <076416d5dc8328dec72d31db12b9bec96bf0ac66.1708404584.git.Takahiro.Kuwano@infineon.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240223_021906_174531_48D233EF 
X-CRM114-Status: UNSURE (   6.23  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue Feb 20, 2024 at 9:34 AM CET, tkuw584924 wrote:
> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
>
> Only SNOR_OVERLAID_REGION is defined for flags in the spi_nor_erase_region
> structure. It can be replaced by a boolean parameter.
>
> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Reviewed-by: Michael Walle <mwalle@kernel.org>

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
