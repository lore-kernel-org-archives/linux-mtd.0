Received: from mail-iy0-f177.google.com ([209.85.210.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RdmyB-0001a7-8Z
 for linux-mtd@lists.infradead.org; Thu, 22 Dec 2011 18:02:20 +0000
Received: by iadk27 with SMTP id k27so14834826iad.36
 for <linux-mtd@lists.infradead.org>; Thu, 22 Dec 2011 10:02:18 -0800 (PST)
Message-ID: <1324577032.1165.15.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 1/2] MTD: pass driver methods through partition wrappers
 on unpartitioned devices
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Dunn <mikedunn@newsguy.com>
Date: Thu, 22 Dec 2011 20:03:52 +0200
In-Reply-To: <1324559149.10300.93.camel@sauron.fi.intel.com>
References: <1324406536-18250-1-git-send-email-mikedunn@newsguy.com>
 <1324406536-18250-2-git-send-email-mikedunn@newsguy.com>
 <1324559149.10300.93.camel@sauron.fi.intel.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-Ztjoq4G2qhtgA5s816Ln"
Mime-Version: 1.0
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Scott Branden <sbranden@broadcom.com>,
 Wan ZongShun <mcuos.com@gmail.com>,
 Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Manuel Lauss <manuel.lauss@googlemail.com>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, linux-mtd@lists.infradead.org,
 Ralf Baechle <ralf@linux-mips.org>, Jiandong Zheng <jdzheng@broadcom.com>,
 Andres Salomon <dilinger@queued.net>, Olof Johansson <olof@lixom.net>,
 Jamie Iles <jamie@jamieiles.com>, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Vimal Singh <vimal.newwork@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-Ztjoq4G2qhtgA5s816Ln
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2011-12-22 at 15:05 +0200, Artem Bityutskiy wrote:
> 1. Rework whole MTD interface from ->read()/->write()/etc (pointers to
> functions) to mtd_read(mtd, ...)/mtd_write(mtd, ...)/etc.

I will send a patch-set for this change tomorrow.

> 2. In the new functions you may do the stuff you do at patch 2.

Then you will be able to do this change easily.

--=20
Best Regards,
Artem Bityutskiy

--=-Ztjoq4G2qhtgA5s816Ln
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJO83EIAAoJECmIfjd9wqK0X10QALXJqtKwiWe09MrhFSIRxbkm
bKuSOilxcsIMBqXJ4QBwbe+iiZhplvaCMXhavSYqwj5iwGhF4qpnfZbmOCsqDpe3
Lf7zEoZ15GismV3w2f7iiOZX8Wcp1n28q6fak+/LMtgEuksvNUI/idxaIG+ULlka
SGf3StoxN19DehU/aSjMewtGd+1v+OImhBe/r68f2Es7DuEujhRKFOu6hyowlhXU
mvarbwsNsQFpyND9oDwAjz8raodPKghX78smYRG05N94hBdZZm/PEEnP+Af6Z/iH
0K/9tQU0ZeecDxExFydxkJv8YHrdKyL9g2Qq9UOT93pk9zaHnk+p63riU6jlaLEk
lml9kfnRDqIxPUyMP+XXgQDbaLcjfXpX/mxp6unWRi7l+UGWfSHfbkK4nylz5GuL
Tl0PulcZ1+tb2BUBZliDzRW/U1qcS69MuOFVLMUkfP/zQNpWWeeJPJ1qVJcjPslF
SgBwwyvAQuQsXl799Cv65pt+TGG3nMnDHxMdmbyzpZrXwRWtgeWCoyjt7DqAtSTU
aM5hkBgMHhV+6tBBCKUIOFxYIMtxaOhUibLP3zmf8eCQES+RKQcC2zoPZanNI5Ja
zQya8HGemPB8Rdz66Wvr7aGGRavHxJktLg7z/YZSYFUnEVHlaxyyFSRbM7PhrCAj
GL5WwYDzk+m/Zl6twoyZ
=W+zW
-----END PGP SIGNATURE-----

--=-Ztjoq4G2qhtgA5s816Ln--
