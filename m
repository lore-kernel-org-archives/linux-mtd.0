Return-Path: <SRS0=B2Jc=KF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6E58C433B4
	for <linux-mtd@archiver.kernel.org>; Mon, 10 May 2021 14:48:43 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A41286109F
	for <linux-mtd@archiver.kernel.org>; Mon, 10 May 2021 14:48:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A41286109F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:Cc:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=iRHOsIInUCRTSVPz2U6roziWrecnDPmFQwUlPHIsL8k=; b=fqmWFtz89ORLEMgHHQdzanIkz
	V9xKjBRtVuEZiwoy0ydh/ejUacfWulcVVeOUo4um5XQG3lnUrrCz16uItC93tg5QkiN/Usv+QNrPw
	8Bnqfe09mP2xtn3P6sF8kQT1cH2CWPoJXog97TLVkVi7+a6+Jxy9AJuIuNxTpugnPMkzndr2NUfd6
	C7YkpGZcmldWJOLzdbM2jgGYCh6V6sQUGgxoowPLDlWXR6inzMVeCwTb/NDtOYCfqAAz/wujGU1/z
	ZPPDzB9Cn+nK734q0AUKvjjB1le1ruXMyYJ/29NEljKmAtuqdTJXFB6B+2HLnNnTm038FqyfmardD
	RizyjIvig==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lg7By-00EfsZ-Ec; Mon, 10 May 2021 14:47:30 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg7Bw-00Efs6-25
 for linux-mtd@desiato.infradead.org; Mon, 10 May 2021 14:47:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=MIME-Version:
 Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
 :Subject:Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=DiZ3As1b2KNh+mu+ihIWwwKcDOii0G+3Ipx3FMG0w1o=; b=YlryMA0FYIVPDhpC11ST73q2ce
 6XDWh+vUiIOLzCphxmDAhJECoR471/jJ56N7S1Cj7IUj7E4wKvXamTjO6ao1OFE7ba1HZQG7z6Tgs
 o3b787sm+GrK1xBY0PGLO9u1izrZxQ0u3zXZc9VMyddJ/4Ed5L1fXyKNPWWxy4n6E13aCvWxeMcUL
 oMApoWpUrbD44fx983IUbhBqTkWR3+d5B507/qfIAQkOM0t0slyd0q8rA2VbsrecqLiEqBWjSFNsw
 P5dqDWPvKDMT2W97MT3j6nExbFeVyhCHjxB8bQYKZNRd9TrJYZvR7tj5vUvjHtomykgQyOHgEX6yU
 R6jNLXYg==;
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg7Bt-008pI3-HN
 for linux-mtd@lists.infradead.org; Mon, 10 May 2021 14:47:26 +0000
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1lg7Bb-0005Em-Ef; Mon, 10 May 2021 16:47:07 +0200
Received: from pza by lupine with local (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1lg7BZ-0001jS-In; Mon, 10 May 2021 16:47:05 +0200
Message-ID: <6dc43e369107d470d85dc541dc67432744bd4d01.camel@pengutronix.de>
Subject: Re: [PATCHv2 2/5] drm/imx: Add 8 pixel alignment fix
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Sebastian Reichel <sebastian.reichel@collabora.com>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>
Cc: Rob Herring <robh+dt@kernel.org>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Alessandro Zummo <a.zummo@towertech.it>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Miquel
 Raynal <miquel.raynal@bootlin.com>,  Saravana Kannan
 <saravanak@google.com>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org,  linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,  linux-rtc@vger.kernel.org,
 linux-mtd@lists.infradead.org, kernel@collabora.com,  Boris Brezillon
 <boris.brezillon@collabora.com>
Date: Mon, 10 May 2021 16:47:05 +0200
In-Reply-To: <20210428222953.235280-3-sebastian.reichel@collabora.com>
References: <20210428222953.235280-1-sebastian.reichel@collabora.com>
 <20210428222953.235280-3-sebastian.reichel@collabora.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210510_074725_584783_161B473E 
X-CRM114-Status: GOOD (  11.03  )
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

Hi Sebastian,

On Thu, 2021-04-29 at 00:29 +0200, Sebastian Reichel wrote:
> Some standard resolutions like 1366x768 do not work properly with
> i.MX6 SoCs, since the horizontal resolution needs to be aligned
> to 8 pixels (so 1360x768 or 1368x768 would work).
> 
> This patch allocates framebuffers allocated to 8 pixels. The extra
> time required to send the extra pixels are removed from the blank
> time. In order to expose the correct display size to userspace,
> the stride is increased without increasing the width.
> 
> Without this patch systems with this display resolution hang
> indefinitely during boot up.
> 
> Suggested-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Thank you, I've rebased and applied this patch on top of imx-drm/next.

regards
Philipp

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
