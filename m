Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05D24C4828D
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Feb 2024 21:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Subject:Cc:To:
	From:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PjKCFej6t1bkQbDJ78L5wvSZVeOIWENLYjrvQT4uxcU=; b=McEs3RxV9DAlzT
	E31cvEPNwcdJdZ6KFL+HImilExEz/s5xlz6ywLQxt7tbFOcK+3R7vKZQd4kuOr2wgKq6SPPX737+E
	2V0YOsV8teCl4Lp/Y3/91WN3mpaWvH6i+IVyTAy6+G/ucSO08DhI6rOS08nXQlMuQCUK12lgXW3PO
	fL6vxKCeFaPOLA/tRvkWjBjiX7NoOQu1YEHyV1D1JribxLmLJb9uJAvPewWXf8nwsW2Mbut78NfG3
	FWzgdt/qV8vnQB81L0AtgZWZbXsDStmFBcL84RKOPCtUIwkYmFXi7lv+/emngAD7kCAwyOEVlWy8G
	G9z6UkR8ZTF+f+KEDLwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVeuJ-00000009RXD-1kSH;
	Thu, 01 Feb 2024 21:47:39 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVeuF-00000009RWA-09xh;
	Thu, 01 Feb 2024 21:47:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 88A646218F;
	Thu,  1 Feb 2024 21:47:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEEB5C433C7;
	Thu,  1 Feb 2024 21:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706824052;
	bh=ONdXqAS27cKeOgWX4XGTKCxg4rE0mzWElHVnnYMMb0Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KYhAJw//yARcM3TA6pVCkI4LUiBLE5XWbQdyIJ2IOE9XeeW9PXuRT0u1fpPxxrkwp
	 Hurjt/dBf8xwi23T1FksMdv9e36XHyjvhrDNFhBSr1xRnTYLMYbJE3ILCL/Xokm/MD
	 5zQO0eFXQidwjXeacacwmmo5pMdGivYcXVl5OsSlyzb4uDD6zF3QHkW/ipNCSyCrkX
	 ruFySuh4tDJV4Rf4YFiYpBgTsdWdhvZKAcl5M+3wneiWVFJ2zo1QtBfWDecyRoxa73
	 fETXEmGDyXWVSu/j1Xloaznpi7OcrAoyx70CgInqn+hTw2H52XDK3rA5SorsXzUwVT
	 KByKrTZWMbAOA==
Mime-Version: 1.0
Date: Thu, 01 Feb 2024 23:47:13 +0200
Message-Id: <CYU2MG4IOJ0Q.2UJOTK999FCCC@suppilovahvero>
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Mark Brown" <broonie@kernel.org>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>
Cc: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 <kernel@pengutronix.de>, "Moritz Fischer" <mdf@kernel.org>, "Wu Hao"
 <hao.wu@intel.com>, "Xu Yilun" <yilun.xu@intel.com>, "Tom Rix"
 <trix@redhat.com>, <linux-fpga@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Alexander Aring" <alex.aring@gmail.com>,
 "Stefan Schmidt" <stefan@datenfreihafen.org>, "Miquel Raynal"
 <miquel.raynal@bootlin.com>, "David S. Miller" <davem@davemloft.net>, "Eric
 Dumazet" <edumazet@google.com>, "Jakub Kicinski" <kuba@kernel.org>, "Paolo
 Abeni" <pabeni@redhat.com>, <linux-wpan@vger.kernel.org>,
 <netdev@vger.kernel.org>, "Lars-Peter Clausen" <lars@metafoo.de>, "Michael
 Hennerich" <Michael.Hennerich@analog.com>, "Jonathan Cameron"
 <jic23@kernel.org>, <linux-iio@vger.kernel.org>, "Dmitry Torokhov"
 <dmitry.torokhov@gmail.com>, <linux-input@vger.kernel.org>, "Ulf Hansson"
 <ulf.hansson@linaro.org>, "Rayyan Ansari" <rayyan@ansari.sh>, "Andy
 Shevchenko" <andriy.shevchenko@linux.intel.com>, "Jonathan Cameron"
 <Jonathan.Cameron@huawei.com>, "Martin Tuma"
 <martin.tuma@digiteqautomotive.com>, "Mauro Carvalho Chehab"
 <mchehab@kernel.org>, <linux-media@vger.kernel.org>, "Sergey Kozlov"
 <serjk@netup.ru>, "Arnd Bergmann" <arnd@arndb.de>, "Yang Yingliang"
 <yangyingliang@huawei.com>, <linux-mmc@vger.kernel.org>, "Richard
 Weinberger" <richard@nod.at>, "Vignesh Raghavendra" <vigneshr@ti.com>, "Rob
 Herring" <robh@kernel.org>, "Heiko Stuebner" <heiko@sntech.de>, "Michal
 Simek" <michal.simek@amd.com>, "Amit Kumar Mahapatra via Alsa-devel"
 <alsa-devel@alsa-project.org>, <linux-mtd@lists.infradead.org>, "Martin
 Blumenstingl" <martin.blumenstingl@googlemail.com>, "Geert Uytterhoeven"
 <geert+renesas@glider.be>, =?utf-8?q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
 "Simon Horman" <horms@kernel.org>, "Ronald Wahl" <ronald.wahl@raritan.com>,
 "Benson Leung" <bleung@chromium.org>, "Tzung-Bi Shih" <tzungbi@kernel.org>,
 "Guenter Roeck" <groeck@chromium.org>, <chrome-platform@lists.linux.dev>,
 "Max Filippov" <jcmvbkbc@gmail.com>, <linux-spi@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, "Bjorn Andersson"
 <andersson@kernel.org>, "Konrad Dybcio" <konrad.dybcio@linaro.org>,
 <linux-arm-msm@vger.kernel.org>, "Matthias Brugger"
 <matthias.bgg@gmail.com>, "AngeloGioacchino Del Regno"
 <angelogioacchino.delregno@collabora.com>,
 <linux-mediatek@lists.infradead.org>, "Thomas Zimmermann"
 <tzimmermann@suse.de>, "Javier Martinez Canillas" <javierm@redhat.com>,
 "Amit Kumar Mahapatra" <amit.kumar-mahapatra@amd.com>,
 <dri-devel@lists.freedesktop.org>, <linux-fbdev@vger.kernel.org>,
 <linux-staging@lists.linux.dev>, "Viresh Kumar" <vireshk@kernel.org>, "Rui
 Miguel Silva" <rmfrfs@gmail.com>, "Johan Hovold" <johan@kernel.org>, "Alex
 Elder" <elder@kernel.org>, <greybus-dev@lists.linaro.org>, "Peter Huewe"
 <peterhuewe@gmx.de>, "Jason Gunthorpe" <jgg@ziepe.ca>,
 <linux-integrity@vger.kernel.org>, "Herve Codina"
 <herve.codina@bootlin.com>, "Alan Stern" <stern@rowland.harvard.edu>, "Aaro
 Koskinen" <aaro.koskinen@iki.fi>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski@linaro.org>, <linux-usb@vger.kernel.org>, "Helge
 Deller" <deller@gmx.de>, "Dario Binacchi"
 <dario.binacchi@amarulasolutions.com>, "Kalle Valo" <kvalo@kernel.org>,
 "Dmitry Antipov" <dmantipov@yandex.ru>, <libertas-dev@lists.infradead.org>,
 <linux-wireless@vger.kernel.org>, "Jonathan Corbet" <corbet@lwn.net>,
 "James Clark" <james.clark@arm.com>, "Bjorn Helgaas" <bhelgaas@google.com>,
 <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v2 00/33] spi: get rid of some legacy macros
