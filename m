Received: from mail-iw0-f177.google.com ([209.85.214.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PnpqH-0005TH-7Z
	for linux-mtd@lists.infradead.org; Fri, 11 Feb 2011 10:03:10 +0000
Received: by iwn38 with SMTP id 38so2225841iwn.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 11 Feb 2011 02:03:06 -0800 (PST)
MIME-Version: 1.0
Sender: foxcore@gmail.com
In-Reply-To: <1297418437-23553-1-git-send-email-antony@niisi.msk.ru>
References: <1297418437-23553-1-git-send-email-antony@niisi.msk.ru>
From: Guillaume LECERF <glecerf@gmail.com>
Date: Fri, 11 Feb 2011 11:02:46 +0100
Message-ID: <AANLkTik_KdzX-3CTyE1CxyOauHgd5p75VApuTX7DGZn1@mail.gmail.com>
Subject: Re: [PATCH] mtd: jedec_probe: initialise make sector erase command
	variable
To: Antony Pavlov <antony@niisi.msk.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org, w.sang@pengutronix.de,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello.

2011/2/11 Antony Pavlov <antony@niisi.msk.ru>:
> In the commit 08968041bef437ec363623cd3218c2b083537ada
> =C2=A0(mtd: cfi_cmdset_0002: make sector erase command variable)
> introdused a field sector_erase_cmd. In the same commit initialisation
> of cfi->sector_erase_cmd made in cfi_chip_setup()
> (file drivers/mtd/chips/cfi_probe.c), so the CFI chip has no problem:
>
> ...
> =C2=A0 =C2=A0 =C2=A0 =C2=A0cfi->cfi_mode =3D CFI_MODE_CFI;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0cfi->sector_erase_cmd =3D CMD(0x30);
> ...
>
> But for the JEDEC chips this initialisation is not carried out,
> so the JEDEC chips have sector_erase_cmd =3D=3D 0.
>
> It's not possible symply add the line
> =C2=A0 =C2=A0 =C2=A0 =C2=A0p_cfi->sector_erase_cmd =3D CMD(0x30);
> to the cfi_jedec_setup() function be cause CMD() macros needs
> map and cfi variables. So this patch makes necessary changes.
>
> Signed-off-by: Antony Pavlov <antony@niisi.msk.ru>

Acked-by: Guillaume LECERF <glecerf@gmail.com>

--=20
Guillaume LECERF
GeeXboX developer - www.geexbox.org
