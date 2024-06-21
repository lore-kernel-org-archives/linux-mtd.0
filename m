Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F5F8C27C4F
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Jun 2024 15:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z5NGz19ezsDKZMA3xGrvCCnItCTt1NW+CBlekbw63ok=; b=Y0cEqCDXUOt66w
	WZ1I3JbBF0YAm97L8bt8aU3x4F07bu7oOKOvTRafWHbGmMtv2BwgP9DD5AQZW5sjued0pSfhx0dj4
	hYcCVb+QNxcJhK50KDbUZHJt2GeaFoZzkzo6D9/QW+uIzkc1HjnIZ8vyR0gGtIG/cQirUw001jjBL
	tYOv/7n9AZcw100xfoBfdPPudGeeG0IXpzmOknIYraDkEUENa1jpFdnmLN69RelTVvqmmehwU+fdU
	V8DwjsbFuni2NcPfBd7itLgTy+LAq/3yhoXLoat4Gj0uAuELRG5rUK6xbks8j23J1vV0mZXlRHiWS
	eYvp+Sr0ajl5OsRiZj5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKgXM-00000009ogg-3Jnv;
	Fri, 21 Jun 2024 15:50:52 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKgXK-00000009ofi-1WwH
	for linux-mtd@lists.infradead.org;
	Fri, 21 Jun 2024 15:50:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E31146248A;
	Fri, 21 Jun 2024 15:50:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1521CC3277B;
	Fri, 21 Jun 2024 15:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718985048;
	bh=QQyDYatsQrlwi7QwFF8CDCr7I6jryJgPpAG3vTbM6l8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=b/gOhkq5Wi+QUt0i18sgThFmrL/duhin+v9G1m1FL7ii4LXPgSKbRHtJbzVbbQ0kq
	 n2XtG6yXTK5UAfDIt2cfrUEKGlzxcKKNNxqiuSAQEpGj7ZBvwv7tKhBguGlKr9+Rjl
	 mEm2l8FT0D7RYpHqPXOFedGbMLl0zpiWy1vJm/kS1rlwUfegYhXvhajOlqICS2fFp5
	 H61AvSWT8/Py/utVPFmsh8gFmXufJ9n+pi/gRGX2NDdKIluLbU48T3py6G4hvFbAZ/
	 HwEBwA5Kh2Q07orS6rEB+fmFtHbBi2epLNorzT0u0zZU8/3QKkuN5KV5plpvvZnfLq
	 xjXcGO6Ln1NYA==
From: Pratyush Yadav <pratyush@kernel.org>
To: Michael Walle <mwalle@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,  Pratyush Yadav
 <pratyush@kernel.org>,  Miquel Raynal <miquel.raynal@bootlin.com>,
  Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Linus Walleij <linus.walleij@linaro.org>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org,  Esben
 Haabendal <esben@geanix.com>,  Hartmut Birr <e9hack@gmail.com>
Subject: Re: [PATCH v2] mtd: spi-nor: winbond: fix w25q128 regression
In-Reply-To: <20240621120929.2670185-1-mwalle@kernel.org> (Michael Walle's
	message of "Fri, 21 Jun 2024 14:09:29 +0200")
References: <20240621120929.2670185-1-mwalle@kernel.org>
Date: Fri, 21 Jun 2024 17:50:45 +0200
Message-ID: <mafs0v822e1m2.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240621_085050_494922_A7CBBDC8 
X-CRM114-Status: GOOD (  11.50  )
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

On Fri, Jun 21 2024, Michael Walle wrote:

> Commit 83e824a4a595 ("mtd: spi-nor: Correct flags for Winbond w25q128")
> removed the flags for non-SFDP devices. It was assumed that it wasn't in
> use anymore. This wasn't true. Add the no_sfdp_flags as well as the size
> again.
>
> We add the additional flags for dual and quad read because they have
> been reported to work properly by Hartmut using both older and newer
> versions of this flash, the similar flashes with 64Mbit and 256Mbit
> already have these flags and because it will (luckily) trigger our
> legacy SFDP parsing, so newer versions with SFDP support will still get
> the parameters from the SFDP tables.
>
> Reported-by: Hartmut Birr <e9hack@gmail.com>
> Closes: https://lore.kernel.org/r/CALxbwRo_-9CaJmt7r7ELgu+vOcgk=xZcGHobnKf=oT2=u4d4aA@mail.gmail.com/
> Fixes: 83e824a4a595 ("mtd: spi-nor: Correct flags for Winbond w25q128")
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Michael Walle <mwalle@kernel.org>

Reviewed-by: Pratyush Yadav <pratyush@kernel.org>

Applied to spi-nor/next. Thanks!

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
