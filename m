Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T3O1A-0002Ye-Qc
 for linux-mtd@lists.infradead.org; Mon, 20 Aug 2012 09:11:29 +0000
Message-ID: <1345454169.2848.19.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 7/8] UBI: add ioctl for max_beb_per1024
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Richard Genoud <richard.genoud@gmail.com>
Date: Mon, 20 Aug 2012 12:16:09 +0300
In-Reply-To: <CACQ1gAjm4xUdVYP3jgFnHnDWmaDFC6fGFu7YqnuF9wbRYTMZ2g@mail.gmail.com>
References: <1345214124-5478-1-git-send-email-richard.genoud@gmail.com>
 <1345214124-5478-8-git-send-email-richard.genoud@gmail.com>
 <CACQ1gAjm4xUdVYP3jgFnHnDWmaDFC6fGFu7YqnuF9wbRYTMZ2g@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-JBKpK6oIhaHwho65zGLn"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, Shmulik Ladkani <shmulik.ladkani@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-JBKpK6oIhaHwho65zGLn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-08-20 at 11:05 +0200, Richard Genoud wrote:
> 2012/8/17 Richard Genoud <richard.genoud@gmail.com>:
> > + * The accepted range is 0-255. If 0 is given, the default kernel conf=
ig value
> > + * CONFIG_MTD_UBI_BEB_LIMIT will be used for compatibility.
> >   */
> >  struct ubi_attach_req {
> >         __s32 ubi_num;
> >         __s32 mtd_num;
> >         __s32 vid_hdr_offset;
> > -       __s8 padding[12];
> > +       __u8 max_beb_per1024;
> > +       __s8 padding[11];
> >  };
> >
> So if I use __u16 instead of __u8, what should be the upper limit ?
> 1024 ? (1024 is nonsense, but why not...)

Pick a reasonably large number, e.g., 768.

--=20
Best Regards,
Artem Bityutskiy

--=-JBKpK6oIhaHwho65zGLn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQMgBZAAoJECmIfjd9wqK04g4QAIRHseofn5JvTCFAZhWK/QPo
le1v5ly0r3eo0Dg8kSlh1TcKkjJAE1kqdRlJECvq818PFqDn2TesFs7HUpDafvim
TFTtQH/ijyBf+uJRerhRj5FdiRMfwoZCaGRlJfAKWopl4V4Wt9QIr9MvBT/1pdqV
QqjpovyvWJlkDzWf6phCJ/QXKhQWbtUm9QSauFyhu0yfr7hgAyAlyqZfT4310i7A
ohQ3KoE6MqKZMa8cElnKwWriyplYOapLIL42IalMK8IVB1+b207D5hC1nX2nD32F
81MwMvcoxWC8v2DYUapE7baJff+kekKkbDTcpLjEi22VvsEUhK67UaiI/ilF+vKc
j04pWpt90J2Ucdknr0mHKxTu5UzFcuTb0BxyJYI9MzWR7cVGqnDTQa0Pk7UlGKyf
W/wEW8bHd+m9b5JwGFyCuKhoaL1O8GtJ1DUjZm7nnXBK1/rVai0hArWC3n9HP66Z
+qzMj+wwxYdi0kKAnuFcuNonbbhUg6eBGI+D3yqy/Hs2m+jVqqqOqxxfutcP8j/0
ytT730Yv5BL+RNuFyDrp6syAwAjAoX0rby/Omdwjqbeq7ilc1GwcG1ZhFN6mIYzG
hJ+jSH+Z2zXVX6yaarvhQU5J6URvhjnfSDAA4lvCNWKNf8v7/VCPGnkEUy4OnfxF
rT5oOLUl2VKoQTHZsSHb
=HEA6
-----END PGP SIGNATURE-----

--=-JBKpK6oIhaHwho65zGLn--
