Received: from co202.xi-lite.net ([149.6.83.202])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UGvo3-0004zf-3w
 for linux-mtd@lists.infradead.org; Sat, 16 Mar 2013 18:26:11 +0000
From: Matthieu Castet <matthieu.castet@parrot.com>
To: David Mosberger-Tang <dmosberger@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Date: Sat, 16 Mar 2013 18:21:52 +0000
Subject: RE : ONFI patch
Message-ID: <C429A122CB68254FACED4BEF16AA357A538A5392AA@OPALE.xi-lite.lan>
References: <CACwUX0OGZivc3pui7Kgo=Y+Tp+dP7UszR_DNN3-pzovo0L7LAg@mail.gmail.com>
In-Reply-To: <CACwUX0OGZivc3pui7Kgo=Y+Tp+dP7UszR_DNN3-pzovo0L7LAg@mail.gmail.com>
Content-Language: fr-FR
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> I would like to propose a patch along the attached to make some of
> the ONFI support routines work on 16-bit devices.  It does the
> following:
>=20
>  *   Always call nand_flash_detect_onfi(), even for known chips.
> Without this, onfi_version stays at 0 and nand_onfi_get_features and
> nand_onfi_set_features will always fail with EINVAL.

Why do you call it for flash we identify as small page ?
On which flash it is not working ?

>  *   For the READID, GET_FEATURES, and SET_FEATURES commands, the
> column address is always 1 byte, regardless of bus-width.

This is ugly.

> I see that the linux-mtd tree has a NAND_BUSWIDTH_AUTO features, but
> I don't see how that's supposed to help for, say,
Did you look at the omap example ?

> nand_onfi-set_features() or nand_onfi_get_features() as
> nand_set_defaults() will eventually set the 16-bit transfer routines
> for 16-bit devices.
If that's a problem of nand_onfi_get/set_features why don't you fix them to=
 use only 8 bits transfert ?

Isn't there a patch already submitted for doing that ?


Matthieu=
