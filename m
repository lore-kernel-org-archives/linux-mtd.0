Received: from yw-out-1718.google.com ([74.125.46.155])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MIiiV-0001DM-GN
	for linux-mtd@lists.infradead.org; Mon, 22 Jun 2009 12:33:50 +0000
Received: by yw-out-1718.google.com with SMTP id 4so1501599ywq.72
	for <linux-mtd@lists.infradead.org>;
	Mon, 22 Jun 2009 05:33:42 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <200906221127.06461.florian@openwrt.org>
References: <200906221127.06461.florian@openwrt.org>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Mon, 22 Jun 2009 08:33:22 -0400
Message-ID: <8bd0f97a0906220533u70305e49ob73238ee59cc6d5f@mail.gmail.com>
Subject: Re: [PATCH] MTD: enable partition parser in the default list when
	selected
To: Florian Fainelli <florian@openwrt.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jun 22, 2009 at 05:27, Florian Fainelli wrote:
> =C2=A0#ifdef CONFIG_MTD_PARTITIONS
> -static const char *part_probe_types[] =3D { "cmdlinepart", "RedBoot", NU=
LL };
> +static const char *part_probe_types[] =3D {
> +#ifdef CONFIG_MTD_CMDLINE_PARTS
> + =C2=A0 =C2=A0 =C2=A0 "cmdlinepart",
> +#elif defined CONFIG_MTD_REDBOOT_PARTS
> + =C2=A0 =C2=A0 =C2=A0 "RedBoot",
> +#elif defined CONFIG_MTD_AR7_PARTS
> + =C2=A0 =C2=A0 =C2=A0 "ar7part",
> +#endif
> + =C2=A0 =C2=A0 =C2=A0 NULL
> +};
> =C2=A0#endif

you just broke systems that have both cmdline and redboot enabled
-mike
