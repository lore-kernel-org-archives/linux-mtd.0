Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SEcIJ-0005AZ-FQ
 for linux-mtd@lists.infradead.org; Mon, 02 Apr 2012 08:07:20 +0000
Message-ID: <1333354231.5440.89.camel@sauron.fi.intel.com>
Subject: Re: [PATCH (mtd-utils)] Makefile: fixup previous 'make clean' fix
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Mon, 02 Apr 2012 11:10:31 +0300
In-Reply-To: <1332979146-8866-1-git-send-email-computersforpeace@gmail.com>
References: <1332979146-8866-1-git-send-email-computersforpeace@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-QKmDP17U+tI4jcDgsTJT"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, Mike Frysinger <vapier.adi@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-QKmDP17U+tI4jcDgsTJT
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-03-28 at 16:59 -0700, Brian Norris wrote:
> Apparently, Makefile comments need to be made without indentation. Otherw=
ise,
> they are printed out as shell commands. This fix prevents seeing this in =
your
> shell during 'make clean':

Pushed to mtd-utils.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-QKmDP17U+tI4jcDgsTJT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPeV73AAoJECmIfjd9wqK0MdUP/0EPdDuVi50i66Lu4AZUo968
9/bpbyFDS43+Pw8JkvYt8A2gVRvss0mn2mu1lVzrWI/kK5f22ICGQ6V0GZQeTH7E
/BAXKqXlRUc/uLvwyexQRspWnR17T09enLFF0cE61yRIyB6D95rzK4L3gGF7dlAR
zc9SPqHyWgGQN5dZoGT4PF8voAdy4McX0OwnTs5lKtFyPsoazTQRaHFgUX+vdRIk
tBHGiZBXvK0wbABGtPY1LdpTRmJdPoSDJtVmNK0uoPR8iYwpc/VZZWW7lRrE+rQO
XMU7Poe9pB60xXpi/DbCQxXF8fBbl5D4rXX41t2FzgBwyYl5z1HH/dYagmwjEtxB
qkhZIKSPO/eEc1rjUgSf1+rirCN7gkYr7j5s5k6m4xAQZsZW4Wjvtze8eFZQVNTQ
wuYih0FmsfbzmAoYC82DB7YMKRpQ13etTJaT2CjOFriH4j7cujeqCWWdQi+4f9/J
xkXa+V2n8O518Hs9MK16mDU0Mc30lN+YdlzjzLlhMex85OJtVmsus9TyF7yC6VOK
E/NeQ82qiom40Na5tN+Hy6wPs/Tus/9Vb4pH85nT/BTiOcISd0tigHjfuUd10zqG
RqfFhsciB1boaJ/OwhBpEP2AeurxHGx+bNNQJBcyHCYxeeOGxgr809lmck3ITwDO
W0eqdF3OoTaSwJrEKqTw
=bpYB
-----END PGP SIGNATURE-----

--=-QKmDP17U+tI4jcDgsTJT--
