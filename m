Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QaN43-0006dg-3N
	for linux-mtd@lists.infradead.org; Sat, 25 Jun 2011 07:14:00 +0000
Received: by bwf12 with SMTP id 12so536830bwf.36
	for <linux-mtd@lists.infradead.org>;
	Sat, 25 Jun 2011 00:13:54 -0700 (PDT)
Subject: Re: [PATCH 1/2 v2] rewrite build system to avoid recursion
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Frysinger <vapier@gentoo.org>
Date: Sat, 25 Jun 2011 10:13:48 +0300
In-Reply-To: <1308984770-6594-1-git-send-email-vapier@gentoo.org>
References: <1308983405-27064-1-git-send-email-vapier@gentoo.org>
	<1308984770-6594-1-git-send-email-vapier@gentoo.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Message-ID: <1308986033.23868.8.camel@koala>
Mime-Version: 1.0
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

On Sat, 2011-06-25 at 02:52 -0400, Mike Frysinger wrote:
> The ubi-utils/src/ subdir is tossed as it just complicates things for no
> real gain.
> 
> The top level clean is replaced with a `find -delete` on objects, so it
> might prune more than necessary, but many projects now do this sort of
> thing and no one complained there.
> 
> A "mkdep" helper generates the actual rule, and the variables are used
> with "foreach" to expand these automatically.
> 
> While we're gutting things, also through in kbuild style output while
> building to make things more legible.
> 
> Signed-off-by: Mike Frysinger <vapier@gentoo.org>
> ---
> v2
> 	- use -M when creating patch
> 	- add xprintf to autosize quiet output

Wow, looks great, however, I experience a build error:

[dedekind@koala mtd-utils (master)]$ make clean
[dedekind@koala mtd-utils (master)]$ git clean -f -d
[dedekind@koala mtd-utils (master)]$ make
  CC      ftl_format.o
  CC      lib/libmtd.o
  CC      lib/libmtd_legacy.o
  CC      lib/libcrc32.o
  CC      lib/libfec.o
  AR      lib/libmtd.a
  LD      ftl_format
  CC      flash_erase.o
  LD      flash_erase
  CC      nanddump.o
nanddump.c: In function ‘process_options’:
nanddump.c:106:7: warning: variable ‘bb_default’ set but not used
[-Wunused-but-set-variable]
  LD      nanddump
  CC      doc_loadbios.o
  LD      doc_loadbios
  CC      ftl_check.o
  LD      ftl_check
  CC      mkfs.jffs2.o
  CC      compr_rtime.o
  CC      compr_zlib.o
  CC      compr_lzo.o
  CC      compr.o
  CC      rbtree.o
  LD      mkfs.jffs2
  CC      flash_lock.o
  LD      flash_lock
  CC      flash_unlock.o
  LD      flash_unlock
  CC      flash_info.o
  LD      flash_info
  CC      flash_otp_info.o
  LD      flash_otp_info
  CC      flash_otp_dump.o
  LD      flash_otp_dump
  CC      mtd_debug.o
  LD      mtd_debug
  CC      flashcp.o
flashcp.c: In function ‘main’:
flashcp.c:255:2: warning: #warning "Check for smaller erase
regions" [-Wcpp]
  LD      flashcp
  CC      nandwrite.o
  LD      nandwrite
  CC      nandtest.o
  LD      nandtest
  CC      jffs2dump.o
  LD      jffs2dump
  CC      nftldump.o
  LD      nftldump
  CC      nftl_format.o
  LD      nftl_format
  CC      docfdisk.o
docfdisk.c: In function ‘main’:
docfdisk.c:269:12: warning: ‘ip’ may be used uninitialized in this
function [-Wuninitialized]
  LD      docfdisk
  CC      rfddump.o
  LD      rfddump
  CC      rfdformat.o
  LD      rfdformat
  CC      serve_image.o
  LD      serve_image
  CC      recv_image.o
  LD      recv_image
  CC      sumtool.o
  LD      sumtool
  CC      mkfs.ubifs/mkfs.ubifs.o
mkfs.ubifs/mkfs.ubifs.c: In function ‘main’:
mkfs.ubifs/ubifs.h:420:2: warning: ‘child_cnt’ may be used uninitialized
in this function [-Wuninitialized]
mkfs.ubifs/mkfs.ubifs.c:1775:6: note: ‘child_cnt’ was declared here
  CC      mkfs.ubifs/crc16.o
  CC      mkfs.ubifs/lpt.o
  CC      mkfs.ubifs/compr.o
  CC      mkfs.ubifs/devtable.o
  CC      mkfs.ubifs/hashtable/hashtable.o
  CC      mkfs.ubifs/hashtable/hashtable_itr.o
  CC      ubi-utils/libubi.o
  AR      ubi-utils/libubi.a
  LD      mkfs.ubifs/mkfs.ubifs
  CC      ubi-utils/ubiupdatevol.o
  CC      ubi-utils/ubiutils-common.o
  LD      ubi-utils/ubiupdatevol
  CC      ubi-utils/ubimkvol.o
  LD      ubi-utils/ubimkvol
  CC      ubi-utils/ubirmvol.o
  LD      ubi-utils/ubirmvol
  CC      ubi-utils/ubicrc32.o
  LD      ubi-utils/ubicrc32
  CC      ubi-utils/ubinfo.o
  LD      ubi-utils/ubinfo
  CC      ubi-utils/ubiattach.o
  LD      ubi-utils/ubiattach
  CC      ubi-utils/ubidetach.o
  LD      ubi-utils/ubidetach
  CC      ubi-utils/ubinize.o
In file included from ubi-utils/ubinize.c:38:0:
./ubi-utils/include/libiniparser.h:35:24: fatal error: dictionary.h: No
such file or directory
compilation terminated.
make: *** [/home/dedekind/git/mtd-utils/ubi-utils/ubinize.o] Error 1

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
