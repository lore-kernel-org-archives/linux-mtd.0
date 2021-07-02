Return-Path: <SRS0=pn6g=L2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A409C11F68
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Jul 2021 13:54:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30A94613FA
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Jul 2021 13:54:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 30A94613FA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EMYPGILFuGRDXBURS/pmJ57faBe7l1Dz1RI4qfFRxz0=; b=AV9WnXup2vvqQpTTO6xi7hYfqZ
	6ECvcrwozauzANVvHngmQPpO6fv+/BAWCpzoARyyOY9hSL/yQdIsXA/nRS14PvTwLWQOwqucUdOdi
	GJQfFsJR/NELnwLLAW0K/oJSDLkrTFnAe9GlQ5+ccAKz5ki9551+qOptDy/iGaIc5wXg0uYLSYu6n
	KNCMG8BgFg1rNbaXhxjU5rg2F+3yeYa3kJombyLePDx0qTpXCZv6l/yJIiXMgQcUGYnp3FFym/g6h
	zXN2Yg5NqejAi+sSf4iIAJuc7iQppo5fq/xpWA0Q6xNf5Smi1YzOgKc3thLhYCqWhQNriyxioJ7bh
	OHaDFwOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lzJcD-003D1P-Ez; Fri, 02 Jul 2021 13:53:57 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lzJcA-003CvN-0p
 for linux-mtd@lists.infradead.org; Fri, 02 Jul 2021 13:53:56 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 094332224D;
 Fri,  2 Jul 2021 15:53:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1625234030;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6sLZmtTJ3lZ2BT+RPe8crlPHg3GfiEiEEdvrAfSxeA4=;
 b=n+cG1Vrb2yzW+YE4YEpsLUO4bbKOajH4Ey5GZpsbQbOw84kGySHlVpiYv8qxSt9Xi1mz1M
 q9nzU2sujMQihJqTHoLInJ2dy9Sd9RmWfejCKy+Iwuq0miNortKFRCnnrZuSQ2RTGQLyeV
 nAoXimI42zXfMW0B6VrjU1b8F7/F3x8=
MIME-Version: 1.0
Date: Fri, 02 Jul 2021 15:53:49 +0200
From: Michael Walle <michael@walle.cc>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, Miquel
 Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH] mtd: core: handle flashes without OTP gracefully
In-Reply-To: <499cf369-c98a-ac48-dfe6-6903314e9606@roeck-us.net>
References: <20210702093841.32307-1-michael@walle.cc>
 <499cf369-c98a-ac48-dfe6-6903314e9606@roeck-us.net>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <ae770937ec2ddf12b294fbee3d815dd4@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210702_065354_813986_F754543F 
X-CRM114-Status: UNSURE (   7.85  )
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

Am 2021-07-02 15:49, schrieb Guenter Roeck:
> On 7/2/21 2:38 AM, Michael Walle wrote:
>> There are flash drivers which registers the OTP callbacks although the
>> flash doesn't support OTP regions and return -ENODATA for these
>> callbacks if there is no OTP. If this happens, the probe of the whole
>> flash will fail. Fix it by handling the ENODATA return code and skip
>> the OTP region nvmem setup.
>> 
>> Fixes: 4b361cfa8624 ("mtd: core: add OTP nvmem provider support")
>> Reported-by: Guenter Roeck <linux@roeck-us.net>
>> Signed-off-by: Michael Walle <michael@walle.cc>
> 
> Tested-by: Guenter Roeck <linux@roeck-us.net>

Thanks for confirming, and sorry for the inconvenience.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
