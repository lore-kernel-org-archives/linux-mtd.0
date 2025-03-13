Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BA2CC282DE
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Mar 2025 13:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ojGGEJWBoBGIa5JnHDILETawbjC2pWVnUxC+hKGYNu8=; b=4BVYzOiCBDT+Sh
	GkSQDaWbuQ0pJ1bM5fT5yDEktKRbaQ9YJltBvj1fBIDYG13bvA6oXv9DSvQkEkP9/8Er0drfe0bGA
	qFEQVUQdSu8VH+/zhDluQrJYdT6Pb4YzElb/TtDP1KhJKtA+sQiInx+CynFslGbmd1wJkHxasTL0a
	3NW6jJOqRTgsdGHACPxBeqt8FHzPaF/aFyAP/3wefAsRvxx4mZfRBR35szVLtBkpJzQTPfl4Ac/Yv
	dpHWB/DblkH8/yu8r7AvQpi3vRaVlggW3YVz/3HkAuKOObYaY7c8QdiPfACbocTiKlCQ+QFHDG375
	oYfPgc9ruznrFwDjLYkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsiy3-0000000BQy3-42DV;
	Thu, 13 Mar 2025 13:51:23 +0000
Received: from mx.denx.de ([2a03:4000:64:cc:545d:19ff:fe05:8172])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsiwi-0000000BQeW-2KTS
	for linux-mtd@lists.infradead.org;
	Thu, 13 Mar 2025 13:50:01 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 668E01020E4C2;
	Thu, 13 Mar 2025 14:49:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1741873795;
	h=from:reply-to:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=zwZpJol3r+NZfuPaketwR5AKh9kAknjnnobmvM92/Kg=;
	b=JOW6V3vyrlwAYaE654BuUamBuLqqbSp4zV+zSf1rcfMd4KjpvOyOh+yJ50hOgGXe4NfRZi
	LjfMJU2AKCodXW0KboUIPgH3P8YF9pJWjUdlD4F75gTXYB6Kp7+9R6FAi4QlgW8xJRJV3H
	ZpRP9vMphJdYWJXz5+mdXs+8i1Hn1+hN3OpVIL5o2TB0HEldrD+R3JwCU7fT8iQKQCwAT9
	NJAof/0sHfkhvRSlqGF8TnuPR+6E8qdROePI5szQ7e9jjezojfNek57Q2Ad2E6HZ+cFMfx
	Y4BsYiKbLHU69e+SO6Xr9YE4+SyZV4h1ewLSx+LckqSy3VbXCvNK4OXVIBQ4tQ==
Message-ID: <27e6e64b-9627-1307-3ca5-2bcfc471f157@denx.de>
Date: Thu, 13 Mar 2025 14:50:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 2/2] mtd: mchp48l640: Use str_enable_disable() in
 mchp48l640_write_prepare()
Content-Language: en-US
To: Zhang Heng <zhangheng@kylinos.cn>, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, han.xu@nxp.com, david@protonic.nl,
 jre@pengutronix.de
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev
References: <20250313095756.945890-1-zhangheng@kylinos.cn>
 <20250313095756.945890-2-zhangheng@kylinos.cn>
From: Heiko Schocher <hs@denx.de>
In-Reply-To: <20250313095756.945890-2-zhangheng@kylinos.cn>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_065000_768155_BA442197 
X-CRM114-Status: UNSURE (   9.97  )
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
Reply-To: hs@denx.de
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello Zhang,

On 13.03.25 10:57, Zhang Heng wrote:
> Remove hard-coded strings by using the str_enable_disable() helper
> function.
> 
> Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>
> ---
>   drivers/mtd/devices/mchp48l640.c | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)

Thanks!

Reviewed-by: Heiko Schocher <hs@denx.de>

bye,
Heiko
-- 
DENX Software Engineering GmbH,      Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-52   Fax: +49-8142-66989-80   Email: hs@denx.de

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
