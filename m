Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SRRLV-0007w5-2p
 for linux-mtd@lists.infradead.org; Mon, 07 May 2012 17:03:37 +0000
Message-ID: <1336410416.13940.29.camel@sauron.fi.intel.com>
Subject: Re: Why kernel tasks for each MTD partition?
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Thilo Fromm <fromm@dresearch-fe.de>
Date: Mon, 07 May 2012 20:06:56 +0300
In-Reply-To: <CADZ6=asqEUUe3zbZY+NE-Ew2e4Cymfnq+UqgmF2VHesBek3-XQ@mail.gmail.com>
References: <CADZ6=asqEUUe3zbZY+NE-Ew2e4Cymfnq+UqgmF2VHesBek3-XQ@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-8WjHO0t7eLJDgtMOgLJ/"
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


--=-8WjHO0t7eLJDgtMOgLJ/
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-05-07 at 18:55 +0200, Thilo Fromm wrote:
> Hello *.*,
>=20
> while playing around with mtdblock and blockrom (see my other mail[1])
> I noticed that a separate kernel process is active for each "mtdblock"
> partition (e.g. ps shows "[mtdblock0]", "[mtdblock1]" kernel processes
> if you have two MTD partitions and you use mtdblock). These also exist
> for my blockrom device nodes. Since I see comparable processes for all
> storage on my Linux workstation I suppose the Linux storage stack runs
> these. Can somebody please fill me in on what they are?

I guess this is related to the general linux design - every block device
has to have an I/O queue - and I think each process represent such a
queue in this case. I am not 100% sure it is the sanest setup for
mtdblock, may be yes, may be not, needs thinking.

But in general note, mtdblock stuff needs a lot of love.

--=20
Best Regards,
Artem Bityutskiy

--=-8WjHO0t7eLJDgtMOgLJ/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPqAEwAAoJECmIfjd9wqK0KL4P/R6AD+Z4DImOCXFwByHlc8N4
+2E60hMc3Gqp6J7mTMKUMYL0s0n7boc/WY9uqs3C5po9zoIQ0iGdt6moJck9Oa2p
9922SeVpxGm4z988U60ty6ME2wNQeM+Wev4Kb9A4URLLnBuVhEwZlQQoK7Ca3kYz
DWAfMEoWo6kSbPHNA1NeNmOmXug4BPjTRN4xxJl7Z+iH6rMPPPEMDQ0eQBrixBLD
ca9xzc/Syu/jPwUMmdsM9ZiJtWgJ9VEqB5Kjp3QYUBLWsIUX+PNYh+IQYlj/HCbZ
2HpyfjoO2wZ+Lo88n2d9cIhYiinYwQetM23BkEBlEWpTsRshbipd1BnYNyRQOXN0
HZ1VSTq7pPMV+oCq0O+X/Wnwdw0mDua+cLD5Lt32aQA+M2DlSgtdsa1qlTQpIeJA
s84kePO8J+Te+71jfPOoi+TBpPsimLIw5Wn2a2s5/eiAu4P858Lg8kvtKlkP/gVp
6QALn4VX242WpG7C/Q+nnhd+5RmS+FE61fgJ/ebeFpt8ejBYxtxCZkkmi8hLZY7D
asG3cOx7g0+iOF2ZxoqO1/YsLVAUibbvtSYUos0SQAr7m6Axw1x6rSVNS9DVDh0D
SCUO4Fvfy/KuX93QNJVFS07BFjvy/L5NXFBumo+3T4ZGhcql5ORcAQuLYWdZSbGL
8Y0SyeohRsfpZSrTcLbF
=Ei5t
-----END PGP SIGNATURE-----

--=-8WjHO0t7eLJDgtMOgLJ/--
