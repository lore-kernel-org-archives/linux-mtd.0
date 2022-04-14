Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A937C433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Apr 2022 09:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QKOQd6RjB8M2zgdW29UAc3byw3e5v6VDyRDjWtEwbMQ=; b=sdNhQqfOI2PrL9KesI055qwsY/
	NcSLp+NPE2D48UiavXV2HYj/9Z3y2K+qe31Od7g9yPcJBq2OC9L7yVCB++GU6PrRIhFE/CJvYcecH
	0hzP6qzbXnx22Qo5SiyQhJ50+QEcSYG5WcXHXMNyxlcu4/Igm/EKUYA8NZCjvMD87BZv8QC7SMsfS
	uUY7ViHO5oGyZH3RPqRG94yAywj9+mTDSTFnPjpwgLZyVib6j2Iun5aIlMvTyf48KMK+d/0EX466U
	JPcLameg/qDgFckWlQzpej0+lhzD+mcikbvrx/aDof+p7umFEXNz0KJLS/h0c5aY6/RL19h6C7eRS
	vm2rQApw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nevWU-004nnJ-Iy; Thu, 14 Apr 2022 09:12:18 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nevUt-004n1i-HC
 for linux-mtd@lists.infradead.org; Thu, 14 Apr 2022 09:10:41 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 474E92223A;
 Thu, 14 Apr 2022 11:10:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1649927437;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Wgg1H9lvOl/NupTcWnhuOCgNVzdve1fEQn32K1KCViQ=;
 b=vtDL8URxi64KhtUuf/UjZoXii8+NTzHgtbxvStWtgqf9qZXCkqNdWv1ex/0swKQYArA7mA
 Sl6OijxFa+BNsQHWuQemjix4d80l1XjnGVVr7NvHuipqSFqv8pAcRS6C+AxD4SS9FiANHJ
 SvmRPAjz63e+L/+m1meCq1f4ttK1u1E=
MIME-Version: 1.0
Date: Thu, 14 Apr 2022 11:10:37 +0200
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
Cc: p.yadav@ti.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, nicolas.ferre@microchip.com
Subject: Re: [PATCH v3 2/3] mtd: spi-nor: Update name and description of the
 set_4byte_addr_mode BFPT methods
In-Reply-To: <20220411125346.118274-3-tudor.ambarus@microchip.com>
References: <20220411125346.118274-1-tudor.ambarus@microchip.com>
 <20220411125346.118274-3-tudor.ambarus@microchip.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <0a751281376b564693aeb6336193e86c@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_021039_846958_AF69A2C9 
X-CRM114-Status: UNSURE (   5.87  )
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

Am 2022-04-11 14:53, schrieb Tudor Ambarus:
> BFPT defines some standard methods to enter and exit the 4-Byte Address
> Mode. Use generic names for these methods and update their description.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> Reviewed-by: Pratyush Yadav <p.yadav@ti.com>

Maybe we should mention which method is typically used by which
vendor in the function doc.

Reviewed-by: Michael Walle <michael@walle.cc>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
