Received: from mail-lb0-f177.google.com ([209.85.217.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SYHBB-0000IA-Dk
 for linux-mtd@lists.infradead.org; Sat, 26 May 2012 13:37:14 +0000
Received: by lbbgg6 with SMTP id gg6so1552335lbb.36
 for <linux-mtd@lists.infradead.org>; Sat, 26 May 2012 06:37:11 -0700 (PDT)
Message-ID: <1338039428.2525.30.camel@koala>
Subject: Re: To clone NAND from a mobile phone
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "William F." <william76.sh@gmail.com>
Date: Sat, 26 May 2012 16:37:08 +0300
In-Reply-To: <4FBE7347.8000004@gmail.com>
References: <4FBE7347.8000004@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-aAWGICmVMZu2Lm0AUTkB"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-aAWGICmVMZu2Lm0AUTkB
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-05-24 at 14:43 -0300, William F. wrote:
> Hello.
>=20
> Firstly, sorry about my bad english and sorry about any stupid question.
> I need to get a clone (or to do an image) from a embedded NAND into a=20
> Nokia 6267 mobile phone.
>=20
> 1) Do I need "MTD tests support" activated in the kernel, right?
> 2) If I connect the phone through its usb cable will be created=20
> something like /dev/mtd0?
> 3) Can I clone the NAND with mtd-utils?

This is a Symbian phone AFAIK. It does not have linux inside. You
connect it to your PC and it exposes the internal flash as a mass
storage USB device. MTD has nothing to do with this.

--=20
Best Regards,
Artem Bityutskiy

--=-aAWGICmVMZu2Lm0AUTkB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPwNyEAAoJECmIfjd9wqK0mnwQAJSNV6ax5gddunhEzfZzf/K0
DLlBr+CTux6dHR+zRYCTn9NL9KvmPCkK1a8NrcdAhzCEtIkv9QCsAQou4mx8SrfV
sqkYKODO89rtsAOtS6TBUE7CqrQ5eHFpEbZ6DPyV4ROcBv/TZblvhwqJhSouwtzJ
abVLeDYLxw6dPvSaeYscIiv2bpfxwf7kBxC/ZM2KUDk2W2ghpwDhNK4o5nCqgZy8
o3solgJDPFtBzSR7KND/trbytVvNNwyF2vPnX7Je3HDErcUnMa7KRVa/VSNn1SE7
B3xwDgO9urbPk00spnra/Z2Ep0nlYO9snC6nHXUOLd/R1TyvLwnhbmrJPP87vsPy
/uOLIWRO0BiPyq0fpwPCaJu29IIAsaDdWpsctaRGjgrcFtAoj7TmQc/DEb1vfpVG
JhnKNMMmQy6FujGMJ2RTFw4E5/V0LB4wq8wI/EoSbornJkTQ1efceUeLiiUC5kIE
OD7upw6xjxnvqQl+TseGwpDyXvrtjijMMhht2WJL922PW8fOFrLowAgKNB/5ajAV
vICLYFXLQQjwR2hVleeLM8wX+CTPWObE+UUv4QSsTxxueWrImRzdmBaIZUz6sdyF
3zmlHe94Sgv9uEz6SQlGIclM7lvN4YNt55N5lj4GCHWXqqNFI8bvewJ/xW4Bdg9a
/WmJrTyTBX1Uqx2PEvJE
=bRwO
-----END PGP SIGNATURE-----

--=-aAWGICmVMZu2Lm0AUTkB--
