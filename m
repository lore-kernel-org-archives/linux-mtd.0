Received: from mail-bk0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T5EtD-0007jg-0B
 for linux-mtd@lists.infradead.org; Sat, 25 Aug 2012 11:50:55 +0000
Received: by bkcji2 with SMTP id ji2so855961bkc.36
 for <linux-mtd@lists.infradead.org>; Sat, 25 Aug 2012 04:50:53 -0700 (PDT)
Message-ID: <1345895450.1815.5.camel@kyv>
Subject: Re: [PATCH 1/2] mtd: s3c2410: Use devm_* functions
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Sachin Kamat <sachin.kamat@linaro.org>
Date: Sat, 25 Aug 2012 14:50:50 +0300
In-Reply-To: <1345539250-4509-1-git-send-email-sachin.kamat@linaro.org>
References: <1345539250-4509-1-git-send-email-sachin.kamat@linaro.org>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-DzXMBbzNpyEwe87shTaG"
Mime-Version: 1.0
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org, patches@linaro.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-DzXMBbzNpyEwe87shTaG
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-08-21 at 14:24 +0530, Sachin Kamat wrote:
> devm_* functions are device managed functions and make cleanup code
> simpler and smaller.
> devm_kzalloc, devm_clk_get and devm_request_and_ioremap functions
> are used.
>=20
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>

Pushed both to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-DzXMBbzNpyEwe87shTaG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQOLwaAAoJECmIfjd9wqK0E7gQAId+hNqTZXgORB0IHOui9kzO
hwXt5zNF2k94uV13syZ0Ih5IuOyitLXz2EbhZXwHI/DpJY5zMjROxkbz4Z9y0Etk
k8G0W6oeqFfMk607If4pQpVTdfG+LZz4MJ6/OD/PCFM5OPOTwSYfhYOc2dOrXpis
RAm9oDRspmuaAMwylmgATWeYcZz9EEJ5D9OUczs7CoD1tkSaalZsU3yPrekWj14p
wWYRyFa2/jjtjOgt12JJZULHB9Mqd42KtBpOmroZmmfwCXEC8ztmXGIVdx9IV2wq
A0z8TxEk5LPKlRwGEjSmcqHST5ZR4Ngok94Hja5p+iR5Dc4YUmBYTKj26wAYmMhW
3uHNfkUoVuFHnncxOEtzNFmL46yQhK9P7rTtX/q5nteQorCsMP07u2V1bM4RkTHl
08Jz3QpRkpkcNhwl5OXe3WMoLM1wv11URMiI5pxJy16K4LBGWEAQGSpPNvpV8ZxG
xv81G0vPZmtijK8urH/LA4U4SJoKa0ZOjur6rfDMfMmMOlMk/qcn72m575kU+0eF
KYVV0nL8rg/P0R520IYF7Vbntj2rH30jutPWJGVqzKIU75sjJ8zRFlDdY5pFazji
CHfalzoDXG+IqLUHx1BCr+G06FfOvP1EqavtDXhVxSWP/aXgWJ3zNEf+H9HSLeDc
LOwaj1ZZiklXz8P2zcM6
=Pghy
-----END PGP SIGNATURE-----

--=-DzXMBbzNpyEwe87shTaG--
