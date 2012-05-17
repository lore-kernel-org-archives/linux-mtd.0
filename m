Message-ID: <1337255011.2564.2.camel@koala>
Subject: Re: [PATCH v7 3/3] MTD: atmel_nand: Update driver to support
 Programmable Multibit ECC controller
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Josh Wu <josh.wu@atmel.com>
Date: Thu, 17 May 2012 14:43:31 +0300
In-Reply-To: <4FB49C60.5030002@atmel.com>
References: <1337093256-19117-1-git-send-email-josh.wu@atmel.com>
 <1337093256-19117-4-git-send-email-josh.wu@atmel.com>
 <1337160353.24809.26.camel@sauron.fi.intel.com>
 <20403.29677.517067.528042@ipc1.ka-ro>
 <1337161217.24809.38.camel@sauron.fi.intel.com>
 <4FB49C60.5030002@atmel.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-VBMFPqZTTjE/yoxwzVy+"
Mime-Version: 1.0
Cc: hongxu.cn@gmail.com, nicolas.ferre@atmel.com, linux-mtd@lists.infradead.org,
 ivan.djelic@parrot.com, plagnioj@jcrosoft.com,
 linux-arm-kernel@lists.infradead.org,
 Lothar =?ISO-8859-1?Q?Wa=DFmann?= <LW@KARO-electronics.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-VBMFPqZTTjE/yoxwzVy+
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-05-17 at 14:36 +0800, Josh Wu wrote:
> >> message text should not be split across lines anyway to ease grepping
> >> for the message.
> > I think the consensus is that it is personal decision of the author. I
> > am not trying to enforce this and I also split messages. In this case I
> > was only wondering why that backslash is used? I never saw this before
> > in the linux kernel.
> >
>=20
> oh, I add the backslash only because if without it, there should be a=20
> warning about message is splitting into two lines.

Backslash is not needed in C. The preprocessor removes it anyway. We do
not put them.

> Now I think I will just keep the text message in one line. That will=20
> avoid any warnings. thanks.

You can just remove the backslashes. I think your lines splitting is
fine otherwise.

--=20
Best Regards,
Artem Bityutskiy

--=-VBMFPqZTTjE/yoxwzVy+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPtORjAAoJECmIfjd9wqK0+UsP/1W7xaoQ+meymyKCKPeKEiho
Yqgu9wYMRXDxnIcVDoZLHCfWrX/UMYRjruUQHW4XtcsS6Y4/brtQviAl72jW2t+Y
ohDT2orft2hNLaGpL5SExXBl5pkvHEs++W5V8lM+9ZenBxTJBQAPH/wUQChpyaWI
rxk60KuLwoPTm24XBS/xr4AXK9++M5QEbDPYAjaO7KRCHSWxkQ9O2FaQPriN1m+t
F7a6GGQW9TlkfJmQ+SAxAtyDPshIrreEtyCKHf0O3ZQ2c1jZyxxWtZNptB6uzMKL
uZKccxtzoUEHysW7yG4ErTKcOwbcmXmP9XOvbWpN5G1/2djpBdgds2rvnh2nfaAf
7EgB6vfxPA0rU4p6ie/lMPXn++hS6x3m0iDYK9UYN3MTniZpRsgQd3gN7umF0G6i
FDqFHvsmqXXbh4GpgbOuEE33esggfpw41zCybpME8Z7u8d0RB8qUqDnYO3cfcXHF
mqrH0wYQtYShsE1uVIqlVNEoSZHbDlXDBMUp/4FXNlU+6TUYzFrPK70MLjmxgaou
Jvgu3cvVRQSuMrUN1VpkfvElRz6xX1917yhl7SRHlr9gMfDCPWg8BvyAVt1bglEK
zC/oaaYcm/U/90C8+xgt+3Mg6+X8XrPMNZEsRfz2q4tcESPCrkzlbSf5dy08nSXN
YTcQF/IYxqjnpTG2mkg3
=uGNq
-----END PGP SIGNATURE-----

--=-VBMFPqZTTjE/yoxwzVy+--
