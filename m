Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC912C433EF
	for <linux-mtd@archiver.kernel.org>; Thu,  5 May 2022 14:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YcYTSfMMZHlNoesa+2xXfWsT4OH1zEofwLsAw0P0MlY=; b=CJAdPTryv0gYCs8XjV0WBcApcZ
	Q8vcgWVegZbxaV8P/uXydwqxcKrv63CpwAARhj2bwW42nQcOxvrpjs/foG/1B/x/jv+78NV/j7wr+
	lYx7Q75+14uuZVSnWWOAoDSg9G6v1tQA0vVpe/9xpY8h9lKmqkct+oXUTgnp7nIqUyFNbtQnFpnGf
	SU13E2PxJSacik58KqBWFBa0N1Way9jRgvYejfKqgJDq33zpzZU/hiG13kYpOWsMPPv4l8ehlRjDt
	XtISp6VFzpy9BIXfr2iUioXzwNXjhNIT1/BVAEEHsgoPRY21TMGD7Y5dNzMa0fFm3/Ahce9+4ChkK
	rbWK8inQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmce0-00GQcc-9X; Thu, 05 May 2022 14:39:52 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmcdm-00GQUh-4d; Thu, 05 May 2022 14:39:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 73ACEB82D82;
 Thu,  5 May 2022 14:39:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CCC8C385A4;
 Thu,  5 May 2022 14:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651761575;
 bh=g1QQljRmgGmXNfn7Y2eEY8r+LEwnNx4UeO2ISPOT2Do=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=L0vPd9KPowSZpVQBjF8sXiij5yDMPUr5RFtZooPJOYwEr7f6V9sJ5RjdYt4+teXw4
 HX+3Lsvh/tUnu66swbaUJEf3iEzikdlXlrH/m21+aBGkI74L4jL0vHXMlDW2xju7TQ
 qSgqS/SB6NAeJ6q+4V1081PhxiZSp+u2jJAGBT16clcxiZwyFhsilN3AcPaFw3uQOl
 /U3Lqtt3KoGY9ElusVTjM9Ji1vjNy9BzO+uo7E5TbFnGSS0gc/3PaPsgM4L70/AnXp
 acSYOAdCd/x5HGwT2qAZRb1IU7d68EXwD6NGQwfP8HuCcvQadOu/ksUTWE8VfWWXKG
 AY97ayhF9stoQ==
Date: Thu, 5 May 2022 15:39:25 +0100
From: Mark Brown <broonie@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Arnd Bergmann <arnd@kernel.org>, Robert Jarzmik <robert.jarzmik@free.fr>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Arnd Bergmann <arnd@arndb.de>, Daniel Mack <daniel@zonque.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Philipp Zabel <philipp.zabel@gmail.com>, Lubomir Rintel <lkundrak@v3.sk>,
 Paul Parsons <lost.distance@yahoo.com>, Tomas Cech <sleep_walker@suse.com>,
 Sergey Lapin <slapin@ossfans.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 Helge Deller <deller@gmx.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 IDE-ML <linux-ide@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>,
 Linux PM list <linux-pm@vger.kernel.org>,
 "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
 patches@opensource.cirrus.com, linux-leds@vger.kernel.org,
 linux-mmc <linux-mmc@vger.kernel.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 linux-rtc@vger.kernel.org, USB list <linux-usb@vger.kernel.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>
Subject: Re: [PATCH 18/48] ARM: pxa: hx4700: use gpio descriptors for audio
Message-ID: <YnPhna5h1+kQGFLa@sirena.org.uk>
References: <20220419163810.2118169-1-arnd@kernel.org>
 <20220419163810.2118169-19-arnd@kernel.org>
 <CACRpkdac8dGKSEmc-HpgooJefrDtiKK+_A1Mv7AJM8yQV9UY-w@mail.gmail.com>
 <CAK8P3a0w3gFzZoBzyRsi1Ta4prESf8Fp0=quAPSKMnaXvbXNTQ@mail.gmail.com>
 <CACRpkdZNryYkidvdKuT57RM3fz6_X+3oOzF5xaOZd+TyScfUsw@mail.gmail.com>
 <CAK8P3a0y0tVZODpp+GSf0EkMPWbbvMqA-4kNf0NJMc0M2=2WHw@mail.gmail.com>
 <CACRpkdaNRX0RDYJd_uaGo5jtiXu_qGHmEDGniaCmR=TZvcHH8A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACRpkdaNRX0RDYJd_uaGo5jtiXu_qGHmEDGniaCmR=TZvcHH8A@mail.gmail.com>
X-Cookie: Real programs don't eat cache.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220505_073938_510826_6688D362 
X-CRM114-Status: GOOD (  21.86  )
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
Content-Type: multipart/mixed; boundary="===============7474461977412395774=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============7474461977412395774==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cOFcvF3tCFvqoEy/"
Content-Disposition: inline


--cOFcvF3tCFvqoEy/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 05, 2022 at 04:33:06PM +0200, Linus Walleij wrote:
> On Thu, May 5, 2022 at 8:04 AM Arnd Bergmann <arnd@kernel.org> wrote:

> > /* Headphones jack detection DAPM pin */
> > static struct snd_soc_jack_pin hs_jack_pin[] = {
> >         {
> >                 .pin    = "Headphone Jack",
> >                 .mask   = SND_JACK_HEADPHONE,
> >         },
> >         {
> >                 .pin    = "Speaker",
> >                 /* disable speaker when hp jack is inserted */
> >                 .mask   = SND_JACK_HEADPHONE,
> >                 .invert = 1,
> >         },

> Hm some ASoC thingie. No idea what that is, but I suppose another
> place where a subsystem for legacy reasons try to do the gpiolib
> inversion on it's own accord. That one isn't flagged as active low in the
> descriptor so it's fine I guess.

It's saying that when the headphone is inserted the headphone output
should be enabled and the speaker output should be disabled, and vice
versa.

> Possible this should be fixed in ASoC to rely on gpiolib but we can't
> fix the entire world.

I don't think so.

--cOFcvF3tCFvqoEy/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJz4ZwACgkQJNaLcl1U
h9DWzgf+L3LZ6AC+cLFicMlKK60/cMgGMGUBo/mfgAk+G01MppBCzVUBD0sq8yoB
9txZAIQeRSHcBJAs2/cp0Tpn6boCF1wwEkW/cP1ENkWFbTpUHpJPKzOmHOfhghTa
W6pokDB6BExE10l8bgrjirSCGKpy9eLTzWkqpq1cb3h9AnaGWqnCakvf0Y33LB8E
xodrQYiRtjGx7sN+iSb0DKzd1aX8MYFAdWN6MIJ/aengJTm1bHbRANMavfvPerE/
REKky9u/NLWP2TXqYfbQaQNkefLK91ezapwt6UYh1K9FxtBd8UNRkkYnbauU+0qP
XzqnZicyIPtB3pQ7IofAi3yQRgjPew==
=dH+z
-----END PGP SIGNATURE-----

--cOFcvF3tCFvqoEy/--


--===============7474461977412395774==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============7474461977412395774==--

