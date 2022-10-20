Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A5F4C4332F
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Oct 2022 11:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q6340bVkp5pk/JKZfQcQLRowDququsFoO/gQJjiDKZ4=; b=hl7sh89sl0jnBcbyIzF/6VDfDi
	FiWKnH/rfhqLcL+6jmpC7rvJX/u/6RUHKOIQfcTyl1Mtk5OrG+pI3OrwaaepJQq8fbzmfK4kqWeRc
	SJz+GrTEpA64nxgh5FNPPb0Mm5bbiRHMueb5GXTtB2pxps8J9Ygf+DlZIgd2mJoaL+xTldKmsf2fO
	agIVXdezNUYdkPmga3x5Yjvz9Lc639KZ1iUO7Y/Uftrn/EYKroqg/FRMowHMj1FqrzLG0swGfCs+h
	uXy7+Ko16faCF7mV3ICPSwfA83SxvSfO5dmBzoWV2bgURVrfEWsbPh5SZJwLlM3WRFkpIQqBUCzk+
	uFQd63fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olUAG-00EMku-VE; Thu, 20 Oct 2022 11:56:45 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olT4R-00Djyh-Ro
	for linux-mtd@lists.infradead.org; Thu, 20 Oct 2022 10:46:41 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 1D88E1285;
	Thu, 20 Oct 2022 12:46:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1666262794;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qyfpMJ7wvOKQzKJbA8gxhqaiUcCTequz7kYwWgzsxo4=;
	b=S8juV9ehFY1QtzfsNES16OBDCJDt6D8JuIVPz/Los2OyZjJ6w3Vjia8HTvNhkenO54ppQ3
	unFA6yGNnUmRezw+llCgvp6smheHSUdl+nLDaH/sj86RcbiqSsEZMzD2eIy8tN7mbXeIk/
	rEWjea8uO3QWs23LC7Oxzl3f9pzXOV512GMQEH8dcbHm6NY4EV7MmMCrEr3pbu3X1tRbg9
	zyPNP/obX07WdBHsRY4cKH4ZJpxA9GVSIXWnwqmoYx6tk/JL+2H54ovBwMfEH+I55genyJ
	Q2YoIew+XpV+wQ38hPNvT32jFOsu9aTsY6KekRcOm4EUF9UMJ+FWfU4cKphlkA==
MIME-Version: 1.0
Date: Thu, 20 Oct 2022 12:46:33 +0200
From: Michael Walle <michael@walle.cc>
To: Eliav Farber <farbere@amazon.com>
Cc: tudor.ambarus@microchip.com, pratyush@kernel.org,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 talel@amazon.com, jonnyc@amazon.com, hhhawa@amazon.com, hanochu@amazon.com,
 itamark@amazon.com, shellykz@amazon.com, amitlavi@amazon.com, dkl@amazon.com
Subject: Re: [PATCH v3 1/1] mtd: spi-nor: micron-st: Enable locking for
 mt25qu256a
In-Reply-To: <20221020092058.33844-1-farbere@amazon.com>
References: <20221020092058.33844-1-farbere@amazon.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <d91e3d91f085390d5dbe0c4415c9e37f@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221020_034640_143413_DB8FA93F 
X-CRM114-Status: UNSURE (   5.76  )
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

Am 2022-10-20 11:20, schrieb Eliav Farber:
> mt25qu256a [1] uses the 4 bit Block Protection scheme and supports
> Top/Bottom protection via the BP and TB bits of the Status Register.
> BP3 is located in bit 6 of the Status Register.
> Tested on MT25QU256ABA8ESF-0SIT.
> 
> [1] 
> https://www.micron.com/-/media/client/global/documents/products/data-sheet/nor-flash/serial-nor/mt25q/die-rev-a/mt25q_qljs_u_256_aba_0.pdf
> 
> Signed-off-by: Eliav Farber <farbere@amazon.com>
> Link: 
> https://lore.kernel.org/lkml/20221019071631.15191-1-farbere@amazon.com

Reviewed-by: Michael Walle <michael@walle.cc>

Thanks,
-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
