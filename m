Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEAB1606A31E
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Nov 2026 17:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eYzdMr4I;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=nj1pLOnl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ed+s4CcuB83icuxTSuXIHlO/ZOjcvA7+DFUvz+j34cY=; b=eYzdMr4I5b1iPkhHr8AnVfuQI4
	UXAx3qYyPrMyGaltv+xN2QXNGroUAgXB8F5Jp8jWV2945+6l+umo3b+x0ea0uhv4oyMpXkZkWjw3A
	wozmLHoYaNFw1wWZ1+U6Ry73rGFZ+FArxIdvwhH6Xq7xkHEz2HL7RG4/wjGGwwQp2Ywss5oHWsoPT
	PlagEdWhXsWWlzP7dlfpNUHIrOBnWrz4oecazcvIeTDhWjBIcfk7OvktPv4270suD/3y8Dkn4CG5Q
	G2mR5XIhw4PwF+LqfzYcOl+L/QDYm/fS4rlVPHsL2fwif7eZ1suuzM3/39junoYUjxG4Tj6dX2jqJ
	aN0PVm+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWGkI-0000000AjYY-1JBg;
	Wed, 25 Nov 2026 17:25:26 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWGk0-0000000AjUO-1gOH
	for linux-mtd@lists.infradead.org;
	Wed, 25 Nov 2026 17:25:23 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso5339099f8f.2
        for <linux-mtd@lists.infradead.org>; Wed, 25 Nov 2026 09:25:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795627506; x=1796232306; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/2ZiDJ9tq36ZHWmXeHMEUP2iypybL2OmKVpnewLrfEs=;
        b=nj1pLOnlJEukLuY91AuxsqpPQ8wMaWzgdKOgi/Dw9+VSAgNwjehHkFzDnkuGqOILig
         iBHD/zDf8xaa+O5cX8c8xpHKYH15oSvtAZdsk0ZYkun7yO22808KCoenRC0iqOEWuknX
         tek5FXKO4RQuQt26bY+HJ3DP16MI3biVp15l5SodSy178Kz1l4sBFoqZusFspf8MepBZ
         RWZrx9c6NWBEsN3clqyXKOF0IDKewacL+ZjyyPsfsr/kNPQvK/rrEG+in2X9p+RNQg/n
         lS/DYR/7DDkZ6TfWRhLVyw6g9Rium1abejby1RqZW3zB4oOBChAz+E7FgbDg+EfB5uFh
         wU5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795627506; x=1796232306;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/2ZiDJ9tq36ZHWmXeHMEUP2iypybL2OmKVpnewLrfEs=;
        b=u4n3ekPu3+ypK4bYMo6VHRThBgWDJYLdoKb8kwTA2C34yLL6+Up0nNTf4BP1R04xlr
         M3kxFaOFHlh+bE8tD40y3HCnhkd0qsciqeKznrBxVdxVv4sgPon//usNMdIk/Ax88p3t
         ZmBswiZeXWBbe2DCdHBqjJAbMA10eZMx1/0E8eSLlh9hiDfbgaaUA/WQqkrha6sK8hwR
         l9DTWfYvtMGYLEhTSjSJEsTULed4m7vGBpl31oisGuor4Yc1ktvr4KmZiJ/mTUw4NWeW
         +13E3j1fYn2LGSL4GNtHyprCD+hrH7+qE4TTpWAapQkd8DBeCyx3Og3biktP2rU18+QW
         snqQ==
X-Forwarded-Encrypted: i=1; AL+hErEakUFxUiRE5IsoGHQSw2wbpBKI6LssUMXDOolo2gng3rRm6JMgSvS6RBXhsMk9tsFv8fsDyAEFJFo=@lists.infradead.org
X-Gm-Message-State: APuU4Z94EZ0cmUPPtjbY0H/sUJUhkt1QlrA4lvIxfK1FaFv8culSbrcI
	KdsbnHoPTjr6A6evn+frHLnOeGJU1PlaD+RfpH8XkgnBu5uD7tmFhcKTOrDQ5j8THYE=
X-Gm-Gg: AZFdTZcWjDcTtZ+VTKIJD0cePwFYAtEOevPEkTuVdCNqg9wovAFulzOARVNRavAXfFp
	1yyJdRUm7yh1YubfOrhRr5Jl1F5XD/nysJSo3p5+RFDoyTFcCJCd0jkilawVDVlziLR/9+UlgYx
	EWdgWktiiWQ+2WK9TBPE/5EAO80wiitPJySqRbQxg35ARRikKd5UV0eIHzxONfuTzsO4rdLIZa4
	5oDFp/OoP/cXc5qgl7gFAdd9vPa6S1j2hEz3ARPav2Oto0H0I9oKDz1W8bNgLNqwQ2A7zfeW4tN
	yrmI1o64qJNDgb/Vqy5BNnDIJk5E+27KEdlYiaVccmNy6R9+s+5cdLgvHWcM1AP2ic6iWgSgHu1
	MKNKHXR2KDve7kk7ZfSzoRqqEsKOvXr1eC8nPCUZQ8SeqyZk9uJUyVne8L0wdU8W6pwdXWSkfhF
	3FaUo0pyc93cUrQ5/ak+FZOUiDQJ3YwWkPmzsPCNTlzFufU8cv4R8KfPkR1WGSy5LU8eVg+2pZJ
	P0L5AzVE4k6wRDvgeB/ohYGzJWA+GHOjy5IChz1adM74U4j7Ah1jJIjyljfbjpGLiJdDz/39oh/
	s/Ordz9xwKHa+o8/G+TWCs5kDEVip2I0I4RzGtFl7TAy/KLXeksNDtaejwTNIQestmqZhrhiruD
	PZdrECBBi1VYNaUdH1A==
