Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37CDDECAAA1
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Sep 2022 07:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aEysaL/IPTSDeFqt5o3YK+2YPW01fvIBvyQhlb46Nu4=; b=bnH8HLG07r4gny64HxM/SNa8Do
	CbaoA7p6rTq4FLWQoVK85lQzI0ElyXSILy8x++uPZ0eYRzz8T5R3fAPRTO5SbudwPStkPIdw0j5SY
	fFDyT2oTj/xhnXT4KfZ5KPEgHFlO46mi+VTk8qKp7GjinQOj4E22kUkmwsbJCU8N7zqTIcylkuj5B
	dHq98weCMtkXAfyD3YUcdP/I03JuW+P6I+gdRpbHJXNGrrspSrPV3w2/zf6mhXHE0ZQHfqN9yr9PJ
	AD/K+IJDbXbDG9AF0TjMRX60vBt7AkZVCYK+9TPvCl4J0qA2LM7pKlzAR5PqoG3FAOAaYl49vDbvb
	6XCxvuKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU15W-001HWN-Aj; Fri, 02 Sep 2022 07:27:38 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU15L-001HSG-Lq; Fri, 02 Sep 2022 07:27:29 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id EAEE29B1;
	Fri,  2 Sep 2022 09:27:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1662103645;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZJHIUEiaDxr5x68L1+nV//9ggio2BTDcp2LsqHnXyjU=;
	b=h29H5dKn4/ohrnbMIIpMwikONwmOwdeRXiytcnTV4n//wU4QXqRNv1l/avf3Qy6VV1MGwb
	ws1jBsL/b3BIY2d5zpQiRSzQv+Tn5m//yi0JB/WzZEPw4aqX3Hwqn6qvwj3nvv/JgHnPcE
	qmf0Oy06Sy8NT7CtCdFNp/D0UT+MPTgdpWDX/jyreCWty410iRBdz+rVa007o1MFOZtAql
	D9sm6lh3XJ2MrqsBSAHuECoa5GTyV+5j7hCCa2dlLZCixUtYZkpd4xfaeEKibSO1gu+L0f
	vmAq6pnF2xFTTVpg4UO0VCSIcDin6NxMV20x0qEET+A8XhLiid8VD1jvjYmH4Q==
MIME-Version: 1.0
Date: Fri, 02 Sep 2022 09:27:24 +0200
From: Michael Walle <michael@walle.cc>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Srinivas Kandagatla
 <srinivas.kandagatla@linaro.org>, Shawn Guo <shawnguo@kernel.org>, Li Yang
 <leoyang.li@nxp.com>, =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?=
 <rafal@milecki.pl>, Frank Rowand <frowand.list@gmail.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Ahmad
 Fatoum <a.fatoum@pengutronix.de>, Philipp Zabel <p.zabel@pengutronix.de>,
 Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH v2 01/20] net: add helper eth_addr_add()
In-Reply-To: <3b86cb68-2b30-76dd-baf5-90af0b0a60a4@infradead.org>
References: <20220901221857.2600340-1-michael@walle.cc>
 <20220901221857.2600340-2-michael@walle.cc>
 <3b86cb68-2b30-76dd-baf5-90af0b0a60a4@infradead.org>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <6fdadf867ed6ce4cdfe3f4b61e1de8be@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220902_002727_906211_D6AC9E6C 
X-CRM114-Status: UNSURE (   6.31  )
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

Am 2022-09-02 01:22, schrieb Randy Dunlap:

>> +/**
>> + * eth_addr_add() - Add (or subtract) and offset to/from the given 
>> MAC address.
> 
>                                          an offset
> ?

yes thanks, I'll change that in the next version.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
