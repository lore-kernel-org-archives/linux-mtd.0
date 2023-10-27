Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2DE8C4332F
	for <linux-mtd@archiver.kernel.org>; Tue, 31 Oct 2023 10:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iwIgX/gc9M4w6iJSyTeFavi6FTpLTG6h0HIlNnUQRxk=; b=LIO+zraA++AaWc
	rtwM4x7X+VJtE1oWTaNZ+vjTZVhakY7YYFy1EEQD/cy6t1wr0+4YMhiiGxHDxMD7j25NvI4Ji9jb9
	A78ZbkWmLJPotwuJMfaHTfQPZf25anWfwATCwkzgR17MMigFaTTx9jmSmWz76N7R3wCYj1NMgY8o0
	DRotFowbNVjqv/FHcU4VJjTA+7PcXbMm8Bt3hBqxrnmEe89OIG+8dzWX30Ffj4nZKQTJbZFO8dWn9
	hL34FAvGnT0GSuFL1KYv7i3U8Hr2GgIUi+LCTqBwws4p5u/V/alP1PfGzMZKH0/7tsrriG/3zT/Q0
	wbeDnpVq4qOkxUF6KLOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxlkR-004xBT-17;
	Tue, 31 Oct 2023 10:13:23 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxlkN-004x8E-2C
	for linux-mtd@lists.infradead.org;
	Tue, 31 Oct 2023 10:13:21 +0000
Received: from [127.0.0.1] (unknown [154.135.136.126])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 367A63C3;
	Tue, 31 Oct 2023 11:13:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1698747192;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PUR6spnQ6honamQNHeG0kSEtO5wSkdiaZI8tPI2AjCs=;
	b=iaQ3RW4I+iP5z+Z7XyhsOReLTbZ4DIh+6eTsYzL2+oTtfz2U7XGs3nfIY1kexs0uQWn8m8
	XqhIjvxmTKC0lNyF4rehIBUDEDK1W3OZQ4MqvcjKjyge5yNCbC3p6hmINvV38KK6Vsd8hc
	l0ExtnLnayVUzaKGDHeDMaoU+efKz0bClmumKCoxxd7vIbDfV+VQK8Ls4mst5sqYz2JACw
	7mFEZOgWIAsEv+PLzFcQHfbP0rPrVwy+ifsbcyfQ/osKr9sVdm3GrVlfutuhTJrS5vS0mw
	uUp5LGkCYORnvBt6/ABsZI3rU6IBIaX/EHVF3yMdHMTCE2Th/aHmPuo2lmCI/w==
Date: Fri, 27 Oct 2023 22:03:22 +0200
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Fabio Estevam <festevam@gmail.com>
CC: pratyush@kernel.org, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, linux-mtd@lists.infradead.org, tkuw584924@gmail.com,
 Fabio Estevam <festevam@denx.de>
Subject: Re: [PATCH v3 1/2] mtd: spi-nor: Set the erase flag for multi-die
User-Agent: K-9 Mail for Android
In-Reply-To: <44a19b4d-2bda-4088-b0b6-a60b3598621f@linaro.org>
References: <20231026112312.3217502-1-festevam@gmail.com> <44a19b4d-2bda-4088-b0b6-a60b3598621f@linaro.org>
Message-ID: <3B565C8F-F5A5-4B20-A05E-9AF6484DDC52@walle.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231031_031320_192888_D6A2AEC8 
X-CRM114-Status: GOOD (  11.61  )
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

>> Instead of manually passing the .flags = NO_CHIP_ERASE in the case
>> of multi-die SPI NOR flash, retrieve the information about the number of
>> dies directly from SFDP and set the SNOR_F_NO_OP_CHIP_ERASE flag in the
>> multi-die case.
>
>We don't have enough data from manufacturers to make such an assumption.
>And since this is not backed up by a standard, I'd like to stick to the
>.flags = NO_CHIP_ERASE for now

mh. we have two flashes which are multi die ones. as far as I remember. i checked the semper flash and it didn't support chip erase. also.. chip erase isn't a standard either and not backed by SFDP, correct? We shouldn't use it in the first place. So we might have a chance to fix that for multi die chips now. 

So as long as there isn't a multi die flash which supports 
chip erase, I'd like to keep the additional flags as minimal as possible. for the best case scenario it would just work out of the box with just SFDP, which is impossible if we need that no_chip_erase flag.

-michael 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
