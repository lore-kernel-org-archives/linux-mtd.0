Received: from mail-iy0-f177.google.com ([209.85.210.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S2hmF-0006ny-4y
 for linux-mtd@lists.infradead.org; Wed, 29 Feb 2012 11:32:59 +0000
Received: by iaky10 with SMTP id y10so8389494iak.36
 for <linux-mtd@lists.infradead.org>; Wed, 29 Feb 2012 03:32:58 -0800 (PST)
Message-ID: <1330515322.3545.99.camel@sauron.fi.intel.com>
Subject: Re: [RFC][PATCH 0/7] UBI checkpointing support
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Richard Weinberger <rw@linutronix.de>
Date: Wed, 29 Feb 2012 13:35:22 +0200
In-Reply-To: <1329250006-22944-1-git-send-email-rw@linutronix.de>
References: <1329250006-22944-1-git-send-email-rw@linutronix.de>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-DVUi3Z9fm01y1yUIqiZO"
Mime-Version: 1.0
Cc: tglx@linutronix.de, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, tim.bird@am.sony.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-DVUi3Z9fm01y1yUIqiZO
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-02-14 at 21:06 +0100, Richard Weinberger wrote:
> The following patch set implements checkpointing support for
> UBI. Checkpointing is an optional feature which stores the physical to
> logical eraseblock relations in a checkpointing superblock to reduce
> the initialization time of UBI. The current init time of UBI is
> proportional to the number of physical erase blocks on the FLASH
> device. With checkpointing enabled the scan time is limited to a fixed
> number of blocks.

Notice, your patch-set has huge amount of checkpatch.pl complaints -
please fix them. This will also be consistent with the overall UBI
coding style where I honored checkpatch.pl limitations like identation
style and 80 chars per line.


--=20
Best Regards,
Artem Bityutskiy

--=-DVUi3Z9fm01y1yUIqiZO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPTg16AAoJECmIfjd9wqK0lR0P/2cptfpDgeVPBtkcmSAmV1eX
dxNSLbIGoareryN8whU2jWLnbXt/xqiKYNFDRXlQnUS6Lndk44qMa0xT7mUTvlqN
6AXHUYxMrkhPeiDzh9/L4Lpdp5kTx9EHgqhMQhGglvSoB8HJy3TKqtxS1AbhZ9hi
HyI0mk94VNXkya/nZ88vNhIYQ9vH4khzbRwGemHJ7XK107XQU5tFfOmiQr5tlDx8
sYKpRvB7rA3/EMz6ylETDqdZWzDmRRLX+qcP0fnSY8zXfIhh1QIIsREjJ0NRxFvz
uAWbnGloy6GBbzHDu8oz8GmSKei+wu8730Onx/EH/YkUbYYuc3aX8YadhOekgBUb
T6KWvtSph5TBO4AnX+76TmvjNw/hEA105F0XP2Iz84y1xlpjJLr2jwvSf6qDZpvv
hlu591ET2awlUolLs489jHoUeXQ2oxjsTM2tY6BSVcohIvlwRV+km4VTvMa8vti4
R+7ON7j3jVYvFQGhpAWPxPdtI146dt6nLP87ZlK3FZhTZV+C+1XTBPXwNZt609T3
MlWBMlGhG00YujgDD0Gh5z9G26qkVpatSTiJsKzZ47DvFjVFvGwio/4lIOsCmODo
/fx5rh/3ngsHHmQtVgsEDHt1u6VEW3ihRRErB0gT2vg/cjPUR0EKmz2wi9HZZp2w
eInvuE+Sgy0SnUtQcwsa
=NuyQ
-----END PGP SIGNATURE-----

--=-DVUi3Z9fm01y1yUIqiZO--
