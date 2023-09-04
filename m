Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 868A8C83F3F
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Sep 2023 14:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pUNzROh72egkms9XbPOUDZgOJwmGL0kvY6yfRZ4hjok=; b=Sfy1I10z8XB00Jj6VzwEVLoeJn
	KyOxSckdkivELjVpKOc8eujDuvin7pYUUY3x8DR7mq6IXDoQ73kmGPIgvkoDNZDiuFKCSSlzBGQez
	1DsK/mzpakXanrTEKupq8BytSIAnSQVHFqgjHxXCNWIuQDLkLDHbU5Kty//olHWmNdYSl/6WJUeNL
	W3Mxkptx+r3HIaFVlKDs069eewEwg7OYb39HD68D3iTPmXfPOtFwkdaqEJ+ISf4zVw15D14XWix6e
	vUWnMmT+aDHCYaKfX4ffCIhooU9iPEOqAmtCEtz93JMuqWgTyUlE6uNjD4LAmv5INGvKqouBWs6tB
	GoeokYsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdAyZ-004Izs-06;
	Mon, 04 Sep 2023 14:54:51 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdAyW-004IzS-1T
	for linux-mtd@lists.infradead.org;
	Mon, 04 Sep 2023 14:54:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5256D60C88;
	Mon,  4 Sep 2023 14:54:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DF74C433C7;
	Mon,  4 Sep 2023 14:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693839284;
	bh=6YiWLWZhRQojhusQvrksldKf/NJ2HtePQPILfFdZTxY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=X4+/LmsTgugqaS+D3wJ37wOyQMHwlUq6EQQHYPbRGTPCKFOVco4LEyHU37cqG8Va9
	 Yya9tEVdzKPPlVDW6mQH0ASDoXYy1nfU8kHS1VXI5lEEMnhfK5YQNIdv4jzFou9nlB
	 OQkT4xM7u3wbnwLapZHiII8f3iHBMRdznLZg8pkRTQ9M6gLGQ7NHRy1oqlt+qKFGTh
	 jMKSxTM2lvRQcX5KJMJNxAQoWABv7b0/iG390II1BdCIwXLeJkcPdUIiXe2eHDxTu/
	 FJnqkI3lvV9a3EIBKdspOiLRWPb70Ef7lJZQrUPdxLCgRC/IeHO+GYFVLjevwZoRIT
	 IpVJ6e481Oebw==
MIME-Version: 1.0
Date: Mon, 04 Sep 2023 16:54:40 +0200
From: Michael Walle <mwalle@kernel.org>
To: liao jaime <jaimeliao.tw@gmail.com>
Cc: linux-mtd@lists.infradead.org, tudor.ambarus@linaro.org,
 pratyush@kernel.org, miquel.raynal@bootlin.com, leoyu@mxic.com.tw, JaimeLiao
 <jaimeliao@mxic.com.tw>
Subject: Re: [PATCH v3 2/5] mtd: spi-nor: core: Hook manufacture by checking
 first byte ID
In-Reply-To: <CAAQoYRk5y_jJqKt-CBQ8vyOi7ppGbestzaCgFbw1fjetk07+ug@mail.gmail.com>
References: <20230804095409.278419-1-jaimeliao.tw@gmail.com>
 <20230804095409.278419-3-jaimeliao.tw@gmail.com>
 <70e42ee5e4c5aba05ac896cb94956f25@kernel.org>
 <CAAQoYR=JQVd3iqfCYKjvkbFSGVWJRX1xFni6CsNht9prhuQ1EA@mail.gmail.com>
 <92234e4c5aca657a966d7c4d9d5f219a@kernel.org>
 <CAAQoYRnpGmo4Li5fJoRWq6_C4cF+OdzbuvQKtiGDJL1HcChXvA@mail.gmail.com>
 <ab8e506ea941749b07f0a93565e731c0@kernel.org>
 <CAAQoYRnJTXGEYbhS1HkBC2p5QtPPFZdACw4zdE5aYoBpeGwefg@mail.gmail.com>
 <CAAQoYRk5y_jJqKt-CBQ8vyOi7ppGbestzaCgFbw1fjetk07+ug@mail.gmail.com>
Message-ID: <639c112dd978e8b6489f158c6c8858b4@kernel.org>
X-Sender: mwalle@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230904_075448_561210_06888D36 
X-CRM114-Status: UNSURE (   9.66  )
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

>> Most of information could get by parsing SFDP.
>> We hope that highest protocol(8D-8D-8D) could used without adding IDs.
>> Because of octal_dtr function is still reply on mafacturer hook 
>> function.
>> So that vendor discovery could make up deficiency.
> 
> For this part, have any ideas?
> We hope that we could do something for reducing reliability of ID 
> table.
> It will be good if new flashes could get all features without comparing 
> flash id
> on ID tables.

Ahh, that was the use case for that. I suggest you look into the SCCR 
SFDP
tables. You should get everything from the 23rd DWORD. At least the 
Application
note you've sent me, shows these values are populated and by a brief 
look
it seems to match your hand written code in patch 1. Which means you 
don't
need any code in macronix.c. Instead you should extend the SCCR parser.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
