Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20AC5C3064D
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Jul 2024 08:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TcNsbVWxpB2t1oavMxdtiz7JzSlZZ5kriGKesqT/Z1s=; b=Er9NxipL/Uthh3
	Wyxm1nFOzUuEwn5DgQi/FZYCyvflK0Dq2Is3RyzZvuL9fgediqIte/pmsMsnyPEenBtgidHutJxtc
	EqBXnIslfsQjSjAT5SPu8AU4+99iSazYP9zKDhsqWmZSMuG0OOyQO5WsVQqDg8J4vWdwzIzu57XOw
	QxLeJbekhpxvMtMJI7N+T48Az0k25M2aeJealW3f9CkuDpCXkGMrqtvpk4CfyucYyKo8bjvc6LMUz
	BL8PbW9ZdHxCVPNZ6kQK27vZpnL75G7K4cnSyE7BrzMH+87Xg2hziSzK0xGDza7xw//NLbl/Sr/BN
	4Af9HgGRjwwqyJc0icKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOYnj-00000005yhw-3QkS;
	Tue, 02 Jul 2024 08:23:47 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOYng-00000005yhD-41FO
	for linux-mtd@lists.infradead.org;
	Tue, 02 Jul 2024 08:23:46 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1sOYmu-00011E-US; Tue, 02 Jul 2024 10:22:56 +0200
Received: from [2a0a:edc0:2:b01:1d::c5] (helo=pty.whiteo.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mfe@pengutronix.de>)
	id 1sOYmp-006ZAc-UQ; Tue, 02 Jul 2024 10:22:51 +0200
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1sOYmp-00ANey-2Z;
	Tue, 02 Jul 2024 10:22:51 +0200
Date: Tue, 2 Jul 2024 10:22:51 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: Sergei Shtylyov <sergei.shtylyov@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Russell King <linux@armlinux.org.uk>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Vladimir Zapolskiy <vz@mleia.com>, Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Tony Lindgren <tony@atomide.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	imx@lists.linux.dev, linux-omap@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
	openbmc@lists.ozlabs.org, linuxppc-dev@lists.ozlabs.org,
	linux-mips@vger.kernel.org, loongarch@lists.linux.dev
Subject: Re: [PATCH 2/9] mtd: add mtd_is_master helper
Message-ID: <20240702082251.ljdaz2b7agabbm76@pengutronix.de>
References: <20240701-b4-v6-10-topic-usbc-tcpci-v1-0-3fd5f4a193cc@pengutronix.de>
 <20240701-b4-v6-10-topic-usbc-tcpci-v1-2-3fd5f4a193cc@pengutronix.de>
 <b97bf565-bef5-fbc7-63c5-f174880ad9ab@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b97bf565-bef5-fbc7-63c5-f174880ad9ab@gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240702_012345_017268_720483EF 
X-CRM114-Status: GOOD (  14.93  )
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

On 24-07-01, Sergei Shtylyov wrote:
> On 7/1/24 4:53 PM, Marco Felsch wrote:
> 
> > Provide a simple helper to make it easy to detect an master mtd device.
> > 
> > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > ---
> >  include/linux/mtd/mtd.h | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
> > index 8d10d9d2e830..bf3fc2ea7230 100644
> > --- a/include/linux/mtd/mtd.h
> > +++ b/include/linux/mtd/mtd.h
> > @@ -408,6 +408,11 @@ static inline struct mtd_info *mtd_get_master(struct mtd_info *mtd)
> >  	return mtd;
> >  }
> >  
> > +static inline bool mtd_is_master(struct mtd_info *mtd)
> > +{
> > +	return mtd->parent ? false : true;
> 
>    Perhaps:
> 
> 	return !mtd->parent;

Sure, if you prefer this style rather I will change it.

Regards,
  Marco

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
