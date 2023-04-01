Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9686DC6FD1D
	for <linux-mtd@archiver.kernel.org>; Sat,  1 Apr 2023 19:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cc5p2G1CuWz6Agn3UORH3Xg/WxchYcI59P9p6qu4Nog=; b=VFRMqKzxDvIQUV
	8X0OpkSAco7/QmS2EWxW2j87rXbqqryVRLCT/HbNdmVj3+gQCiIhixe5Dco7miX415jLrb42UHRA5
	bqv5taMM7Ax7jwRSolUAvQ8DAAI72tQeHd1fm5DyuW8M8UWHXcY4XP3qXhQguJpDQz2rUS0EU9KFf
	aY0zJnuS4CAMeEEkv6I/oqfOMGbL0PJw+4XgmoXuIN+GFfVJrGIKbZikOts2Pm80SprO39/vEzhg5
	HVG6dnGI58SJqNOlyFWyAMNVIOhj/ZcJLf391hxamy25Rp6Me30zaMsiiyok6ufDP3DZKe9NFtlIg
	sAgK+f8MBhPWuo8La78w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pigX5-00BAaT-0c;
	Sat, 01 Apr 2023 19:04:59 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pigX2-00BAZg-03;
	Sat, 01 Apr 2023 19:04:58 +0000
Received: from ip4d1634d3.dynamic.kabel-deutschland.de ([77.22.52.211] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1pigWu-00048l-0m; Sat, 01 Apr 2023 21:04:48 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Phil Edworthy <phil.edworthy@renesas.com>,
 Uwe =?ISO-8859-1?Q?Kleine=2DK=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 kernel@pengutronix.de
Subject:  Re: [PATCH 40/49] mtd: rawnand: rockchip: Convert to platform remove callback
 returning void
Date: Sat, 01 Apr 2023 21:04:46 +0200
Message-ID: <3562741.hdfAi7Kttb@diego>
In-Reply-To: <20230401161938.2503204-41-u.kleine-koenig@pengutronix.de>
References:  <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
 <20230401161938.2503204-41-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230401_120456_060064_D0647A04 
X-CRM114-Status: GOOD (  12.30  )
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

Am Samstag, 1. April 2023, 18:19:29 CEST schrieb Uwe Kleine-K=F6nig:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
> =

> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> =

> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
