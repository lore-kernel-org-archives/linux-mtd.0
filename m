Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C0B1C4828F
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Feb 2024 23:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2N1uU7mRvaGUiDbdk56UlEI3srPAGBVhmjwhxUSbCDQ=; b=h1+5VTSM/VAtXG
	g+KSejmWnGkmRzM+UIy9eb6fcGrwkOyXatf7C1BPvDgw/5AC9aFWtdyPMyPHDbc7aMu6I+o+Al3el
	hPGZz6k4w0B7RafyxJAgsop2BXNU2DT9G7y7l/fp6z7QOAWcueALKdFFsAdIeaywcOqNgrVPIIJe9
	o+l5cXueJU3075TSmJUWzp/nyC2GUQj2sLSuVpTnqm0Whym6hCJX+EQA71Vgb0vyDuWFZscSDaXTZ
	3NTPnc6LxEWNcBTPSafK2umhGyIExt+Pcp859tcWjOmUzlXRMXjUw2qZQ/F578y9dz3Twvpytkpyn
	62/lURpzNT5O6uO8wPxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYE6T-0000000FZTZ-2maV;
	Thu, 08 Feb 2024 23:46:49 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYBqE-0000000ExSI-1wHx;
	Thu, 08 Feb 2024 21:21:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9718260B33;
	Thu,  8 Feb 2024 21:21:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 289CDC433F1;
	Thu,  8 Feb 2024 21:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707427313;
	bh=oqvxtofftemHVkqCtUvTHWJMUcVkNerevyhL33rOVTg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=L5BmvqcRkgnwQazmD6GNbT/V4WhBK5Jh6gNZcDqvZtq3vD3bjm4E5j4iLEoOGBSf2
	 9F9jyrrWriCDl5Wu0BAXPhkb1g056buOTe2Ztq7rnNXkEo1LQlxR/MS5DrRDwOGECL
	 PzXvkI3prpHFsJQ85rgk8WagJHAGPijl/nL+cwohJK5pgSdWN4EVlzkTj2GSjD78+U
	 Do4/ScbKYtsrkZ/UX5X3+BMEO6gp6SsFMVnpleSnv3fJUOOdIaypIpDthmOW76tyzt
	 Evsw5NI06O+Mh6/qIrxzDT3P++ocGhgYPwbeQwHydxaTl96OS/0UKdfbCWCgOU5q38
	 wcv+IJzWFU9dQ==
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
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, linux-input@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Martin Tuma <martin.tuma@digiteqautomotive.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
 Sergey Kozlov <serjk@netup.ru>, Arnd Bergmann <arnd@arndb.de>, 
 Yang Yingliang <yangyingliang@huawei.com>, linux-mmc@vger.kernel.org, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, 
 Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>, 
 Amit Kumar Mahapatra via Alsa-devel <alsa-devel@alsa-project.org>, 
 linux-mtd@lists.infradead.org, Simon Horman <horms@kernel.org>, 
 Ronald Wahl <ronald.wahl@raritan.com>, Benson Leung <bleung@chromium.org>, 
 Tzung-Bi Shih <tzungbi@kernel.org>, Guenter Roeck <groeck@chromium.org>, 
 chrome-platform@lists.linux.dev, Michal Simek <michal.simek@amd.com>, 
 Max Filippov <jcmvbkbc@gmail.com>, linux-spi@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 linux-mediatek@lists.infradead.org, Thomas Zimmermann <tzimmermann@suse.de>, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org, 
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev, 
 Viresh Kumar <vireshk@kernel.org>, Rui Miguel Silva <rmfrfs@gmail.com>, 
 Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, 
 greybus-dev@lists.linaro.org, Peter Huewe <peterhuewe@gmx.de>, 
 Jarkko Sakkinen <jarkko@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, 
 linux-integrity@vger.kernel.org, Herve Codina <herve.codina@bootlin.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-usb@vger.kernel.org, Helge Deller <deller@gmx.de>, 
 Dario Binacchi <dario.binacchi@amarulasolutions.com>, 
 Kalle Valo <kvalo@kernel.org>, Dmitry Antipov <dmantipov@yandex.ru>, 
 libertas-dev@lists.infradead.org, linux-wireless@vger.kernel.org, 
 Jonathan Corbet <corbet@lwn.net>, Bjorn Helgaas <bhelgaas@google.com>, 
 James Clark <james.clark@arm.com>, linux-doc@vger.kernel.org
