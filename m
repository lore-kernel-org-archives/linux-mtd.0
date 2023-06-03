Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00556C7EE29
	for <linux-mtd@archiver.kernel.org>; Sat,  3 Jun 2023 00:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kEtXeCp1vdPHplR/G/QaHQk47uOV2BWwjfbWqxJWFLk=; b=t+X63up55meVcH
	AgdyhFY+wbqhVoHEVWNAq3ztW9B0FAQLD4UlsCRfETNdZSoaqAXgXi4pn+bWY8pjZTcV9ZkBtzJiM
	261aAxxw64IiC5IhVzcSe4xEXZkim3TywHLhkjld3tfE+U5EkjTGo0TfUxoLkok74l4KNata6p2dU
	++dJim5wI9gUBK0tRiGJH3Wk4QG1mOTcYquA2Qcj7OJYp4y1LBL1Lk49/edykIjxLBWVT0UWMyuTy
	UY2xv3ixVHltaoveWFbU/GN8YCuO4lpr24Lpxr9YVL/L8Jxhh2oIxIhj71+7dkMQhfkGhdcLVFH4W
	sxeVAt+YjM/+fnxZW1nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q5EvW-008FO5-1M;
	Sat, 03 Jun 2023 00:15:26 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q5EvS-008FMS-2y
	for linux-mtd@lists.infradead.org;
	Sat, 03 Jun 2023 00:15:24 +0000
Received: from [127.0.0.1] (nyx.walle.cc [158.255.213.36])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 122A2102;
	Sat,  3 Jun 2023 02:15:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1685751315;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Dse3uBwknFWk6pPKL4cxQOJ3Qeh0WqW0rpY9QEi+cjg=;
	b=L9XkY24PzEJ6XOJBYkyez+8seHdJVyeu7Ce1FawojyDGUGDBOt7A7b2EENrG6ZfdZAcv/g
	vQbB+y8tXSAf/e2I7EC5An3zhgRQTqUMfwynPXJTYl3ci/uXTuEA3cZj+UZIbcrVcDBt/1
	yR/r7jX+EincIVPYMH5xitFxgvxK9H5M2ZiXc2TVq5WkdyGJ4gpduFo3xj2jDfWQbLUJai
	ty+1a/cQQbgHEr7FZoFGpPfSw3arFxYocBhTRFI5Jv43R/2JyGTvDJmEb6Z4nxsd7rY3VJ
	4u041kNMEoyzSuV7PEsFiZNx2e+EE5WDJDocEhqLQFoSw6Ycbg7+WAo6PRGclQ==
Date: Sat, 03 Jun 2023 08:14:59 +0800
From: Michael Walle <michael@walle.cc>
To: Linus Walleij <linus.walleij@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
CC: linux-mtd@lists.infradead.org, "Jason A . Donenfeld" <Jason@zx2c4.com>
Subject: Re: [PATCH] mtd: otp: Put factory OTP/NVRAM into the entropy pool
User-Agent: K-9 Mail for Android
In-Reply-To: <20230602212318.3524782-1-linus.walleij@linaro.org>
References: <20230602212318.3524782-1-linus.walleij@linaro.org>
Message-ID: <E8B5CEB9-C5BD-44D7-8F55-DFA6FD1BC91E@walle.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230602_171523_354934_04852123 
X-CRM114-Status: UNSURE (   7.65  )
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

Am 3. Juni 2023 05:23:18 GMT+08:00 schrieb Linus Walleij <linus.walleij@linaro.org>:
>The factory OTP, if supported, contains factory-programmed
>information such as typically the serial number or production
>week for the chip.
>
>As this is device-unique information, submit it into the
>system entropy pool.
>
>This does not count as improvement of the entropy as such
>but in practice it makes it a bit more random to mix in these
>numbers.

Please note, that not every flash will have some kind of unique identifier, some won't have that section populated at all or some OEM stuff in it. But I guess that's alright.

-michael 
[I'm still on vacation and just have access to a mobile phone, so sorry for any incorrect formatting] 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
