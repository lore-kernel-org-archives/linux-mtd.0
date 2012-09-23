Message-ID: <1348404075.1889.1.camel@kyv>
Subject: Re: [PATCH v2] mtd: atmel_nand: fix the compile error which miss
 label "err_ecc_ioremap".
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Josh Wu <josh.wu@atmel.com>
Date: Sun, 23 Sep 2012 15:41:15 +0300
In-Reply-To: <1347347412-24214-1-git-send-email-josh.wu@atmel.com>
References: <1347347412-24214-1-git-send-email-josh.wu@atmel.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-1n4IEf4tV+VRKB8O5dJ8"
Mime-Version: 1.0
Cc: vikram186@gmail.com, plagnioj@jcrosoft.com, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, nicolas.ferre@atmel.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-1n4IEf4tV+VRKB8O5dJ8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-09-11 at 15:10 +0800, Josh Wu wrote:
> Add err_ecc_ioremap label to fix following errors:
> ---8<---=20
>   CC      drivers/mtd/nand/atmel_nand.o
> drivers/mtd/nand/atmel_nand.c: In function 'atmel_nand_probe':
> drivers/mtd/nand/atmel_nand.c:1423: error: label 'err_ecc_ioremap' used b=
ut not defined
> make[3]: *** [drivers/mtd/nand/atmel_nand.o] Error 1
> make[2]: *** [drivers/mtd/nand] Error 2
> make[1]: *** [drivers/mtd] Error 2
> make: *** [drivers] Error 2
> --->8---

Pushed to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-1n4IEf4tV+VRKB8O5dJ8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQXwNrAAoJECmIfjd9wqK0CcsQAMV6kaH/qjJSwtw6j+H16LT7
mv4wApqoaTRLSBiyxBC4H4uTBHoh3Q3k9AKqZObF7/S/80M9MlSy4apkYHp/gz6i
S7CYfPX3i+GEy7mIUZjAuXP6owRAGDdBLVWfrQjw8F1tNWcjhEidFIBcQWbn3c/B
f8tZVcr9ih+f/bYqUVVLc5hCtXtnpBQ8sqXE+T+TxdQaOaPt+ac6Of8Hozdq3cs7
n3kQ3SAQvlS5+FBDOjW49yCGacT8bSNAgTvB7lTxNoAHxXmiT8ZHck+Zv9fjOI3C
qrmCS9sZPp97HUBdj1aTyHC7xEw2lbA61NAcHipsxHToN/EKu7Gm6Igwl858teSy
saTAd/J6kzbldgUflQUNsE9WzltVBwmHyBATt/NHJHlw5zlDcaInoJeUfN70J+p2
KJrxr549NblAJlTHzOAO8LdHB0HWtH2ETd/E0lhrJyCrPQkhwwMkGO3EDdQSxKCb
EPWtXLnpQOOdjh0hIy64h17setgmgqgozPIVFv4GGBO5xTYKLUeOiEuE24Odp2WH
6GyZKYC0ap7Dai574bqIRlifoiSr9x6oBdAodEG0EYBs6es/9fs/pVSlh/HQE4nh
Mjw8XNrjL9GRLbXERaxv5FUfUo8XcfSiMi/oOYzq9siKFSivR1TZedkx3tDZAdDp
/M4qfI8RkNiE11tCCZYA
=9DQd
-----END PGP SIGNATURE-----

--=-1n4IEf4tV+VRKB8O5dJ8--