X-Mailer: aerc 0.15.2
References: <cover.1705944943.git.u.kleine-koenig@pengutronix.de>
 <2024012417-prissy-sworn-bc55@gregkh>
 <c1e38a30-5075-4d01-af24-ac684e77cf29@sirena.org.uk>
In-Reply-To: <c1e38a30-5075-4d01-af24-ac684e77cf29@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240201_134735_191223_BE637629 
X-CRM114-Status: GOOD (  12.79  )
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

T24gV2VkIEphbiAyNCwgMjAyNCBhdCA3OjIyIFBNIEVFVCwgTWFyayBCcm93biB3cm90ZToKPiBP
biBXZWQsIEphbiAyNCwgMjAyNCBhdCAwOToxMzo0OUFNIC0wODAwLCBHcmVnIEtyb2FoLUhhcnRt
YW4gd3JvdGU6Cj4gPiBPbiBNb24sIEphbiAyMiwgMjAyNCBhdCAwNzowNjo1NVBNICswMTAwLCBV
d2UgS2xlaW5lLUvDtm5pZyB3cm90ZToKPgo+ID4gPiBOb3RlIHRoYXQgSm9uYXRoYW4gQ2FtZXJv
biBoYXMgYWxyZWFkeSBhcHBsaWVkIHBhdGNoIDMgdG8gaGlzIHRyZWUsIGl0Cj4gPiA+IGRpZG4n
dCBhcHBlYXIgaW4gYSBwdWJsaWMgdHJlZSB0aG91Z2ggeWV0LiBJIHN0aWxsIGluY2x1ZGVkIGl0
IGhlcmUgdG8KPiA+ID4gbWFrZSB0aGUga2VybmVsIGJ1aWxkIGJvdHMgaGFwcHkuCj4KPiA+IEFy
ZSB3ZSBzdXBwb3NlZCB0byB0YWtlIHRoZSBpbmRpdmlkdWFsIGNoYW5nZXMgaW4gb3VyIGRpZmZl
cmVudAo+ID4gc3Vic3lzdGVtIHRyZWVzLCBvciBkbyB5b3Ugd2FudCB0aGVtIGFsbCB0byBnbyB0
aHJvdWdoIHRoZSBzcGkgdHJlZT8KPgo+IEdpdmVuIHRoYXQgdGhlIGZpbmFsIHBhdGNoIHJlbW92
ZXMgdGhlIGxlZ2FjeSBpbnRlcmZhY2VzIEknbSBleHBlY3RpbmcKPiB0byB0YWtlIHRoZW0gdmlh
IFNQSS4KCisxCgpsZWFzdCBmdXNzIGFwcHJvYWNoCgpCUiwgSmFya2tvCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
