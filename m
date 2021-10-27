Return-Path: <SRS0=tFGH=PP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73182C433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Oct 2021 16:59:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 398DB6109D
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Oct 2021 16:59:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 398DB6109D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LLhcF+Ppk6wU1fSMw83EJaPDmRStHnAjT+EtcxtckDE=; b=2CQq/+FLVR+88v
	q8XGf3Tb9K47y+lATaJhTxELYzlWYUE9yEqVWEG/tu0zYff35LRavBEcFxJiNs01NiKnftSE8sxi2
	zP4/CKPhCXSGktLbRURe+eBTOCx3RLPzE7OliYCXrSC9+hiqnrCI/qgxYYbHV13NlAiFCm1alQYLu
	+jeKDaGfQNw/Av4Bahw9DLbW5QsNObNJJ0GZInuCe+VcYPszFVcrEIkANeORf3jCOwjgS+4xbusxt
	On30hsfkZu3TXOAMsUcnpcRW6U0pUftp61cEdr8HfhIdD0XDBerIZkfGKgGYMKmnM5szi+Bw1sZD5
	R/yMDP6W0WaBLZ1ucLYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfmGI-005Wtq-Rd; Wed, 27 Oct 2021 16:58:50 +0000
Received: from smtprelay0090.hostedemail.com ([216.40.44.90]
 helo=smtprelay.hostedemail.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfmGE-005Wqs-NP; Wed, 27 Oct 2021 16:58:48 +0000
Received: from omf01.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
 by smtprelay05.hostedemail.com (Postfix) with ESMTP id 88CE218027A8A;
 Wed, 27 Oct 2021 16:58:41 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by
 omf01.hostedemail.com (Postfix) with ESMTPA id 34EC11727C; 
 Wed, 27 Oct 2021 16:57:52 +0000 (UTC)
Message-ID: <20ffb5604269f9add568b343701d42097c599c89.camel@perches.com>
Subject: Re: dt-bindings: treewide: Update @st.com email address to
 @foss.st.com
From: Joe Perches <joe@perches.com>
To: Patrice CHOTARD <patrice.chotard@foss.st.com>, Marc Zyngier
 <maz@kernel.org>,  Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Rob Herring <robh+dt@kernel.org>, maxime coquelin
 <mcoquelin.stm32@gmail.com>, alexandre torgue
 <alexandre.torgue@foss.st.com>,  michael turquette
 <mturquette@baylibre.com>, stephen boyd <sboyd@kernel.org>, herbert xu
 <herbert@gondor.apana.org.au>,  "david s . miller" <davem@davemloft.net>,
 david airlie <airlied@linux.ie>, daniel vetter <daniel@ffwll.ch>, thierry
 reding <thierry.reding@gmail.com>, sam ravnborg <sam@ravnborg.org>, yannick
 fertre <yannick.fertre@foss.st.com>, philippe cornu
 <philippe.cornu@foss.st.com>, benjamin gaignard
 <benjamin.gaignard@linaro.org>,  vinod koul <vkoul@kernel.org>, ohad
 ben-cohen <ohad@wizery.com>, bjorn andersson <bjorn.andersson@linaro.org>,
 baolin wang <baolin.wang7@gmail.com>, jonathan cameron <jic23@kernel.org>,
 lars-peter clausen <lars@metafoo.de>, olivier moysan
 <olivier.moysan@foss.st.com>, arnaud pouliquen
 <arnaud.pouliquen@foss.st.com>,  Thomas Gleixner <tglx@linutronix.de>,
 Jassi Brar <jassisinghbrar@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Hugues Fruchet <hugues.fruchet@foss.st.com>, Fabrice
 Gasnier <fabrice.gasnier@foss.st.com>, Lee Jones <lee.jones@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Jakub Kicinski
 <kuba@kernel.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Kishon Vijay Abraham I <kishon@ti.com>,  Linus Walleij
 <linus.walleij@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>,  Mathieu Poirier <mathieu.poirier@linaro.org>, Matt
 Mackall <mpm@selenic.com>, Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,  Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Amit Kucheria
 <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>, Wim Van Sebroeck
 <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Viresh Kumar
 <viresh.kumar@linaro.org>, Ahmad Fatoum <a.fatoum@pengutronix.de>, Jagan
 Teki <jagan@amarulasolutions.com>, dillon min <dillon.minfei@gmail.com>,
 Marek Vasut <marex@denx.de>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>,  Sebastian Reichel <sre@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Paul Cercueil
 <paul@crapouillou.net>, Fabien Dessenne <fabien.dessenne@foss.st.com>, 
 Christophe Roullier <christophe.roullier@foss.st.com>, Gabriel Fernandez
 <gabriel.fernandez@foss.st.com>, Lionel Debieve
 <lionel.debieve@foss.st.com>, Amelie Delaunay
 <amelie.delaunay@foss.st.com>,  Pierre-Yves MORDRET
 <pierre-yves.mordret@foss.st.com>, Ludovic Barre
 <ludovic.barre@foss.st.com>, Christophe Kerello
 <christophe.kerello@foss.st.com>, pascal Paillet <p.paillet@foss.st.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jose Abreu
 <joabreu@synopsys.com>, Le Ray <erwan.leray@foss.st.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org,  linux-clk@vger.kernel.org,
 linux-crypto@vger.kernel.org,  dri-devel@lists.freedesktop.org,
 dmaengine@vger.kernel.org,  linux-remoteproc@vger.kernel.org,
 linux-i2c@vger.kernel.org,  linux-iio@vger.kernel.org,
 alsa-devel@alsa-project.org,  linux-media@vger.kernel.org,
 linux-mtd@lists.infradead.org,  netdev@vger.kernel.org,
 linux-phy@lists.infradead.org,  linux-gpio@vger.kernel.org,
 linux-rtc@vger.kernel.org,  linux-serial@vger.kernel.org,
 linux-spi@vger.kernel.org,  linux-pm@vger.kernel.org,
 linux-usb@vger.kernel.org,  linux-watchdog@vger.kernel.org
Date: Wed, 27 Oct 2021 09:57:50 -0700
In-Reply-To: <865a4055-5c2f-0793-bdce-9f04eac167d2@foss.st.com>
References: <20211020065000.21312-1-patrice.chotard@foss.st.com>
 <22fb6f19-21eb-dcb5-fa31-bb243d4a7eaf@canonical.com>
 <878ryoc4dc.wl-maz@kernel.org>
 <82492eb2-5a5e-39a2-a058-5e2ba75323e0@foss.st.com>
 <865a4055-5c2f-0793-bdce-9f04eac167d2@foss.st.com>
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
X-Stat-Signature: d7f39g9ut4x78f1qzm6ux4u3z7warbny
X-Rspamd-Server: rspamout02
X-Rspamd-Queue-Id: 34EC11727C
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1/mP1yO9Xb7wezovkJWdqP2VR+2BHiCxac=
X-HE-Tag: 1635353872-396338
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211027_095846_908634_2EC6BC43 
X-CRM114-Status: GOOD (  25.68  )
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

On Wed, 2021-10-27 at 15:56 +0200, Patrice CHOTARD wrote:
> On 10/27/21 8:11 AM, Patrice CHOTARD wrote:
> > On 10/20/21 1:39 PM, Marc Zyngier wrote:
> > > On Wed, 20 Oct 2021 08:45:02 +0100,
> > > Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com> wrote:
> > > > On 20/10/2021 08:50, patrice.chotard@foss.st.com wrote:
> > > > > From: Patrice Chotard <patrice.chotard@foss.st.com>
> > > > > =

> > > > > Not all @st.com email address are concerned, only people who have
> > > > > a specific @foss.st.com email will see their entry updated.
> > > > > For some people, who left the company, remove their email.
> > > > Also would be nice to see here explained *why* are you doing this.
> > > =

> > > And why this can't be done with a single update to .mailmap, like
> > > anyone else does.
> > =

> > Thanks for the tips, yes, it will be simpler.
> =

> I made a try by updating .mailmap with adding a new entry with my @foss.s=
t.com email :
> =

>  Pali Roh=E1r <pali@kernel.org> <pali.rohar@gmail.com>
>  Paolo 'Blaisorblade' Giarrusso <blaisorblade@yahoo.it>
> +Patrice Chotard <patrice.chotard@foss.st.com> <patrice.chotard@st.com>
>  Patrick Mochel <mochel@digitalimplant.org>
>  Paul Burton <paulburton@kernel.org> <paul.burton@imgtec.com>
> =

> But when running ./scripts/get_maintainer.pl Documentation/devicetree/bin=
dings/arm/sti.yaml, by old email is still displayed
> =

> Rob Herring <robh+dt@kernel.org> (maintainer:OPEN FIRMWARE AND FLATTENED =
DEVICE TREE BINDINGS)
> Patrice Chotard <patrice.chotard@st.com> (in file)
> devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE =
TREE BINDINGS)
> linux-kernel@vger.kernel.org (open list)
> =

> By default, the get_maintainer.pl script is using .mailmap file ($email_u=
se_mailmap =3D 1).
> =

> It seems there is an issue with get_maintainer.pl and maintainer name/e-m=
ail found in yaml file ?

I'm of two minds whether it's an "issue" actually.

get_maintainer is not the only tool used to create email
address lists.

Some actually read files like MAINTAINERS or .dts or .yaml
files directly to find maintainer addresses.

So If your name and email address is listed in an source file
where nominally active email addresses are entered then I
believe .mailmap should not modify it.

So I believe email addresses in each file should be updated
in preference to using a mailmap entry for nominally active
email addresses in these files.

---

$ cat Documentation/devicetree/bindings/arm/sti.yaml
# SPDX-License-Identifier: GPL-2.0
%YAML 1.2
---
$id: http://devicetree.org/schemas/arm/sti.yaml#
$schema: http://devicetree.org/meta-schemas/core.yaml#

title: ST STi Platforms Device Tree Bindings

maintainers:
  - Patrice Chotard <patrice.chotard@st.com>




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
