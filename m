Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92F2BC433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 13 May 2022 17:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hFK/BUKeTJinDCGXrjTsVI2/3aE1YQlYRIlgCL0Hlsk=; b=FUjfYxOTC3WNoagIRs3yvaQUjV
	VPCPU9CHs5SN596n2n3U43TGg0TdQjyoKQnTquu9Dh2QpJJm62xUkamkjJjYe1ae9kIn8VUT8ny3J
	SxehRvwRja64v0dWpVl3Zya++NJeGW2gbpQ++knSAjbBJljexk4iehqTy5i5XkTiH0BxA6qF+Jhij
	YQj/vSGf0ANkfDRa6bjho1TR5p01lNkAXUyZ3S5BR4Eie9PPYIYkNPBeJ27sXS9WDof1U0SBOIR1K
	KkqcH1+OwD2o8dVD1zr0Wo9SAj3e2wPWITEh2c6imStFvHzqyoxcHqM/qS9gcXxbTgVlrnSOi6aDN
	W86D4Z8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npYzL-00H3ox-SD; Fri, 13 May 2022 17:22:03 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npYzH-00H3kp-Jd
 for linux-mtd@lists.infradead.org; Fri, 13 May 2022 17:22:01 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 0374D221D4;
 Fri, 13 May 2022 19:21:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1652462513;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QMV8VRxmSptJXLRk6YRt/p7jiW7WuIAN+Y3frdH9Rt0=;
 b=eWYiklEo44ZYsfC1Bt+l2zVQZYk65FzJe5tSi1A3/ClC5oZi7njpRcslmOah4tktSnm9Y2
 ePVWvTK+XECyPeTripAfD5pIt7w7RZkRTqW/B5oSt1cyWar6GVKK7W2lelWSibH5kZI0Kj
 Y6PTTjgbhOEWd/aO5ZNigpAOjhPDl2o=
MIME-Version: 1.0
Date: Fri, 13 May 2022 19:21:52 +0200
From: Michael Walle <michael@walle.cc>
To: Alexander Sverdlin <alexander.sverdlin@nokia.com>
Cc: linux-mtd@lists.infradead.org, Tudor Ambarus
 <tudor.ambarus@microchip.com>, Pratyush Yadav <p.yadav@ti.com>, Miquel
 Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: spi-nor: Support Dual and Quad Read on Macronix
 mx25u25635f
In-Reply-To: <d59ec4e0-3bce-2b44-1fc5-54a26fe77c7f@nokia.com>
References: <20220513094759.44185-1-alexander.sverdlin@nokia.com>
 <34eccc66cc75dd0ffbf8a77780b6f8a7@walle.cc>
 <d59ec4e0-3bce-2b44-1fc5-54a26fe77c7f@nokia.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <a6515b6d3c790be8a66f30069a05df56@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220513_102159_831203_DF67CC5C 
X-CRM114-Status: UNSURE (   8.89  )
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

Hi,

Am 2022-05-13 18:09, schrieb Alexander Sverdlin:
>>> According to datasheet both Dual and Quad Read is supported. The read 
>>> test
>>> shows x3.8 speed gain.
>> 
>> Does it have SFDP? Try adding PARSE_SFDP instead of the
>> NO_SFDP_FLAGS.
> 
> Some issues with its SFDP were known:
> https://patchwork.ozlabs.org/project/linux-mtd/patch/1492068234-9509-1-git-send-email-dev@kresin.me/

That doesn't seem to be the case for your flash. The quad and
dual flags you've added, will enable SFDP parsing anyway. So
instead of adding these flags, just adding PARSE_SFDP should
work, too. We still have to keep the SPI_NOR_4B_OPCODES.

>> Please post an SFDP dump of this flash [1].

Thanks.

>> xxd -p /sys/bus/spi/devices/spi0.0/sfdp
> 53464450060102ff00060110300000ffc2000104100100ff84000102c000
> 00ffffffffffffffffffffffffffffffffffe520fbffffffff0f44eb086b
> 083b04bbfeffffffffff00ffffff44eb0c200f5210d800ff8749b50082d2
> 04d24403673830b030b0f7bdd55c4a9e29fff050f985ffffffffffffffff
> ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> ffffffffffffffffffffffff7f8fffff215cdcffffffffffffffffffffff
                           ^^^^^^^^^^^^^^^^

That's the 4BAIT table.


> ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> ffff002050169df9c06485cbffffffffffff

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
