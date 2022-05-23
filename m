Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89ADAC4332F
	for <linux-mtd@archiver.kernel.org>; Mon, 23 May 2022 09:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jt2GPbOshCeBppwDMlbQek9NMw4V0xxW2RKjrFjGh6I=; b=gdTqxLgUBvHoaCasku0/XCW2b3
	sVzG5qjL1HwnkbunTdpKZWdzXxSQjS+WsFr0QWBCBAJIXvctoh9hFj0eygla+mmHLlPilSKe5+B2z
	/Lew+6ERdfX3MOZ31Rddy9fqxQvl8tZD+Z+YByAn921Q3kQbFteRGPIyh46ScmgfOa+L6BcWHG+7f
	gU0t6dHtaXsHMCI/86Y1UzMXh9STWu9KpqeT8mFRdJ3sBZ6a5Sa3X26sGshVl+l3cjwEpEJzKtF8X
	ySp+CxddAmNrI4mdK33JWyGhk34+UHcGxYcwvYsamnRNRjtQoT0y6rV7kktcr0RD08XBRlWvE1WUE
	uv24vg2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt4kF-00306x-7h; Mon, 23 May 2022 09:52:59 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt3ru-002cOd-T5
 for linux-mtd@lists.infradead.org; Mon, 23 May 2022 08:56:52 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 7464D2223E;
 Mon, 23 May 2022 10:56:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1653296205;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rquYATX1ADWYUg8wL8PrsOW2UgBQX328g6NCIpn6XN4=;
 b=YU6fHmY3jOmCq8LyjWdV0k2BOrGIgvm2My/3RUCJv18Js0Pj8kUCyiJbDCn0LVs52QGZrl
 rLnlv6phO+MLHj64tuRzTMQe+7RSPXcZmfcd6wAGQAfFzXvcG5PF1YsEOPxw1UgO52OFAh
 pob8Rm+nKa9m+eqRL/zvMFeWSYreuR8=
MIME-Version: 1.0
Date: Mon, 23 May 2022 10:56:44 +0200
From: Michael Walle <michael@walle.cc>
To: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
Cc: linux-mtd@lists.infradead.org, Tudor Ambarus
 <tudor.ambarus@microchip.com>, Pratyush Yadav <p.yadav@ti.com>
Subject: Re: [PATCH 1/2] mtd: spi-nor: macronix: Add support for mx66l2g45g
In-Reply-To: <b3e85d41-9415-b911-6f61-941885af1955@linux.intel.com>
References: <20220522054802.1719443-1-jiaqing.zhao@linux.intel.com>
 <04c432289041752d113c15245361ade8@walle.cc>
 <b3e85d41-9415-b911-6f61-941885af1955@linux.intel.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <fac4b7877f600a4067534fca672dc842@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_015651_173038_D7B24ABA 
X-CRM114-Status: UNSURE (   9.53  )
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

Am 2022-05-23 10:50, schrieb Jiaqing Zhao:
> Hi,
> 
> Yes this one supports SFDP according to its spec.
> 
> On my setup, I cannot see the sysfs object. Do I need to enable some 
> specific
> kernel config or it's SPI controller related? My setup is running 
> kernel 5.15.

No, it should be there since v5.14. See commit 36ac02286265. And you 
shouldn't
need to enable any special configuration option.

Did you do a "find /sys -name sfdp"?

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
