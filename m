Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F03BC47DD3
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Jan 2024 19:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cxc81pW7FQrgHgpqo6gsqkZ3LnPd1XedqHnMRMdbcHI=; b=eaERAOiFaP8PCM
	yb6norjTqCmS+0cR48Dcuqi27dOrk9rwedmdbK5E5JBsBNd5dNAuVzCMZ25mzSEmAFRqSbs3SgIGY
	0sWxleHUIRELp7+Uw+rzjtM7K+G9Hs3wc1GfxbnRx4HNAs/4uDIISu/+5Cu1LlzWvhnN3JIp6Nzeh
	aV2ZdWnWyHzdCrceDs1g46cnSLEvVwPbXo1D7EGfjjvUP1f97OfM1v6rDXQ+ocSGUHV97NPOSU+yB
	K+mRQE6zkVUdOTnur57d61E4Stj2+DnBXwmbxkkBYMWvepqdQmo55gqEBOUuzyvJjZqZ5/tFCsall
	9E2HA1LVZiBDDiWW1NzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRzuC-00DiQY-2K;
	Mon, 22 Jan 2024 19:24:24 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRzu8-00DiOD-0h;
	Mon, 22 Jan 2024 19:24:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 7EAD7CE2C65;
	Mon, 22 Jan 2024 19:24:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FBDEC433C7;
	Mon, 22 Jan 2024 19:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705951455;
	bh=MEXKZHQkB/IyiyQVHXrZDxlLURiVSiUhivYGVZLcqn0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Om7TXwRG+RLb91NjkMlGtbBbQYrAGinHi8YBBuORygdejt7BZ+vQd9Bqs0sBl/BxP
	 VCw1yjmez+FHyuigs8WrRG3xG5dxGPTpaOT2qYeFl6QHLeQijLl0kkOlguh3EaCef5
	 +AkOU52pnihuLtq9XxoisJbYHmdBJ7MWGdIGbaT+Hqd1d3bAs/JdGsBZD+YdEjOqeP
	 eiYtqYfgWpXt9iSL4haLcS9baDm6slcDBeeq4Pri4phWer/ACYdMdlNEE7R3pgjieo
	 tFpdEkRwqJLtm9GAX85YeLj+l6gbxcnR7JUDJE+8uHr22Geysx+TUOYD6M7QtotXaK
	 eSyrD1CGdOh3w==
Date: Mon, 22 Jan 2024 19:23:43 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@pengutronix.de>,
 kernel@pengutronix.de, Moritz Fischer <mdf@kernel.org>, Wu Hao
 <hao.wu@intel.com>, Xu Yilun <yilun.xu@intel.com>, Tom Rix
 <trix@redhat.com>, linux-fpga@vger.kernel.org,
 linux-kernel@vger.kernel.org, Alexander Aring <alex.aring@gmail.com>,
 Stefan Schmidt <stefan@datenfreihafen.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, linux-wpan@vger.kernel.org,
 netdev@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>, Michael
 Hennerich <Michael.Hennerich@analog.com>, linux-iio@vger.kernel.org, Dmitry
 Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org, Ulf
 Hansson <ulf.hansson@linaro.org>, Rayyan Ansari <rayyan@ansari.sh>, Andy
 Shevchenko <andriy.shevchenko@linux.intel.com>, Jonathan Cameron
 <Jonathan.Cameron@huawei.com>, Martin Tuma
 <martin.tuma@digiteqautomotive.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, linux-media@vger.kernel.org, Sergey Kozlov
 <serjk@netup.ru>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Yang Yingliang <yangyingliang@huawei.com>,
 linux-mmc@vger.kernel.org, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, Heiko
 Stuebner <heiko@sntech.de>, Michal Simek <michal.simek@amd.com>, Amit Kumar
 Mahapatra via Alsa-devel <alsa-devel@alsa-project.org>,
 linux-mtd@lists.infradead.org, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Pali =?UTF-8?B?Um9ow6Fy?= <pali@kernel.org>,
 Simon Horman <horms@kernel.org>, Ronald Wahl <ronald.wahl@raritan.com>,
 Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>,
 Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev, Max
 Filippov <jcmvbkbc@gmail.com>, linux-spi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Bjorn Andersson
 <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 linux-arm-msm@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-mediatek@lists.infradead.org, Thomas Zimmermann
 <tzimmermann@suse.de>, Javier Martinez Canillas <javierm@redhat.com>, Amit
 Kumar Mahapatra <amit.kumar-mahapatra@amd.com>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, Viresh Kumar <vireshk@kernel.org>, Rui
 Miguel Silva <rmfrfs@gmail.com>, Johan Hovold <johan@kernel.org>, Alex
 Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, Peter Huewe
 <peterhuewe@gmx.de>, Jarkko Sakkinen <jarkko@kernel.org>, Jason Gunthorpe
 <jgg@ziepe.ca>, linux-integrity@vger.kernel.org, Herve Codina
 <herve.codina@bootlin.com>, Alan Stern <stern@rowland.harvard.edu>, Aaro
 Koskinen <aaro.koskinen@iki.fi>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>, linux-usb@vger.kernel.org, Helge Deller
 <deller@gmx.de>, Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Kalle Valo <kvalo@kernel.org>, Dmitry Antipov <dmantipov@yandex.ru>,
 libertas-dev@lists.infradead.org, linux-wireless@vger.kernel.org, Jonathan
 Corbet <corbet@lwn.net>, James Clark <james.clark@arm.com>, Bjorn Helgaas
 <bhelgaas@google.com>, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 00/33] spi: get rid of some legacy macros
