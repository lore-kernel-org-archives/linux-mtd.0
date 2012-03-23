Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SB4gJ-00085v-V5
 for linux-mtd@lists.infradead.org; Fri, 23 Mar 2012 13:37:32 +0000
Message-ID: <1332510021.18717.65.camel@sauron.fi.intel.com>
Subject: [GIT PULL] UBIFS changes for v3.4-rc1
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 23 Mar 2012 15:40:21 +0200
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-fZxxZobLAgTud4SoK1xf"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-fZxxZobLAgTud4SoK1xf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Linus,

The following changes since commit 6b21d18ed50c7d145220b0724ea7f2613abf0f95=
:

  Linux 3.3-rc5 (2012-02-25 12:18:16 -0800)

are available in the git repository at:

  git://git.infradead.org/linux-ubifs.git tags/upstream-3.4-rc1

for you to fetch changes up to 5a1f36c90c9b21a7aa31c29a1926b376dd6a11cf:

  UBIFS: improve error messages (2012-03-07 17:13:23 +0200)

----------------------------------------------------------------
- Improve error messages
- Clean-up i_nlink management
- Minor clean-ups

----------------------------------------------------------------
Artem Bityutskiy (6):
      UBIFS: amend recovery debugging message
      UBIFS: increase dumps loglevel
      UBIFS: make the dbg_lock spinlock static
      UBIFS: do not use inc_link when i_nlink is zero
      UBIFS: kill CUR_MAX_KEY_LEN macro
      UBIFS: improve error messages

 fs/ubifs/debug.c    |  410 +++++++++++++++++++++++++----------------------=
---
 fs/ubifs/debug.h    |    3 -
 fs/ubifs/dir.c      |   18 +-
 fs/ubifs/recovery.c |    3 +-
 fs/ubifs/sb.c       |   19 ++-
 fs/ubifs/ubifs.h    |   11 +-
 6 files changed, 234 insertions(+), 230 deletions(-)

--=20
Best Regards,
Artem Bityutskiy

--=-fZxxZobLAgTud4SoK1xf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPbH1FAAoJECmIfjd9wqK0rEcQAIPT4IYi2/+1nd0qW0rcoIZA
5nN8xAUUUtPJ2khzM/V6TyNrOerfwJL2Lz5MeUVmbnKGlG/BtblP7NYNgHEKlio5
lcsSk/01j4HOBPBNY4uo+L23uwgTSp6TkdHV1TSvECOV7o3AojWZGAWuihlgnsXO
1ow0EU05ssRc8ldgl0iCN7H6CdWa3B0Jopjf5IIzlHk8AFhUOYq0jGfAUWknNyq+
Nne/b9CoRscjIN/k1YXPlxwemUnOZ85LRHTXD5JMGrSLWkdx/L6P7fq5QlPu48qE
V+K7IdfP0aVCjA5YcUIE7vS5vAzoa2MWc/WjL1hSH/vpa4zJ14YLvL0ZPtRwCnyz
41n8YyDcV2M9cC9ytWXG6+IOtOs3xdH36dNxfzcax0xj0KevYqds/9PYCAV3WPJb
eFm60dy2y94VvtrJtw+Sr9zH27uFyC32kHzReR7FwbukV917+8I3TTqoUjHnCuZR
PoL15sMbsesHZ0Bb1zlDFsZNxlljmBwniuHzjRfEN7M34BNeuSju1/eWRIgqEW5D
jYGf4dU1Ll7oT60Z8NzbG3MxqpBHAqneeNhJ59mlm6C2gi54f2q5jhsXx4Nb8Oer
VfR66uKW2Tzc0RcUWwDA4UNFSn3IM5jXTRoBKc0n3ySac9ljNa/dlwvfKfSm8pxi
gJV2u4r09ZuskG3wovyA
=nTo9
-----END PGP SIGNATURE-----

--=-fZxxZobLAgTud4SoK1xf--
