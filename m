Return-Path: <SRS0=qOpI=IG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26419C433DB
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Mar 2021 09:55:41 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B43E964FB8
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Mar 2021 09:55:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B43E964FB8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=i6PoN27Xt1zz1fsKJW9plIBZpdz0cBss28TDvFvV4fs=; b=NZuDAcbspnEOOyYHS6v1gBD9I
	jRXZKa2gLzDGQu2wIMwn4z8ofXxGbGBWnqW1XSvuQVsbNuOCuJTdzWmz1teYE0CjI+t35rFA16qLi
	DXGymYrgGVPXqUU0TcWe9DkW1loa5vdG/OWGclAOPFHRk289wZXPgJbJEJ+QUS2XTBGF756J16FLv
	/QiAKBMZL1pQa8E+RnKj2YlCBSIQg5ahTbUqqHgkg5O1qDeGuItrETdRfq59J0oGOyN/dxOTAPSdX
	1nqrcU8tvr/JKJUtIIWGxfi1RZHz6uPQeG22hqGjCSYHJR6h3s6kK89eIZBwhYpeFUHpDCo4C2Bhr
	CdOfGVrbA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJCax-00GHrb-S4; Mon, 08 Mar 2021 09:54:35 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJCas-00GHpo-3g
 for linux-mtd@lists.infradead.org; Mon, 08 Mar 2021 09:54:33 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id D819622246;
 Mon,  8 Mar 2021 10:54:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1615197269;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Mvygtkil7ta1nozc09CcL7f9MLw8A5Zp+hHf8eHw7v0=;
 b=Ye/rqwKUxNumwFtS7Qw0eWMlNbKg02NQEwnkqh6XRnIQxigDXjBotwb6MkmQ6mvMQ1h6Ye
 7ch5bpimuMjVl1eYIMgC4/vSuq7God5Q48m4dUZ7X9UbnMTooanMqiPhBxgnjX80nkrIyy
 A5qEh8B6MpeBInvZIJQ0e/Y6bEz0pNg=
MIME-Version: 1.0
Date: Mon, 08 Mar 2021 10:54:28 +0100
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
Cc: p.yadav@ti.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com
Subject: Re: [PATCH] MAINTAINERS: Add Michael and Pratyush as designated
 reviewers for SPI NOR
In-Reply-To: <20210308092333.80521-1-tudor.ambarus@microchip.com>
References: <20210308092333.80521-1-tudor.ambarus@microchip.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <87d94fa3b49a568f2c20ebcd9f1ab935@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210308_095430_677548_1D296949 
X-CRM114-Status: UNSURE (   7.13  )
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

Am 2021-03-08 10:23, schrieb Tudor Ambarus:
> It's already been the case for some time that Michael and Pratyush
> are reviewing SPI NOR patches. Update MAINTAINERS to reflect reality.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>

Acked-by: Michael Walle <michael@walle.cc>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