Message-ID: <20240122192343.148a0b6d@jic23-huawei>
In-Reply-To: <e62cdf7f-ce58-4f46-a0a0-25ce9fb271b1@sirena.org.uk>
References: <cover.1705944943.git.u.kleine-koenig@pengutronix.de>
	<e62cdf7f-ce58-4f46-a0a0-25ce9fb271b1@sirena.org.uk>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.40; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_112420_605356_529C66A6 
X-CRM114-Status: GOOD (  16.61  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gTW9uLCAyMiBKYW4gMjAyNCAxODoxODoyMiArMDAwMApNYXJrIEJyb3duIDxicm9vbmllQGtl
cm5lbC5vcmc+IHdyb3RlOgoKPiBPbiBNb24sIEphbiAyMiwgMjAyNCBhdCAwNzowNjo1NVBNICsw
MTAwLCBVd2UgS2xlaW5lLUvDtm5pZyB3cm90ZToKPiAKPiA+IE5vdGUgdGhhdCBKb25hdGhhbiBD
YW1lcm9uIGhhcyBhbHJlYWR5IGFwcGxpZWQgcGF0Y2ggMyB0byBoaXMgdHJlZSwgaXQKPiA+IGRp
ZG4ndCBhcHBlYXIgaW4gYSBwdWJsaWMgdHJlZSB0aG91Z2ggeWV0LiBJIHN0aWxsIGluY2x1ZGVk
IGl0IGhlcmUgdG8KPiA+IG1ha2UgdGhlIGtlcm5lbCBidWlsZCBib3RzIGhhcHB5LiAgCj4gCj4g
SXQncyBhbHNvIGdvaW5nIHRvIGJlIG5lZWRlZCBmb3IgYnVpbGRhYmlsaXR5IG9mIHRoZSBlbmQg
b2YgdGhlIHNlcmllcy4KCkFoLiAgSSB0aG91Z2h0IGludGVudCB3YXMgdG8gc3BsaXQgdGhpcyBh
Y3Jvc3MgYWxsIHRoZSBkaWZmZXJlbnQgdHJlZXMKdGhlbiBkbyB0aGUgZmluYWwgcGF0Y2ggb25s
eSBhZnRlciB0aGV5IHdlcmUgYWxsIGdvbmU/CgpJJ20gZmluZSB3aXRoIGl0IGdvaW5nIGFsbCBp
biBvbmUgZ28gaWYgcGVvcGxlIHByZWZlciB0aGF0LgoKTXkgdHJlZSB3aWxsIGJlIG91dCBpbiBh
IGZldyBtaW5zLiBXYXMganVzdCB3YWl0aW5nIHRvIHJlYmFzZSBvbiByYzEKd2hpY2ggSSd2ZSBq
dXN0IGRvbmUuCgpKb25hdGhhbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
