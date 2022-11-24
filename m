Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 590D1C433FE
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Nov 2022 12:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Z/1wJqqUpFQ5rAuEuc5DBLfeDfN+c6M1OcgrjqgP9s=; b=Ds3DLcM8FyrTZDyxvruMGgc/JX
	nqDoRnyzH+SH3SX7/O8RNwk8A7rsGCnAVoxWt72JCB1jNsbkBJQUtYufuOqpDR7fhjOSVfKFPLkVa
	z/Q8rVQCn9BUgVvFMZoyKZq6e9yTSfg6l5ZFrKSUcAXXOsAdn6BdMwbsSqOVDv0zfp2OcXWXp6Toc
	4Ik7TXH6UKCwvn9IpWTtMni0Ie5+7CAlCEwmXN5PWAXQwfsozbxLxF/9BOzIRZqVZafNX5mGiaGz1
	bsyTPdQ8QbqxhtflRRzfG+I5sWunCT51Pv6K/fu4sBg6J572uYV+nRqNtAk9sQP0Pj/tX9mGTyUNc
	gt5kN6lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyBiW-008Uws-Ci; Thu, 24 Nov 2022 12:52:37 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyBYr-008PYU-U6
	for linux-mtd@lists.infradead.org; Thu, 24 Nov 2022 12:42:40 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id AECD3230D;
	Thu, 24 Nov 2022 13:42:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1669293750;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RZKIn1cANNx+S4Yd+waIX76jsdNjbQtyrqMrAFlCrOw=;
	b=k+FOs5psBNiw8LVp3JHliZBh0Q/Id/T74+a4pqlWLf/8bdxQZWjW+VH5tLHLpKfammqHqc
	e0/9gu3bDuhRVFBHtFE3PXK3w95kH2u4Qen6ZLr9x4YTEy0H/ePs2NWEtZaZgUVR6Dfw+n
	2Ug7k8WCrwmMkb1binZhbOHMkKuoyp1bKNcpg+/wrpSvy4LUmkrwhYsRU7B9ItHMciufnk
	xK12tmh2BU1VIN6XpIgznFvMljGJCWd03wKM5N1zVwJn87kW0QYyKN6y17jsgrB57z87Nh
	fnIJV+Bi9GpRW6iTieU0lbulrzZVel7/rpcv88v7ST4zW5BozcnBun3ZwYlMSg==
MIME-Version: 1.0
Date: Thu, 24 Nov 2022 13:42:30 +0100
From: Michael Walle <michael@walle.cc>
To: Nathan Barrett-Morrison <nathan.morrison@timesys.com>
Cc: greg.malysa@timesys.com, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 pratyush@kernel.org, richard@nod.at, tudor.ambarus@microchip.com,
 vigneshr@ti.com
Subject: Re: [PATCH 0/2] These are the required patches I found while adding
In-Reply-To: <20221124114713.132514-1-nathan.morrison@timesys.com>
References: <bb6c006a27184ffa0e4ab9303cffcc72@walle.cc>
 <20221124114713.132514-1-nathan.morrison@timesys.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <d812e89c0c8d00f0043463dda241ece5@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221124_044238_402714_A7C828C6 
X-CRM114-Status: GOOD (  13.93  )
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

Am 2022-11-24 12:47, schrieb Nathan Barrett-Morrison:
> Ah yes, I just realized we're effectively using the device in 1S-1S-8S
> extended SPI mode, so the 0xC7 setting is probably not required.  We
> were never able to get DTR mode working on the IS25LX256. I can fix
> this patch up so it's more explicit about what's going on here.
> 
> The 8S-8S-8S support in core.c is still going to be used for another
> OSPI device I'm porting over from an older kernel.

Can you link a datasheet? The problem with 8s8s8s is that it needs
mode switching which can be footgun. And IMHO it doesn't provide
significant performance improvements over 1s8s8s.

> Would you like me to separate these patches, fix up the ISSI once, and 
> resubmit?

Yes please. Also, I've seen that you use flags in the flash_info table.
Please have a look if that information can be deduced from the SFDP. 
E.g.
does a flash describe if it supports 1s1s8s.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
