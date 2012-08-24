Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T4sgQ-0003CA-Ba
 for linux-mtd@lists.infradead.org; Fri, 24 Aug 2012 12:08:14 +0000
Message-ID: <1345810383.2848.304.camel@sauron.fi.intel.com>
Subject: Re: Problems after 2nd bootup with NAND and ubifs/ubi
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Jaya Kumar <jayakumar.lkml@gmail.com>
Date: Fri, 24 Aug 2012 15:13:03 +0300
In-Reply-To: <CADqH6Vx_doWcOFP6N8qSV-h+KdZi8cqdxyHCROf-SKFvUiYNhg@mail.gmail.com>
References: <CADqH6Vx_doWcOFP6N8qSV-h+KdZi8cqdxyHCROf-SKFvUiYNhg@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-19eQlb6GwJ5cZdVw1p6Q"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-19eQlb6GwJ5cZdVw1p6Q
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-08-15 at 15:19 +0800, Jaya Kumar wrote:
> b) flash_then_boot_then_replaylogfail.txt
> UBIFS: recovery needed
> UBIFS error (pid 1): replay_log_leb: first log node at LEB 3:0 is not
> CS node
> UBIFS error (pid 1): replay_log_leb: log error detected while
> replaying the log at LEB 3:0

I meant that we fixed 2 bugs with this symptom recently (first log node
at LEB 3:0). But probably you also have some issues in the driver. Those
ECC errors you see and the failing mtd tests mean you need to dig what's
going on on the driver leve.

--=20
Best Regards,
Artem Bityutskiy

--=-19eQlb6GwJ5cZdVw1p6Q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQN2/PAAoJECmIfjd9wqK0Q1wP/RTrRlHiZ+I8+nNt+r1yXnFB
1KnbgUzyUE8yYFTx+5Yx7zvApRA3V9Jg3Y0VHQSjM1+qTaHVlEtkO7G1T0V5m5mh
8iCiS/Mwy/IOHxa2IUoOSaR/La9utewlICz3OtUhWHmFkPhQu0nvAaSyztS7qxRU
gdo4FPlxpGX3/o5gnUUsQFG7ZYHineZAVTlLhppFQxEbfQ+AXzRxq4e8nYLYL/db
pvkZo6aC6GbuKhaloRL717o0Uadj8TrzA31C7nGU9I7m9vTZgHuquDZjEk7rzjuJ
LSWEri3aFKygTKC3qgFnu8HofVD3kVEaNSFwvLOnKkAYNeuq7odtCNsIUj7zE+gv
lqwgzDSnQK6cwoM4+TarJJH9CgxISwF+dShQ4OucGi+WBYkt8Wv85nIUQDlEWTf6
l6buSB7LSdSz/I7cTMPj6WT6lWxBrCVw8fw+4OGSUMbIHo9hURHK0A1z0iw4RTd7
NNIHeStRrU26/dttFlsYAvI5qdlZiHEddVnWHvbCgqFgLgiNI+Zpqm9FnHqr396R
r9BrZTd3bFsSxoDiTkQG56Z9uuVSNO1d2ZQM6V3ajQTzjSNPi5GbV8ieySZ24Vgk
Al1LytXJDKJyv/G2hLQyncfm0mB18W3BCXNbqpgERkfGfG2m3EYs9TnbcJCWr+2B
TEzth4eI0eWsIxG8dzVY
=9LCZ
-----END PGP SIGNATURE-----

--=-19eQlb6GwJ5cZdVw1p6Q--
