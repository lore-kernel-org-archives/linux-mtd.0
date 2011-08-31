Received: from mms2.broadcom.com ([216.31.210.18])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QyqyD-0006TG-C6
	for linux-mtd@lists.infradead.org; Wed, 31 Aug 2011 20:01:10 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH 00/10] nandwrite: cleanup, support ioctl(MEMWRITE)
Date: Wed, 31 Aug 2011 13:00:29 -0700
Message-ID: <1314820839-7107-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: b35362@freescale.com, Brian Norris <computersforpeace@gmail.com>,
	linux-mtd@lists.infradead.org, Mike Frysinger <vapier.adi@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch series cleans up old features in nandwrite and supports new
features with ioctl(MEMWRITE).

Byproducts of this include:
(1) kill --raw
(2) re-implement --autoplace
(3) support OOB writes for MLC NAND (only write once per page)

(1) is done because it's difficult to really tell the reason for --raw
in the first place. Thus, in restructuring mtd_write and nandwrite, I
cannot support it. I don't think anyone will miss it.
(2) is done just because we can. Previously, support for the autoplace
OOB layout was spotty, depended on the obsolete ioctl(MEMGETOOBSEL), and
utilized user-space code to imitate an internal kernel interface. Old
code can be supported with little impact by pushing it to a "legacy"
function and supporting autoplacement primarily by way of the new
ioctl(MEMWRITE).
(3) was kind of the end goal for introducing ioctl(MEMWRITE). We needed
a user interface that could write data+OOB in a single operation.

Brian

Brian Norris (10):
  nandwrite: trivial variable move
  mtd-utils: update mtd-abi.h
  nandwrite: consolidate buffer usage
  libmtd: modify `mtd_write' to cover OOB writes
  libmtd: support MEMWRITE ioctl
  nandwrite: merge `mtd_write_oob' and `mtd_write' calls
  mtdutils: move OOB auto-layout into libmtd's mtd_write
  nandwrite: kill `--raw' option
  nandwrite: re-implement `--autoplace' option
  nandwrite: use common.h "errmsg" functions

 include/libmtd.h      |   15 ++++--
 include/mtd/mtd-abi.h |  122 ++++++++++++++++++++++++++++++++++++------
 lib/libmtd.c          |   86 ++++++++++++++++++++++++++----
 nanddump.c            |    2 +-
 nandwrite.c           |  143 +++++++++++++++++--------------------------------
 ubi-utils/ubiformat.c |    6 ++-
 6 files changed, 245 insertions(+), 129 deletions(-)

-- 
1.7.5.4
