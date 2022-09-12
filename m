Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 372DBECAAA1
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Sep 2022 07:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xeZqhJScTJrxxqfHlVbxvca3xMMkxdCBnxkInQzPP4A=; b=wj0EvRkwNh8su/22UkO+Slg65U
	DTSNNIjTADCPNbkfQAxPJUZbTYiCccKJtzBqvrGQrmcngpaaM05RdSJJ+kVBgBOvxF7iG2V+JurTp
	gScEn7pXVFpp9gJlsTPie9nqaPX8rZJTh6QXxoc/1WT2I+DQbW7iBh68xBwqzbm4lP9fRImqw5TCq
	Jyba94i8DXA5w5KvP0ke/5C4KbNhAgZdcrvdRhcy4f0Tnk9VXXKQl87R7YBGBhEjjHTAsLlMD8gme
	l9pKumHVEUjguJ47VQFZ/N4msmzSnkc+btC2mZG3urBFTcfnKAxANNNfYfnBmKRwHjtqosJlzd5Gb
	y7/SZEpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXduh-007ZIK-HH; Mon, 12 Sep 2022 07:31:27 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXdtB-007YOB-1q
	for linux-mtd@lists.infradead.org; Mon, 12 Sep 2022 07:29:54 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 79A441267;
	Mon, 12 Sep 2022 09:29:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1662967787;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VziR2u5O4tknk9NY0gbu+w1H27mQ9pu5Om+ivBunlxg=;
	b=m7XbjXohL0XOtWjw1g8VDRyMSmd9ORL19CEPcWLrL1YQEaZ89+3kdfTM2gpuFPEdIasrWc
	Umr/KgniLcIzABY8YVNzRFdLoAOumGBucCTMSsqycSk7iZksHc4PMvvvtzjJ6SeAGqd6Rc
	5pebveNAKKkDnAQZG4lRAlUp0r7gIYGE38RH20yNWA3GUx6+cyACBMbHMgMaX+jbkiez9I
	B+KsRazt/y9TgOUmwu0bOBc/aJKmT5+vwDo5mntKYEafLn3bHdLsf6v8tPQm/xi5tiJnH3
	8QCIbRygtCuoDu5JElK3ArXilgZuv0Zveh3E/sU1QT3KwLZIGoSNrMYB7dCN7A==
MIME-Version: 1.0
Date: Mon, 12 Sep 2022 09:29:47 +0200
From: Michael Walle <michael@walle.cc>
To: tkuw584924@gmail.com
Cc: linux-mtd@lists.infradead.org, tudor.ambarus@microchip.com,
 pratyush@kernel.org, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, Bacem.Daassi@infineon.com, Takahiro Kuwano
 <Takahiro.Kuwano@infineon.com>
Subject: Re: [PATCH v2] mtd: spi-nor: sfdp: Fix index value for SCCR dwords
In-Reply-To: <20220912051317.2369-1-Takahiro.Kuwano@infineon.com>
References: <20220912051317.2369-1-Takahiro.Kuwano@infineon.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <9b23d99e2da65775140039f89bf64a25@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220912_002953_370567_BBE5D8D2 
X-CRM114-Status: UNSURE (   4.17  )
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

Am 2022-09-12 07:13, schrieb tkuw584924@gmail.com:
> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> 
> Array index for SCCR 22th DOWRD should be 21.
> 
> Fixes: 981a8d60e01f ("mtd: spi-nor: Parse SFDP SCCR Map")
> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>

Reviewed-by: Michael Walle <michael@walle.cc>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
