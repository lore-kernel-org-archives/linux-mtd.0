Received: from mx1.redhat.com ([209.132.183.28])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TLZtS-0006oi-1Q
 for linux-mtd@lists.infradead.org; Tue, 09 Oct 2012 13:30:43 +0000
From: David Howells <dhowells@redhat.com>
To: dwmw2@infradead.org
Subject: [GIT PULL] Disintegrate UAPI for mtd
Date: Tue, 09 Oct 2012 14:30:31 +0100
Message-ID: <30720.1349789431@warthog.procyon.org.uk>
Cc: dhowells@redhat.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Can you merge the following branch into the mtd tree please.

This is to complete part of the Userspace API (UAPI) disintegration for which
the preparatory patches were pulled recently.  After these patches, userspace
headers will be segregated into:

	include/uapi/linux/.../foo.h

for the userspace interface stuff, and:

	include/linux/.../foo.h

for the strictly kernel internal stuff.

---
The following changes since commit 9e2d8656f5e8aa214e66b462680cf86b210b74a8:

  Merge branch 'akpm' (Andrew's patch-bomb) (2012-10-09 16:23:15 +0900)

are available in the git repository at:


  git://git.infradead.org/users/dhowells/linux-headers.git tags/disintegrate-mtd-20121009

for you to fetch changes up to 4a8e43feeac7996b8de2d5b2823e316917493df4:

  UAPI: (Scripted) Disintegrate include/mtd (2012-10-09 09:49:09 +0100)

----------------------------------------------------------------
UAPI Disintegration 2012-10-09

----------------------------------------------------------------
David Howells (1):
      UAPI: (Scripted) Disintegrate include/mtd

 include/mtd/Kbuild                  | 5 -----
 include/uapi/mtd/Kbuild             | 5 +++++
 include/{ => uapi}/mtd/inftl-user.h | 0
 include/{ => uapi}/mtd/mtd-abi.h    | 0
 include/{ => uapi}/mtd/mtd-user.h   | 0
 include/{ => uapi}/mtd/nftl-user.h  | 0
 include/{ => uapi}/mtd/ubi-user.h   | 0
 7 files changed, 5 insertions(+), 5 deletions(-)
 rename include/{ => uapi}/mtd/inftl-user.h (100%)
 rename include/{ => uapi}/mtd/mtd-abi.h (100%)
 rename include/{ => uapi}/mtd/mtd-user.h (100%)
 rename include/{ => uapi}/mtd/nftl-user.h (100%)
 rename include/{ => uapi}/mtd/ubi-user.h (100%)
.
