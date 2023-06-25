Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AAACEB64DC
	for <linux-mtd@archiver.kernel.org>; Sun, 25 Jun 2023 21:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lFqHJZfpGyc7yjoBHZ47C2JHCCtRCNRMyvU+N323Pss=; b=T86onJJTTbzWe3
	HVqHi1udmlaki4uL/z/yopoQZLoXnQgD7cX/GC5yH38+rSDgepqFITB4b2bkEQo90DhmjVFY800vN
	pxuYcxQ60lnrrdULsm5E7OLLw2qvKjdg6P0KBb7sA9OkFEPfWTNbrVyLh0LU87FZ5lghEKsgrJKCt
	HN/A5DJcZErcf1bVJzvrEg44jMnaoHgOiYyJ0wZR90WwCbAYoINUJtVkLO2gEhIzbex/nWHnd7Jag
	t2SX1Y1A3U5JqiCUEPWqQ7OUGLPDj9TvALl+LwrGJ4gRZqhwCWkqaCmNXgtewyT8YnDafhsIjOy+/
	TKQQpKlOxMwHlEoRkC5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDXRK-008liI-08;
	Sun, 25 Jun 2023 21:38:34 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDXRG-008lhK-2h;
	Sun, 25 Jun 2023 21:38:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=YKfoLR4HZ++Z2czbit0pX4ts6RsJ4WouWyiUQXpLhB0=; b=E1zgJqJggmMQ263Cv9ohJkmFdB
	dRbiAAW7niLAMgCLJmhZvUoOzfZ/sUgVucsOWdFAkd5d+S47K842MM183vB18lGE6U2stQgZZ3ow+
	bAGHxzcjRopEfREHDeOWvnoekKXW49u/R1+JVSAABCegkiyCq+O0LyN2WuBX3rOiqU58=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1qDXR9-00HV5q-KP; Sun, 25 Jun 2023 23:38:23 +0200
Date: Sun, 25 Jun 2023 23:38:23 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Rogan Dawes <rogan@dawes.za.net>
Cc: Fabio Estevam <festevam@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mtd <linux-mtd@lists.infradead.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Lothar =?iso-8859-1?Q?Wa=DFmann?= <LW@karo-electronics.de>,
	Marek Vasut <marex@denx.de>
Subject: Re: Trying to boot mainline on Wink Hub v1
Message-ID: <ddb713dd-c8d5-4daa-a24f-64c8d213e0ae@lunn.ch>
References: <CAOYdKdhscu_NDetiWDgm7bqh-Tf7kqGMHYOvOE0sQh2dU3t64g@mail.gmail.com>
 <CAOMZO5AZQ1147K8tD5e0fJ680CtdDBWk1eMN7n9rVWtJX06W3A@mail.gmail.com>
 <CAOYdKdhuVbzavb9CJYqOLXX7PYCbOGzmeUg2eTgF1saTviCo-Q@mail.gmail.com>
 <f2570cf9-d01f-431b-832c-deae7a8f4c61@lunn.ch>
 <CAOYdKdiKxpk6sY7wWrrpW+ih6JziMyboRQO=2L3qov_DMhBmOA@mail.gmail.com>
 <CAOYdKdgrpQ9LQvjG7Eg40XtNPonYXmtRmwR=ZERatRJC6osZsA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOYdKdgrpQ9LQvjG7Eg40XtNPonYXmtRmwR=ZERatRJC6osZsA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230625_143830_878267_F1CB9F34 
X-CRM114-Status: UNSURE (   7.81  )
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

On Sun, Jun 25, 2023 at 11:09:21PM +0200, Rogan Dawes wrote:
> I tried adding a &nand block to my device tree, but I think it is not
> quite as simple as that, as I got an error message complaining about
> my additions:
> 
> Error: arch/arm/boot/dts/imx28-wink-hub-v1.dts:40.6-11 syntax error
> FATAL ERROR: Unable to parse input tree

Looking at imx28.dtsi, it appears the nand controller is called gpmi,
not nand. So try replacing &namd with &gpmi.

Look at arch/arm/boot/dts/imx28-apf28.dts as an example.

     Andrew


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
