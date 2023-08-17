Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96FFEC2FC14
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Aug 2023 13:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IhsFYHpRhrPRABYDU5dqMRY41VmqEJZrnAe11n2CZQ4=; b=U0wlpQLus0uZCbHqy3cnUSMa1G
	MN3OwAPgT6q0IKtS/Ee3fV9b7kLCtBZF5Mst2/koBbG6mubVOhs2edTXSiwTbtKOAp7gNNC0gfsan
	ZC0BkOM8QKuJesZaVNbwj8eiJAHz/9arovfsWbVFFCYIRjo0xOR2xUorakbwd7uYaJ1gqSnWakYSe
	Lu92O970Kh6FzgttpOy/yORxmvZYhbDUgPFs9GIbVbC/lwT6XgxJJW+Qetl8dzIUyxff1fKu6RU7/
	R5fI5OyxWVqQ5v4PzGJhaHRMH7x0LvBH2bAVTkF4OgAqBVA2CLC6GzewLuhylJQgHs6TYhVc8FmPh
	LG+p0Y6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWcqD-006RZ7-0M;
	Thu, 17 Aug 2023 13:15:09 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWcq9-006RXy-2M
	for linux-mtd@lists.infradead.org;
	Thu, 17 Aug 2023 13:15:07 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 6CF1B3D9;
	Thu, 17 Aug 2023 15:14:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1692278099;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=smIG5hi/qQQO7zsEVLHIIK2UNrg451bmx1kSE8izq6Y=;
	b=vMbCq8i0GOclICjBdWlA/1LUt9oHo/9Ar1S8G9Lfo2W6y1NeYnL56AfRHLYTtxUQkbyyT+
	jZcRK/odQ98uX4PrIUr/tdGhnT0lsyqAlU2Fffj6rmX7b9Yj8Mdk5q4rgWdldT4dXh8Asf
	jwyKS2BaMXYhY7xaOqrtm7aAun0IOiqp0BxGDBoDJkmguviUi+dxW6JjlMTuHpLnBC2p1X
	JkA0YaX7jywsD2K7Rb3BJV8GyHQqCm3xoQG6oT//dtK+pK/bqw085S5nTgG6+AjWqLQhTc
	sPj+fB0ZbadnI9cxOIBbl5yHCfpqy8FaAmDTlUsiInXmSwAbU2188XRZERzTfw==
MIME-Version: 1.0
Date: Thu, 17 Aug 2023 15:14:59 +0200
From: Michael Walle <michael@walle.cc>
To: SSunk <ssunkkan@gmail.com>
Cc: tudor.ambarus@linaro.org, pratyush@kernel.org,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, SSunk
 <ssunkkan@gmail.com>
Subject: Re: [PATCH] Add support for more XMC series
In-Reply-To: <20230817124655.13023-1-ssunkkan@gmail.com>
References: <20230817124655.13023-1-ssunkkan@gmail.com>
Message-ID: <8bbfdeecc4085e4f7c916c26c98de147@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230817_061506_227408_137BBFB2 
X-CRM114-Status: UNSURE (   4.60  )
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

> Add XMC XM25QH128C/XM25QH256C/XM25QU256C/XM25QH512C/XM25QU512C
> and set the parse_sfdp flag.
> 
> Signed-off-by: Kankan Sun <ssunkkan@gmail.com>

NAK. You're just posting the same patch over and over again.

Please respond the the former questions and please read
https://www.kernel.org/doc/html/latest/process/submitting-patches.html

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
