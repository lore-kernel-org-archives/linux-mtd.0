Return-Path: <SRS0=wahI=PK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A5C1C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Oct 2021 11:58:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3474F610D2
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Oct 2021 11:58:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3474F610D2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5+daHwfanin4o/qX6pHbZhNpSgUHWD6s5mEnTOdVp/o=; b=y7n6DyfWgJNhONTAwMLiPd4aoQ
	wxaNrK5Gym0Yn0i5NgBAyw0CAK77xq7OTf/O3L3JNb+13S1OCEt/NA8Upt3R26AnIJvkzTwxHKolJ
	vaQcPJcAAz6sUsI1PgSst2Yx8ZctOKRbVqerweLcZBXXcz3HB/ZhO9NilACUYYLH9JXKjCFo/Xllc
	8BFqKQrEv3SJk/YVxq7RsbZJezoppOM3wC1fwe8nt1Gv7QWywjBFamT3d5A71aM3NRXbv4NjtPIAS
	NtfQhAAhngTQPxJyyAtAROGx3U2G+hqPImL3enr5dO0lk/4M3NA6YPmN3/WboLNy6nZOz10GBmrPa
	chlktOMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdtBH-00Aj0x-M6; Fri, 22 Oct 2021 11:57:51 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdtAa-00Ail9-Eg; Fri, 22 Oct 2021 11:57:09 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id C7A20221E1;
 Fri, 22 Oct 2021 13:57:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1634903826;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rVq4Nn9QQHD7FF1qA/ZE0zKR/835zr5tN2rah1ugoao=;
 b=I8tIl2vNXiYf1s5rlQtpgzyTR7oBTOm3t6D52XRjxUUAlvpcTfRIrAQPW0hpvjsxLsruKl
 sr6UqtHlymRuVT/A8R+q4kgO9w1AU4kq/7jtD/jCYtoIOHPgjHsfjmPh7G9lYIY6ruk/6u
 Ljb04o88Wep2HxiizGP6/ebi4OvR5Lk=
MIME-Version: 1.0
Date: Fri, 22 Oct 2021 13:57:06 +0200
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: Re: [PATCH v2 22/35] mtd: spi-nor: core: Use common naming scheme for
 setting mtd_info fields
In-Reply-To: <20210727045222.905056-23-tudor.ambarus@microchip.com>
References: <20210727045222.905056-1-tudor.ambarus@microchip.com>
 <20210727045222.905056-23-tudor.ambarus@microchip.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <4c0ac0a3efa3075e77260185767c8554@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211022_045708_710317_5F927C07 
X-CRM114-Status: UNSURE (   6.21  )
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
Cc: macromorgan@hotmail.com, vigneshr@ti.com, jaimeliao@mxic.com.tw,
 richard@nod.at, esben@geanix.com, linux@rasmusvillemoes.dk,
 knaerzche@gmail.com, nicolas.ferre@microchip.com,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 code@reto-schneider.ch, miquel.raynal@bootlin.com, heiko.thiery@gmail.com,
 sr@denx.de, p.yadav@ti.com, mail@david-bauer.net, zhengxunli@mxic.com.tw
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Am 2021-07-27 06:52, schrieb Tudor Ambarus:
> The functions names are self explanatory, get rid of the comment
> for the OTP function.

Mhh. I see, this partly addresses my comments to the previous patch.
Maybe it would have been better to have this squashed into one
commit :p

But my main concern remains: what if we need more that just
the mtd callbacks assigments. Basically we loose the otp_init()
call.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
