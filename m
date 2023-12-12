Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA001C4332F
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Dec 2023 13:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y4Ki1nOfKVpixQn3hVgmaEvtjSmbc4GVZpCS6QMhFP0=; b=dkXcOFh5ktCLQwGLMdjvZoE+U0
	VrWWxaF2nfZWxoGjenfKx0xca8pkI0UO0WsGaWDcL6M7N4qyzbebK29wShbOVU+cUTyw/N+zMg1zO
	CQnBUZN9ZvywPYfZ2CO0PZVJddZAM34dxF9b+8MUvL2H/r0uj4jLJvVsgdtb28pAeBAXlWgTX6i2K
	XQ59MIcvK9OLmaI5gU+THR7g4ooyG1Gi3t4xcJEDX0PWgy5rkVvi3vriBj1UxyhX7aAzOfsN3HkwV
	+DA2ozlEW14mLEZqjZcZocbHY+eMAZdXvar3SD0axPHo7tKr27I7ci62XmhagopwfKhH9exQ7ZZE9
	Z18QaX1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rD2wv-00BpMT-24;
	Tue, 12 Dec 2023 13:37:25 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rD2ws-00BpL9-0a
	for linux-mtd@lists.infradead.org;
	Tue, 12 Dec 2023 13:37:23 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id EFAC7A31;
	Tue, 12 Dec 2023 14:37:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1702388238;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g2OGLpqn9BAIlGeS4tNMxjJ8RCA/Y+BNhLEX0wxUXrw=;
	b=L1zRTNmn/7fPZmIn9zM6MsXjyE/JxVdhFCsA88iz+Hr/dkfnGZ1aR0PiwMAQGrlH1Z8Odl
	yWra2zFBglIjFYPbubgb04ySt0qPGBeiwJ9ovhI9mNi+qTFl3QUstCKvjjSLfHOfKsMo2y
	12TFV+3E9hkrXa5q9iz3WLjFYQefBNlIggEOeC3XwgcBlt2mT8ZYSimZYJn0QVogD0TSzJ
	MEAN99nI579owoVY3jUzN0IxmzPSM/JzaXZY7vwK69cVVrAMgvSvEefLT9EMzjEAW9qEkk
	nK0v3Kg3fori663au2ZUFlijLE+5WbW2fVkFEr06MB9e41BC8WR9qqO7U+4SDA==
MIME-Version: 1.0
Date: Tue, 12 Dec 2023 14:37:17 +0100
From: Michael Walle <michael@walle.cc>
To: liao jaime <jaimeliao.tw@gmail.com>
Cc: linux-mtd@lists.infradead.org, tudor.ambarus@linaro.org,
 pratyush@kernel.org, miquel.raynal@bootlin.com, leoyu@mxic.com.tw,
 jaimeliao@mxic.com.tw
Subject: Re: [PATCH] mtd: spi-nor: core: Introduce spi_nor_abort_octal_dtr()
In-Reply-To: <CAAQoYR=8b7NR8h0SHz=bp9=XHzZebDQhPUOc20b0eAF6Vd1kAw@mail.gmail.com>
References: <20231207075147.21851-1-jaimeliao.tw@gmail.com>
 <f015ef75d6bb0a9f8edba37b40affb60@walle.cc>
 <CAAQoYR=8b7NR8h0SHz=bp9=XHzZebDQhPUOc20b0eAF6Vd1kAw@mail.gmail.com>
Message-ID: <e08b45ea59a0ba96de99a42ddf7b6769@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231212_053722_368280_786206E9 
X-CRM114-Status: GOOD (  16.70  )
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

>> > Some flashes contains 8D_8D_8D information in SFDP but did not enter
>> > octal DTR mode if conditions are not satisfied.
>> 
>> What exactly are these conditions? Rather than "abort" the octal mode,
>> the flash shouldn't have that capability in the first place.
> "Abort" is not a good word.
> Is it better for using "discard"?
> 3 conditions should be satisfied before enable octal dtr mode.
> 1. function hook in nor->params->set_octal_dtr
> 2. nor->read_proto and nor->write_proto are SNOR_PROTO_8_8_8_DTR
> 3. nor->flags & SNOR_F_IO_MODE_EN_VOLATILE
> Flash driver still bring 8D_8D_8D protocol instructions in 1s-1s-1s 
> mode if
> conditions are not satisfied.
> In a case, flash ID didn't include in vendor's ID table.
> It will be "spi-nor-generic".
> 8D-8D-8D information could be parsed in SFDP but 
> nor->params->set_octal_dtr
> didn't hook vendor specific function for enabling octal dtr mode.
> So that it still bring 8D protocol in 1s-1s-1s mode and have no chance
> to select 1-1-8 protocol.
> I think it may better to re-select a suitable protocol for this case.

Just that we are on the same page. You are using the spi-nor-generic
driver, but that driver will elect the 8d8d8d protocol but that won't
work, because we don't have a .set_octal_dtr. Therefore, the fallback
is 1s1s1s. Correct?

To me it seems, that spi_nor_select_{read,pp,erase}() will select
the wrong commands/proto. So it should be fixed there. Probably
shared_mask is wrong.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
