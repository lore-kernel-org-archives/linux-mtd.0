Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1M9ytd-0003Xp-3d
	for linux-mtd@lists.infradead.org; Fri, 29 May 2009 10:01:12 +0000
Subject: Re: UBIFS: "sync" mount option does not work
From: Artem Bityutskiy <dedekind@infradead.org>
To: =?ISO-8859-1?Q?Aur=E9lien_G=C9R=D4ME?= <ag@debian.org>
In-Reply-To: <20090528170621.GJ18372@roxor.cx>
References: <20090528170621.GJ18372@roxor.cx>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 29 May 2009 13:00:49 +0300
Message-Id: <1243591249.11172.106.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	linux-mtd@lists.infradead.org, Adrian.Hunter@nokia.com
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2009-05-28 at 19:06 +0200, Aurélien GÉRÔME wrote:
> Hi,
> 
> Mounting a ubifs RedBoot partition located on a NOR flash as root
> filesystem fails.
> 
> The kernel is an up-to-date 2.6.24 ubifs git backport.
> 
> It always works fine without the "sync" mount option, but I *really*
> need to disable writeback.
> 
> Here is the full boot log.
> 
> RedBoot> exec -b 0x18000 -l 0x500000 -c "noinitrd console=mxcuart,0x5000C000,115200n8 rootfstype=ubifs ubi.mtd=rootfs0 root=ubi0:rootfs rootflags=sync ignore_loglevel"
> Warning: invalid entry address but still continue ...
> entry=0x80018000, target=0x80018000
> [    0.000000] Linux version 2.6.24.6 (ag@debian.org) (gcc version 4.2.4 (Debian 4.2.4-6)) #1 PREEMPT Thu May 28 18:22:53 CEST 2009
> [    0.000000] CPU: ARMv6-compatible processor [4107b364] revision 4 (ARMv6TEJ), cr=00e5387f
> [    0.000000] Machine: Freescale MX31/MX32 ADS
...
> [    6.800000] UBIFS error (pid 1): ubifs_parse_options: unrecognized mount option "sync" or missing value
> [    6.820000] List of all partitions:
> [    6.820000] 0800    1023120 sda driver: sd
> [    6.830000]   0801    1020096 sda1
> [    6.830000] No filesystem could mount root, tried:  ubifs
> [    6.830000] Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(0,0)

This seems to be a general problem. I believe if you try to do
the same with ext2, it'll refuse your sync flag as well. The
problem is that UBIFS, as well as ext2, expects the "sync"
option to be passed as MS_SYNCHRONOUS flag, not as a string.
Take a look at "man 2 mount", for example.

But when you pass the "sync" option with 'rootflags' kernel
option, it is passed to UBIFS as a string, and UBIFS is not
ready to accept it.

Below is the patch which fixes the issue for UBIFS. We could
invent a VFS fix for this as well, because this should not
be UBIFS-specific.

--

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Subject: [PATCH] UBIFS: allow sync option in rootflags
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

When passing UBIFS parameters via kernel command line, the
sync option will be passed to UBIFS as a string, not as an
MS_SYNCHRONOUS flag. Teach UBIFS interpreting this flag.

Reported-by: Aurélien GÉRÔME <ag@debian.org>
Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/super.c |   40 +++++++++++++++++++++++++++++++++++-----
 1 files changed, 35 insertions(+), 5 deletions(-)

diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index d4ab0fc..3513cad 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -940,6 +940,27 @@ static const match_table_t tokens = {
 };
 
 /**
+ * parse_standard_option - parse a standard mount option.
+ * @option: the option to parse
+ *
+ * Normally, standard mount options like "sync" are passed to file-systems as
+ * flags. However, when a "rootflags=" kernel boot parameter is used, they may
+ * be present in the options string. This function tries to deal with this
+ * situation and parse standard options. Returns 0 if the option was not
+ * recognized, and the corresponding integer flag if it was.
+ *
+ * UBIFS is only interested in the "sync" option, so do not check for anything
+ * else.
+ */
+static int parse_standard_option(const char *option)
+{
+	ubifs_msg("parse %s", option);
+	if (!strcmp(option, "sync"))
+		return MS_SYNCHRONOUS;
+	return 0;
+}
+
+/**
  * ubifs_parse_options - parse mount parameters.
  * @c: UBIFS file-system description object
  * @options: parameters to parse
@@ -1015,9 +1036,19 @@ static int ubifs_parse_options(struct ubifs_info *c, char *options,
 			break;
 		}
 		default:
-			ubifs_err("unrecognized mount option \"%s\" "
-				  "or missing value", p);
-			return -EINVAL;
+		{
+			unsigned long flag;
+			struct super_block *sb = c->vfs_sb;
+
+			flag = parse_standard_option(p);
+			if (!flag) {
+				ubifs_err("unrecognized mount option \"%s\" "
+					  "or missing value", p);
+				return -EINVAL;
+			}
+			sb->s_flags |= flag;
+			break;
+		}
 		}
 	}
 
@@ -1908,6 +1939,7 @@ static int ubifs_fill_super(struct super_block *sb, void *data, int silent)
 	INIT_LIST_HEAD(&c->orph_list);
 	INIT_LIST_HEAD(&c->orph_new);
 
+	c->vfs_sb = sb;
 	c->highest_inum = UBIFS_FIRST_INO;
 	c->lhead_lnum = c->ltail_lnum = UBIFS_LOG_LNUM;
 
@@ -1939,8 +1971,6 @@ static int ubifs_fill_super(struct super_block *sb, void *data, int silent)
 	if (err)
 		goto out_bdi;
 
-	c->vfs_sb = sb;
-
 	sb->s_fs_info = c;
 	sb->s_magic = UBIFS_SUPER_MAGIC;
 	sb->s_blocksize = UBIFS_BLOCK_SIZE;
-- 
1.6.0.6

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
