Received: from mail-ot0-x242.google.com ([2607:f8b0:4003:c0f::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ciSc3-0004sU-0m
 for linux-mtd@lists.infradead.org; Mon, 27 Feb 2017 21:13:52 +0000
Received: by mail-ot0-x242.google.com with SMTP id i1so3115049ota.3
 for <linux-mtd@lists.infradead.org>; Mon, 27 Feb 2017 13:13:22 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1488227292-18906-4-git-send-email-albeu@free.fr>
References: <1488227292-18906-1-git-send-email-albeu@free.fr>
 <1488227292-18906-4-git-send-email-albeu@free.fr>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Date: Mon, 27 Feb 2017 22:13:21 +0100
Message-ID: <CACna6rzZ-UiJR8oBJ9oHE+ZNT=nm6oLiKyW4bsiZ34TMRDh5Xw@mail.gmail.com>
Subject: Re: [PATCH 3/3] ath9k: ahb: Add OF support
To: Alban <albeu@free.fr>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Why you didn't cc linux-wireless?!?!

On 27 February 2017 at 21:28, Alban <albeu@free.fr> wrote:
> @@ -513,6 +515,43 @@ static void ath9k_eeprom_release(struct ath_softc *sc)
>         release_firmware(sc->sc_ah->eeprom_blob);
>  }
>
> +#ifdef CONFIG_OF
> +static int ath9k_init_of(struct ath_softc *sc)
> +{
> +       struct device_node *np = sc->dev->of_node;
> +       struct ath_hw *ah = sc->sc_ah;
> +       const void *macaddr;
> +       struct clk *clk;
> +       int ret = 0;
> +
> +       if (!np) {
> +               dev_err(sc->dev, "no platform data or OF node\n");
> +               return -EINVAL;
> +       }
> +
> +       clk = clk_get(sc->dev, "ref");
> +       if (!IS_ERR(clk)) {
> +               ah->is_clk_25mhz = (clk_get_rate(clk) == 25000000);
> +               clk_put(clk);
> +       }
> +
> +       ah->disable_2ghz = of_property_read_bool(np, "qca,disable-2ghz");
> +       ah->disable_5ghz = of_property_read_bool(np, "qca,disable-5ghz");

Please use ieee80211-freq-limit:
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=b330b25eaabda00d74e47566d9200907da381896

Most likely with the wiphy_read_of_freq_limits helper:
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=e691ac2f75b69bee743f0370d79454ba4429b17

Example:
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=0f83ff69735651cc7a3d150466a5257ff829b62b
