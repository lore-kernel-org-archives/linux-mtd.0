Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA836C352A1
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Dec 2022 15:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tLPIE4PKg3rIC/xfwU5dQ0TWqBE43n8AHsUUmfmUOB4=; b=4M7BFLWfI7lKeO1UOdE4vmvPyw
	MZqAw9RZMzUiCX6I/r0vzFl2aQDdv0c/QQja6hf1GwNhQzTZQa/DEO0jMS31TdfazbcPIa2dj0U9N
	NNDM4Ey5Yftf3LWXcSsGaIc09TKGPpzGk0EfYkobHscxQhbNxvN10Fozb/byca1qU+yt/tL+b2Rej
	lN1VhmkXvM5c1T/qdLMFvUFiqZyNAOnKZ5hrwqswZSS0Yl4Pb5z5lXdWnMebTXNHDyHES2wwMf4En
	laN8US1JnIvmT5VpoxFm6/EHgDYt0FbB5sdTxWU1qXnZ1o6wt/PATTMS35Wh63erla9vG5lVyzD2O
	5Y0A3H4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2Zpk-00CMwp-E0; Tue, 06 Dec 2022 15:26:12 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2Zk8-00CEX9-8L
	for linux-mtd@lists.infradead.org; Tue, 06 Dec 2022 15:20:26 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 3AA7115A7;
	Tue,  6 Dec 2022 16:20:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1670340016;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qnwdjB3Mg5HPzl2dLPVLEGGciQ6HTvHeDUycm3jvEmI=;
	b=edrk4JCz/U3EWnN86SAHZhrcRxHUnNSRZGMarj0ZKYc6p3qowKQw2pXnRRik+ExjTZK/ag
	PAaCPa3z1DEGLIMjgdCl3EV4NXAFr36sZG/7yderyhF0yMkydd/vv2TYlDZ1nCWRk+5ugM
	dOu7Bvyp7oV4RVwqZe8aMWu0zvxRTyuwY6xNQQ+Fe8PwH/i+tvH95ppeFgd/4WOiiEOyd7
	YwItJWb/2/ZSkWWksrr7Oep+ZExB6b/Z3AbaZtCisutS8raoR4CQ47WYfjnuDcbZmB3SNP
	0E+YNdJ1+rY6RNoB6lVy2YlqSkZUsH52K9FSarFIAPhV1OZFENU8NKH9eyQtkA==
MIME-Version: 1.0
Date: Tue, 06 Dec 2022 16:20:16 +0100
From: Michael Walle <michael@walle.cc>
To: Victor Lim <victorswlim@gmail.com>
Cc: tudor.ambarus@microchip.com, p.yadav@ti.com, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, linux-mtd@lists.infradead.org,
 alejandro.carmona@amd.com, amit.kumar-mahapatra@amd.com,
 vikhyat.goyal@amd.com, Victor Lim <vlim@gigadevice.com>
Subject: Re: [PATCH] Linux: SPI NOR flash: adding parts to gigadevice.c
In-Reply-To: <20221206111037.8999-1-vlim@gigadevice.com>
References: <20221206111037.8999-1-vlim@gigadevice.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <b28701983841143c1d1f456fa15ac88a@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221206_072024_504664_83BAC210 
X-CRM114-Status: UNSURE (   7.68  )
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

Am 2022-12-06 12:10, schrieb Victor Lim:
> Please find the part #s added below the line
> /* adding these parts */

This isn't better either. Frieder already pointed out the mistakes
in the previous thread.

But in general we need one patch per part with SFDP dumps and also
some testing with this exact part.

But in general, if you worry about not being able to boot with
these flashes, there is now a generic spi-nor driver available [1],
which uses the information from the SFDP tables. So I'd presume
every new flash should be supported at least for basic operations
out of the box.

-michael

[1] 
https://lore.kernel.org/linux-mtd/166903807811.85501.6803386075881922742.b4-ty@microchip.com/

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
