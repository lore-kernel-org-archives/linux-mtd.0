Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aBgmq-00069q-FQ
 for linux-mtd@lists.infradead.org; Wed, 23 Dec 2015 10:36:53 +0000
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
From: Richard Weinberger <richard@nod.at>
Subject: [GIT PULL] UBI fixes for 4.4-rc
Message-ID: <567A7922.8030405@nod.at>
Date: Wed, 23 Dec 2015 11:36:18 +0100
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="BtaMJBMqiJab6IsUcHTKb9fCnQNQA8V9q"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--BtaMJBMqiJab6IsUcHTKb9fCnQNQA8V9q
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Linus,

the following changes since commit 9f9499ae8e6415cefc4fe0a96ad0e27864353c=
89:

  Linux 4.4-rc5 (2015-12-13 17:42:58 -0800)

are available in the git repository at:

  git://git.infradead.org/linux-ubifs.git tags/upstream-4.4-rc7

for you to fetch changes up to 6b238de189f69dc77d660d4cce62eed15547f4c3:

  mtd: ubi: don't leak e if schedule_erase() fails (2015-12-16 22:59:03 +=
0100)

----------------------------------------------------------------
This pull request contains four bug fixes for UBI.

----------------------------------------------------------------
Brian Norris (1):
      UBI: fix use of "VID" vs. "EC" in header self-check

Sebastian Siewior (2):
      mtd: ubi: fixup error correction in do_sync_erase()
      mtd: ubi: don't leak e if schedule_erase() fails

Sudip Mukherjee (1):
      UBI: fix return error code

 drivers/mtd/ubi/debug.c |  2 +-
 drivers/mtd/ubi/io.c    |  2 +-
 drivers/mtd/ubi/wl.c    | 53 +++++++++++++++++++++++++++----------------=
------
 3 files changed, 31 insertions(+), 26 deletions(-)


--BtaMJBMqiJab6IsUcHTKb9fCnQNQA8V9q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJWenkoAAoJEPmeIjfg4UaaaEQP/i3THOpKaLVKE5hpqjD2SYOk
3IiAWeE8pppucs8qIe7XqdB/i54DPoaipaK1E81SHBU7Dr0NAZtakwzwCGLar4e7
QkuUCqgCMPSYzYc3UQCu5xEvc8pxfGi3RCeOWRYdfxcPaz12N0FNrZAVvbNppulO
GupPPvKejypaZbX1x0rS3DHxPC2lnIPuvpBWWkqpblWzyg2wsG1CsFpGu8SXE7Da
nXLH3stagOQ3xvs3NqoS94rNawtH67oB75Sy9wPfqj1BQiGFm/my14msnuMrSvY6
kcDm7nWZrDex1VrvuVtFqMaxWs9zTgCFxqOQMxfRH8y1KobPX/xvv4q3AunUF3Ci
9RBm7GdlEiORH/CZ1p1lXkBXML/BfyD9jgriPib3bRZQ+k9zclqVyKfZZs0G5VWX
RwKCEKRN8lsdU6/kl0Fs9hYy3V+DbDvkrzc48RdMxPMkNVGHCJG3V7vy3s+3Fc5k
YLa/AXXjLwHxsxCg6Zrkd3nL4+dApoVMhcb7GDWdC+5vfdzjpTyn6kYKTwcpLEM4
WA/W90ksZD4tfY8sp0Xx15HfJs75NOYwN2qoocDhjWWGnmD5GFLYSrrfcTqJEnWw
xVy3TZ8ibd5PymPMYeWIjvHG1u8tzAllef7Ugg1JIhK8Ixkg+Z1Q9nKoA4WPn9IP
P7YgZa7diIfR3wAiSmdS
=X8OM
-----END PGP SIGNATURE-----

--BtaMJBMqiJab6IsUcHTKb9fCnQNQA8V9q--
