Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TGWjX-0005Qv-4o
 for linux-mtd@lists.infradead.org; Tue, 25 Sep 2012 15:07:36 +0000
Message-ID: <1348585657.24309.13.camel@sauron.fi.intel.com>
Subject: Re: [MTD-UTILS 0/3] fix off_t use in lseek
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Richard Genoud <richard.genoud@gmail.com>
Date: Tue, 25 Sep 2012 18:07:37 +0300
In-Reply-To: <1347460715-3951-1-git-send-email-richard.genoud@gmail.com>
References: <1347460715-3951-1-git-send-email-richard.genoud@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-FDa1VjqZMfWVlDF0HZLS"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-FDa1VjqZMfWVlDF0HZLS
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-09-12 at 16:38 +0200, Richard Genoud wrote:
> In lseek call, sometimes off_t is used, sometime u_int32_t or
> off64_t (with lseek64).
> This patchset corrects those inconsistencies in respect with the
> WITHOUT_LARGEFILE compilation option.

Could be a bit nicer (commit messages are not perfect, the second patch
is rather big), but not big deal, pushed to mtd-utils.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-FDa1VjqZMfWVlDF0HZLS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQYci5AAoJECmIfjd9wqK0KHIQAIsjZXU0fdGhe7ENFhLJuI48
pQPVDgdnnv5TqDqvczDYFNJorau3ONeglitfKC7ADaLYMNNBZU6mN4ZE656oGDWG
aOuUEm+8YgNgTQRAWPkJugAGb/mnGkFmWVZWBRvMtLFTwv/re2jwd9ElhbYWlrvX
54R/i9s2O2DEzJ0rrZYBeuba/66ySRBEsyzpTcvyvBnRv5/NYSW08UC2bYfKi5yG
MoOctdF9qv5+Ho2aDevK2uyv3liBf603OySwj6v+aHJSl0MoKkjPO8HUPJ8Ad/kR
pXNY7H6ykUvtQOJAdedZPhrWTCsVDt6nhWVu9IgijDZuIN0JdcOxgn5gtYBKOPCv
wtLcYJHqt9noFBndI3c77qasbQNd7nWb+wMRoelgE3nmjV7VFKdG8FE0oUwRvkaz
rpIeVlrZkX3tjY95HL1z3OoDpWtIc0/Dfn6RRmPtoQ+6buZ+RH1WTGXoV3csgtHk
l+jlXpLiCyTUJqdqJnr7PfzPbhrQKpCZJ/I50AK76hNRwpmYhxU2U0PZiKG2+s1v
tR5OKtRNR/nF23rA5/ubCie97J82XWRMBlDI10wSsAIJFK1ZzPwPTeTTyaxRCSS5
hwMfuvbjhwJygVBzAmocdSrfWH/QnQgEDwKI+XmZb62FQN41Dk7U3pMLx4m95TJz
Y0cj8dbyOKRomoWS5K+7
=tP8j
-----END PGP SIGNATURE-----

--=-FDa1VjqZMfWVlDF0HZLS--
