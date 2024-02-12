Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7617C48297
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Feb 2024 15:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0XyvzdYMQQhRAOZNZzdddB8GBcbR/JWo/QIS3/PhF0g=; b=bK6lMMofLM+CSn
	k482WH69IQ2li31qd+yQTvzLDCTUhHCFIhhQ18EUqXobInjzpb39yYCU8APd8yLuizLzLKfXYxcSN
	8DPUr6y/+NAe9YJnBFI8eRad9+aAvCV3Is/SnWFp4O+cVK4FPoBYTspbhXCbiAhPjN8q3a6K1PbEp
	JIZmVKjW6pHR4wP+eqA/tNh1lhWzTLTCqNSOfWqgaLwThtY/DgoOykA0OKSJO1Wyx2gwNa0x8eFuA
	yQSPkx6fMipb8AT5wNEcrW7lnMGqc1E/E2z4LVNFf5RzFG2Xavb9+PjF9nv5LwJIU//V1DNz/3Df+
	IJVl9QI5Wx+VZScN7J4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZYJE-00000005yfO-46H0;
	Mon, 12 Feb 2024 15:33:28 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZYJA-00000005ydc-2Umt;
	Mon, 12 Feb 2024 15:33:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E07B860BAD;
	Mon, 12 Feb 2024 15:33:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CD66C433F1;
	Mon, 12 Feb 2024 15:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707752000;
	bh=GFsfkdOmJKsuZtWQAq7OhjxHg4IKHiDCDNVd+Gd58aw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Co2aU8UOdKL4W8SUaaEqV0BTVAuiZ9niMqI5QuXmkWRQqRD+bsuUp32djuJPfJQ7M
	 J0AdS/WqPhUm+WDhNwj0PIl1NFZPSx4kaz74w8AVaBO2niEWSvmitVVz0AuwMwTUcd
	 8MtOvRT2s7ojnBMUpDpCQjuzEzxH0//zOgasqtDHJDU6fjIDBJFEa6lJkzge7aVnIn
	 65sRlXZGfvNWKRj6hhoF+/MvmClp/yoVXWTT6Lqc/PTFBqTwhuA4fpNCA+K8uTOths
	 DH2aamg+A5g3aeMmWit1ZUc4X0oSEYy8EtlcvJyPFhdziLYkgWINAXOkx2oWF2pGNL
	 vlKQQFPbdC2Dw==
From: Mark Brown <broonie@kernel.org>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: kernel@pengutronix.de, Moritz Fischer <mdf@kernel.org>, 
 Wu Hao <hao.wu@intel.com>, Xu Yilun <yilun.xu@intel.com>, 
 Tom Rix <trix@redhat.com>, linux-fpga@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexander Aring <alex.aring@gmail.com>, 
 Stefan Schmidt <stefan@datenfreihafen.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 linux-wpan@vger.kernel.org, netdev@vger.kernel.org, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Jonathan Cameron <jic23@kernel.org>, linux-iio@vger.kernel.org, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org, 
 Ulf Hansson <ulf.hansson@linaro.org>, Rayyan Ansari <rayyan@ansari.sh>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
 Martin Tuma <martin.tuma@digiteqautomotive.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
 Sergey Kozlov <serjk@netup.ru>, Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Yang Yingliang <yangyingliang@huawei.com>, linux-mmc@vger.kernel.org, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Michal Simek <michal.simek@amd.com>, 
 Amit Kumar Mahapatra via Alsa-devel <alsa-devel@alsa-project.org>, 
 linux-mtd@lists.infradead.org, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 =?utf-8?q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
 Simon Horman <horms@kernel.org>, Ronald Wahl <ronald.wahl@raritan.com>, 
 Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
 Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev, 
 Max Filippov <jcmvbkbc@gmail.com>, linux-spi@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 linux-mediatek@lists.infradead.org, Thomas Zimmermann <tzimmermann@suse.de>, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>, 
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
 linux-staging@lists.linux.dev, Viresh Kumar <vireshk@kernel.org>, 
 Rui Miguel Silva <rmfrfs@gmail.com>, Johan Hovold <johan@kernel.org>, 
 Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, 
 Peter Huewe <peterhuewe@gmx.de>, Jarkko Sakkinen <jarkko@kernel.org>, 
 Jason Gunthorpe <jgg@ziepe.ca>, linux-integrity@vger.kernel.org, 
 Herve Codina <herve.codina@bootlin.com>, 
 Alan Stern <stern@rowland.harvard.edu>, 
 Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-usb@vger.kernel.org, Helge Deller <deller@gmx.de>, 
 Dario Binacchi <dario.binacchi@amarulasolutions.com>, 
 Kalle Valo <kvalo@kernel.org>, Dmitry Antipov <dmantipov@yandex.ru>, 
 libertas-dev@lists.infradead.org, linux-wireless@vger.kernel.org, 
 Jonathan Corbet <corbet@lwn.net>, James Clark <james.clark@arm.com>, 
 Bjorn Helgaas <bhelgaas@google.com>, linux-doc@vger.kernel.org
