Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE2A9C77B72
	for <linux-mtd@archiver.kernel.org>; Fri, 14 Apr 2023 23:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vn0Hpq5vmLJFIXeY4FCsnDsu9+38wAB1DMnL8gJ6gTw=; b=c6Jm4TH3572x4o
	QQWZ4rx86BuqpjHh6niQrTPnct373ozWntSS+DUyT5ARuPzsm63wKk0SvjIcGckDMgklUJa2b8IQF
	ipuI8yQOw9wkjBIT0/mD4jYByBT2UXBSJ+m9ATzFc6kRfbVm0ovwhTyuVHPI+xVxRQrBVzjC0zqzP
	aP7vDnrwKz59jNVyAkc1sxA+g9uJCXyS/tnT6sY2Ndez6O7L9+5oMHZo0ynJIDQuDOtXU50JIf+ZO
	7CIOnyXEO4h5PbBZPvQKnw9ErK/pt76lp9UzNod8ZQPwCbN98+G8u53C1vs6uJBTVBusZldErSSZd
	VSRv7Fo4elh+a25rkSlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pnSbS-00AhR6-16;
	Fri, 14 Apr 2023 23:13:14 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pnSbP-00AhQC-1a
	for linux-mtd@lists.infradead.org;
	Fri, 14 Apr 2023 23:13:12 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1pnSb0-0005eK-1N;
	Sat, 15 Apr 2023 01:12:46 +0200
Date: Sat, 15 Apr 2023 00:12:44 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Richard Weinberger <richard@nod.at>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	chengzhihao1 <chengzhihao1@huawei.com>,
	Nicolas Schichan <nschichan@freebox.fr>,
	George Kennedy <george.kennedy@oracle.com>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	yi zhang <yi.zhang@huawei.com>
Subject: Re: [PATCH -next v3] ubi: Fix failure attaching when vid_hdr offset
 equals to (sub)page size
Message-ID: <ZDnd7KmiRDhFuhhF@makrotopia.org>
References: <20230306013308.3884777-1-chengzhihao1@huawei.com>
 <20230324161923.1456371-1-nschichan@freebox.fr>
 <2c2c2ce9-795b-4f76-cde9-db4a4066dcc1@huawei.com>
 <20230329175421.3bd4906e@xps-13>
 <53992166.434647.1680125620704.JavaMail.zimbra@nod.at>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <53992166.434647.1680125620704.JavaMail.zimbra@nod.at>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230414_161311_526296_68D1F71A 
X-CRM114-Status: UNSURE (   7.00  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Richard,

On Wed, Mar 29, 2023 at 11:33:40PM +0200, Richard Weinberger wrote:
> ----- Urspr=FCngliche Mail -----
> > Von: "Miquel Raynal" <miquel.raynal@bootlin.com>
> >> Thanks for testing.
> >> =

> >> > Tested-by: Nicolas Schichan <nschichan@freebox.fr>
> > =

> > Same here.
> > =

> > Tested-by: Miquel Raynal <miquel.raynal@bootlin.com> # v5.10, v4.19
> =

> Applied to next, PR will follow soon.

As stable linux trees are affected I wonder when this will hit
linux-stable, ie. will it be part of 5.15.108, for example?


Cheers


Daniel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
