Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57A0DC47077
	for <linux-mtd@archiver.kernel.org>; Sun,  7 Jan 2024 07:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:In-Reply-To:From:References:To:
	Cc:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0XYSpN5J3hJdcothGtShzf1y9MibvUOGsl+sIvbSv+Y=; b=s8wD9L2El8pc3g
	+f01U2sl3DmZDGiGRIxyH2RyBDu33YJAfN2Fytjhcee36s1E2kt9KI5Q2dQTQofazq4p2FUCv2vvL
	vwEPncqJCbKYQBVtn0w83M9uyGnfeyPB3OcxLrP791ACzd04CN+10pGhkzO0RFxMbFvNN+9h4+5TP
	mI6Gz84w02lEpBjV5j2hU/rt6K/Jod2LnPMs8ayFHhQJo18jv5DuymM5B1L+dQeaOUhxjjm2DrCEq
	vTwvAhmQsthvX7baYbtRrnqTZfLTMIkFI6bD/W9brkTgbAyEUDKIr9MoygGCUGxhbYUAat3t4qFDV
	6XG/690P2Z/hwytoTw3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rMNyC-002bKq-37;
	Sun, 07 Jan 2024 07:53:20 +0000
Received: from mailserv1.kapsi.fi ([2001:67c:1be8::25:1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rMNy9-002bKD-01
	for linux-mtd@lists.infradead.org;
	Sun, 07 Jan 2024 07:53:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ext.kapsi.fi; s=20161220; h=Subject:Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:To:Cc:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=m6g9iLOnpGv4IVL+V7tSobgbhGx3fTVvhxm26BC+2rw=; b=p1x+pJ6SRhlNAI8W8siDslzh1p
	QtwjnWHdwtj5Kf2nbs2xJVqpVGvZXLM6QkTwJyCTm+bbc9SyVzGpKs+6y4sQcv0FQ9eO/rBgoGin8
	0/fJQgjPaSFrpTgp19oGw4aOlfSC/E1ROL66OedSHoL9Gc6m64XJDdCa0msLqMTYmx3r9Ypgi+MYW
	YZXA/gYD4kAxm6Mg/eLheE0q4WXCs048Znm6vHw9ou9FqZ4gp9z6V1cRwL63K12mizm2nAH8TVkGu
	C/zUgftyjemh1PQXKb8/J/IkL5ZN5cKzGprVSqGTOzfU5G/DUaalYjuM4mZMco9a1AvTDCrIvA4C/
	R447HMLQ==;
Received: from 89-166-32-214.bb.dnainternet.fi ([89.166.32.214]:61658 helo=[192.168.3.116])
	by mailserv1.kapsi.fi with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <maukka@ext.kapsi.fi>)
	id 1rMNxy-007TKJ-0n;
	Sun, 07 Jan 2024 09:53:06 +0200
Message-ID: <bab7fbe2-384e-4a52-92a6-2aabc9f69dbc@ext.kapsi.fi>
Date: Sun, 7 Jan 2024 09:53:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: Mauri Sandberg <maukka@ext.kapsi.fi>,
 david oberhollenzer <david.oberhollenzer@sigma-star.at>,
 linux-mtd <linux-mtd@lists.infradead.org>
To: Richard Weinberger <richard@nod.at>
References: <20231229135653.4764-1-maukka@ext.kapsi.fi>
 <fbce5a93-c3b8-45f4-9698-c76838ac5fea@ext.kapsi.fi>
 <1214686551.202632.1704536161145.JavaMail.zimbra@nod.at>
 <022816c4-7afd-4bd9-80a7-6bd5e9e0edd0@ext.kapsi.fi>
 <1464457733.203332.1704554608470.JavaMail.zimbra@nod.at>
Content-Language: en-GB
From: Mauri Sandberg <maukka@ext.kapsi.fi>
In-Reply-To: <1464457733.203332.1704554608470.JavaMail.zimbra@nod.at>
X-SA-Exim-Connect-IP: 89.166.32.214
X-SA-Exim-Mail-From: maukka@ext.kapsi.fi
Subject: Re: [PATCH] mkfs.ubifs: Add option to minimize the amount of LEBs
X-SA-Exim-Version: 4.2.1 (built Wed, 06 Jul 2022 17:57:39 +0000)
X-SA-Exim-Scanned: Yes (on mailserv1.kapsi.fi)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240106_235317_695623_75413228 
X-CRM114-Status: UNSURE (   6.99  )
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



On 6.1.2024 17.23, Richard Weinberger wrote:
> Hm, I gave your patch a try. As soon I use "-M", the resulting file system
> does not mount. No matter how large the UBI volume is.

You are most correct here, it does not mount nicely with the '-M'. On
the other hand the minimal filesystem produced with, say, '-c XX and -l
2' does mount nicely as rw too. So in theory this could work, the
solution just was not that simple.

I'll approach you with another version should I get it working. Thanks
for your time. :)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
