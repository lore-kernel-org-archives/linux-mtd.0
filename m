Received: from mail-pz0-f41.google.com ([209.85.210.41])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QuSYD-0003bF-Nj
	for linux-mtd@lists.infradead.org; Fri, 19 Aug 2011 17:08:10 +0000
Received: by pzk4 with SMTP id 4so7208195pzk.28
	for <linux-mtd@lists.infradead.org>;
	Fri, 19 Aug 2011 10:08:07 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH 00/10] nandwrite: clean out old ioctls
Date: Fri, 19 Aug 2011 10:07:46 -0700
Message-Id: <1313773676-12879-1-git-send-email-computersforpeace@gmail.com>
Cc: Kevin Cernekee <cernekee@gmail.com>,
	Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
	Mike Frysinger <vapier.adi@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

This series cleans up some coding style, but it primarily deals with
several options to nandwrite that have rotted. Mostly, this deals with
MEMSETOOBSEL, which hasn't existed since kernel 2.6.17 - see commit:

  [MTD] NAND Consolidate oobinfo handling
  Sat May 27 20:36:12 2006 +0200
  commit ff268fb8791cf18df536113355d7184007c269d9

For reference, MEMSETOOBSEL was "replaced" with MTDFILEMODE in the same
kernel release:

  [MTD] NAND Expose the new raw mode function and status info to userspace
  Tue May 30 00:37:34 2006 +0200
  commit f1a28c02843efcfcc41982149880bac3ac180234

Several features depended (in part or entirely) on the MEMSETOOBSEL
ioctl: the -j, -y, and -a options to nandwrite and by extension the -f
(--forcelegacy) option which handled special cases for -j and -y. There
are also pieces of nanddump that relied on this behavior as a backup. We
just remove them, since they have been useless for over 5 years.

There shouldn't be any actual loss of functionality in these patches so
far (at least, not very much); let me know if there's something critical
I'm missing.

On the other hand, there is plenty of value in these edits, since it
leaves room for more rennovation and addition of newer, better kernel
interfaces for writing data and changing OOB modes.

Brian

Brian Norris (10):
  mtd_debug: fixup style
  mtd_debug: replace #defines with enum
  mtd-utils: use __func__ instead of __FUNCTION__
  nandwrite: remove C99 comment style
  nandwrite: remove `autoplace' features
  nandwrite: kill more MEMSETOOBSEL
  nandwrite: kill -j, -y, and -f options
  nandwrite: cleanup "oobinfochanged" leftovers
  nandwrite: refactor "old_oobinfo" code
  nanddump: kill usages of MEMSETOOBSEL ioctl

 mtd_debug.c              |  355 ++++++++++++++++++++++------------------------
 nanddump.c               |   43 +-----
 nandwrite.c              |  174 ++++-------------------
 tests/ubi-tests/common.c |   10 +-
 4 files changed, 205 insertions(+), 377 deletions(-)

-- 
1.7.6