In-Reply-To: <cover.1705944943.git.u.kleine-koenig@pengutronix.de>
References: <cover.1705944943.git.u.kleine-koenig@pengutronix.de>
Subject: Re: (subset) [PATCH v2 00/33] spi: get rid of some legacy macros
Message-Id: <170775198078.46149.4700126128576800564.b4-ty@kernel.org>
Date: Mon, 12 Feb 2024 15:33:00 +0000
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-a684c
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240212_073324_741799_982F05F2 
X-CRM114-Status: GOOD (  16.16  )
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

T24gTW9uLCAyMiBKYW4gMjAyNCAxOTowNjo1NSArMDEwMCwgVXdlIEtsZWluZS1Lw7ZuaWcgd3Jv
dGU6Cj4gdGhpcyBpcyB2MiBvZiB0aGlzIHBhdGNoIHNldC4KPiAKPiBDaGFuZ2VzIHNpbmNlIChp
bXBsaWNpdCkgdjEsIHNlbnQgd2l0aCBNZXNzYWdlLUlkOgo+IGNvdmVyLjE3MDUzNDgyNjkuZ2l0
LnUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZToKPiAKPiAgLSBSZWJhc2UgdG8gdjYuOC1y
YzEKPiAgLSBGaXggYSBidWlsZCBmYWlsdXJlIG9uIHNoCj4gIC0gQWRkZWQgdGhlIHRhZ3MgcmVj
ZWl2ZWQgaW4gKGltcGxpY2l0KSB2MS4KPiAKPiBbLi4uXQoKQXBwbGllZCB0bwoKICAgaHR0cHM6
Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvYnJvb25pZS9zcGkuZ2l0
IGZvci1uZXh0CgpUaGFua3MhCgpbMDEvMzNdIGZwZ2E6IGljZTQwLXNwaTogRm9sbG93IHJlbmFt
aW5nIG9mIFNQSSAibWFzdGVyIiB0byAiY29udHJvbGxlciIKICAgICAgICBjb21taXQ6IDIyN2Fi
NzNiODlkNjZlMzA2NGIzYzJiY2I1ZmUzODJiMTgxNTc2M2QKWzAyLzMzXSBpZWVlODAyMTU0OiBj
YTgyMTA6IEZvbGxvdyByZW5hbWluZyBvZiBTUEkgIm1hc3RlciIgdG8gImNvbnRyb2xsZXIiCiAg
ICAgICAgY29tbWl0OiAxNjdiNzg0NDY3MDZiYjRkMTlmN2RkOTNjYTMyMGFlZDI1YWUxYmJkClsw
My8zM10gaWlvOiBhZGM6IGFkX3NpZ21hX2RlbHRhOiBGb2xsb3cgcmVuYW1pbmcgb2YgU1BJICJt
YXN0ZXIiIHRvICJjb250cm9sbGVyIgogICAgICAgIGNvbW1pdDogMjc4MGU3YjcxNmE2MDU3ODFk
YmVlNzUzZWY0OTgzZDc3NWE2NTQyNwpbMDQvMzNdIElucHV0OiBweHNwYWQgLSBmb2xsb3cgcmVu
YW1pbmcgb2YgU1BJICJtYXN0ZXIiIHRvICJjb250cm9sbGVyIgogICAgICAgIGNvbW1pdDogYTc4
YWNlYzUzYjg1MjQ1OTNhZmVlZDcyNThhNDQyYWRjMzQ1MDgxOApbMDUvMzNdIElucHV0OiBzeW5h
cHRpY3Mtcm1pNCAtIGZvbGxvdyByZW5hbWluZyBvZiBTUEkgIm1hc3RlciIgdG8gImNvbnRyb2xs
ZXIiCiAgICAgICAgY29tbWl0OiAxMjQ1NjMzYzYxYmFmMTU5ZmNjMTMwM2Q3ZjA4NTVmNDk4MzFi
OWMxClswNi8zM10gbWVkaWE6IG1nYjQ6IEZvbGxvdyByZW5hbWluZyBvZiBTUEkgIm1hc3RlciIg
dG8gImNvbnRyb2xsZXIiCiAgICAgICAgY29tbWl0OiAyYzJmOTNmYmZiYTcxODZjYzA4MWUyMzEy
MGYxNjllYWMzYjViNjJhClswNy8zM10gbWVkaWE6IG5ldHVwX3VuaWR2YjogRm9sbG93IHJlbmFt
aW5nIG9mIFNQSSAibWFzdGVyIiB0byAiY29udHJvbGxlciIKICAgICAgICBjb21taXQ6IGNmYTEz
YTY0YmQ2MzFkOGYwNGExYzM4NTkyMzcwNmZjZWY5YTYzZWQKWzA4LzMzXSBtZWRpYTogdXNiL21z
aTI1MDA6IEZvbGxvdyByZW5hbWluZyBvZiBTUEkgIm1hc3RlciIgdG8gImNvbnRyb2xsZXIiCiAg
ICAgICAgY29tbWl0OiBkZDg2OGFlNjQ2ZDU3NzBmODBmOTBkYzA1NmQwNmViMmU2ZDM5YzYyClsw
OS8zM10gbWVkaWE6IHY0bDItc3ViZGV2OiBGb2xsb3cgcmVuYW1pbmcgb2YgU1BJICJtYXN0ZXIi
IHRvICJjb250cm9sbGVyIgogICAgICAgIGNvbW1pdDogZDkyMGIzYTY3MmI3Zjc5Y2QxM2IzNDEy
MzRhZWJkNDkyMzNmODM2YwpbMTAvMzNdIG1pc2M6IGdlaGMtYWNoYzogRm9sbG93IHJlbmFtaW5n
IG9mIFNQSSAibWFzdGVyIiB0byAiY29udHJvbGxlciIKICAgICAgICBjb21taXQ6IDI2ZGNmMDll
ZTVkOWNlYmEyYzYyN2FlM2JhMTc0YTIyOWYyNTYzOGYKWzExLzMzXSBtbWM6IG1tY19zcGk6IEZv
bGxvdyByZW5hbWluZyBvZiBTUEkgIm1hc3RlciIgdG8gImNvbnRyb2xsZXIiCiAgICAgICAgY29t
bWl0OiBiMGE2Nzc2ZTUzNDAzYWEzODA0MTFmMmE0M2NkZWZiOWYwMGZmNTBhClsxMi8zM10gbXRk
OiBkYXRhZmxhc2g6IEZvbGxvdyByZW5hbWluZyBvZiBTUEkgIm1hc3RlciIgdG8gImNvbnRyb2xs
ZXIiCiAgICAgICAgY29tbWl0OiA0NGVlOTk4ZGI5ZWVmODRiZjAwNWMzOTQ4NjU2NmE2N2NiMDE4
MzU0ClsxNC8zM10gbmV0OiBrczg4NTE6IEZvbGxvdyByZW5hbWluZyBvZiBTUEkgIm1hc3RlciIg
dG8gImNvbnRyb2xsZXIiCiAgICAgICAgY29tbWl0OiAxY2M3MTFhNzJhZTdmZDQ0ZTkwODM5ZjBj
OGQzMjI2NjY0ZGU1NWEyClsxNS8zM10gbmV0OiB2ZXJ0ZXhjb206IG1zZTEwMng6IEZvbGxvdyBy
ZW5hbWluZyBvZiBTUEkgIm1hc3RlciIgdG8gImNvbnRyb2xsZXIiCiAgICAgICAgY29tbWl0OiA3
OTY5Yjk4YjgwYzAzMzJmOTQwYzU0N2Y4NDY1MGEyMGFhYjMzODQxClsxNi8zM10gcGxhdGZvcm0v
Y2hyb21lOiBjcm9zX2VjX3NwaTogRm9sbG93IHJlbmFtaW5nIG9mIFNQSSAibWFzdGVyIiB0byAi
Y29udHJvbGxlciIKICAgICAgICBjb21taXQ6IDg1YWQwZWMwNDlhNzcxYzQ5MTBjOGFlYmIyZDBi
ZDljZTkzMTFmZDkKWzE3LzMzXSBzcGk6IGJpdGJhbmc6IEZvbGxvdyByZW5hbWluZyBvZiBTUEkg
Im1hc3RlciIgdG8gImNvbnRyb2xsZXIiCiAgICAgICAgY29tbWl0OiAyMjU5MjMzMTEwZDkwMDU5
MTg3YzViYTc1NTM3ZWI5M2ViYTg0MTdiClsxOC8zM10gc3BpOiBjYWRlbmNlLXF1YWRzcGk6IERv
bid0IGVtaXQgZXJyb3IgbWVzc2FnZSBvbiBhbGxvY2F0aW9uIGVycm9yCiAgICAgICAgY29tbWl0
OiBlNzEwMTFkYWNjMzQxM2JlZDQxMThkMmM0MmYxMDczNmZmY2Q3NjJjClsxOS8zM10gc3BpOiBj
YWRlbmNlLXF1YWRzcGk6IEZvbGxvdyByZW5hbWluZyBvZiBTUEkgIm1hc3RlciIgdG8gImNvbnRy
b2xsZXIiCiAgICAgICAgY29tbWl0OiAyOGU1OWQ4YmYxYWNlMGRkZjA1Zjk4OWE0OGQ2ODI0ZDc1
NzMxMjY3ClsyMC8zM10gc3BpOiBjYXZpdW06IEZvbGxvdyByZW5hbWluZyBvZiBTUEkgIm1hc3Rl
ciIgdG8gImNvbnRyb2xsZXIiCiAgICAgICAgY29tbWl0OiAxNzQ3ZmJkZWRiYThiNmIzZmQ0NTk4
OTVlZDVkNTdlNTM0NTQ5ODg0ClsyMS8zM10gc3BpOiBnZW5pLXFjb206IEZvbGxvdyByZW5hbWlu
ZyBvZiBTUEkgIm1hc3RlciIgdG8gImNvbnRyb2xsZXIiCiAgICAgICAgY29tbWl0OiAxNGNlYTky
MzM4YTA3NzZjMTYxNTk5NDE1MGU3MzhhYzBmNWZiYjJjClsyMi8zM10gc3BpOiBsb29wYmFjay10
ZXN0OiBGb2xsb3cgcmVuYW1pbmcgb2YgU1BJICJtYXN0ZXIiIHRvICJjb250cm9sbGVyIgogICAg
ICAgIGNvbW1pdDogMmMyMzEwYzE3ZmFjMTNhYTdlNzg3NTZkN2YzNzgwYzc4OTFmOTM5NwpbMjMv
MzNdIHNwaTogc2xhdmUtbXQyN3h4OiBGb2xsb3cgcmVuYW1pbmcgb2YgU1BJICJtYXN0ZXIiIHRv
ICJjb250cm9sbGVyIgogICAgICAgIGNvbW1pdDogODE5N2IxMzZiYmJlNjRhN2NhYjEwMjBhNGIw
NjcwMjBlNTk3N2Q5OApbMjQvMzNdIHNwaTogc3BpZGV2OiBGb2xsb3cgcmVuYW1pbmcgb2YgU1BJ
ICJtYXN0ZXIiIHRvICJjb250cm9sbGVyIgogICAgICAgIGNvbW1pdDogZDkzNGNkNmYwZTVkMDA1
Mjc3MjYxMmRiNGIwN2RmNjBjYjlkYTM4NwpbMjUvMzNdIHN0YWdpbmc6IGZidGZ0OiBGb2xsb3cg
cmVuYW1pbmcgb2YgU1BJICJtYXN0ZXIiIHRvICJjb250cm9sbGVyIgogICAgICAgIGNvbW1pdDog
YmJkMjVkNzI2MGVlZWFlZjg5ZjczNzFjYmFkY2QzM2RkN2Y3YmZmOQpbMjYvMzNdIHN0YWdpbmc6
IGdyZXlidXM6IHNwaTogRm9sbG93IHJlbmFtaW5nIG9mIFNQSSAibWFzdGVyIiB0byAiY29udHJv
bGxlciIKICAgICAgICBjb21taXQ6IGVlM2M2NjhkZGEzZDI3ODNiMGZmZjQwOTE0NjEzNTZmZTAw
MGU0ZDgKWzI3LzMzXSB0cG1fdGlzX3NwaTogRm9sbG93IHJlbmFtaW5nIG9mIFNQSSAibWFzdGVy
IiB0byAiY29udHJvbGxlciIKICAgICAgICBjb21taXQ6IGI2YWYxNGVhY2M4ODE0YjA5ODZlMjA1
MDdkZjQyM2NlYmU5ZmQ4NTkKWzI4LzMzXSB1c2I6IGdhZGdldDogbWF4MzQyMF91ZGM6IEZvbGxv
dyByZW5hbWluZyBvZiBTUEkgIm1hc3RlciIgdG8gImNvbnRyb2xsZXIiCiAgICAgICAgY29tbWl0
OiA4YzcxNmY0YTNkNGZjYmVjOTc2MjQ3ZTM0NDNkMzZjYmMyNGMwNTEyClsyOS8zM10gdmlkZW86
IGZiZGV2OiBtbXA6IEZvbGxvdyByZW5hbWluZyBvZiBTUEkgIm1hc3RlciIgdG8gImNvbnRyb2xs
ZXIiCiAgICAgICAgY29tbWl0OiBiMjMwMzFlNzMwZTcyZWM5MDY3YjdjMzhjMjVlNzc2YzVlMjdl
MTE2ClszMC8zM10gd2lmaTogbGliZXJ0YXM6IEZvbGxvdyByZW5hbWluZyBvZiBTUEkgIm1hc3Rl
ciIgdG8gImNvbnRyb2xsZXIiCiAgICAgICAgY29tbWl0OiAzMDA2MGQ1N2NlZTE5NGQ2YjcwMjgz
ZjJmYWY3ODdlMmZkYzYxYjZlClszMS8zM10gc3BpOiBmc2wtbGliOiBGb2xsb3cgcmVuYW1pbmcg
b2YgU1BJICJtYXN0ZXIiIHRvICJjb250cm9sbGVyIgogICAgICAgIGNvbW1pdDogODAxMTg1ZWZh
MjQwMmRjZTU3ODI4OTMwZTk2ODQ4ODRmYzhkNjJkYQpbMzIvMzNdIHNwaTogRHJvcCBjb21wYXQg
bGF5ZXIgZnJvbSByZW5hbWluZyAibWFzdGVyIiB0byAiY29udHJvbGxlciIKICAgICAgICBjb21t
aXQ6IDYyMGQyNjlmMjlhNTY5YmEzNzQxOWNjMDNjZjFkYTJkNTVmNjI1MmEKWzMzLzMzXSBEb2N1
bWVudGF0aW9uOiBzcGk6IFVwZGF0ZSBkb2N1bWVudGF0aW9uIGZvciByZW5hbWluZyAibWFzdGVy
IiB0byAiY29udHJvbGxlciIKICAgICAgICBjb21taXQ6IDc2YjMxZWI0YzJkYTNkZGIzMTk1Y2Mx
NGY2YWFkMjQ5MDhhZGY1MjQKCkFsbCBiZWluZyB3ZWxsIHRoaXMgbWVhbnMgdGhhdCBpdCB3aWxs
IGJlIGludGVncmF0ZWQgaW50byB0aGUgbGludXgtbmV4dAp0cmVlICh1c3VhbGx5IHNvbWV0aW1l
IGluIHRoZSBuZXh0IDI0IGhvdXJzKSBhbmQgc2VudCB0byBMaW51cyBkdXJpbmcKdGhlIG5leHQg
bWVyZ2Ugd2luZG93IChvciBzb29uZXIgaWYgaXQgaXMgYSBidWcgZml4KSwgaG93ZXZlciBpZgpw
cm9ibGVtcyBhcmUgZGlzY292ZXJlZCB0aGVuIHRoZSBwYXRjaCBtYXkgYmUgZHJvcHBlZCBvciBy
ZXZlcnRlZC4KCllvdSBtYXkgZ2V0IGZ1cnRoZXIgZS1tYWlscyByZXN1bHRpbmcgZnJvbSBhdXRv
bWF0ZWQgb3IgbWFudWFsIHRlc3RpbmcKYW5kIHJldmlldyBvZiB0aGUgdHJlZSwgcGxlYXNlIGVu
Z2FnZSB3aXRoIHBlb3BsZSByZXBvcnRpbmcgcHJvYmxlbXMgYW5kCnNlbmQgZm9sbG93dXAgcGF0
Y2hlcyBhZGRyZXNzaW5nIGFueSBpc3N1ZXMgdGhhdCBhcmUgcmVwb3J0ZWQgaWYgbmVlZGVkLgoK
SWYgYW55IHVwZGF0ZXMgYXJlIHJlcXVpcmVkIG9yIHlvdSBhcmUgc3VibWl0dGluZyBmdXJ0aGVy
IGNoYW5nZXMgdGhleQpzaG91bGQgYmUgc2VudCBhcyBpbmNyZW1lbnRhbCB1cGRhdGVzIGFnYWlu
c3QgY3VycmVudCBnaXQsIGV4aXN0aW5nCnBhdGNoZXMgd2lsbCBub3QgYmUgcmVwbGFjZWQuCgpQ
bGVhc2UgYWRkIGFueSByZWxldmFudCBsaXN0cyBhbmQgbWFpbnRhaW5lcnMgdG8gdGhlIENDcyB3
aGVuIHJlcGx5aW5nCnRvIHRoaXMgbWFpbC4KClRoYW5rcywKTWFyawoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vz
c2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tdGQvCg==
