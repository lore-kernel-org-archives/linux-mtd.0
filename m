Return-Path: <SRS0=TxUZ=KP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA56FC433B4
	for <linux-mtd@archiver.kernel.org>; Thu, 20 May 2021 15:26:52 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B29396121E
	for <linux-mtd@archiver.kernel.org>; Thu, 20 May 2021 15:26:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B29396121E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O6+dxHOhsTfRSzIjL1eImCQHSJZYvMtCL5RiyFfFjHo=; b=BmOAwegta+WsbcvHDHL/56lO1M
	MQ/QEzy2mZFn/XuadhASFSiBsHqrQW1pWFqk6u0viPO7g7HhhPBu/wZ5EGEQ84oKFlz0aU0KiyIZQ
	IDNnurhWoVmK+foAoqQWTJwsUE+wbhBs8w26HO6xFiqkhci1rF3t1HW7Dvb1IJflrH3HpWyPhJW70
	Hfxz4By0fYFeaO5rKOv9Xsc72oKN08os395ibpyahJdY46Ile7rbiYVzGXjiMlM9FzZwFd7nWNGMV
	zQWNTDDQGHYuJ2dw84KX+o/29rNALIKDuzYAohD7hWKT0Ijg95/YeGVv1r9iqwDdMPVu8WIZ84KEH
	PlavAVtw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ljkYu-001g7I-N9; Thu, 20 May 2021 15:26:13 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ljkXS-001fXp-7w
 for linux-mtd@desiato.infradead.org; Thu, 20 May 2021 15:24:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=YHf/1v1fGbUdpmCKcskQepvJMic+ILVUbOQLobw+E8Q=; b=QZhuMvkMbsBWV0AAj1uEZgflzT
 ha7bekifW4JjUmGKeBsS5FIY77jUfdQgQ4qM1xC7WXIG1raUm9As6SVUf5hxibhJEn0IoB9JqiQy0
 DbdEVQYmMMDBXahqGQ/A2n9nUh2W6t0aXTH/yXBFlWYFdorNUIexgCTigUkh4BwbgTOmTy9x24wuF
 rF5CFBLvaS7nh3XSBFw11/Clm17evBq28zp0wbSl8ORXuHFxSvUL8DCQvdE7rdln/3SJjH5mmhGAw
 Z6pm/NGD+yWl17sQntdx94uTLam9SoxtUtMG9kLUQmVqmzRzxS1HQvxv4Am/XedXm0/hJJU5+ou41
 kufdemhA==;
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljkXP-00GStH-KX
 for linux-mtd@lists.infradead.org; Thu, 20 May 2021 15:24:40 +0000
Received: by mail-lf1-x12b.google.com with SMTP id b26so9113403lfq.4
 for <linux-mtd@lists.infradead.org>; Thu, 20 May 2021 08:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YHf/1v1fGbUdpmCKcskQepvJMic+ILVUbOQLobw+E8Q=;
 b=CHhbCCoXLMa7YLC7+DNtAb8hhHdxRqAg0wQBXxTog8yWISm+WFO+q0LGTDYf483tsK
 MLF/j+75Wf4E6OiCTmEmaEjdV+235Q1JsQtIHuQr+WZpBtvw/hskTkwOrVVxK+M+rXMK
 ljdx85dvDX5rgTuEl9Kt3pDzhr/EualTnM8p3CeJk7I+qaJPwzPfhR6+e4L4zs0QzUGG
 QWeYvIlDbr0b3piZegVSvtONXv91dgFeVjmGG5KqW0NBdsh5VWpU8kp7/eOubF4qVtAI
 mPcBKeQRrvzgN4NEVXCL5JSuD4OK/hxNN7trcPkdHPMBKhj11HKwG8X5nwkiExAMkq5T
 250A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YHf/1v1fGbUdpmCKcskQepvJMic+ILVUbOQLobw+E8Q=;
 b=GrbSp1T9QH4cfJyJ39//xdDaZPDgo49n93TPwDZtHWnhAAi3fdQ/wEWJY6yFQ8FMGo
 shIiSvCD9ux6V/C1A2GTRBDRFZhNXv2FEGxtRPVvJq8XmCnfmqhZtg58gtjpvEl+/A40
 mQAYGzGFPvMycNEcH36XuTRQ6tT/Vk4cU2jSpUQ0SqwCLIBVnrdzxKVPJLYVLAIPrS6o
 Pu5cVDPFEXgZjAlbCTN8M4ERYECznndAv9J1fuLucutaY+4beLlaZiEZ5fHR4M3WsDcj
 cSmvb99HsHV71zCg3Wrcjob+CJQI7E/0U1hOBOa9EvjVm4pgX5nQW5hehTXy64cfcQwP
 VDwA==
X-Gm-Message-State: AOAM533vWyB0i4IUrXFpjI44LawdiyTDPgL1gFXqwZCo47dPNUjeBXWk
 nHUKZj0XIm0eF0AiAfJY7GJ6U5G9oQKp1zk9x/RurA==
X-Google-Smtp-Source: ABdhPJzJItWpdY1aIPg4g2EfiVyffJGj6ebM0naseD2zm9RG8i10R7z2Lh4yaAqdvoBYRdtz7FtG7T1QkEZHf93BkJ0=
X-Received: by 2002:ac2:544f:: with SMTP id d15mr3640883lfn.465.1621524277719; 
 Thu, 20 May 2021 08:24:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210520114851.1274609-1-clabbe@baylibre.com>
 <20210520114851.1274609-2-clabbe@baylibre.com>
In-Reply-To: <20210520114851.1274609-2-clabbe@baylibre.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 20 May 2021 17:24:26 +0200
Message-ID: <CACRpkda6ou1SJZzBwHXN_kWofnFw8w7XAkr7VcFO2NrqbQug_Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] mtd: partitions: redboot: fix style issues
To: Corentin Labbe <clabbe@baylibre.com>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>, 
 =?UTF-8?Q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh R <vigneshr@ti.com>, 
 linux-kernel <linux-kernel@vger.kernel.org>, linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210520_082439_692155_B085518F 
X-CRM114-Status: UNSURE (   9.24  )
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

On Thu, May 20, 2021 at 1:49 PM Corentin Labbe <clabbe@baylibre.com> wrote:

> This patch fixes easy checkpatch issues.
>
> Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
(...)
> -    uint32_t     flash_base;    // Address within FLASH of image
(...)
> +       u32       flash_base;    // Address within FLASH of image

Does checkpatch complain about this? At one point the MTD maintainer
disliked the u32/u16/u8 types and explicitly wanted to use the C
standard library types, and it's the kind of eccentric maintainer
deviations we accommodate for.

From my personal side:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
