Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AE84C77B70
	for <linux-mtd@archiver.kernel.org>; Sat, 15 Apr 2023 18:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ls6ZfQT1i8pXnbgmMgQciD46xTfRIXZU3A4574wLzmE=; b=0HTsip/JVnX9B3
	FvfCUYXqklzDIAPrLmKh1FbwrWFF3wzNe1rRkDGCbzq/WxNJ1/KUOJ3sJnYg2sHeH18ldvYklE7+h
	NmQVT2HU1IqfNEudwN+/Ly+fXCPWgRG0QCf4jRs4yjwAy7iEvJWBvWf7XBCErvoM7zgGdXb+zN7ns
	i6ny+dWzcYHh/zvZpHvHlO/qn9O9IHLORn5MVK7wyqJ29ZAvJzDDTMOLqEPn23A109wC5zODTJq1N
	aUGaI4MZJhtquum/+/bavV+ZpxE3uNMr6NLLTI/VxrsK8mrjeVFMjB8YWyhbQ0LkHOKBKfhnYwZLq
	W5+HVWPvRCt247QGy8Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pnkEU-00CZZP-2W;
	Sat, 15 Apr 2023 18:02:42 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pnkER-00CZYt-0q
	for linux-mtd@lists.infradead.org;
	Sat, 15 Apr 2023 18:02:40 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1pnkEG-0004OG-1S;
	Sat, 15 Apr 2023 20:02:28 +0200
Date: Sat, 15 Apr 2023 19:02:26 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: stable@vger.kernel.org, linux-mtd <linux-mtd@lists.infradead.org>
Cc: Hauke Mehrtens <hauke@hauke-m.de>, Richard Weinberger <richard@nod.at>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	chengzhihao1 <chengzhihao1@huawei.com>,
	Nicolas Schichan <nschichan@freebox.fr>,
	George Kennedy <george.kennedy@oracle.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	yi zhang <yi.zhang@huawei.com>
Subject: Request to pick "ubi: Fix failure attaching when vid_hdr offset
 equals to (sub)page size"
Message-ID: <ZDrmsnX5BHxtBNwf@makrotopia.org>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230415_110239_321382_2AB72BAD 
X-CRM114-Status: UNSURE (   9.62  )
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

Hi,

please pick

 1e020e1b96afd ("ubi: Fix failure attaching when vid_hdr offset equals to (=
sub)page size")

from linux-next to stable trees.
The commit fixes a problem with another recent commit

 1b42b1a36fc94 ("ubi: ensure that VID header offset ... size")

which has already made it to stable trees and thereby broke attaching
UBI and hence renders devices unbootable.

As a temporary fix I have applied this patch downstream in OpenWrt.


Thank you!


Best regards


Daniel

----- Forwarded message from Daniel Golle <daniel@makrotopia.org> -----

Date: Sat, 15 Apr 2023 00:12:46 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Richard Weinberger <richard@nod.at>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, chengzhihao1 <chengzhihao1@h=
uawei.com>, Nicolas Schichan <nschichan@freebox.fr>, George Kennedy <george=
.kennedy@oracle.com>, linux-kernel <linux-kernel@vger.kernel.org>, linux-mtd
	<linux-mtd@lists.infradead.org>, Sascha Hauer <s.hauer@pengutronix.de>, yi=
 zhang <yi.zhang@huawei.com>
Subject: Re: [PATCH -next v3] ubi: Fix failure attaching when vid_hdr offse=
t equals to (sub)page size

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

----- End forwarded message -----

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
