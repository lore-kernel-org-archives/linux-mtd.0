Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q9ubD-0008Ne-0P
	for linux-mtd@lists.infradead.org; Wed, 13 Apr 2011 07:34:52 +0000
Received: by wwb39 with SMTP id 39so279648wwb.18
	for <linux-mtd@lists.infradead.org>;
	Wed, 13 Apr 2011 00:34:49 -0700 (PDT)
Subject: Re: Oops when calling fsync on read-only file-system
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Reuben Dowle <Reuben.Dowle@navico.com>
In-Reply-To: <70F6AAAFDC054F41B9994A9BCD3DF64E1284E165@exch01-aklnz.MARINE.NET.INT>
References: <70F6AAAFDC054F41B9994A9BCD3DF64E1284E165@exch01-aklnz.MARINE.NET.INT>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 13 Apr 2011 10:31:59 +0300
Message-ID: <1302679919.2768.9.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

thanks a lot for reporting this!
On Tue, 2011-04-12 at 13:32 +1200, Reuben Dowle wrote:
> On my system, calling the fsync system call on any file in a UBI
> file-system that is mounted read-only leads to a kernel oops. Our
> system is running a customise version of 2.6.31, but as far as I can
> see (without testing which is not possible due to extensive vendor
> customisation of .31 kernel version), the current git branch also
> contains this bug.
> 
> I have created a patch against 2.6.31 that fixes the problem in my
> system. Perhaps someone could test on latest kernel version.
> 
> Signed-off-by: Reuben Dowle <reuben.dowle at navico.com>

Wow! Shame on me for this bug! And it is funny that it is there for
several years already and there are product with this bug! Here is the
fix which I will merge upstream soon:


From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Subject: [PATCH] UBIFS: fix oops when R/O file-system is fsync'ed

This patch fixes severe UBIFS bug: UBIFS oopses when we 'fsync()' an
file on R/O-mounter file-system. We (the UBIFS authors) incorrectly
thought that VFS would not propagate 'fsync()' down to the file-system
if it is read-only, but this is not the case.

It is easy to exploit this bug using the following simple perl script:

use strict;
use File::Sync qw(fsync sync);

die "File path is not specified" if not defined $ARGV[0];
my $path = $ARGV[0];

open FILE, "<", "$path" or die "Cannot open $path: $!";
fsync(\*FILE) or die "cannot fsync $path: $!";
close FILE or die "Cannot close $path: $!";

Thanks to Reuben Dowle <Reuben.Dowle@navico.com> for reporting about this
issue.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Reported-by: Reuben Dowle <Reuben.Dowle@navico.com>
Cc: stable@kernel.org
---
 fs/ubifs/file.c |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index a2b5012..3594aae 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -1312,6 +1312,9 @@ int ubifs_fsync(struct file *file, int datasync)
 
 	dbg_gen("syncing inode %lu", inode->i_ino);
 
+	if (inode->i_sb->s_flags & MS_RDONLY)
+		return 0;
+
 	/*
 	 * VFS has already synchronized dirty pages for this inode. Synchronize
 	 * the inode unless this is a 'datasync()' call.
-- 
1.7.2.3

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
