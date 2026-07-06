Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9DE1C43458
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Jul 2026 14:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pn9vWow2Z0BkrBhwtMvc4Xr5wCPFDxYay+AUBZt2UvU=; b=Snecr2cMzDpCIS
	8d2+prOLNRdFbjwJatP76ZqOG5nhuvA15uu+VzYsc/w812P4O9swq7WYZqHkLCnrPtA6UmZ4OnpAw
	ekjSh5EY+epemvbFeEdAWcFPTxo6Hd8i7gE30yFOCpxqalHatnzRa/rAYUs8rWSx6bV8a83j/xc2g
	dzxLU/T4xWJajss8DOdZcF5g6lTSCt1fkBGs1YcrduRuMNcQ7LyYHF/rFDcGmg9UaUt182lQ+DJk3
	vOChfY+rwnry0+lV1Cp7m3sf4B3jvNaDno3PMm4Jftu5OmZvhdowj5zjoyTEg28iYrdRLlFQOsB2G
	oyqMk+A+VUhwX0X490MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgkD7-0000000CjrE-3tcy;
	Mon, 06 Jul 2026 14:22:13 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgkD5-0000000CjpG-16eT
	for linux-mtd@lists.infradead.org;
	Mon, 06 Jul 2026 14:22:13 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id BD43B4E40CB6;
	Mon,  6 Jul 2026 14:22:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 92BA0601A2;
	Mon,  6 Jul 2026 14:22:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B5D4011BBA0E1;
	Mon,  6 Jul 2026 16:22:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783347729; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=hMvLtsm7HJEGV9CA9lPIbySySQBIuRWoc748T8Npwe4=;
	b=EabktF70DxXXfLpoD9d/2XOT81WvUIfoRFrtkP21b7Ls1yiRxQrERfDr7HTaZkiXyp0YA2
	slEW+AhrjKb5bxds9lskQUU0m05bZ/srxZuLO1j5yVuMWLnYe/VFPBdVbfxMxwPwP5ePIA
	gIiNTObgi+gbMhTPTO2CZyitkXpY9HZbE6p0vefEjAPmvEfDH4xutzNQLx0wQGh2HJxqdB
	es1k3k15Qe3xXHFPbRPenmTwfc9bjyv75RVGcIQhqb9LC30mAn276Ogi8GPdjkCxCrEeuz
	IXwRK8OEUNpdV1d6hXUofj65/LDVfniBQy85+GYMOeykZJoUnv7V5AbpHRKiAg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Michael Walle <mwalle@kernel.org>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Takahiro Kuwano
 <takahiro.kuwano@infineon.com>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  Tudor Ambarus
 <tudor.ambarus@linaro.org>,  linux-mtd@lists.infradead.org,  Cheng Ming
 Lin <chengminglin@mxic.com.tw>,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 7/8] mtd: spi-nor: push the rollback mechanism into
 the sfdp module
In-Reply-To: <20260703143003.1809579-8-mwalle@kernel.org> (Michael Walle's
	message of "Fri, 3 Jul 2026 16:29:18 +0200")
References: <20260703143003.1809579-1-mwalle@kernel.org>
	<20260703143003.1809579-8-mwalle@kernel.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Mon, 06 Jul 2026 16:22:05 +0200
Message-ID: <874iickxki.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_072211_441634_3F71E512 
X-CRM114-Status: UNSURE (   8.00  )
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

On 03/07/2026 at 16:29:18 +02, Michael Walle <mwalle@kernel.org> wrote:

> Right now, the core is handling the rollback of the parameters. But it
> doesn't have the knowledge what has to be rolled back. And in fact,
> havent rolled back everything. Push it down to the called function and
> make it mandatory, that this function has no side effects if it fails.
>
> Funny enough, there is a comment in the SFDP table handing code that

handling?                                                ^

> each table parser is responsible to roll back any changes. But none of
> them did. So while add it, expand the logic to that and roll it back for
> them. There is one simple rule though:
>
>   SFDP parsing and fixups may only modify the spi_nor_flash_parameters.

Ok.

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
