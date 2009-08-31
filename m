Received: from mail-vw0-f193.google.com ([209.85.212.193])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Mi3Hs-0000XO-G7
	for linux-mtd@lists.infradead.org; Mon, 31 Aug 2009 09:35:01 +0000
Received: by vws31 with SMTP id 31so1988472vws.28
	for <linux-mtd@lists.infradead.org>;
	Mon, 31 Aug 2009 02:34:55 -0700 (PDT)
MIME-Version: 1.0
Sender: kyungmin78@gmail.com
In-Reply-To: <A32D4C31541C4D8B9BF6CB4D6EF4B5DC@sisodomain.com>
References: <EF4202CC14044212993EE17E6010D5E7@sisodomain.com>
	<87D6E94B11734CE1A253D9AE203F4192@sisodomain.com>
	<4A94CF0A.6060106@gmail.com>
	<6098B9D32DCD48C387EF96034FFFC55D@sisodomain.com>
	<1251466736.3514.10.camel@localhost>
	<A32D4C31541C4D8B9BF6CB4D6EF4B5DC@sisodomain.com>
Date: Mon, 31 Aug 2009 18:34:54 +0900
Message-ID: <9c9fda240908310234h6cef3afev6a3f6e315321631b@mail.gmail.com>
Subject: Re: [PATCH] [OneNAND] OTP support re-implementation 1/1
From: Kyungmin Park <kmpark@infradead.org>
To: Amul Kumar Saha <amul.saha@samsung.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

@@ -2717,16 +2927,21 @@ static int onenand_otp_walk(struct mtd_info
*mtd, loff_t from, size_t len,
       if (density < ONENAND_DEVICE_DENSITY_512Mb)
               otp_pages =3D 20;
       else
-               otp_pages =3D 10;
+               otp_pages =3D 50;

Is it always 50 pages? Is it right? why I think it's 10. please check
the previous OneNAND spec.
At least the latest OneNAND spec say it's 50. flex or not.

> + =A0 =A0 =A0 /*
> + =A0 =A0 =A0 =A0* Note: OTP lock operation
> + =A0 =A0 =A0 =A0* =A0 =A0 =A0 OTP block : 0xXXFC =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 XX 1111 1100
> + =A0 =A0 =A0 =A0* =A0 =A0 =A0 1st block : 0xXXF3 (If chip support) =A0 X=
X 1111 0011
> + =A0 =A0 =A0 =A0* =A0 =A0 =A0 Both =A0 =A0 =A0: 0xXXF0 (If chip support)=
 =A0 XX 1111 0000
> + =A0 =A0 =A0 =A0*/
> + =A0 =A0 =A0 if (FLEXONENAND(this)) {
> +
> +#ifdef CONFIG_ONENAND_OTP_AREA
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 buf[FLEXONENAND_OTP_LOCK_OFFSET] =3D 0xFC;
> +#elif defined(CONFIG_ONENAND_OTP_BLOCK0)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 buf[FLEXONENAND_OTP_LOCK_OFFSET] =3D 0xF3;
> +#elif defined(CONFIG_ONENAND_OTP_AREA_BLOCK0)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 buf[FLEXONENAND_OTP_LOCK_OFFSET] =3D 0xF0;
> +#endif /* ONENAND_OTP_AREA | ONENAND_OTP_BLOCK0 | ONENAND_OTP_AREA_BLOCK=
0 */
> + =A0 =A0 =A0 } else {
> +
> +#ifdef CONFIG_ONENAND_OTP_AREA
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 buf[ONENAND_OTP_LOCK_OFFSET] =3D 0xFC;
> +#elif defined(CONFIG_ONENAND_OTP_BLOCK0)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 buf[ONENAND_OTP_LOCK_OFFSET] =3D 0xF3;
> +#elif defined(CONFIG_ONENAND_OTP_AREA_BLOCK0)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 buf[ONENAND_OTP_LOCK_OFFSET] =3D 0xF0;
> +#endif /* ONENAND_OTP_AREA | ONENAND_OTP_BLOCK0 | ONENAND_OTP_AREA_BLOCK=
0 */
> + =A0 =A0 =A0 }
> +

it's too much #ifdef, #endif. Introuduce the opt_lock_offset and set
the proper offset based on flex or not.

And the set the buf[otp_lock_offset] =3D proper value.

Thank you,
Kyungmin Park