In-Reply-To: <cover.1707324793.git.u.kleine-koenig@pengutronix.de>
References: <cover.1707324793.git.u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v3 00/32] spi: get rid of some legacy macros
Message-Id: <170742729486.2266792.11643460714402047207.b4-ty@kernel.org>
Date: Thu, 08 Feb 2024 21:21:34 +0000
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-0438c
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240208_132154_599360_47A38445 
X-CRM114-Status: GOOD (  18.02  )
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

T24gV2VkLCAwNyBGZWIgMjAyNCAxOTo0MDoxNCArMDEwMCwgVXdlIEtsZWluZS1Lw7ZuaWcgd3Jv
dGU6Cj4gQ2hhbmdlcyBzaW5jZSB2Mgo+IChodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1z
cGkvY292ZXIuMTcwNTk0NDk0My5naXQudS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlKToK
PiAKPiAgLSBEcm9wIHBhdGNoICJtdGQ6IHJhd25hbmQ6IGZzbF9lbGJjOiBMZXQgLnByb2JlIHJl
dHJ5IGlmIGxvY2FsIGJ1cyBpcwo+ICAgIG1pc3NpbmciIHdoaWNoIGRvZXNuJ3QgYmVsb25nIGlu
dG8gdGhpcyBzZXJpZXMuCj4gIC0gRml4IGEgYnVpbGQgZmFpbHVyZSBub3RpY2VkIGJ5IHRoZSBr
ZXJuZWwgYnVpbGQgYm90IGluCj4gICAgZHJpdmVycy9zcGkvc3BpLWF1MTU1MC5jLiAoSSBmYWls
ZWQgdG8gY2F0Y2ggdGhpcyBiZWNhdXNlIHRoaXMgZHJpdmVyCj4gICAgaXMgbWlwcyBvbmx5LCBi
dXQgbm90IGVuYWJsZWQgaW4gYSBtaXBzIGFsbG1vZGNvbmZpZy4gVGhhdCdzIGEgYml0Cj4gICAg
dW5mb3J0dW5hdGUsIGJ1dCBub3QgZWFzaWx5IGZpeGFibGUuKQo+ICAtIEFkZCB0aGUgUmV2aWV3
ZWQtYnk6IGFuZCBBY2tlZC1ieTogdGFncyBJIHJlY2VpdmVkIGZvciB2Mi4KPiAKPiBbLi4uXQoK
QXBwbGllZCB0bwoKICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5l
bC9naXQvYnJvb25pZS9zcGkuZ2l0IGZvci1uZXh0CgpUaGFua3MhCgpbMDEvMzJdIGZwZ2E6IGlj
ZTQwLXNwaTogRm9sbG93IHJlbmFtaW5nIG9mIFNQSSAibWFzdGVyIiB0byAiY29udHJvbGxlciIK
ICAgICAgICBjb21taXQ6IDIyN2FiNzNiODlkNjZlMzA2NGIzYzJiY2I1ZmUzODJiMTgxNTc2M2QK
WzAyLzMyXSBpZWVlODAyMTU0OiBjYTgyMTA6IEZvbGxvdyByZW5hbWluZyBvZiBTUEkgIm1hc3Rl
ciIgdG8gImNvbnRyb2xsZXIiCiAgICAgICAgY29tbWl0OiAxNjdiNzg0NDY3MDZiYjRkMTlmN2Rk
OTNjYTMyMGFlZDI1YWUxYmJkClswMy8zMl0gaWlvOiBhZGM6IGFkX3NpZ21hX2RlbHRhOiBGb2xs
b3cgcmVuYW1pbmcgb2YgU1BJICJtYXN0ZXIiIHRvICJjb250cm9sbGVyIgogICAgICAgIGNvbW1p
dDogMjc4MGU3YjcxNmE2MDU3ODFkYmVlNzUzZWY0OTgzZDc3NWE2NTQyNwpbMDQvMzJdIElucHV0
OiBweHNwYWQgLSBmb2xsb3cgcmVuYW1pbmcgb2YgU1BJICJtYXN0ZXIiIHRvICJjb250cm9sbGVy
IgogICAgICAgIGNvbW1pdDogYTc4YWNlYzUzYjg1MjQ1OTNhZmVlZDcyNThhNDQyYWRjMzQ1MDgx
OApbMDUvMzJdIElucHV0OiBzeW5hcHRpY3Mtcm1pNCAtIGZvbGxvdyByZW5hbWluZyBvZiBTUEkg
Im1hc3RlciIgdG8gImNvbnRyb2xsZXIiCiAgICAgICAgY29tbWl0OiAxMjQ1NjMzYzYxYmFmMTU5
ZmNjMTMwM2Q3ZjA4NTVmNDk4MzFiOWMxClswNi8zMl0gbWVkaWE6IG1nYjQ6IEZvbGxvdyByZW5h
bWluZyBvZiBTUEkgIm1hc3RlciIgdG8gImNvbnRyb2xsZXIiCiAgICAgICAgY29tbWl0OiAyYzJm
OTNmYmZiYTcxODZjYzA4MWUyMzEyMGYxNjllYWMzYjViNjJhClswNy8zMl0gbWVkaWE6IG5ldHVw
X3VuaWR2YjogRm9sbG93IHJlbmFtaW5nIG9mIFNQSSAibWFzdGVyIiB0byAiY29udHJvbGxlciIK
ICAgICAgICBjb21taXQ6IGNmYTEzYTY0YmQ2MzFkOGYwNGExYzM4NTkyMzcwNmZjZWY5YTYzZWQK
WzA4LzMyXSBtZWRpYTogdXNiL21zaTI1MDA6IEZvbGxvdyByZW5hbWluZyBvZiBTUEkgIm1hc3Rl
ciIgdG8gImNvbnRyb2xsZXIiCiAgICAgICAgY29tbWl0OiBkZDg2OGFlNjQ2ZDU3NzBmODBmOTBk
YzA1NmQwNmViMmU2ZDM5YzYyClswOS8zMl0gbWVkaWE6IHY0bDItc3ViZGV2OiBGb2xsb3cgcmVu
YW1pbmcgb2YgU1BJICJtYXN0ZXIiIHRvICJjb250cm9sbGVyIgogICAgICAgIGNvbW1pdDogZDky
MGIzYTY3MmI3Zjc5Y2QxM2IzNDEyMzRhZWJkNDkyMzNmODM2YwpbMTAvMzJdIG1pc2M6IGdlaGMt
YWNoYzogRm9sbG93IHJlbmFtaW5nIG9mIFNQSSAibWFzdGVyIiB0byAiY29udHJvbGxlciIKICAg
ICAgICBjb21taXQ6IDI2ZGNmMDllZTVkOWNlYmEyYzYyN2FlM2JhMTc0YTIyOWYyNTYzOGYKWzEx
LzMyXSBtbWM6IG1tY19zcGk6IEZvbGxvdyByZW5hbWluZyBvZiBTUEkgIm1hc3RlciIgdG8gImNv
bnRyb2xsZXIiCiAgICAgICAgY29tbWl0OiBiMGE2Nzc2ZTUzNDAzYWEzODA0MTFmMmE0M2NkZWZi
OWYwMGZmNTBhClsxMi8zMl0gbXRkOiBkYXRhZmxhc2g6IEZvbGxvdyByZW5hbWluZyBvZiBTUEkg
Im1hc3RlciIgdG8gImNvbnRyb2xsZXIiCiAgICAgICAgY29tbWl0OiA0NGVlOTk4ZGI5ZWVmODRi
ZjAwNWMzOTQ4NjU2NmE2N2NiMDE4MzU0ClsxMy8zMl0gbmV0OiBrczg4NTE6IEZvbGxvdyByZW5h
bWluZyBvZiBTUEkgIm1hc3RlciIgdG8gImNvbnRyb2xsZXIiCiAgICAgICAgY29tbWl0OiAxY2M3
MTFhNzJhZTdmZDQ0ZTkwODM5ZjBjOGQzMjI2NjY0ZGU1NWEyClsxNC8zMl0gbmV0OiB2ZXJ0ZXhj
b206IG1zZTEwMng6IEZvbGxvdyByZW5hbWluZyBvZiBTUEkgIm1hc3RlciIgdG8gImNvbnRyb2xs
ZXIiCiAgICAgICAgY29tbWl0OiA3OTY5Yjk4YjgwYzAzMzJmOTQwYzU0N2Y4NDY1MGEyMGFhYjMz
ODQxClsxNS8zMl0gcGxhdGZvcm0vY2hyb21lOiBjcm9zX2VjX3NwaTogRm9sbG93IHJlbmFtaW5n
IG9mIFNQSSAibWFzdGVyIiB0byAiY29udHJvbGxlciIKICAgICAgICBjb21taXQ6IDg1YWQwZWMw
NDlhNzcxYzQ5MTBjOGFlYmIyZDBiZDljZTkzMTFmZDkKWzE2LzMyXSBzcGk6IGJpdGJhbmc6IEZv
bGxvdyByZW5hbWluZyBvZiBTUEkgIm1hc3RlciIgdG8gImNvbnRyb2xsZXIiCiAgICAgICAgY29t
bWl0OiAyMjU5MjMzMTEwZDkwMDU5MTg3YzViYTc1NTM3ZWI5M2ViYTg0MTdiClsxNy8zMl0gc3Bp
OiBjYWRlbmNlLXF1YWRzcGk6IERvbid0IGVtaXQgZXJyb3IgbWVzc2FnZSBvbiBhbGxvY2F0aW9u
IGVycm9yCiAgICAgICAgY29tbWl0OiBlNzEwMTFkYWNjMzQxM2JlZDQxMThkMmM0MmYxMDczNmZm
Y2Q3NjJjClsxOC8zMl0gc3BpOiBjYWRlbmNlLXF1YWRzcGk6IEZvbGxvdyByZW5hbWluZyBvZiBT
UEkgIm1hc3RlciIgdG8gImNvbnRyb2xsZXIiCiAgICAgICAgY29tbWl0OiAyOGU1OWQ4YmYxYWNl
MGRkZjA1Zjk4OWE0OGQ2ODI0ZDc1NzMxMjY3ClsxOS8zMl0gc3BpOiBjYXZpdW06IEZvbGxvdyBy
ZW5hbWluZyBvZiBTUEkgIm1hc3RlciIgdG8gImNvbnRyb2xsZXIiCiAgICAgICAgY29tbWl0OiAx
NzQ3ZmJkZWRiYThiNmIzZmQ0NTk4OTVlZDVkNTdlNTM0NTQ5ODg0ClsyMC8zMl0gc3BpOiBnZW5p
LXFjb206IEZvbGxvdyByZW5hbWluZyBvZiBTUEkgIm1hc3RlciIgdG8gImNvbnRyb2xsZXIiCiAg
ICAgICAgY29tbWl0OiAxNGNlYTkyMzM4YTA3NzZjMTYxNTk5NDE1MGU3MzhhYzBmNWZiYjJjClsy
MS8zMl0gc3BpOiBsb29wYmFjay10ZXN0OiBGb2xsb3cgcmVuYW1pbmcgb2YgU1BJICJtYXN0ZXIi
IHRvICJjb250cm9sbGVyIgogICAgICAgIGNvbW1pdDogMmMyMzEwYzE3ZmFjMTNhYTdlNzg3NTZk
N2YzNzgwYzc4OTFmOTM5NwpbMjIvMzJdIHNwaTogc2xhdmUtbXQyN3h4OiBGb2xsb3cgcmVuYW1p
bmcgb2YgU1BJICJtYXN0ZXIiIHRvICJjb250cm9sbGVyIgogICAgICAgIGNvbW1pdDogODE5N2Ix
MzZiYmJlNjRhN2NhYjEwMjBhNGIwNjcwMjBlNTk3N2Q5OApbMjMvMzJdIHNwaTogc3BpZGV2OiBG
b2xsb3cgcmVuYW1pbmcgb2YgU1BJICJtYXN0ZXIiIHRvICJjb250cm9sbGVyIgogICAgICAgIGNv
bW1pdDogZDkzNGNkNmYwZTVkMDA1Mjc3MjYxMmRiNGIwN2RmNjBjYjlkYTM4NwpbMjQvMzJdIHN0
YWdpbmc6IGZidGZ0OiBGb2xsb3cgcmVuYW1pbmcgb2YgU1BJICJtYXN0ZXIiIHRvICJjb250cm9s
bGVyIgogICAgICAgIGNvbW1pdDogYmJkMjVkNzI2MGVlZWFlZjg5ZjczNzFjYmFkY2QzM2RkN2Y3
YmZmOQpbMjUvMzJdIHN0YWdpbmc6IGdyZXlidXM6IHNwaTogRm9sbG93IHJlbmFtaW5nIG9mIFNQ
SSAibWFzdGVyIiB0byAiY29udHJvbGxlciIKICAgICAgICBjb21taXQ6IGVlM2M2NjhkZGEzZDI3
ODNiMGZmZjQwOTE0NjEzNTZmZTAwMGU0ZDgKWzI2LzMyXSB0cG1fdGlzX3NwaTogRm9sbG93IHJl
bmFtaW5nIG9mIFNQSSAibWFzdGVyIiB0byAiY29udHJvbGxlciIKICAgICAgICBjb21taXQ6IGI2
YWYxNGVhY2M4ODE0YjA5ODZlMjA1MDdkZjQyM2NlYmU5ZmQ4NTkKWzI3LzMyXSB1c2I6IGdhZGdl
dDogbWF4MzQyMF91ZGM6IEZvbGxvdyByZW5hbWluZyBvZiBTUEkgIm1hc3RlciIgdG8gImNvbnRy
b2xsZXIiCiAgICAgICAgY29tbWl0OiA4YzcxNmY0YTNkNGZjYmVjOTc2MjQ3ZTM0NDNkMzZjYmMy
NGMwNTEyClsyOC8zMl0gdmlkZW86IGZiZGV2OiBtbXA6IEZvbGxvdyByZW5hbWluZyBvZiBTUEkg
Im1hc3RlciIgdG8gImNvbnRyb2xsZXIiCiAgICAgICAgY29tbWl0OiBiMjMwMzFlNzMwZTcyZWM5
MDY3YjdjMzhjMjVlNzc2YzVlMjdlMTE2ClsyOS8zMl0gd2lmaTogbGliZXJ0YXM6IEZvbGxvdyBy
ZW5hbWluZyBvZiBTUEkgIm1hc3RlciIgdG8gImNvbnRyb2xsZXIiCiAgICAgICAgY29tbWl0OiAz
MDA2MGQ1N2NlZTE5NGQ2YjcwMjgzZjJmYWY3ODdlMmZkYzYxYjZlClszMC8zMl0gc3BpOiBmc2wt
bGliOiBGb2xsb3cgcmVuYW1pbmcgb2YgU1BJICJtYXN0ZXIiIHRvICJjb250cm9sbGVyIgogICAg
ICAgIGNvbW1pdDogODAxMTg1ZWZhMjQwMmRjZTU3ODI4OTMwZTk2ODQ4ODRmYzhkNjJkYQpbMzEv
MzJdIHNwaTogRHJvcCBjb21wYXQgbGF5ZXIgZnJvbSByZW5hbWluZyAibWFzdGVyIiB0byAiY29u
dHJvbGxlciIKICAgICAgICBjb21taXQ6IDYyMGQyNjlmMjlhNTY5YmEzNzQxOWNjMDNjZjFkYTJk
NTVmNjI1MmEKWzMyLzMyXSBEb2N1bWVudGF0aW9uOiBzcGk6IFVwZGF0ZSBkb2N1bWVudGF0aW9u
IGZvciByZW5hbWluZyAibWFzdGVyIiB0byAiY29udHJvbGxlciIKICAgICAgICBjb21taXQ6IDc2
YjMxZWI0YzJkYTNkZGIzMTk1Y2MxNGY2YWFkMjQ5MDhhZGY1MjQKCkFsbCBiZWluZyB3ZWxsIHRo
aXMgbWVhbnMgdGhhdCBpdCB3aWxsIGJlIGludGVncmF0ZWQgaW50byB0aGUgbGludXgtbmV4dAp0
cmVlICh1c3VhbGx5IHNvbWV0aW1lIGluIHRoZSBuZXh0IDI0IGhvdXJzKSBhbmQgc2VudCB0byBM
aW51cyBkdXJpbmcKdGhlIG5leHQgbWVyZ2Ugd2luZG93IChvciBzb29uZXIgaWYgaXQgaXMgYSBi
dWcgZml4KSwgaG93ZXZlciBpZgpwcm9ibGVtcyBhcmUgZGlzY292ZXJlZCB0aGVuIHRoZSBwYXRj
aCBtYXkgYmUgZHJvcHBlZCBvciByZXZlcnRlZC4KCllvdSBtYXkgZ2V0IGZ1cnRoZXIgZS1tYWls
cyByZXN1bHRpbmcgZnJvbSBhdXRvbWF0ZWQgb3IgbWFudWFsIHRlc3RpbmcKYW5kIHJldmlldyBv
ZiB0aGUgdHJlZSwgcGxlYXNlIGVuZ2FnZSB3aXRoIHBlb3BsZSByZXBvcnRpbmcgcHJvYmxlbXMg
YW5kCnNlbmQgZm9sbG93dXAgcGF0Y2hlcyBhZGRyZXNzaW5nIGFueSBpc3N1ZXMgdGhhdCBhcmUg
cmVwb3J0ZWQgaWYgbmVlZGVkLgoKSWYgYW55IHVwZGF0ZXMgYXJlIHJlcXVpcmVkIG9yIHlvdSBh
cmUgc3VibWl0dGluZyBmdXJ0aGVyIGNoYW5nZXMgdGhleQpzaG91bGQgYmUgc2VudCBhcyBpbmNy
ZW1lbnRhbCB1cGRhdGVzIGFnYWluc3QgY3VycmVudCBnaXQsIGV4aXN0aW5nCnBhdGNoZXMgd2ls
bCBub3QgYmUgcmVwbGFjZWQuCgpQbGVhc2UgYWRkIGFueSByZWxldmFudCBsaXN0cyBhbmQgbWFp
bnRhaW5lcnMgdG8gdGhlIENDcyB3aGVuIHJlcGx5aW5nCnRvIHRoaXMgbWFpbC4KClRoYW5rcywK
TWFyawoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
