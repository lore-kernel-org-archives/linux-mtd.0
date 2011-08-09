Received: from mms3.broadcom.com ([216.31.210.19])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1Qqtz7-0001Za-KY
	for linux-mtd@lists.infradead.org; Tue, 09 Aug 2011 21:37:14 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH v2 0/5] bugfix, cleanup for mtdinfo
Date: Tue, 9 Aug 2011 14:36:41 -0700
Message-ID: <1312925806-15929-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: brian.foster@maxim-ic.com, Brian Norris <computersforpeace@gmail.com>,
	linux-mtd@lists.infradead.org, Mike Frysinger <vapier.adi@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This series includes v2 of a bugfix patch, as discussed in this thread:
  http://lists.infradead.org/pipermail/linux-mtd/2011-August/037386.html
and previously. Now, `mtdinfo --all' will not try to print out
region_info, since we need to supply a file path for use with ioctl. In
the future, if sysfs support is supplied for region_info, then we can
renew support in `mtdinfo --all'.

In addition to the bugfix, there are several other cleanups for mtdinfo.

Brian

Brian Norris (5):
  mtdinfo: don't open NULL pointer when getting region_info with `-a'
  mtdinfo: refactor code to remove "args.all" dependency
  mtdinfo: restructure help message
  mtdinfo: fixup "example usage" help section
  mtdinfo: consolidate help as display_help()

 ubi-utils/mtdinfo.c |   61 ++++++++++++++++++++++++++------------------------
 1 files changed, 32 insertions(+), 29 deletions(-)
