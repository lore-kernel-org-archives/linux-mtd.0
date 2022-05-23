Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43C5AC433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 23 May 2022 17:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lZuUEU929g97aigrFSVUKnUv0yKBCkYnp7L7A936YiA=; b=mKEKvla7qggi0tT0VPKkRjWh/i
	X8Q/Mvg8KOfRoqWNhNDctps8qdDDDduHH7bEB+X01HwF+zh0f9UB6jY05OsaxyEOsvtpqTitm065r
	noeGIWRIbNus56y55uAM3AwhTFb7RBfPL1/izK8eRZ/ZfpmZhs44OKFLHYMLbWg9MAQ3iCei59qVt
	2m7Ti/aZt77rg96EB0eyG4q8CByli7xvBjGb7p7puKE6S5hoJypjVkVElBFzok7G6ZxRyfsebKLUh
	Kjxs9qxPu7XwbyNvdKcDpYdz+/QypyyE2Qv56s4xa1xIoIGTPh2IkFrI8XiZX2kLzwtp8jkEtrZcV
	+cOpBVRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntBUG-005JIv-Kj; Mon, 23 May 2022 17:04:56 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ntBUD-005JHY-HT
 for linux-mtd@lists.infradead.org; Mon, 23 May 2022 17:04:55 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 65E722223A;
 Mon, 23 May 2022 19:04:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1653325485;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jb6PERdk6i9UFuOnXNXUP3rrDZ8XeDfZdaGqhadGnCU=;
 b=Ih5AmYm8o1wIkM6kcDHNAbqqH2sSuEv1mYQKGBnAgUS3MHS26G0HujQQ36/S8RVWPFcfSn
 Vq2LBEL+oL6sqFXVRAU8YnD4c0yakjpr3QdQBeJsSswrm4md5PdEEhXdN9QSoBajQDiaDT
 iRdpv9dd8Sv7E5C/cEz5vIjYFlY13jk=
MIME-Version: 1.0
Date: Mon, 23 May 2022 19:04:44 +0200
From: Michael Walle <michael@walle.cc>
To: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
Cc: linux-mtd@lists.infradead.org, Tudor Ambarus
 <tudor.ambarus@microchip.com>, Pratyush Yadav <p.yadav@ti.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] mtd: spi-nor: macronix: Add support for mx66l2g45g
In-Reply-To: <20220523150334.1758649-1-jiaqing.zhao@linux.intel.com>
References: <20220523150334.1758649-1-jiaqing.zhao@linux.intel.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <e310ab2100f459346ae6cfa77c9ada19@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_100453_780271_4DEA668E 
X-CRM114-Status: UNSURE (   7.42  )
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

Am 2022-05-23 17:03, schrieb Jiaqing Zhao:
> Macronix mx66l2g45g is a 3V, 2Gbit (256MB) NOR flash that supports
> x1, x2, and x4 operation modes.
> 
> Tested read/write/erase with Aspeed AST2600 BMC SoC operating in x2
> mode at 50MHz, using Aspeed spi-mem driver.
> 
> Signed-off-by: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>

Reviewed-by: Michael Walle <michael@walle.cc>

# is this picked up by b4? link goes to the sfdp dump
Link: 
https://lore.kernel.org/r/2b859cff-2403-0526-f3ae-749920b3fd8b@linux.intel.com

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
