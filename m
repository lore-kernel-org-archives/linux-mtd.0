Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: RE: [PATCH V4 2/4] MTD : add the common code for GPMI controller
	driver
Date: Tue, 12 Apr 2011 14:03:06 +0300
Message-ID: <E550E0E66149EE438CE65645D99717D601670B0E@darkblue.bgt.local>
In-Reply-To: <1301722240-15406-3-git-send-email-b32955@freescale.com>
References: <1301722240-15406-1-git-send-email-b32955@freescale.com>
	<1301722240-15406-3-git-send-email-b32955@freescale.com>
From: "Veli-Pekka Peltola" <veli-pekka.peltola@bluegiga.com>
To: "Huang Shijie" <b32955@freescale.com>
Cc: linux@arm.linux.org.uk, David.Woodhouse@intel.com, dedekind1@gmail.com,
	linux-mtd@lists.infradead.org, ffainelli@freebox.fr,
	shijie8@gmail.com, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I have one correction to your NAND driver. Please see inlined comments.

> These files contain the common code for the GPMI driver.
>=20
> Signed-off-by: Huang Shijie <b32955@freescale.com>
> ---
>  drivers/mtd/nand/gpmi-nfc/gpmi-nfc-main.c | 2453
> +++++++++++++++++++++++++++++
>  drivers/mtd/nand/gpmi-nfc/gpmi-nfc.h      |  551 +++++++
>  2 files changed, 3004 insertions(+), 0 deletions(-)
>  create mode 100644 drivers/mtd/nand/gpmi-nfc/gpmi-nfc-main.c
>  create mode 100644 drivers/mtd/nand/gpmi-nfc/gpmi-nfc.h
>=20
> diff --git a/drivers/mtd/nand/gpmi-nfc/gpmi-nfc-main.c
> b/drivers/mtd/nand/gpmi-nfc/gpmi-nfc-main.c
> new file mode 100644
> index 0000000..7bbc448
> --- /dev/null
> +++ b/drivers/mtd/nand/gpmi-nfc/gpmi-nfc-main.c
> @@ -0,0 +1,2453 @@

<snip>

> +#ifdef CONFIG_PM
> +static int gpmi_nfc_suspend(struct platform_device *pdev,
pm_message_t
> state)
> +{
> +	return 0;
> +}
> +
> +static int gpmi_nfc_resume(struct platform_device *pdev)
> +{
> +	return 0;
> +}
> +#else
> +#define suspend  NULL
> +#define resume   NULL
> +#endif

If CONFIG_PM is disabled your defines don't match function names.

<snip>

> +/* This structure represents this driver to the platform management
> system. */
> +static struct platform_driver gpmi_nfc_driver =3D {
> +	.driver =3D {
> +		.name =3D GPMI_NFC_DRIVER_NAME,
> +	},
> +	.probe   =3D gpmi_nfc_probe,
> +	.remove  =3D __exit_p(gpmi_nfc_remove),
> +	.suspend =3D gpmi_nfc_suspend,
> +	.resume  =3D gpmi_nfc_resume,
> +	.id_table =3D gpmi_ids,
> +};

This section fails to compile as gpmi_nfc_suspend and gpmi_nfc_resume
are undefined. It compiles fine if I add gpmi_nfc_ prefix to defines.

--
Veli-Pekka Peltola
R&D Engineer
Bluegiga Technologies=20
