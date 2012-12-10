Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Ti4bg-00048O-Sb
 for linux-mtd@lists.infradead.org; Mon, 10 Dec 2012 14:45:21 +0000
Message-ID: <1355150780.2657.36.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 2/2] mtd: mxc_nand: reorder part_probes to let cmdline
 override other sources
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
To: Lothar =?ISO-8859-1?Q?Wa=DFmann?= <LW@KARO-electronics.de>
Date: Mon, 10 Dec 2012 16:46:20 +0200
In-Reply-To: <1354779748-28869-2-git-send-email-LW@KARO-electronics.de>
References: <1354779748-28869-1-git-send-email-LW@KARO-electronics.de>
 <1354779748-28869-2-git-send-email-LW@KARO-electronics.de>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-iWjINyuuJtmvfRMyGK93"
Mime-Version: 1.0
Cc: David Woodhouse <dwmw2@infradead.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawn.guo@linaro.org>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Reply-To: artem.bityutskiy@linux.intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-iWjINyuuJtmvfRMyGK93
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-12-06 at 08:42 +0100, Lothar Wa=C3=9Fmann wrote:
> The cmdline is the easiest to change source of information. Thus
> let it take precedence over 'RedBoot' and 'ofpart'. This makes the
> mxc_nand driver to be in sync with all other NAND drivers that support
> 'cmdlinepart' partition parsing.

Pushed to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-iWjINyuuJtmvfRMyGK93
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQxfW8AAoJECmIfjd9wqK0W0oP/2gUTNszHHIboFKEuJT/UuDM
3PqsPBMuZk9istkPYrCF1n0tx6OQ07/Sz/UqrATl0iqfqWhlveTqvYVMza0mspJK
0hOMOSJKb4n78acyMv/d8E8GSkNv/5pewdEC6vIn6m+H/AhyFFNETcsxSl8SQC++
XQRtaBFWGgtM3OlzkLUKW2HQMFCAL6J7WmZundC8RspvxKa4ek726wDeY58wrMHU
jLymLdeomHf63pRaQUQiMin8XA6wUotXGJOTs3XdDhshkjCMl59/1UOwUVQ12ozf
4dc14R8mtuF3LoX0afsf82oRTXoJZue6bloiaTqKRfcH5Tg1ZFxrfTRvIXrXAjf1
uzLKLy1eZwIrLdquoT3Jl7F7IAu9D8Trxu4ImqchgFAKzFPJwCvU9OUFZPUEFQhF
6LjC+NglWYGFNJN0+AXPhNE2nE4RuypllvWcA3jf5YTrD7hKxjAadd1STa5+R7BU
Oko+UnOkYrTv74jqpiPNJFQgW2ZfEhndvJoSOuAp6Sjf5OsyOr3+BZNKkWHhiXTk
hqbPjbEiOLQlKOYp5V9Z1/XUh2fM0TsGZpTS0kgJehu1VBLoz+Ou42b63svbpovT
RP9shmoPEk9EfFB7eD/+LiRzLvqFjRJrRkcZTeEAK0PFxw6gEXpBD/+zg5ut4VM1
PpqqrNUBvox7xswyG6XU
=xRcY
-----END PGP SIGNATURE-----

--=-iWjINyuuJtmvfRMyGK93--
