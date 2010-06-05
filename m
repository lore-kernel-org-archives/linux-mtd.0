MIME-Version: 1.0
In-Reply-To: <AANLkTilydl5oKETCC69C_QY6xJa3mIXve097JU6qevfp@mail.gmail.com>
References: <4C09F15E.9020408@gmail.com>
	<AANLkTinLfGD-x-861sFK9r2zW5aEZvyXIB4PFKJl8NDZ@mail.gmail.com>
	<AANLkTikJiPjl3LKVqgqtlK2YEePXDf7K6EdOlUE4uzBb@mail.gmail.com>
	<AANLkTilydl5oKETCC69C_QY6xJa3mIXve097JU6qevfp@mail.gmail.com>
From: Eric Miao <eric.y.miao@gmail.com>
Date: Sat, 5 Jun 2010 15:59:56 +0800
Message-ID: <AANLkTile8PqagLri8n1Y0Xn03e8STx7XQODUx83woYNE@mail.gmail.com>
Subject: Re: [PATCH 1/3] MTD/pxa: patch for error return value method of
	pxa2xx-flash.c
To: Wan ZongShun <mcuos.com@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Jun 5, 2010 at 3:53 PM, Wan ZongShun <mcuos.com@gmail.com> wrote:
> Hi Eric,
>
> This following piece of code:
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!info->map.virt) {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0printk(KERN_WARNIN=
G "Failed to ioremap %s\n",
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 info->map.name);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D -ENOMEM;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto fail2;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>
> Shouldn't =C2=A0the 'KERN_ERR' in stead of the 'KERN_WARNING '?
> Because the =C2=A0'info->map.virt =3D=3D NULL' can arouse the serious cra=
sh.
>

The thing is you need to figure out if it is mandatory because we
have another info->map.cached just in case. Disaster is both can
not be mapped.
