Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F929C433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 18 May 2022 08:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BMXzT21bagCGDv5S91/XveekEhjea/m+lFNCI7N9Dqo=; b=wSIuJGPUUkvid7h1HvXYXB/N/T
	c3HQWdrtxPsL/foyOtWTaZ5wN1pRsLBOMU4j+R+FfSnznLx95ibcSjSZ7hEzMk9h91o1e/G2w9O33
	pYAgv/2PTrcSyTupyEb4RkWOdMfOh+mUSUN8EK5jkIW+1RJ3s4GxlTR/79GTlbuGl6zWeEd4xE8gH
	ygklxLHQaJwcLn5//ESgwGW1CYwDFW/ejBFgYVJ0/Sh71ZEeu7TkX1z/L7dOAyG4ejwPk4tTOZOss
	kShOwtI5XwEXuK0j44yYTYWppU8J7FUJEDSno4ukraNLvFWCVr84ISNscyk/XfI3uR8kFLxe+MbFW
	UFoJuTlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrF9q-000crU-CZ; Wed, 18 May 2022 08:35:50 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrF9n-000coc-Pn
 for linux-mtd@lists.infradead.org; Wed, 18 May 2022 08:35:49 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id B47D82223A;
 Wed, 18 May 2022 10:35:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1652862943;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fWHra9QZcYYd0/tHQvPL1JiBOR50Ad54Fwe3nmWTk60=;
 b=W3pKtrLXRBjrHcNyEk2iRr8AKf2Ua9L7pw3yccR1cyBHLzRVzj660oHlUTcMMxni/lyqBs
 tpG8Ko9RtsDyxXAlIBQgOM7TF+hP2obYaRFpNu+Rik8zj0+Qp/bmQc6eBl8R9CB3kFlMnP
 UpH5b8Yyhd+LW0S6vitWwxkePRkZ7eU=
MIME-Version: 1.0
Date: Wed, 18 May 2022 10:35:42 +0200
From: Michael Walle <michael@walle.cc>
To: Takahiro Kuwano <tkuw584924@gmail.com>
Cc: tudor.ambarus@microchip.com, p.yadav@ti.com,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, Bacem.Daassi@infineon.com, Takahiro Kuwano
 <Takahiro.Kuwano@infineon.com>
Subject: Re: [PATCH v15 6/8] mtd: spi-nor: Retain nor->addr_width at 4BAIT
 parse
In-Reply-To: <03b554e5-2182-f1e6-3954-e0128d21b840@gmail.com>
References: <cover.1652063152.git.Takahiro.Kuwano@infineon.com>
 <dac51af409be97ab316a9de5c0297359df7d2e2d.1652063152.git.Takahiro.Kuwano@infineon.com>
 <99cf396f9210279e28dc1656a652efb4@walle.cc>
 <93de6975-c734-06d4-7865-bbe7f90cba4a@gmail.com>
 <0eea594f72858ec0ee099d45da71bc96@walle.cc>
 <57fd05cd-e0a7-b41a-53f0-c419ddc53a1a@gmail.com>
 <03b554e5-2182-f1e6-3954-e0128d21b840@gmail.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <e5a57f5e138366da9c97803656fc492a@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220518_013548_038460_B92776F8 
X-CRM114-Status: UNSURE (   4.23  )
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

Am 2022-05-18 08:04, schrieb Takahiro Kuwano:
> Any comments on how to handle this?

It's not even been a week since the former mail. Please give us some
time :)

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
