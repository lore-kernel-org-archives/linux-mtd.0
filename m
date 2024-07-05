Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B362C30658
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Jul 2024 09:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uISl/rCJHDfvQXfQU5Azkl82AXZZgmbxuAQd+qv18Bc=; b=KWcSE1wtSyJrxAjeenB5JZJTuM
	bLo8er9q3lzf/IH462Kkxn+SZHDWQX3vtSKCdUUQ4/xnxsZqlFyOxzB8KkYDs8LLoRwDN+xZRBYLv
	nuxC9SYYrtDBtJW9LN52fZ+aIYZ3i3bvATYXgsbBZRGq0w/BhbMH6tZo/bpJ7Hz+QEL+3E4cONvb4
	+sk++zwU62hVXGcR3PIQ4d9puBfX+2OOiREx66CnXAdMi13CgHPOLuEx57xW46v2UeohhnF8vGncC
	ja5eqqAdUI0SUmrEpCYDcEQcVVJF4GyRw6iA2G3bA1KNiCP/KR+bnBFl7Aj6igNFGqV8RQl5n9zXO
	LZr7nXIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPf8G-0000000FQdd-2ZzG;
	Fri, 05 Jul 2024 09:21:32 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPf8C-0000000FQct-17Iq
	for linux-mtd@lists.infradead.org;
	Fri, 05 Jul 2024 09:21:30 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-a72988749f0so192278866b.0
        for <linux-mtd@lists.infradead.org>; Fri, 05 Jul 2024 02:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1720171286; x=1720776086; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DAsvD8/mLkcQAkkYRWz+VC5gPXf282xVyAGgndXBPhk=;
        b=eVif1pMYBQ7uNVMt+NSCPijcRoExFxXJlKMu4RKIsPM8wRg+g4z+jz3J+2kBjSmqZN
         Hww1i3IQajYARD+f3yh2haM+5bvSwj3OG7J/kxYs5zFmbJlZ5Mpcr8I6gFpU/EUc0ND9
         Xj+YaEdtAgnwILjMiMG58NispAK+TwOyAROEDQEGP2hb9UMqGJGVIg6UmxX41Z9Rmzlg
         xogUdvWlOd5Gb1dGSUn8+5xUlxX0Bj5dSeMB9OtqRXQ8JMbuv/qPNLmx6debkD/omKVn
         ECnzpd6WZlclPWeY8xfT2fzb/39vFjDa1eHLUu4q1pg+4hbMGUc9r8BUIps2FKfAUSrn
         0Sug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720171286; x=1720776086;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DAsvD8/mLkcQAkkYRWz+VC5gPXf282xVyAGgndXBPhk=;
        b=UJ/DvRplBHoFOAaiZhwFtce4ZLnoKciw19SrNp/q8ENJ6jCWtvZF/wJNefqulTv51g
         xpv9DltmudwnSGHTlKmifNnC/56bvH7Kqm5hBBs8+gjlS4xYSJnTiKx4q3BcbyHbBATp
         8GS1A7wtC6nqz9CTVn/AMAE53xOLpanPnMZKi4i/q6O1OTdpEBTPjeduMXsVUSMckzcb
         igNTarwrAHWsl7VdS9TB14c9oaoB84aHcJaCK92V5O+LYKAym9c5DwM2w0qBzCKBwglT
         aGVPz7gHlQ+3XAWPEdFUa69EKGfvmsv8Z0byPmFP0kjVFrilsUVDgIk2VT5j6JoLYRET
         pzjQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4Hle2xVZsBuSurMWib/hVm48H0mi9xLqIpgWodLKG/ZLMD0sb1Lqg9WFu4lvYK7r1dCm8gISCcIXBoFbxwHwtuCWqZnH7Ubeb0lbZ8Q==
