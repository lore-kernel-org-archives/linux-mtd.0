Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A574ECC6B1A
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Oct 2026 08:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jooi0uaBQQFtKN4wZxuXGM4Qzfu6BjVNo9uxu2M+XNw=; b=WV6rjJGLc2j+4O
	Y/0J/52P15G6//Mkl8lkT21Slabhzu9QQKpeMLuR7sNqjG64wzeSxMMcs5HyKaZrXqg5qXrTtC0Ya
	yN4lX9DmS6Dv8EsGmodVQ3hNS5GjIQQCpMfsbUOtz156FBLetZmkOpHkILTAbfVlbYtD1VLtTM4Th
	N41EKM22TNBKaKayUb56MKya6yy9gA8JoyeAHegXdi7CyXFn8d62fLfH7ZNO5EToGT+vlGLal6R1V
	Zrqo77CSrfvmGtS7caazhykuJ8vn6gckZDl7QnnXMVeXjkaLMKLSc+I/Td70KqQlVyWagn6XsBtuP
	tju2gQ1sTYoWddlvyHSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGuTc-0000000Euex-4Ar5;
	Wed, 14 Oct 2026 08:36:44 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGuTZ-0000000EudS-3PGL;
	Wed, 14 Oct 2026 08:36:43 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id AA2A81A1229;
	Wed, 14 Oct 2026 08:36:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 73D2E60368;
	Wed, 14 Oct 2026 08:36:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E2AA410328A40;
	Wed, 14 Oct 2026 10:36:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791966993; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=AmkKhagroyTrfnY1UehniY27S8y3ZQdzENbUkvimUcU=;
	b=JBp6AxJvp56jOjxN93fuSFzzVy7v+V4KlZeXAfa6jRLV9uyWrAbNDML472XbDxWUaNMrFO
	Hf29Y7aRcojyIMBA/7xHynWjXwM6MbsHsZjECXV0P0d3ShgkCGPVFlUVZ6MRK7iFaYl1NC
	3ShqlroitL43kWo4feCHSIYzit1sosXbACgNz0o2YrOgzExSIiwgoNNc3msTUr14aYaN3L
	EhnjMywzLnHUAFeDzEmS7+Zsd/LgNPrVhD10c01nfgQGTtGgGMCbn7sYrpbmLdZL3vhRaR
	tbg/GJ2HnyEbJMw2ybrYBcRoR8lKZJRQJaMJFM9oCEnJWT5L7pFh1gpYVWT+7Q==
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
Subject: Re: [PATCH v8 3/8] nvmem: core: take a reference on dev.of_node in
 nvmem_register()
In-Reply-To: <2e21cc4b871da8764e3a12d0ebdcf7cb799149ab.1790847519.git.manikandan.m@microchip.com>
	(Manikandan Muralidharan's message of "Wed, 14 Oct 2026 12:10:07
	+0530")
References: <cover.1790847519.git.manikandan.m@microchip.com>
	<2e21cc4b871da8764e3a12d0ebdcf7cb799149ab.1790847519.git.manikandan.m@microchip.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Wed, 14 Oct 2026 10:36:26 +0200
Message-ID: <87qzhsznjp.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_013641_992157_A0CE41A2 
X-CRM114-Status: UNSURE (   5.33  )
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

On 14/10/2026 at 12:10:07 +0530, Manikandan Muralidharan <manikandan.m@microchip.com> wrote:

> nvmem_register() stores config->of_node (or config->dev->of_node)
> into nvmem->dev.of_node without taking its own reference. Callers
> that get the node via of_get_compatible_child() etc. and drop their
> reference right after registering leave nvmem->dev.of_node backed by
> no reference at all.
>
> Take an of_node_get() when assigning nvmem->dev.of_node and release
> it in nvmem_release(). Existing callers that hold their own get/put
> pair around the registration call need no changes, since get/put on
> a device_node is per-holder and independent of core now also holding
> one.
>
> Suggested-by: Michael Walle <mwalle@kernel.org>
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
