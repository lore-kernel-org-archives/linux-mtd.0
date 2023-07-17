Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72F64EB64DA
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Jul 2023 06:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rKXCfPM6H5hkmhr1Z62XNsE1P84J6mUSnWnIO3aMPek=; b=AAw0xHBTEZl6Xs/iA3PI+pNsTU
	wHZ1cpctTdE3ySOjPYzwdpt/qx7FNx3qxOvPvcPTEf8LMFYRBQYnJX9AQWKuGDg+9Dmuf9esSJa1D
	11MsYIqjBPzWl2TXdxL7MhUYhjI8dG/KQJku9d/wmsfHwOG0KbwLcB9wz9p8eLMp33rb9+gZqMbDf
	4Mb5yXqMocLf1EInNIvzS0wVREXssF1Z08MDtlqWbihPaQH5R8XVa1QR/jPSeIVt3hoT9H4qbFqpW
	mUJ9xf3vYZu+5p7rfI5cFgqHrbFAnJ1s41f4tPwrLXkvz/9uvv9YgxoDPuFyiv1EaVbKzWuyILb6t
	pioE6EpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0KJ-005Xvx-1E;
	Wed, 19 Jul 2023 06:06:19 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0KH-005XuR-1k
	for linux-mtd@bombadil.infradead.org;
	Wed, 19 Jul 2023 06:06:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=5vU3VV+r7nUZ1dqeEIv+dK4fJYEqnyzGx0w1lUrG/KY=; b=Jvj3rrWyATGYjBmIZM+4OjD6TJ
	ZP3Vh0VOP01pzxhbSJv22cRYXFc9sfkYZ/E5Aal2lYd6sRjsHP0zuSvj+VKnS9hvq/L00FbwkoZna
	bfm5CPwT+r2pWLpCMcsChYKY47LpbFdCqIATSbeeMZRI8E04vJvSKiaFfslBhwlF9PoDbdhtBZvUH
	5Nt7qbDfwuVJt03F5g13aifU/6Yvq00Hizrdq+dUwnchn4VNFDo7Y5mAzGibYh0HQVL4TNcWUXTJb
	7oj/4xiy44zZ3NQagD17cIk5uG9vje5UwpM2Y33jk2laxdUceLohzV1kqM/c9sRHGCa1C7DWZ1xSl
	UuLLE6GQ==;
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLX3H-009Qps-0E
	for linux-mtd@lists.infradead.org;
	Mon, 17 Jul 2023 22:51:12 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id AFC923D5;
	Tue, 18 Jul 2023 00:49:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1689634179;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5vU3VV+r7nUZ1dqeEIv+dK4fJYEqnyzGx0w1lUrG/KY=;
	b=CFN1IBEsn6ZXJx8hV89aR2mDMYkjD+Ae3R0vuapNIfBs/iNLCd6B7NI1LvQq3evH5GodKj
	FBVnHoYZZDKLPlUKbe5NNHRrtLX/WW2QcpKIQROwUQmCwVV8QM7n6ZWtCys5JZSD3RHzoR
	OH7o+BBIYkrpTsF09v+DkxJp+NXuXMesEyKYFqZ+iaVxEZaCSoEVaXCHVlBrZHVoQb3mbK
	Q3msVxobM0rkBsA4FCehM5eCiE4vNRAxComf8bxUjcX3ZrFEs8KaBGvXhMH5ceHFQ+sPKY
	Sbm066ojM6Rgoffc/G3YpBBMof7UTSW+CTCXb0r1zyCJhhQRWMNzZYbOBMCpaA==
MIME-Version: 1.0
Date: Tue, 18 Jul 2023 00:49:39 +0200
From: Michael Walle <michael@walle.cc>
To: tkuw584924@gmail.com, miquel.raynal@bootlin.com
Cc: linux-mtd@lists.infradead.org, tudor.ambarus@linaro.org,
 pratyush@kernel.org, richard@nod.at, vigneshr@ti.com, d-gole@ti.com,
 tkuw584924@gmail.com, Bacem.Daassi@infineon.com, Takahiro Kuwano
 <Takahiro.Kuwano@infineon.com>
Subject: Re: [PATCH 3/5] mtd: spi-nor: spansion: Add MCP support in
 octal_dtr_enable()
In-Reply-To: <cac44f4d9ed06e250c2fa8aa900d8de3de4c4337.1686557139.git.Takahiro.Kuwano@infineon.com>
References: <cover.1686557139.git.Takahiro.Kuwano@infineon.com>
 <cac44f4d9ed06e250c2fa8aa900d8de3de4c4337.1686557139.git.Takahiro.Kuwano@infineon.com>
Message-ID: <d05156c981f0ddcdfb754c685530cd22@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230717_235050_426893_6C17FA19 
X-CRM114-Status: UNSURE (   8.49  )
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

Hi Takahiro, Hi Miquel,

> S28HS02GT is multi-chip package (MCP) device that requires Octal DTR
> configuraion for each die. We can access to configuration registers in 
> each
> die by using params->n_dice and params->vreg_offset[] populated from 
> SFDP.

I'm looking into cleaning up the flash db and come across the n_banks
and n_dice parameter. Which sounds like they seem to be similar, maybe
identical? Unfortunately, there is no public datasheet for the macronix
flash.. IIRC there is one for the Semperflashes but I'm not sure if 
there
is one for the MCP parts.
Could we somehow clarify if these are the same properties? I've looked 
at
the SFDP tables of the macronix flash and they don't have the SCCR map 
for
multi chip devices :/

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
