Received: from mail-yi0-f49.google.com ([209.85.218.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QmE8N-000415-FQ
	for linux-mtd@lists.infradead.org; Thu, 28 Jul 2011 00:07:27 +0000
Received: by yib17 with SMTP id 17so1700339yib.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 27 Jul 2011 17:07:25 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1311775410-5158-1-git-send-email-jamie@jamieiles.com>
References: <1311775410-5158-1-git-send-email-jamie@jamieiles.com>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Wed, 27 Jul 2011 17:07:05 -0700
Message-ID: <CAMjpGUdPaAi=8ktisse0W_qWWPvaPXyCf9RgKAV02YzD7cn1aA@mail.gmail.com>
Subject: Re: [PATCH] mtd: gpio-nand: add device tree bindings
To: Jamie Iles <jamie@jamieiles.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: David Woodhouse <dwmw2@infradead.org>, devicetree-discuss@lists.ozlabs.org,
	linux-mtd@lists.infradead.org,
	Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jul 27, 2011 at 07:03, Jamie Iles wrote:
> --- a/drivers/mtd/nand/gpio.c
> +++ b/drivers/mtd/nand/gpio.c
>
> +static const struct of_device_id gpio_nand_id_table[] =3D {
> + =C2=A0 =C2=A0 =C2=A0 { .compatible =3D "gpio-nand" },
> + =C2=A0 =C2=A0 =C2=A0 {}
> +};
> +MODULE_DEVICE_TABLE(of, gpio_nand_id_table);

all this new logic is missing CONFIG_OF ifdef protection for all the
ports not using device trees
-mike
