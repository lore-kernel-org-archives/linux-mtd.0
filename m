Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D02DEC433EF
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Mar 2022 02:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b0yTsYv2heM6fqIRsVTIKwnj27aq0sU2t2cy1SUOR6o=; b=X4Fa5BD3Iut/Xw
	s19Zj2joAu/uO6uNEJ5jDe1S6Z05yO9L9CGql5dGbDWYuj6SLlfUrWTw2tm6/vdiWkOBGS4cBNdUa
	yOHYKaBdgaJUps3NlF02chVJWr6UcNluWbjy02HxQmcXGrmnBJ65Q91ggdZ0ZulBCOHnaO0wMAxYz
	ydI9+8r/x6VTnzHQ6CRxQTWuim7gLXYPhaHr6qqlaZl8jwtadFreFrcJvpcaS+H54gqHtE84EUCwY
	htT0Gp80n50g7w/M7XT1Y87gTLAm27h4ZxBflQ32izwVyyNKbvBsNY7qXrfmBDKxJ0lOvZ2CNDHS2
	SlZD0890olWnFrXdY+fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPEOS-0012bh-Eg; Wed, 02 Mar 2022 02:07:08 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPEOG-0012Xp-3r; Wed, 02 Mar 2022 02:06:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 332E9CE20C2;
 Wed,  2 Mar 2022 02:06:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45615C340EE;
 Wed,  2 Mar 2022 02:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646186812;
 bh=RbXjCq2vc9KTjJ2ViOIg4WEUsqUh0ts1JySeSDecJPA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=CeKdGh4HJ5xY8VnlinUJxQ4c1yi48El5NRql2ZCTIP2Mmz0h+R9wG20554NXflcMb
 h6p72p9M9T34mgM1urwfL0Ac2+setqTN/Hus8HEP5hSlYeKrX8CP+Je136zRGYM7VA
 w1pjE71yLhWfV68Lf6cJfJbdXpWGyL0GKTqAv/ac1YdSambaOKcoPt74fztMyceRi0
 5dvchGms8HIYcCELtkRrsq91AyGKV8jHUTZngeLt8ODz7/UTURXidE5aF4tRsfmx/S
 3akqly+ZZPX8OcHC4ilBq/WvlehbRgEdqm1HbTL1VkHGK5IVG2BcNKHdXUlJV0iXmx
 dVIuoFk3QvPLw==
Date: Tue, 1 Mar 2022 18:06:50 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof
 Kozlowski <krzysztof.kozlowski@canonical.com>, Thierry Reding
 <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, Dmitry
 Torokhov <dmitry.torokhov@gmail.com>, Pavel Machek <pavel@ucw.cz>, Lee
 Jones <lee.jones@linaro.org>, Guenter Roeck <groeck@chromium.org>, Miquel
 Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, "David S. Miller"
 <davem@davemloft.net>, Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul
 <vkoul@kernel.org>, Sebastian Reichel <sre@kernel.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Mathieu Poirier <mathieu.poirier@linaro.org>,
 Mark Brown <broonie@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
 linux-leds@vger.kernel.org, linux-mtd@lists.infradead.org,
 netdev@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-pm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-spi@vger.kernel.org,
 linux-usb@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: Another pass removing cases of 'allOf'
 containing a '$ref'
Message-ID: <20220301180650.6188a66c@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
In-Reply-To: <20220228213802.1639658-1-robh@kernel.org>
References: <20220228213802.1639658-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220301_180656_389032_D1D59F5D 
X-CRM114-Status: GOOD (  12.57  )
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

On Mon, 28 Feb 2022 15:38:02 -0600 Rob Herring wrote:
> Another pass at removing unnecessary use of 'allOf' with a '$ref'.
> 
> json-schema versions draft7 and earlier have a weird behavior in that
> any keywords combined with a '$ref' are ignored (silently). The correct
> form was to put a '$ref' under an 'allOf'. This behavior is now changed
> in the 2019-09 json-schema spec and '$ref' can be mixed with other
> keywords.

Acked-by: Jakub Kicinski <kuba@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
