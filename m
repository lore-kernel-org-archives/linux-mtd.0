Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7955FC433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 12 May 2022 21:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bWWPNWcWbpavrdPRNPPDweCjKy9YKgqa3fr7NGvLGRY=; b=WyqPjN7p+GSl3o1X2kj8cs9dXk
	CPHTbVRVrlLS1CD2JX7z68WujYVyN5yVuDf9wUGnk2k9aQnqtzkE7lvXMORPSXNJKMgHrzQuVxy/A
	tvrwNowa0sd9zywS1iIxfQglnHwU97GWh9J2GCXYm//rC94L6qfmdaSJxc3v93/m2lx0VTK5loNL1
	5bJg/mVH5si8v5KdxSzU9zPOp8OjX9SbC+55xKe22YVAX/9V53GfzgYasYDd0GddynPnqdGGmF7kP
	XxYI+9vXxqIuxrgskm1sMud62hFnuU3V9wPtBEhbDOFK6lyflSLdcUdR+/wLyzcIvus72MrCLYlej
	OLthBh1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npFyl-00DVfO-3N; Thu, 12 May 2022 21:04:11 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npFw7-00DUDL-RB
 for linux-mtd@lists.infradead.org; Thu, 12 May 2022 21:01:29 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 420B92223A;
 Thu, 12 May 2022 23:01:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1652389282;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q5VyRGaWQwYPazpUx8D9znYch4yDqoqsbHDzeRqqxbc=;
 b=bv/HIjroH1fUroxtkISuFZxP3ZnO0t87CLXUFogZ2i2fFCgmwF6pvQadrW4wUTIT11lDDT
 zfhELdqMcRp7nSAqtzBcSodQfiuJbt78JNBd9hCbucaRKbDH7ASXNVaklXKSubpZIvoHpJ
 ZMnATX6/jSNBARJRbA0uu1tg8/9RFzU=
MIME-Version: 1.0
Date: Thu, 12 May 2022 23:01:21 +0200
From: Michael Walle <michael@walle.cc>
To: tkuw584924@gmail.com
Cc: linux-mtd@lists.infradead.org, tudor.ambarus@microchip.com,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, p.yadav@ti.com,
 Bacem.Daassi@infineon.com
Subject: Re: [PATCH v15 1/8] mtd: spi-nor: s/addr_width/addr_nbytes
In-Reply-To: <c56fb52bf191e3ae77572b042c2ff452f4919612.1652063152.git.Takahiro.Kuwano@infineon.com>
References: <cover.1652063152.git.Takahiro.Kuwano@infineon.com>
 <c56fb52bf191e3ae77572b042c2ff452f4919612.1652063152.git.Takahiro.Kuwano@infineon.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <4660f02c22ea36b916ec57781d2cf2c8@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220512_140128_158521_4DDB331D 
X-CRM114-Status: UNSURE (   6.87  )
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

Am 2022-05-10 00:10, schrieb tkuw584924@gmail.com:
> From: Tudor Ambarus <tudor.ambarus@microchip.com>
> 
> Address width was an unfortunate name, as it means the number of IO 
> lines
> used for the address, whereas in the code it is used as the number of
> address bytes. s/addr_width/addr_nbytes throughout the entire SPI NOR
> framework.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>

I'm not a big fan of just renaming, but

Reviewed-by: Michael Walle <michael@walle.cc>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
