Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02271C25B75
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Jun 2024 09:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nhwqr7lrO5F+6GhD0HMBlVz3pJHRJnyf/55NIkMN4rs=; b=2Zh4ev/lrpRQTk
	a2lATWp2opSa91xl3b6rLhKximT96uL4vLBxWWuwWblnTsmKF1vHF6E6OimsT9GkhL/Ppall+Ae8x
	IWeR9ey8lMwrWY0XPvFrIYco3uWg0O8vr0nSjW6wMrkAQh1peJHOw6Sk1VLo1mb/4A5+k4jGrpWDK
	2snmfBMgrqwjcVokz33anPTvACJx7A4YPmatoUGMsLwYyxlKm/LsjsnWKMz2WNMWYW6rsix15gQ5/
	m8HXU9NMIOGULMtSa6mKaJXh59El7VPFV2bqmhkcrTsPh8mWiGIpjwrmin6LI1KTpnrKffeRZPZwr
	mc4N1Dp28ICqpHrwpWLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sE3ka-0000000G9X5-3ulZ;
	Mon, 03 Jun 2024 09:13:08 +0000
Received: from www530.your-server.de ([188.40.30.78])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sE3kX-0000000G9Wa-2Ek4
	for linux-mtd@lists.infradead.org;
	Mon, 03 Jun 2024 09:13:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Content-Type:MIME-Version:Message-ID:Date:References:
	In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=QKqlw7KFcPgtNXrAPz88Db59XEJsKjSrvWdIHK4P2Uk=; b=hLPOwia4RYd5asUVOYfpYiL6C7
	uYaK7lkYHmGms+G+wl2lUHyzltZUoaj2Qs+hXhH/nO5eLXdby3sZ75tRO0d+Iv4bnVLheBc1YZR3i
	MuNdwTcDEMQ8HFiLoxcqQ1BdYlgBhlTeacFSDCNO/K/UpGi0/DZbyb9u3Cr8ZimarZvEhXRYm8M0z
	Eh7bvKb8CePtmFQOozuDKtjbHPA5csgXFQQ9hmBzUBoWGkLsxsJFVh7bfUYZ2XYK9R75L9yf6+08g
	5nTtKUX8Uk3ufsnboI++B2MzK3NfqPOgPDaLR8xzIqSQpJj1RsSoMbfYD/zU1VGacOjBjljSZCut9
	T3Mwd5TA==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <esben@geanix.com>)
	id 1sE3kU-0008Y4-TT; Mon, 03 Jun 2024 11:12:59 +0200
Received: from [185.17.218.86] (helo=localhost)
	by sslproxy05.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <esben@geanix.com>)
	id 1sE3kR-0002Kd-0n;
	Mon, 03 Jun 2024 11:12:58 +0200
From: Esben Haabendal <esben@geanix.com>
To: "Michael Walle" <mwalle@kernel.org>
Cc: "Tudor Ambarus" <tudor.ambarus@linaro.org>,  "Pratyush Yadav"
 <pratyush@kernel.org>,  "Miquel Raynal" <miquel.raynal@bootlin.com>,
  "Richard Weinberger" <richard@nod.at>,  "Vignesh Raghavendra"
 <vigneshr@ti.com>,  <linux-mtd@lists.infradead.org>,
  <linux-kernel@vger.kernel.org>,  "Rasmus Villemoes"
 <rasmus.villemoes@prevas.dk>
Subject: Re: [PATCH] mtd: spi-nor: macronix: workaround for device id re-use
In-Reply-To: <D1Q8LSUGXEIH.1N6HH5514YIJV@kernel.org> (Michael Walle's message
	of "Mon, 03 Jun 2024 10:25:44 +0200")
References: <20240524-macronix-mx25l3205d-fixups-v1-1-ee152e56afb3@geanix.com>
	<D1Q7BU6PJ356.1CTXPUZE8U6XX@kernel.org> <87frtuigo3.fsf@geanix.com>
	<D1Q8LSUGXEIH.1N6HH5514YIJV@kernel.org>
Date: Mon, 03 Jun 2024 11:12:58 +0200
Message-ID: <877cf6ie3p.fsf@geanix.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Authenticated-Sender: esben@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27294/Sun Jun  2 10:29:37 2024)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240603_021305_619735_B443D7BD 
X-CRM114-Status: UNSURE (   9.95  )
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

"Michael Walle" <mwalle@kernel.org> writes:

> Hi,
>
>> > In that case, I'd rather see a new flag in .no_sfdp_flags
>> > to explicitly trigger the SFDP read. Then your new flash would only
>> > need this flag and doesn't require the shenanigans with the fixup,
>> > right?
>>
>> I fixup would still be required in order to enable 1-2-2 for MX25L3205D,
>> as it will fail the SFDP read, but actually does support 1-2-2.
>
> But you (probably) don't care and we also don't care for the
> additional speed. So, I'd rather drop that code that is just there
> for that ancient EoL flash.

Fine with me. Because you are right, I don't personally care. I don't
have any boards with the ancient 3205d part.

/Esben

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