X-Gm-Message-State: AOJu0YxuLN1tiuZ5bHuajNa9ztKBnrJl/RiELlt+kk2Dhxxa4Mj7raqo
	zWCvm0pTncq9p23aBIetb7wVPDTeoHEzjJztp2d0/zRFuCXqXDV4nbVIqLnj/w4=
X-Google-Smtp-Source: AGHT+IH5GBzifj2YL+uV1tph7kmD/UU37Fput+e22tUxmHwQFDW0cLo/eN2fRQ1OiC6xRmZjvtbAaw==
X-Received: by 2002:a17:906:fb95:b0:a6f:b400:4751 with SMTP id a640c23a62f3a-a77ba46ccffmr181755366b.22.1720171286291;
        Fri, 05 Jul 2024 02:21:26 -0700 (PDT)
Received: from localhost (p50915e7b.dip0.t-ipconnect.de. [80.145.94.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a77d9cdf337sm10855266b.53.2024.07.05.02.21.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 02:21:25 -0700 (PDT)
Date: Fri, 5 Jul 2024 11:21:25 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Nikita Shubin <nikita.shubin@maquefel.me>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, 
	Arnd Bergmann <arnd@arndb.de>, Stephen Boyd <sboyd@kernel.org>, 
	Hartley Sweeten <hsweeten@visionengravers.com>, Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Lukasz Majewski <lukma@denx.de>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Andy Shevchenko <andy@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Sebastian Reichel <sre@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Thierry Reding <thierry.reding@gmail.com>, Mark Brown <broonie@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Damien Le Moal <dlemoal@kernel.org>, 
	Sergey Shtylyov <s.shtylyov@omp.ru>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Ralf Baechle <ralf@linux-mips.org>, "Wu, Aaron" <Aaron.Wu@analog.com>, Lee Jones <lee@kernel.org>, 
	Olof Johansson <olof@lixom.net>, Niklas Cassel <cassel@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	dmaengine@vger.kernel.org, linux-watchdog@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-spi@vger.kernel.org, netdev@vger.kernel.org, linux-mtd@lists.infradead.org, 
	linux-ide@vger.kernel.org, linux-input@vger.kernel.org, linux-sound@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Andrew Lunn <andrew@lunn.ch>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH v10 00/38] ep93xx device tree conversion
Message-ID: <jyvlqfvqn5bp3jmvxvwyrcqmihjohuq3o757mfph7x37kbwvtq@gtgyh4fca4fq>
References: <20240617-ep93xx-v10-0-662e640ed811@maquefel.me>
 <CAHp75VfSC9gAD9ipeWRPdQOxUp4FXqYYei-cJTs38nbz0cHpkg@mail.gmail.com>
 <48c242838c77034485a9e667dc0e867207c5beed.camel@maquefel.me>
 <241a4cf9830b0118f01e8fcf2853c62527636049.camel@maquefel.me>
MIME-Version: 1.0
In-Reply-To: <241a4cf9830b0118f01e8fcf2853c62527636049.camel@maquefel.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240705_022128_336513_B49D5261 
X-CRM114-Status: GOOD (  33.83  )
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
Content-Type: multipart/mixed; boundary="===============7024150580546170113=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============7024150580546170113==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="icynwgj6p72h37hs"
Content-Disposition: inline


--icynwgj6p72h37hs
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Thu, Jun 27, 2024 at 11:29:44AM +0300, Nikita Shubin wrote:
> On Tue, 2024-06-18 at 19:20 +0300, Nikita Shubin wrote:
> > Hello Andy!
> > On Mon, 2024-06-17 at 12:58 +0200, Andy Shevchenko wrote:
> > > On Mon, Jun 17, 2024 at 11:38=E2=80=AFAM Nikita Shubin via B4 Relay
> > > <devnull+nikita.shubin.maquefel.me@kernel.org> wrote:
> > > >=20
> > > > The goal is to recieve ACKs for all patches in series to merge it
> > > > via Arnd branch.
> > >=20
> > > 'receive'
> > >=20
> > > > Unfortunately, CLK subsystem suddenly went silent on clk portion
> > > > of
> > > > series V2 reroll,
> > > > tried to ping them for about a month but no luck.
> > > >=20
> > > > Link:
> > > > https://lore.kernel.org/r/20240408-ep93xx-clk-v2-1-adcd68c13753@maq=
uefel.me
> > > >=20
> > > > Some changes since last version (v9) - see "Changes in v10",
> > > > mostly
> > > > cosmetic.
> > >=20
> > > ...
> > >=20
> > > > Patches should be formated with '--histogram'
> > >=20
> > > 'formatted'
> > >=20
> > > ...
> > >=20
> > > > Changes in v10:
> > > >=20
> > > > Reordered SoB tags to make sure they appear before Rb and Acked
> > > > tags.
> > >=20
> > > This is not required. The importance is only the order of SoBs
> > > themselves. If they are interleaved with other tags, it's fine.
> >=20
> > Ah - ok. Just saw someone was complaining about b4 reordering them.=20
> >=20
> > >=20
> > > ...
> > >=20
> > >=20
> > > Hopefully to see this series being eventually applied soon.
> > > Arnd? (Do we have all necessary subsystem maintainers' tags, btw?)
> > >=20
> > >=20
> >=20
> > As i see from my perspective only three left:
> >=20
> > Clk subsystem:
> >=20
> > - clk: ep93xx: add DT support for Cirrus EP93xx
> >=20
> > DMA subsystem (but the only request from Vinod, as far as i remember,
> > was fixing commits titles):
> >=20
> > - dmaengine: cirrus: Convert to DT for Cirrus EP93xx
> > - dmaengine: cirrus: remove platform code
> >=20
> > Beside that tags missing on platform code removal (which can be Acked
> > by Arnd himself i believe) and dtsi/dts files (same ?).
>=20
> Vinod acked the above two patches:
>=20
> https://lore.kernel.org/all/ZnkIp8bOcZK3yVKP@matsya/
> https://lore.kernel.org/all/ZnkImp8BtTdxl7O3@matsya/
>=20
> so only:
>=20
> - clk: ep93xx: add DT support for Cirrus EP93xx
>=20
> https://lore.kernel.org/all/20240617-ep93xx-v10-3-662e640ed811@maquefel.m=
e/
>=20
> left.
>=20
> Hope Stephen will find some time for this one.

As we're approaching the merge window and this is still unclear, I
applied the pwm bits (i.e. patches 12, 13). If I understand correctly,
patch 33 isn't suitable for application yet as it has a dependency on
pinctrl changes in that series.

(side note: Your patches are signed, but that doesn't bring any benefit
if the receivers don't have your key. I didn't find it neither on
keys.openpgp.org nor in the kernel pgp key collection.)

Best regards
Uwe

--icynwgj6p72h37hs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmaHuxIACgkQj4D7WH0S
/k63agf/ctyXHUSwirhdvMJNeHEME1eqwJPf8P71cxUigi0cvcf0NrTT4jEqglzC
BqT8dRZCw6LKUShZlhwO7ymRXcAjNYTvFLuJKQYOGuVQZQEtoK7PDa80NeQjFhZP
r0CwuOQfcg2ovACIA1T/iSX2APqGatvsO4Ke7h2u5kawsGxQIu2TZnfPDhwTIdqj
Ib33BChvzlU45YrMZrQUHKE3/3XOHyxVvZSutJmaHLtSdIOE/fPr/U5anDzjdWFS
gxrbDGE0Z3LyDIb0OB8iZiVIeyXDjysmlTdYpfPQi3/4JT+ohaNXgpSC5dmYo/s+
R6QHGSe+ahTTQGyCjdYkOM/hMh/CiQ==
=1/WB
-----END PGP SIGNATURE-----

--icynwgj6p72h37hs--


--===============7024150580546170113==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============7024150580546170113==--

