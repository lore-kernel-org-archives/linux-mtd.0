Received: from smtp.nokia.com ([131.228.20.172] helo=mgw-ext13.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IUfH6-000455-2t
	for linux-mtd@lists.infradead.org; Mon, 10 Sep 2007 05:09:46 -0400
Subject: What's in ubi-2.6.git
From: Artem Bityutskiy <dedekind@infradead.org>
To: LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Date: Mon, 10 Sep 2007 12:09:03 +0300
Message-Id: <1189415343.14370.97.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The following are UBI changes I'd like to push to 2.6.24. The amount of
changes is small, so no additional comments.

URL: git://git.infradead.org/~dedekind/ubi-2.6.git master
(based on top of -rc2 for now).

Artem Bityutskiy (6):
      UBI: fix sparse warnings
      UBI: add more prints
      UBI: use linux print_hex_dump(), not home-grown one
      UBI: allocate memory with GFP_NOFS
      UBI: do not use vmalloc on I/O path
      UBI: use byte hexdump

Florin Malita (1):
      UBI: fix leak in ubi_scan_erase_peb

Jesper Juhl (1):
      UBI: don't use array index before testing if it is negative

 drivers/mtd/ubi/build.c |   28 +++++++++++++++-
 drivers/mtd/ubi/debug.c |   37 +--------------------
 drivers/mtd/ubi/debug.h |    2 -
 drivers/mtd/ubi/eba.c   |   82 +++++++++++++++++--------------------------=
---
 drivers/mtd/ubi/io.c    |   75 ++++++++++++++++++++-----------------------
 drivers/mtd/ubi/kapi.c  |    9 ++++-
 drivers/mtd/ubi/scan.c  |   45 ++++++++++++--------------
 drivers/mtd/ubi/scan.h  |    8 ++--
 drivers/mtd/ubi/ubi.h   |   36 +++++++++++++++------
 drivers/mtd/ubi/vmt.c   |   70 +++++++++++++++++++++-------------------
 drivers/mtd/ubi/vtbl.c  |    8 ++--
 drivers/mtd/ubi/wl.c    |   17 +++++----
 12 files changed, 202 insertions(+), 215 deletions(-)

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
