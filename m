Received: from rv-out-0708.google.com ([209.85.198.242])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KW2y9-00067t-Au
	for linux-mtd@lists.infradead.org; Thu, 21 Aug 2008 05:44:25 +0000
Received: by rv-out-0708.google.com with SMTP id b17so743764rvf.42
	for <linux-mtd@lists.infradead.org>;
	Wed, 20 Aug 2008 22:44:24 -0700 (PDT)
Message-ID: <48AD00C4.6060302@gmail.com>
Date: Wed, 20 Aug 2008 22:44:36 -0700
From: Jared Hulbert <jaredeh@gmail.com>
MIME-Version: 1.0
To: Linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org,
	linux-mtd <linux-mtd@lists.infradead.org>,
	=?ISO-8859-1?Q?J=F6rn_Engel?= <joern@logfs.org>, tim.bird@AM.SONY.COM,
	cotte@de.ibm.com, nickpiggin@yahoo.com.au
Subject: [PATCH 00/10] AXFS: Advanced XIP filesystem
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Reply-To: jaredeh@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I'd like to get a first round of review on my AXFS filesystem.  This is a simple
read only compressed filesystem like Squashfs and cramfs.  AXFS is special
because it also allows for execute-in-place of your applications.  It is a major
improvement over the cramfs XIP patches that have been floating around for ages.
The biggest improvement is in the way AXFS allows for each page to be XIP or
not.  First, a user collects information about which pages are accessed on a
compressed image for each mmap()ed region from /proc/axfs/volume0.  That
'profile' is used as an input to the image builder.  The resulting image has
only the relevant pages uncompressed and XIP.  The result is smaller memory
sizes and faster launches.
                            

See http://axfs.sourceforge.net for more info.


fs/Kconfig                |   21 +
fs/Makefile               |    1 
fs/axfs/Makefile          |    7 
fs/axfs/axfs_bdev.c       |  158 ++++++++
fs/axfs/axfs_inode.c      |  490 ++++++++++++++++++++++++++
fs/axfs/axfs_mtd.c        |  233 ++++++++++++
fs/axfs/axfs_profiling.c  |  594 +++++++++++++++++++++++++++++++
fs/axfs/axfs_super.c      |  866 ++++++++++++++++++++++++++++++++++++++++++++++
fs/axfs/axfs_uml.c        |   47 ++
fs/axfs/axfs_uncompress.c |   97 +++++
include/linux/axfs.h      |  358 +++++++++++++++++++
11 files changed, 2872 insertions(+)
