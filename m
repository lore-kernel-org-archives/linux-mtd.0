Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1878C5B567
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Aug 2026 06:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W7sOhrD/prWGHOGeIgZsLu/9HeSTvrqHYWUiAGjKuQU=; b=OfY0Nyzjcba1Gv
	+eBpgM5D+Dkohr+g6D15V4w9N7NntOYH4U3HumNkGO4I5PsuyomHd66r5p3vxoLS7yUhO+WOt7qHM
	XN1WMyANpUwLQ0giyQZXtGHGHsVQc0cz98zgudA+Kqi95hc4QXm3tKbPVE1eI/W3TMUxTMDyRZbLl
	eAtJxcUHVWbLCpOfvPfcrHDVunb5Kl0IheBVl0eCntt6fNlwOC1qRq5euEDkiHRLDNsyFrL2cR6Vy
	pol7yhrxWxKqilhn7ZWodYTARUMZv+FrK7R6bBrbI3jrAXqRLx6AeqifiNLb1TFZ1xLcnY99sjOyG
	VoRhZJdB1VRGhtRge1iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu2EL-0000000FUls-0908;
	Wed, 12 Aug 2026 06:14:25 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu2EI-0000000FUl1-1PZt
	for linux-mtd@lists.infradead.org;
	Wed, 12 Aug 2026 06:14:23 +0000
Received: from localhost (unknown [IPv6:2a02:810b:4320:1000:4685:ff:fe12:5967])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 1E437111;
	Wed, 12 Aug 2026 08:14:19 +0200 (CEST)
Mime-Version: 1.0
Date: Wed, 12 Aug 2026 08:14:18 +0200
Message-Id: <DKMQSZRM4QEZ.2EXQD5U58EVTI@kernel.org>
Subject: Re: [PATCH] mtd: spi-nor: scope the exclusive RWW lock
Cc: <pratyush@kernel.org>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <jianhao.xu@seu.edu.cn>,
 <stable@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Tudor Ambarus" <tudor.ambarus@linaro.org>, "Runyu Xiao"
 <runyu.xiao@seu.edu.cn>
X-Mailer: aerc 0.20.0
References: <20260809084223.3596259-1-runyu.xiao@seu.edu.cn>
 <DKL4CBQNKCO2.3NAZ6S25Q60XN@kernel.org>
 <6e208a8b-da11-4ba1-adfc-f1e80c891310@linaro.org>
In-Reply-To: <6e208a8b-da11-4ba1-adfc-f1e80c891310@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_231422_550319_7B7E1FD3 
X-CRM114-Status: UNSURE (   6.67  )
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

On Tue Aug 11, 2026 at 12:05 PM CEST, Tudor Ambarus wrote:
>
>
> On 8/10/26 11:25 AM, Michael Walle wrote:
>> Tudor, do
>> you know why you've omitted the guard() in spi_nor_rww_start_exclusive()?
>
> because using guard changes the behavior of the code.

But that commit removed the mutex_unlock(), thus keeping the lock.
That wasn't the case before the commit. IMHO the Fixes: tag is
correct.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