X-Received: by 2002:a05:6000:178f:b0:4bb:c85e:d565 with SMTP id ffacd0b85a97d-4bbc86e17b5mr436127f8f.55.1795627506305;
        Wed, 25 Nov 2026 09:25:06 -0800 (PST)
Received: from localhost (p200300f65f19a904452474b9d670397a.dip0.t-ipconnect.de. [2003:f6:5f19:a904:4524:74b9:d670:397a])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4ab658e2d1bsm37047838f8f.8.2026.11.25.09.25.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 09:25:05 -0800 (PST)
Date: Wed, 25 Nov 2026 18:25:04 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
	Takahiro Kuwano <takahiro.kuwano@infineon.com>, Vladimir Zapolskiy <vz@mleia.com>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, Alexander Usyskin <alexander.usyskin@intel.com>, 
	Joern Engel <joern@lazybastard.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, 
	Shrikanth Hegde <sshegde@linux.ibm.com>, Michal Simek <michal.simek@amd.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Brian Norris <computersforpeace@gmail.com>, 
	Kamal Dasu <kamal.dasu@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, William Zhang <william.zhang@broadcom.com>, 
	Anand Gore <anand.gore@broadcom.com>, Kursad Oney <kursad.oney@broadcom.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Han Xu <han.xu@nxp.com>, 
	Paul Cercueil <paul@crapouillou.net>, Harvey Hunt <harveyhuntnexus@gmail.com>, 
	Keguang Zhang <keguang.zhang@gmail.com>, Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
	Liang Yang <liang.yang@amlogic.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Stefan Agner <stefan@agner.ch>, Lucas Stach <dev@lynxeye.de>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Linus Walleij <linusw@kernel.org>, 
	Kyungmin Park <kyungmin.park@samsung.com>, linux-mtd@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, imx@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 00/10] mtd: use desginated initializers in *_device_id
 arrays
Message-ID: <awcZcuSbse5g3FWK@monoceros>
References: <20261125-acpi-mtd-v1-0-42ad2f645bee@thegoodpenguin.co.uk>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261125-acpi-mtd-v1-0-42ad2f645bee@thegoodpenguin.co.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_092520_663273_B39FD4CD 
X-CRM114-Status: GOOD (  23.48  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============5302204008001941329=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--===============5302204008001941329==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nbybrdipqtjlxyaa"
Content-Disposition: inline


--nbybrdipqtjlxyaa
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 00/10] mtd: use desginated initializers in *_device_id
 arrays
MIME-Version: 1.0

On Wed, Nov 25, 2026 at 04:28:26PM +0000, Pawel Zalewski wrote:
> This series is converting lists that contain the *_device_id structs,
> to make use of named initializers (which they do not use currently).
> This work is part of the on going effort in the kernel associated with
> device-ids [1]
>=20
> The plan is to convert *_device_id::driver_data to have an anonymous
> union, like it was introduced for PCI and I2C device ID tables.

Not sure I understand that. PCI and I2C wasn't converted yet. ieee1394
and zorro were.

> The goal is to increase type-safety (most of the existing casts are gone),
> to improve readability and to make use intent a bit more clear:
>=20
> ```
> union {
> 	kernel_ulong_t driver_data;
> 	const void *driver_data_ptr;
> }
> ```
>=20
> But for that to work all lists containing the structs need to use named
> initializers first to avoid triggering -Wmissing-braces for that field.
> This effort is split per every subsystem into:
> - pre-clean-ups that convert the lists to use named initializers
>   (which is this series)
> - actual implementations that make some of the modules use the new
>   driver_data_ptr member (which is not needed in the mtd subsystem)
>=20
> That way the task can be fragmented into manageable and independent chunks
> of work and makes this effort easier to review.
>=20
> Patches 1-3 implement the named initializer change.
> Patched 4-10 are just churn to unify the list termination and can be drop=
ped.
>=20
> [1] https://lore.kernel.org/all/cover.1780048925.git.u.kleine-koenig@bayl=
ibre.com
>=20
> Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>

Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>

with or without addressing the nitpick I had for one of the patches.

Thanks for going through this
Uwe

--nbybrdipqtjlxyaa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmsHGe4ACgkQj4D7WH0S
/k7Hxgf+JDQD3nuNyQeHxxoBDQbZLCdeqai2FGzqlA/wVP4ILYtl0Hj2B4Uvb51m
TWG5nlrssz3YpBalM5hoN7zT4/kYrvYV+kEZwlQ0rRaST1L1WSsaI+hIrd+sFqjI
E8CbBh9BDS8e2lqRUB02P2qNgrLW8OGoqjf65o8A416iktJ3LaEisuhLP8aVKb9O
G9s0nSWXydrbhPM3eKUGdumEvZViZRDTbdQOOZ3Ont4s0nic7RCuY5HxIJAv5u7h
n+QP/LXiSy/47VdwvRwqyJDfGxZnUzMHMxb0X6NQg1g1C/xCJFt3XHlD/eUHbI7K
axkOeY5ogCnXHhh12ds+XESv7iHqCw==
=xvDo
-----END PGP SIGNATURE-----

--nbybrdipqtjlxyaa--


--===============5302204008001941329==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============5302204008001941329==--

