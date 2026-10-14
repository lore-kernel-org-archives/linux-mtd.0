Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 847B4CC6B29
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Oct 2026 08:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HS/ZVLUCkt9if18h4IRwV1FU9rocMBhhwsXDgJacB/0=; b=CFX51I/2xcISlM
	n6/36kb/K95hH3qzvmHLn54xD38fv8IkqLPWd6dNuwXFGOb0X4HQ8D7JopuVFhmfM4FwYcuB+uxIk
	kcmriFOxlNpFOZfX9jRE7IeILQUgYyd3sMci41kfumqaYW29QDF0MoueXvAjAc7HwXoNIPN008BWP
	ILqK372PCj+rLk+iYnl2GB3jF0OJZ0MsJMaN6GiH5lfg2KkzA1N5CHiOOxxTYAW1iFxRCoQFzdAVc
	uSSH3EI/QGKpvM44ULcGC+x6gmoeHqThFg3Pdiaja7VlVzewwA/ZD0l9IPZSJm7tzXzbXf06MEros
	u6USJ273N1hN+ybB4fnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGuVj-0000000EvCN-3cCR;
	Wed, 14 Oct 2026 08:38:55 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGuVg-0000000Ev9j-2OhQ;
	Wed, 14 Oct 2026 08:38:53 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 87F55C63440;
	Wed, 14 Oct 2026 08:39:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9323D60368;
	Wed, 14 Oct 2026 08:38:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4D675103286A7;
	Wed, 14 Oct 2026 10:38:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791967128; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=ngJFCKHqbgCLyG9vhboqwQUYeRLMtMl0aG5g/OQVWlc=;
	b=mq2Xp10guRPwOdzd5i29FPKBO3X5MoRrIDnynu+OM/FCaB5zvzCaTUpQoKiQNkWiJBd1P4
	RcIpGp8oUqiBVqGBcBchPS8i8MsOXMOju1szusJtZev+cdUICiyy1pMMwlD4aHLI9/yWVB
	12lNzP6dgKerzIA9QGtkL4HgipGMFlZIc7aeZOdLyZHqqfYDMk8Vr2w3+iNzvySIGpPexz
	z73yYP6RfNokqHlpefpHcIX/X5aLu+ceWfhnv0vWpEsXGbWeXoqb+uMUH0HU4mzObgcoIX
	hLZGbyZoZbB9Oc13tOMNwnmWYFBkgUxWv8kpUkc0QThocKv1ia7Fk3Df69msIA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Manikandan Muralidharan <manikandan.m@microchip.com>
Cc: <pratyush@kernel.org>,  <mwalle@kernel.org>,
  <takahiro.kuwano@infineon.com>,  <richard@nod.at>,  <vigneshr@ti.com>,
  <robh@kernel.org>,  <krzk+dt@kernel.org>,  <conor+dt@kernel.org>,
  <srini@kernel.org>,  <nicolas.ferre@microchip.com>,
  <alexandre.belloni@bootlin.com>,  <claudiu.beznea@tuxon.dev>,
  <linux@armlinux.org.uk>,  <richardcochran@gmail.com>,
  <linusw@kernel.org>,  <arnd@arndb.de>,  <aaro.koskinen@iki.fi>,
  <gregkh@linuxfoundation.org>,  <mathieu.dubois-briand@bootlin.com>,
  <michael@walle.cc>,  <linux-mtd@lists.infradead.org>,
  <devicetree@vger.kernel.org>,  <linux-kernel@vger.kernel.org>,
  <linux-arm-kernel@lists.infradead.org>,  <netdev@vger.kernel.org>
Subject: Re: [PATCH v8 4/8] mtd: spi-nor: sfdp: expose the SFDP as a
 read-only NVMEM device
In-Reply-To: <093672d183a06dc2f37366b2f9ff144316850863.1790847519.git.manikandan.m@microchip.com>
	(Manikandan Muralidharan's message of "Wed, 14 Oct 2026 12:10:08
	+0530")
References: <cover.1790847519.git.manikandan.m@microchip.com>
	<093672d183a06dc2f37366b2f9ff144316850863.1790847519.git.manikandan.m@microchip.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Wed, 14 Oct 2026 10:38:42 +0200
Message-ID: <87ld80znfx.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_013852_769560_2BD68EB9 
X-CRM114-Status: UNSURE (   6.88  )
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

On 14/10/2026 at 12:10:08 +0530, Manikandan Muralidharan <manikandan.m@microchip.com> wrote:

> The SPI NOR core already reads the SFDP tables during enumeration and
> caches them in nor->sfdp->dwords (see spi_nor_parse_sfdp()). Re-expose
> that cached data as a read-only NVMEM device, in on-flash byte order,
> rooted at the flash's SFDP child node (compatible "jedec,sfdp").
>
> This lets NVMEM cells reference any SFDP data: a fixed-layout for
> parameters at a known offset, or an nvmem-layout parser for vendor data
> whose location must be discovered at runtime. The device is only registered
> when an "sfdp" node is present in the device tree.
>
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
