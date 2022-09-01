Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B21DECAAD1
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Sep 2022 16:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i9k4XlPKpdA9XViOAC4fPB7GKRueGTQvE9UGPHZ06fg=; b=eij+b6kq0yS4nn
	zXJgjIsv5ppkgG/2sj9kp6tY4CEb/1+mrh5AnIrm5L5THAid1wcKW/fzjnWhzHua4p85vl2LJ3e9w
	Hbn+MtUEBJ2dWny1vXRSx2UugbgqD5wqq+uXe8KJmYg8pCFh6MJXGhBj4KU5HBEixFONhxxK+EeoD
	NJlYSwa9gnNO8vOEg3sOG4SUKAB3FBAJDoR3J/njyF5+PA0MQmsxa8hqRfSZfFXQ4Vx1/zkQf0li7
	HjMAWzfS5EQGMeJ/y5DRNXBeihUsfm+Ouy1XiIiiyBIg2yCBy4Y4I/nTUycu40LF/ES3XtCRw7ydv
	2fYJGmIGF4nE5RxMlBNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTn6O-00DMEF-RZ; Thu, 01 Sep 2022 16:31:36 +0000
Received: from vps0.lunn.ch ([185.16.172.187])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTn6M-00DMD2-AX; Thu, 01 Sep 2022 16:31:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=LS2Woa4LuC44oMA7jdjUMP7C74QvndhsN+0OPg570ho=; b=hiDoRMTUYB2AzZo6c4oNEWXuTY
	H7xyflAdZh1PxBlnzsU6luqs5zaHiwun4Het1j+FTqNVe3STnTtW2I+8NBIkIWVNyDf+AA9NQVOnW
	Q5ht1B6aulg/+vV8j/BnyDSfGFT/v6HjUzgNHcLewBJdXk5CgRVqw3Yk4tEYSgygx+80=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1oTn5v-00FJtV-HL; Thu, 01 Sep 2022 18:31:07 +0200
Date: Thu, 1 Sep 2022 18:31:07 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Michael Walle <michael@walle.cc>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Frank Rowand <frowand.list@gmail.com>,
	linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org, Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: Re: [PATCH v1 01/14] net: add helper eth_addr_add()
Message-ID: <YxDeS2hAgP5C/Bla@lunn.ch>
References: <20220825214423.903672-1-michael@walle.cc>
 <20220825214423.903672-2-michael@walle.cc>
 <1682967feab905d06402d0f8402799a8@walle.cc>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1682967feab905d06402d0f8402799a8@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220901_093134_382531_4A27C153 
X-CRM114-Status: GOOD (  13.46  )
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

On Thu, Sep 01, 2022 at 06:26:39PM +0200, Michael Walle wrote:
> Hi netdev maintainers,
> 
> Am 2022-08-25 23:44, schrieb Michael Walle:
> > Add a helper to add an offset to a ethernet address. This comes in handy
> > if you have a base ethernet address for multiple interfaces.
> > 
> > Signed-off-by: Michael Walle <michael@walle.cc>
> 
> Would it be possible to get an Ack for this patch, so I don't have
> to repost this large (and still growing) series to netdev every time?

Looks O.K. to me

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
