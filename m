Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B23BC43334
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Jul 2022 07:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nIYIUV4WBX3jUL/MtqTZP/BbwpcnL9Wtna4SyVwOgM0=; b=E4Z0ADOsW70wvjpUs0Pn4TcLmP
	vVxpkvhWzaMjwIO3+ycGtqgl4vm36eybbf6EN2Ai9RU94Xib1dCVryzZRqDkd335EYOJZ+xo7tF8y
	GNrwvhDC7GeN1FWor/6EhCopNvcMCQQmAn4Whnpv4z/yqwH044lhq/iFj0C1wnf898n/79Lxs2LbI
	2m5keWaibnKA5i7wKpbVd0VOB+XKpO+4h+10YCRha9W4MaJkwi2ilHiVgZmm6D8R9w2V7QJHueiUM
	tXpRFTgwAobkypxp/Vo0zBt1TnJTK42VRIBZ2BloWTKTEmTT68fEMBZAKK9mkk9ZO1ESABfwUVlM7
	BzxyHGzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDL4n-00BS3a-S0; Mon, 18 Jul 2022 07:21:57 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDL4l-00BS2S-Gx
	for linux-mtd@lists.infradead.org; Mon, 18 Jul 2022 07:21:57 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ssl.serverraum.org (Postfix) with ESMTPSA id 3C8A72222E;
	Mon, 18 Jul 2022 09:21:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
	t=1658128912;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NASt9wxN6DuJH9tMOB2+yU3AYq+oeIqH6OCgUY+ZBlc=;
	b=Vl4yPRBiYvVL/zTJ8WRUdsBu8wqWtEb7m4tYyUpayM9E3juj1eTAzFqPg68qMBLZP+lzQQ
	Tzgand/7yPejFYX83bZg4Pyv1ARJXXU/RkJF0OulOFv3MSnpHTDSQvGR1o1d20gr2Oxeyq
	Cd6PtbcqKTLPUneA5bC67ex9QtbkGxc=
MIME-Version: 1.0
Date: Mon, 18 Jul 2022 09:21:50 +0200
From: Michael Walle <michael@walle.cc>
To: Tudor.Ambarus@microchip.com
Cc: p.yadav@ti.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, quic_c_sbhanu@quicinc.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] mtd: spi-nor: winbond: use SNOR_ID3() for w25q512nwm
In-Reply-To: <735a88af-c4f1-a6b3-3f85-ea532b3f39c7@microchip.com>
References: <20220510140232.3519184-1-michael@walle.cc>
 <20220510140232.3519184-3-michael@walle.cc>
 <735a88af-c4f1-a6b3-3f85-ea532b3f39c7@microchip.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <5d3af3ad552a00913ba1bc50707e257d@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220718_002155_746254_343A2194 
X-CRM114-Status: UNSURE (   8.49  )
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

Am 2022-07-12 10:40, schrieb Tudor.Ambarus@microchip.com:
> Shaik, can we have your Tested-by tag on this?

This will need the following patch to work correctly:
https://lore.kernel.org/linux-mtd/20220716000643.3541839-1-quic_jaehyoo@quicinc.com/

But other that that, the SFDP data is exactly the same
as in the w25q512nwq, except for the "hello world" string.
But that string is between the header and the tables in
an unused area and I suspect it was accidentally written
during OTP testing as it happend with the w25q512nwq, too.

So this should be good to go once the w25q512nwq is merged.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
