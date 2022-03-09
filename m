Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1322EC433EF
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Mar 2022 10:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J4An5LuS0bq1n8TYzdpc2tiNUwODVi+zvT9ouO2GhrM=; b=sQ3tynnOm/mBl6
	05hxb1yNJHfabgXGxAhJVM/lHKT4stFgUfuMCnIeikSpOh5rAQE4vRFOCS/aD9r1vapFRcWiWlXg9
	QIazlvmYw6/ws1h+VJh7rTLz8saV1Nwv935WzrViPITcJ/cZMPO62HaaWiKCpSkJJ4iIS2aZQMhXj
	oboeCgBrlXesjVfkXtJFXA8xLuvYQ/DWBh8Cvifgkx5y7FUhvyiMvbrpnsgIDA7tIH5S0zFgwDx5M
	SmqopColzqERr1LRem2Lrf+6QNmKpmTyIgUYMTaUSRPjRlbHVv/DCqCOX8SO+JaOLa2NV2aGW+8li
	GlLg5tn140N9S+qa7RdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRtZb-0089JM-4Z; Wed, 09 Mar 2022 10:29:39 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRtZV-0089IO-Da
 for linux-mtd@lists.infradead.org; Wed, 09 Mar 2022 10:29:34 +0000
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[127.0.0.1])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <a.fatoum@pengutronix.de>)
 id 1nRtZQ-0001XY-T6; Wed, 09 Mar 2022 11:29:28 +0100
Message-ID: <c6856ab5-6a83-5eb2-ca59-745e63fd842e@pengutronix.de>
Date: Wed, 9 Mar 2022 11:29:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v2] mtd: cfi_cmdset_0002: Use chip_ready() for write on
 S29GL064N
Content-Language: en-US
To: Vignesh Raghavendra <vigneshr@ti.com>,
 Tokunori Ikegami <ikegami.t@gmail.com>
Cc: linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>,
 Pengutronix Kernel Team <kernel@pengutronix.de>
References: <20220306153213.411425-1-ikegami.t@gmail.com>
 <90374ffa-0fe6-dada-32b2-445854125b11@ti.com>
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <90374ffa-0fe6-dada-32b2-445854125b11@ti.com>
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220309_022933_495028_40A60FDB 
X-CRM114-Status: GOOD (  16.86  )
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

Hello Vignesh,

On 09.03.22 09:17, Vignesh Raghavendra wrote:
> + Ahmad (who reported the bug)

Thanks for Cc'ing.

> Hi Ahmad,
> 
> On 06/03/22 9:02 pm, Tokunori Ikegami wrote:
>> The regression issue has been caused on S29GL064N and reported it.
>> Also the change mentioned is to use chip_good() for buffered write.
>> So disable the change on S29GL064N and use chip_ready() as before.
>>
>> Fixes: dfeae1073583("mtd: cfi_cmdset_0002: Change write buffer to check correct value")
>> Signed-off-by: Tokunori Ikegami <ikegami.t@gmail.com>
>> Cc: Miquel Raynal <miquel.raynal@bootlin.com>
>> Cc: Richard Weinberger <richard@nod.at>
>> Cc: Vignesh Raghavendra <vigneshr@ti.com>
>> Cc: linux-mtd@lists.infradead.org
>> Cc: stable@vger.kernel.org
>> Link: https://lore.kernel.org/r/b687c259-6413-26c9-d4c9-b3afa69ea124@pengutronix.de/
> 
> Could you please test this exact patch and provide Tested-by so that it
> gets registered by patch tracking systems?

Tested-by: Ahmad Fatoum <a.fatoum@pengutronix.de>

Thanks,
Ahmad

> 
> [...]
> 
> Regards
> Vignesh
> 


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
