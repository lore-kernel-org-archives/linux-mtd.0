Received: from mail-yx0-f177.google.com ([209.85.213.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RQliO-0005Dk-80
 for linux-mtd@lists.infradead.org; Wed, 16 Nov 2011 20:04:12 +0000
Received: by yenl9 with SMTP id l9so114639yen.36
 for <linux-mtd@lists.infradead.org>; Wed, 16 Nov 2011 12:04:09 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH 0/2] small mtd-utils fixes
Date: Wed, 16 Nov 2011 12:03:55 -0800
Message-Id: <1321473837-27891-1-git-send-email-computersforpeace@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 Mike Frysinger <vapier.adi@gmail.com>, Kevin Cernekee <cernekee@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

These two fixes are somewhat trivial, although the second one fixes a
kind of regression that occurred since the last release.

Speaking of releases: when will we make a new release? After kernel 3.2
is final? Or perhaps a pre-3.2 and post-3.2 release? There are a lot of
important fixes in git right now, and I'd like to incorporate them
officially.

Also, note that the following commit was intended to be paired with the
commits in the "brian" branch:

    commit bf01f2960ba82468b1b25f00e044fd0c3ee0770a
    nandwrite: consolidate buffer usage

While it is functionally harmless, it does include an unnecessary
memcpy(). In fact, the patch really is useful only when paired with the
rest of the 'brian' branch, which is intended for kernels supporting
ioctl(MEMWRITE) - i.e., kernel version >= 3.2.

So I recommend that the next release either includes the 'brian' branch
or does not include commit bf01f2. Mike Frysinger and I discussed this
issue on the ML earlier and didn't really come up with a solution that
avoids the overhead both with and without MEMWRITE. I figure pre-3.2
kernel users will just have to put up with it eventually.

Thanks,
Brian

Brian Norris (2):
  mtd-utils: add jffs2reader to .gitignore
  mtdinfo: provide info when used without arguments

 .gitignore          |    1 +
 ubi-utils/mtdinfo.c |   14 ++++++++++----
 2 files changed, 11 insertions(+), 4 deletions(-)

-- 
1.7.5.4
