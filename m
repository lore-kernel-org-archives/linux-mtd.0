Received: from mail-qy0-f176.google.com ([209.85.221.176])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MVkfs-0000X5-0o
	for linux-mtd@lists.infradead.org; Tue, 28 Jul 2009 11:16:56 +0000
Received: by qyk6 with SMTP id 6so4809570qyk.28
	for <linux-mtd@lists.infradead.org>;
	Tue, 28 Jul 2009 04:16:51 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <ce9ab5790907280413g32c8ac21o74697609e0b805b@mail.gmail.com>
References: <20090728095928.GA26063@mail.gnudd.com>
	<ce9ab5790907280413g32c8ac21o74697609e0b805b@mail.gmail.com>
From: vimal singh <vimal.newwork@gmail.com>
Date: Tue, 28 Jul 2009 16:46:31 +0530
Message-ID: <ce9ab5790907280416m6626cc00see65ad0be27b6f68@mail.gmail.com>
Subject: Re: [PATCH V6] Nand driver for Nomadik 8815 SoC (on NHK8815 board)
To: Alessandro Rubini <ru@gnudd.com>, linux@arm.linux.org.uk,
	linux-mtd@lists.infradead.org, STEricsson_nomadik_linux@list.st.com
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jul 28, 2009 at 4:43 PM, vimal singh<vimal.newwork@gmail.com> wrote=
:
> Sorry to say, but you missed one comment I gave last time:
>
> On Tue, Jul 28, 2009 at 3:29 PM, Alessandro Rubini<ru@gnudd.com> wrote:
>
> ---snip---
>
>> +static inline int parity(int b) /* uses low 8 bits: returns 0 or all-1 =
*/
>> +{
>> + =A0 =A0 =A0 b =3D b ^ (b >> 4);
>> + =A0 =A0 =A0 b =3D b ^ (b >> 2);
>> + =A0 =A0 =A0 return (b ^ (b >> 1)) & 1
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ? ~0 : 0;
>> +}
>
> This function is not in use... please remove it.
>
> ---snip---
>
>> + =A0 =A0 =A0 /*
>> + =A0 =A0 =A0 =A0* This stanza declares ECC_HW but uses soft routines. I=
t's because
>> + =A0 =A0 =A0 =A0* HW claims to make the calculation but not the correct=
ion. However,
>> + =A0 =A0 =A0 =A0* I haven't managed to get the desired data out of it u=
ntil now.
>> + =A0 =A0 =A0 =A0*/
>> + =A0 =A0 =A0 nand->ecc.mode =3D NAND_ECC_SOFT;
>> + =A0 =A0 =A0 nand->ecc.layout =3D &nomadik_ecc_layout;
>> + =A0 =A0 =A0 nand->ecc.hwctl =3D nomadik_ecc_control;
>> + =A0 =A0 =A0 nand->ecc.size =3D 512;
>> + =A0 =A0 =A0 nand->ecc.bytes =3D 3;
>
> As I wrote earlier too, are you aware of that currently 512 byte
> sector ECC will not work without below patch: (since in nand_base.c,
> SW ECC configurations over write the 'ecc.size' by 256)
>
> http://patchwork.ozlabs.org/patch/13697/
>
> As an alternative, if you use 'NAND_SKIP_BBTSCAN' option, moving assignme=
nt:
> =A0 =A0 =A0nand->ecc.size =3D 512;
> after 'nand_scan' is done, will work.
>

Sorry, you already mentioned it... I missed those lines in your mail.

-vimal

>> +
>> + =A0 =A0 =A0 nand->options =3D pdata->options;
>> +
>> + =A0 =A0 =A0 /*
>> + =A0 =A0 =A0 =A0* Scan to find existance of the device
>> + =A0 =A0 =A0 =A0*/
>> + =A0 =A0 =A0 if (nand_scan(&host->mtd, 1)) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -ENXIO;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto err_unmap;
>> + =A0 =A0 =A0 }
>> +
>
