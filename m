Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0FEEC433F5
	for <linux-mtd@archiver.kernel.org>; Thu,  5 May 2022 15:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HyuJI5Gry7otSr3icv7l91cn6x952wYzg8+FLB1z3Vs=; b=mX/OzNJYdg3g0DRAy5n1kNKt+C
	dUVACwiSqWCalzIqGa+YxTL4OkpAjhgvGI7MCCI0yuOWdqXf1Drcd2i0/Qv4b7Um7+QCirwMusJvE
	gDRRzqblMyeu2SUVGD9qCIxtrGFe771STY1JDd7rFNfItTV5unXto58EcK4oNh2JvszBPwivy6PIW
	NTFEw7bhBrjiLxEKGFKA9O1K39gn0uR0uQ/SMTOG9HobEko/G8qNhYys1X/IyGL+UF53n3ZUu78Mw
	i8pcwPIssoxSuN12KKvT5cRVhaGGFbMigLfc3/3M8X4V/r2pWDD4XQ9ZoRY5lOnuy0IEBNzk9zbKl
	hPgZrErg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmd2B-00GXqA-W9; Thu, 05 May 2022 15:04:52 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmd1l-00GXc3-GS; Thu, 05 May 2022 15:04:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0AE19B82DB0;
 Thu,  5 May 2022 15:04:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F33FC385A8;
 Thu,  5 May 2022 15:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651763061;
 bh=ndNt7BUf9dTGF9Boc0sHL0QvCjcViApZ2+jdoiRYFyE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qsTwJOAmbU9NAcodvY8Up4PoNuEDRZy5qxSFcdI0VmbgNmn3/5x71X8ojXxDFeNvv
 wY4qvOjbwdrz7Yr75u2sbhbjskoI/sZWGz4PEQP/S+I8xtRFCkH1Moav6HaNLEeEMO
 WD9CFgJXtdTh9DLKCtyGpxZcPAVjEnkCl68AjKWpRBt4xYlkTr26FWjmXq6vdFHjfo
 1JagmTiGO1QdyMD0R232U+yffpnEC/3hGsGQpybLdnELbR+ZACe8+oOYvvWsaDz2qx
 oHX9cN4PzhibRt823eQYXukpGaPOEOOiwDBSuJUdGm0u9JKoMHgHhPlLEhO0XHJKCM
 raFIKJWwjP1BA==
Date: Thu, 5 May 2022 16:04:11 +0100
From: Mark Brown <broonie@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
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
Message-ID: <YnPna0pW9csiFkHK@sirena.org.uk>
References: <20220419163810.2118169-1-arnd@kernel.org>
 <20220419163810.2118169-19-arnd@kernel.org>
 <CACRpkdac8dGKSEmc-HpgooJefrDtiKK+_A1Mv7AJM8yQV9UY-w@mail.gmail.com>
 <CAK8P3a0w3gFzZoBzyRsi1Ta4prESf8Fp0=quAPSKMnaXvbXNTQ@mail.gmail.com>
 <CACRpkdZNryYkidvdKuT57RM3fz6_X+3oOzF5xaOZd+TyScfUsw@mail.gmail.com>
 <CAK8P3a0y0tVZODpp+GSf0EkMPWbbvMqA-4kNf0NJMc0M2=2WHw@mail.gmail.com>
 <CACRpkdaNRX0RDYJd_uaGo5jtiXu_qGHmEDGniaCmR=TZvcHH8A@mail.gmail.com>
 <YnPhna5h1+kQGFLa@sirena.org.uk>
 <CAK8P3a2cYUYMKSMo3VOLVTO0=LWc0sHf72Eph8t_es9axo_eeA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAK8P3a2cYUYMKSMo3VOLVTO0=LWc0sHf72Eph8t_es9axo_eeA@mail.gmail.com>
X-Cookie: Real programs don't eat cache.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220505_080425_878870_52982E4E 
X-CRM114-Status: GOOD (  26.26  )
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
Content-Type: multipart/mixed; boundary="===============1825732239600756788=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============1825732239600756788==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZLP2bC8awi6xddl+"
Content-Disposition: inline


--ZLP2bC8awi6xddl+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 05, 2022 at 04:59:35PM +0200, Arnd Bergmann wrote:
> On Thu, May 5, 2022 at 4:39 PM Mark Brown <broonie@kernel.org> wrote:
> > On Thu, May 05, 2022 at 04:33:06PM +0200, Linus Walleij wrote:
> > > On Thu, May 5, 2022 at 8:04 AM Arnd Bergmann <arnd@kernel.org> wrote:

> > > > static struct snd_soc_jack_pin hs_jack_pin[] = {
> > > >         {
> > > >                 .pin    = "Headphone Jack",
> > > >                 .mask   = SND_JACK_HEADPHONE,
> > > >         },
> > > >         {
> > > >                 .pin    = "Speaker",
> > > >                 /* disable speaker when hp jack is inserted */
> > > >                 .mask   = SND_JACK_HEADPHONE,
> > > >                 .invert = 1,
> > > >         },

> > > Hm some ASoC thingie. No idea what that is, but I suppose another
> > > place where a subsystem for legacy reasons try to do the gpiolib
> > > inversion on it's own accord. That one isn't flagged as active low in the
> > > descriptor so it's fine I guess.

> > It's saying that when the headphone is inserted the headphone output
> > should be enabled and the speaker output should be disabled, and vice
> > versa.

> Ok, that sounds like I should remove the flag here if I declare the
> GPIO line as GPIO_ACTIVE_LOW instead of GPIO_ACTIVE_HIGH, right?

If you change the sense of the GPIO you'll need to flip the invert to
the headphone instead of the speaker - whichever way round the GPIO
sense is each of the pins should be taking the opposite sense from the
GPIO state to the other.

--ZLP2bC8awi6xddl+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJz52oACgkQJNaLcl1U
h9CbVgf+IcoNpQ7Zg0fdYkNEqwa7HwKX/Qt0QGkD2AOfzxG/HwCNSJGjXbLRoDSG
LZDrxzKVzeoyjgCVaof252MDqttrmcheVCIAEBBJloJwRZ09bHBdKRPPZhbkgcTz
jtkkGnEzXjRjYMDG6uc2pcooFw43TvoeGlypGRIHfw7iuVsLV9p49OqDnjO4jGer
JBdqJjiSsBVptiZvzaVRbk7kjilcUyKIlQWL83na306uUWq3kMe8gOEw2S5VTvqd
iQ7h7SpGvhyYN6hKCklertmWbnGLlgzT0PXgO8R3thr5L4UiST7AH2vQijgqPoJx
UGG0jN4gSGc0pHUx7zh4kY6kWXN/Sg==
=5RUB
-----END PGP SIGNATURE-----

--ZLP2bC8awi6xddl+--


--===============1825732239600756788==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============1825732239600756788==--

