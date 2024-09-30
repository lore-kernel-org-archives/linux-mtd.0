Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D73ECF649D
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Sep 2024 10:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pr56qChgqsj3SRmL9XHiT2W3a3XnSI6R5w0LihmG5eg=; b=fqktY7QUWYfNy7
	RQIBL4k/0t66Z3VmI8pJjoZs8xCyM9YQGbshJCYH2SLB2nP81rdGhJGLIfxUeE92R8mG3skE4cKMG
	rCrs+L//G0/AESlHFfCTVZnsA55GyztU6lE/0Klopbavkph/A6XygKA3zCBWeDlrEqKrjJ+/nJl2w
	DZI8c9Tgu/cvpHIqsCvaSHm7yKeV1pCkJzunm8XeisZjXW/dx0mpH7YSXzsEIKErUKOOjk4Oj0gkq
	7uV9FWKXERWaH+kwUSZwc0T/Q3IARX4kXJ4ohh1+47liadi6cWn4QjlR4M4zTc3KV0UYbWOkAahN7
	Rj7Zhcfp87YTWVo6w4iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svDFz-0000000GcmP-2zGG;
	Mon, 30 Sep 2024 10:03:55 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svCps-0000000GYgh-1B43
	for linux-mtd@lists.infradead.org;
	Mon, 30 Sep 2024 09:36:58 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1svCpY-0005oj-Vr; Mon, 30 Sep 2024 11:36:37 +0200
Received: from [2a0a:edc0:2:b01:1d::c5] (helo=pty.whiteo.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mfe@pengutronix.de>)
	id 1svCpX-002bLD-Ok; Mon, 30 Sep 2024 11:36:35 +0200
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1svCpX-00328M-25;
	Mon, 30 Sep 2024 11:36:35 +0200
Date: Mon, 30 Sep 2024 11:36:35 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v2 2/3] mtd: spi-nor: support vcc-supply regulator
Message-ID: <20240930093635.6pyp4qole3qynllq@pengutronix.de>
References: <20240930-spi-v2-0-ed7f6bcbe0df@nxp.com>
 <20240930-spi-v2-2-ed7f6bcbe0df@nxp.com>
 <20240930111914.4b412581@xps-13>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240930111914.4b412581@xps-13>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_023656_348859_7D066795 
X-CRM114-Status: GOOD (  20.20  )
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

Hi Miquel,

On 24-09-30, Miquel Raynal wrote:
> Hi,
> =

> peng.fan@oss.nxp.com wrote on Mon, 30 Sep 2024 17:22:25 +0800:
> =

> > From: Peng Fan <peng.fan@nxp.com>
> > =

> > SPI NOR flashes needs power supply to work properly. The power supply
> > maybe software controllable per board design. So add the support
> > for an vcc-supply regulator.
> > =

> > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > ---
> >  drivers/mtd/spi-nor/core.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> > =

> > diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> > index 9d6e85bf227b..5249c8b13916 100644
> > --- a/drivers/mtd/spi-nor/core.c
> > +++ b/drivers/mtd/spi-nor/core.c
> > @@ -17,6 +17,7 @@
> >  #include <linux/mtd/spi-nor.h>
> >  #include <linux/mutex.h>
> >  #include <linux/of_platform.h>
> > +#include <linux/regulator/consumer.h>
> >  #include <linux/sched/task_stack.h>
> >  #include <linux/sizes.h>
> >  #include <linux/slab.h>
> > @@ -3462,6 +3463,10 @@ int spi_nor_scan(struct spi_nor *nor, const char=
 *name,
> >  	if (!nor->bouncebuf)
> >  		return -ENOMEM;
> >  =

> > +	ret =3D devm_regulator_get_enable(dev, "vcc");
> =

> 					_optional ?

The regulator optional API is different compared to other optional APIs.
If we would use optional here, we would need to check the returned error
code. On the other hand if the non optional API is used and the
regualtor is missing, a dummy regualtor is returned (as pointed out by
Marc).

Please see the _optional API doc to see more information about the
_optional usage.

Regards,
  Marco

> > +	if (ret)
> > +		return ret;
> > +
> >  	ret =3D spi_nor_hw_reset(nor);
> >  	if (ret)
> >  		return ret;
> > =

> =

> =

> Thanks,
> Miqu=E8l
> =


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
