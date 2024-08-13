Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37FE7C52D7C
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Aug 2024 14:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kTHUWD31OYtK3kSsVXkoB5H6S5hAidJgsQAbZlOS4g4=; b=to1SVnucy+Gd61
	JsKZZL+JI/UAtHwk3aus8ZDIPImLZJI1wrmPT2PQFGjQb5/lKiWSkOkFkhHRjS5u+1kDYUWS1w7C3
	+tiCnCyRQlCtSkOxzbqlkf92o6Xiy1zMu+hUtuG4OUDJarrmInFmiMGHT64fcNAVqI495BTJADtof
	YemxgH9dHdnB0EhJViow3CWPRJbLjsuiE99h736lqgCiIRfqX3xLWZcxdat8GuSswJ0uZZxRcUpzk
	Mj/EEAdzZ79ZhKSJzEjkoKH5NILgJNPI1CruIjSCjOOQyPVFmP8HdK8TqCz0aHUJjgpzePhyllWhn
	P8cQr67oW+Xow/pm33uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdsae-000000041z6-0vcy;
	Tue, 13 Aug 2024 14:33:36 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdsaa-000000041xr-0zHR
	for linux-mtd@lists.infradead.org;
	Tue, 13 Aug 2024 14:33:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id AEA6ECE13E0;
	Tue, 13 Aug 2024 14:33:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2E37C4AF0F;
	Tue, 13 Aug 2024 14:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723559607;
	bh=3a6mRuAjt3jIt4YRX2DWO332ocA6zv8y2+Yw3KbG7FI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=iUfWLnfG8bNGd7QIFpHNn6S9UB701G5zggTss4wNqKyd6g6F1qk2ziwTav9jz4BF2
	 OjilPhBCr5rE7/MjXrlL9eHesqGEQi9uIECrgGYSmJChNaOWcugFxm7+bFh9UlQWd2
	 06gjYgy/WiBPRTk0IRDwY6kC19B9mvcX9i1AbWzA2QrzYAVVzEoU4emS+DjEUvSk8Y
	 +Y5f9FQMaGFM2wb4K5OPES2TlqAw8zH5VmoIxWN+E/wgPZz6hWLQQDy8tqEVYbhLD4
	 a+4BI4EUQlE+58dD2KmCNIodh59x0gapma8B+e3OQMifg8B4Te2mgwBnXfxCjPZdC8
	 oAmZFAZBjFj9g==
From: Pratyush Yadav <pratyush@kernel.org>
To: Michael Walle <mwalle@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,  Pratyush Yadav
 <pratyush@kernel.org>,  Miquel Raynal <miquel.raynal@bootlin.com>,
  Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: spi-nor: winbond: add Zetta ZD25Q128C support
In-Reply-To: <20240804221535.291923-1-mwalle@kernel.org> (Michael Walle's
	message of "Mon, 5 Aug 2024 00:15:35 +0200")
References: <20240804221535.291923-1-mwalle@kernel.org>
Date: Tue, 13 Aug 2024 16:33:25 +0200
Message-ID: <mafs0mslgze4q.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240813_073332_521425_07C51608 
X-CRM114-Status: GOOD (  10.03  )
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

On Mon, Aug 05 2024, Michael Walle wrote:

> Zetta normally uses BAh as its vendor ID. But for the ZD25Q128C they
> took the one from Winbond and messed up the size parameters in SFDP.
> Most functions seem compatible with the W25Q128, we just have to fix up
> the size.
>
> Link: http://www.zettadevice.com/upload/file/20150821/DS_Zetta_25Q128_RevA.pdf
> Link: https://www.lcsc.com/datasheet/lcsc_datasheet_2312081757_Zetta-ZD25Q128CSIGT_C19626875.pdf
> Signed-off-by: Michael Walle <mwalle@kernel.org>

Applied to spi-nor/next. Thanks!

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
