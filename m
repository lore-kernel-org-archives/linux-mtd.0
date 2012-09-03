Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T8WfT-0004js-7L
 for linux-mtd@lists.infradead.org; Mon, 03 Sep 2012 13:26:19 +0000
Message-ID: <1346679068.3061.52.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v3 0/6] UBI: add max_beb_per1024 parameter / ioctl
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Richard Genoud <richard.genoud@gmail.com>
Date: Mon, 03 Sep 2012 16:31:08 +0300
In-Reply-To: <CACQ1gAjeNq5zNKzSbO_eeDG7ahhBc9mNvMf_s4RadrWSq-5taQ@mail.gmail.com>
References: <1345478416-23900-1-git-send-email-richard.genoud@gmail.com>
 <1345716615.2848.229.camel@sauron.fi.intel.com>
 <20120823133655.72157b18@pixies.home.jungo.com>
 <1345725030.2848.236.camel@sauron.fi.intel.com>
 <20120823154404.51e31873@pixies.home.jungo.com>
 <1345726686.2848.241.camel@sauron.fi.intel.com>
 <CACQ1gAhs6E5jHGnTy1RhbnuzKq7uAJk0DeHfi0k73jC_8noiAg@mail.gmail.com>
 <CACQ1gAiFQfAbKVRfhjy-K31MJP9YchzxmmCo4FJECoKuudeBtw@mail.gmail.com>
 <1346659239.3061.17.camel@sauron.fi.intel.com>
 <CACQ1gAgxnrLR-NDkiw=QUZ9r6JO30AVwX6MOYX4vV9WXoBaBiA@mail.gmail.com>
 <1346673180.3061.44.camel@sauron.fi.intel.com>
 <CACQ1gAjeNq5zNKzSbO_eeDG7ahhBc9mNvMf_s4RadrWSq-5taQ@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-El3bZimh2jg9YlzSNEZ7"
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


--=-El3bZimh2jg9YlzSNEZ7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-09-03 at 15:14 +0200, Richard Genoud wrote:
> I finally managed to reproduced it on linux-ubi/master + only one
> patch to make my board boot:
> (I thought it needed much more code than that...)

Hmm, you use slob... I guess this is the reason, I do not see issues
with slub. May be there is a bug which is revealed when slob is used?
I'll need to try slob.

--=20
Best Regards,
Artem Bityutskiy

--=-El3bZimh2jg9YlzSNEZ7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQRLEcAAoJECmIfjd9wqK0jLYP/1Nr5a//LChASX7PdAzTVz5J
PpCgETzm+Ekzx3YgngacN0lBCPHN3hNd7bcO9fMx9aoXftcACdmwLsXW/CVXOjkH
rlyZEpkT8A18Ed1W9p4zqeIXssYfZasHmWnD5YCG5ZH+JT0PDC8BBkVeXK227IWy
Ph5+ZAJEVBt6ZlXcs3HePoLpyvlnCxxS9B8pZvJHOdH7FfdhcJYg+BIiYzN3huYG
dpWt8c8oL/UJnyJfDaGJxRaCBj0rtfladfg0ml+nMIGIKESSYUDsMFOxb6RsUYGB
c3RyTN04XLWXyI9QDTH1t9VKEZvE2NgR71nXtqnMmQW/Z7AZFVUd6H7zK/rYTl2T
8Ufq02ewzM8pHqEdj1G3WWNUJgqpsSjLWgi0XcyfOTHViSM8FZyQz4pRsJ0LGHWx
w704diFd1fv6/SRNeMqsugfmY8dybhzooXSVyumpjzwtjXhqIm/m2Ou3BTn02eha
U7QMD4EMlUoMEQxke4xGP7Ra9kZHZHSX0FjwTyIpDWcMbthZWQLmP8yoD68cn10d
pcFvRhQEQ6eXG8uX3Nn4S4DK/Nf4GS38Y05EVox9lylXAut+ExH1nSwXT3pZiS5J
Tn/hzE2CHJ/7/jSgmFssGrtY6lqSYuLIbtnjuHyg4M7GLNKVBhcrg0ckLWO2ZVSa
W1zAAbhmO0YSqzhYtbQz
=aN9v
-----END PGP SIGNATURE-----

--=-El3bZimh2jg9YlzSNEZ7--
