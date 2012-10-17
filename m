Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TOSwn-0006qO-Rl
 for linux-mtd@lists.infradead.org; Wed, 17 Oct 2012 12:42:08 +0000
Message-ID: <1350477742.5769.144.camel@sauron.fi.intel.com>
Subject: Re: [PATCH RESEND] jffs2: Fix lock acquisition order bug in
 jffs2_write_begin
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Thomas Betker <thomas.betker@freenet.de>
Date: Wed, 17 Oct 2012 15:42:22 +0300
In-Reply-To: <507476E7.8030705@freenet.de>
References: <507321E6.1050609@freenet.de> <507476E7.8030705@freenet.de>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-Eltsj7YwxFLtKUjGY0r5"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, thomas.betker@rohde-schwarz.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-Eltsj7YwxFLtKUjGY0r5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-10-09 at 21:11 +0200, Thomas Betker wrote:
> jffs2_write_begin() first acquires the page lock, then f->sem. This cause=
s an AB-BA deadlock with jffs2_garbage_collect_live(), which first acquires=
 f->sem, then the page lock:

This patch does not apply to l2-mtd.git, which is based on 3.7-rc1.

$:~/git/l2-mtd$ git apply --check ~/tmp/thomas.mbox
error: patch failed: fs/jffs2/file.c:138
error: fs/jffs2/file.c: patch does not apply

Could you please wrap commit message lines to 80 characters when you
re-send?

Also, would you please add Cc: stable@vger.kernel.org [vX.Y+], where
vX.Y is the starting version for which this patch is relevant, e.g.,
v3.0.

Thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-Eltsj7YwxFLtKUjGY0r5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQfqeuAAoJECmIfjd9wqK0JpkQALHtwUv7lT8Xb//GRagxk1hQ
b0FAQFe8rbrt2vJW7kmOpxXNvujRVM5lFUkNofF34gEbaBC71Mc3KpXq28vNJGeg
oi4S7u9FaiLl5S14A82oc3N+7f0rB+z9odlobRsQhXOJUL/6VAH4IH3JAsS5FUNX
FBdnbnhaNEWkWFqid/z5NxxbKb2gIVUHCBi3KMXQHxSbBu8lIaWLMo2LR2zIc4DI
BW3QFAxOV0wYX1DsiOY2YxRHObdAewnv/RKwn2TBcF7vURWEp/ZQSZSXP+EiSTTR
bRbxvaQwnRd4JsTttqjZZi7Uax1cUMLS1um16FOIS3JS11I0HIekdyWmfeTmugpp
ztpayuRlrAayxloXz6+eZwbljno0dARHZuRR7bwAujInDtVIoSgvEorXbSWPg09S
Mvhgwh9/2uKgxEcD+LfwAzTcsdHJvxVY2huWKTytep9mq/tqA8jDqxm7R6EMHUem
IgKrkscj4kOkYq58sRhLj17zza9CdhIkYzNyR+o3w9BVmWPMxWpvYd5ZDEH62CCe
CpeLFVjcZxPNhR5uXL+qqatg578UXV2omTr303DhpWN60/uSd/x2vtmGLRcFa7/R
R5CxNL031M3dzz1RtsiUj49u4fsjj4zwj0hRBpLinSqiLZdKz9QfgpQyBdQDkK6r
xQoAvhv4ybRYjt8I528r
=C5GM
-----END PGP SIGNATURE-----

--=-Eltsj7YwxFLtKUjGY0r5--
