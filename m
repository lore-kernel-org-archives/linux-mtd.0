Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CPO1H-000828-EP
	for linux-mtd@lists.infradead.org; Wed, 03 Nov 2004 11:30:04 -0500
Message-ID: <41890762.9030901@yandex.ru>
Date: Wed, 03 Nov 2004 19:29:22 +0300
From: "Artem B. Bityuckiy" <abityuckiy@yandex.ru>
MIME-Version: 1.0
To: Estelle HAMMACHE <estelle.hammache@st.com>
References: <417F961A.1090107@yandex.ru>		<1098881953.13633.1786.camel@hades.cambridge.redhat.com>		<417FA408.9080906@yandex.ru>	<1098884706.13633.1791.camel@hades.cambridge.redhat.com>		<4180E732.70608@yandex.ru>
	<4180FAD8.2000107@yandex.ru> <41879A58.F960F963@st.com>
In-Reply-To: <41879A58.F960F963@st.com>
Content-Type: multipart/mixed; boundary="------------070908010709010006020101"
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
Subject: Re: JFFS2 & SMP
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------070908010709010006020101
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Hello Estelle.

It seems I now what is the problem. Thank you for your message.

The wbuf is protected by the alloc_sem because of all the writes go 
through the space reservation (or in case of GC, it also holds the 
alloc_sem).

When JFFS2 reads the flash, it also looks to the write buffer and if the 
NAND page which should be read is currently in the wbuf, it reads some 
data from the wbuf too. But there is no any protection there.

I've introduced the new read/write semaphore (wbuf_sem). It seems the 
problem is fixed, but I'm not sure yet.

Please, could you try the attached patch? The patch was made against the 
MTD snapshot of date 20041008 
(ftp://ftp.uk.linux.org/pub/people/dwmw2/mtd/cvs/mtd-snapshot-20041008.tar.bz2).

David, could you comment this?

Estelle HAMMACHE wrote:
> Hello Artem,
> 
> Have you made any progress with this issue ?
> 
> I believe this problem could be reproduced more easily
> by adding a long sleep() at the end of __jffs2_flush_wbuf
> between memset() and the affectation of c->wbuf_ofs.
> Then write and fsync a file and try to read it back during
> the sleep.
> I've done something similar on my non-linux setup (actually
> I use a longjmp to exit from __jffs2_flush_wbuf) and I obtain 
> the following when I try to read back the file:
> <7>Node read from 00080160: node_crc ffffffff, calculated CRC f09e7845. dsize ffffffff, csize ffffffff, offset ffffffff,
> buf 1100a48
> <4>Node CRC ffffffff != calculated CRC f09e7845 for node at 00080160
> 
> I think the wbuf variables are well protected against
> cuncurrent writes, however if the wbuf is being flushed 
> (fsync or GC) and you try to _read_ the file which has a 
> node in wbuf, there may be some inconsistency between 
> wbuf_ofs and wbuf contents.
> I suggest to modify the end of __jffs2_flush_wbuf this way:
> 
> 	c->wbuf_len = 0; /* do this FIRST so that reads won't attempt to use wbuf */
> 	memset(c->wbuf,0xff,c->wbuf_pagesize);
> 	/* adjust write buffer offset, else we get a non contiguous write bug */
> 	c->wbuf_ofs += c->wbuf_pagesize;
> 
> Does this seem useful ?
> Estelle
> 
> "Artem B. Bityuckiy" wrote:
> 
>>Hello,
>>
>>how the the wbuf and related variables in the jffs2_sb_info are protected?
>>
>>--
>>Best Regards,
>>Artem B. Bityuckiy,
>>St.-Petersburg, Russia.
>>
>>______________________________________________________
>>Linux MTD discussion mailing list
>>http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
> 

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.

--------------070908010709010006020101
Content-Type: text/x-patch;
 name="preempt-patch.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="preempt-patch.diff"

diff -auNr mtd-snapshot-20041008/fs/jffs2/build.c mtd-preepmpt-fix/fs/jffs2/build.c
--- mtd-snapshot-20041008/fs/jffs2/build.c	2003-10-29 02:00:34.000000000 +0300
+++ mtd-preepmpt-fix/fs/jffs2/build.c	2004-11-03 19:20:49.769732102 +0300
@@ -314,6 +314,7 @@
 
 	init_MUTEX(&c->alloc_sem);
 	init_MUTEX(&c->erase_free_sem);
+	init_rwsem(&c->wbuf_sem);
 	init_waitqueue_head(&c->erase_wait);
 	init_waitqueue_head(&c->inocache_wq);
 	spin_lock_init(&c->erase_completion_lock);
diff -auNr mtd-snapshot-20041008/fs/jffs2/wbuf.c mtd-preepmpt-fix/fs/jffs2/wbuf.c
--- mtd-snapshot-20041008/fs/jffs2/wbuf.c	2004-09-12 02:00:12.000000000 +0400
+++ mtd-preepmpt-fix/fs/jffs2/wbuf.c	2004-11-03 19:20:49.761733507 +0300
@@ -392,7 +392,7 @@
    1: Pad, do not adjust nextblock free_size
    2: Pad, adjust nextblock free_size
 */
-static int __jffs2_flush_wbuf(struct jffs2_sb_info *c, int pad)
+static int __jffs2_flush_wbuf(struct jffs2_sb_info *c, int pad, int alloc_wbuf_sem)
 {
 	int ret;
 	size_t retlen;
@@ -408,8 +408,11 @@
 		BUG();
 	}
 
+	if (alloc_wbuf_sem)
+		down_write(&c->wbuf_sem);
+
 	if(!c->wbuf || !c->wbuf_len)
-		return 0;
+		goto exit;
 
 	/* claim remaining space on the page
 	   this happens, if we have a change to a new block,
@@ -458,7 +461,7 @@
 
 		jffs2_wbuf_recover(c);
 
-		return ret; 
+		goto exit;
 	}
 
 	spin_lock(&c->erase_completion_lock);
@@ -497,6 +500,9 @@
 	/* adjust write buffer offset, else we get a non contiguous write bug */
 	c->wbuf_ofs += c->wbuf_pagesize;
 	c->wbuf_len = 0;
+exit:
+	if (alloc_wbuf_sem)
+		up_write(&c->wbuf_sem);
 	return 0;
 }
 
@@ -525,7 +531,7 @@
 	if (c->unchecked_size) {
 		/* GC won't make any progress for a while */
 		D1(printk(KERN_DEBUG "jffs2_flush_wbuf_gc() padding. Not finished checking\n"));
-		ret = __jffs2_flush_wbuf(c, 2);
+		ret = __jffs2_flush_wbuf(c, 2, 1);
 	} else while (old_wbuf_len &&
 		      old_wbuf_ofs == c->wbuf_ofs) {
 
@@ -537,7 +543,7 @@
 		if (ret) {
 			/* GC failed. Flush it with padding instead */
 			down(&c->alloc_sem);
-			ret = __jffs2_flush_wbuf(c, 2);
+			ret = __jffs2_flush_wbuf(c, 2, 1);
 			break;
 		}
 		down(&c->alloc_sem);
@@ -552,10 +558,9 @@
 /* Pad write-buffer to end and write it, wasting space. */
 int jffs2_flush_wbuf_pad(struct jffs2_sb_info *c)
 {
-	return __jffs2_flush_wbuf(c, 1);
+	return __jffs2_flush_wbuf(c, 1, 1);
 }
 
-
 #define PAGE_DIV(x) ( (x) & (~(c->wbuf_pagesize - 1)) )
 #define PAGE_MOD(x) ( (x) & (c->wbuf_pagesize - 1) )
 int jffs2_flash_writev(struct jffs2_sb_info *c, const struct kvec *invecs, unsigned long count, loff_t to, size_t *retlen, uint32_t ino)
@@ -575,6 +580,8 @@
 	if (!c->wbuf)
 		return jffs2_flash_direct_writev(c, invecs, count, to, retlen);
 	
+	down_write(&c->wbuf_sem);
+
 	/* If wbuf_ofs is not initialized, set it to target address */
 	if (c->wbuf_ofs == 0xFFFFFFFF) {
 		c->wbuf_ofs = PAGE_DIV(to);
@@ -592,12 +599,12 @@
 		/* It's a write to a new block */
 		if (c->wbuf_len) {
 			D1(printk(KERN_DEBUG "jffs2_flash_writev() to 0x%lx causes flush of wbuf at 0x%08x\n", (unsigned long)to, c->wbuf_ofs));
-			ret = jffs2_flush_wbuf_pad(c);
+			ret = __jffs2_flush_wbuf(c, 1, 1);
 			if (ret) {
 				/* the underlying layer has to check wbuf_len to do the cleanup */
 				D1(printk(KERN_WARNING "jffs2_flush_wbuf() called from jffs2_flash_writev() failed %d\n", ret));
 				*retlen = 0;
-				return ret;
+				goto exit;
 			}
 		}
 		/* set pointer to new block */
@@ -658,14 +665,14 @@
 		}			
 		
 		/* write buffer is full, flush buffer */
-		ret = __jffs2_flush_wbuf(c, 0);
+		ret = __jffs2_flush_wbuf(c, 0, 0);
 		if (ret) {
 			/* the underlying layer has to check wbuf_len to do the cleanup */
 			D1(printk(KERN_WARNING "jffs2_flush_wbuf() called from jffs2_flash_writev() failed %d\n", ret));
 			/* Retlen zero to make sure our caller doesn't mark the space dirty.
 			   We've already done everything that's necessary */
 			*retlen = 0;
-			return ret;
+			goto exit;
 		}
 		outvec_to += donelen;
 		c->wbuf_ofs = outvec_to;
@@ -709,7 +716,6 @@
 
 	if (splitvec != -1) {
 		uint32_t remainder;
-		int ret;
 
 		remainder = outvecs[splitvec].iov_len - split_ofs;
 		outvecs[splitvec].iov_len = split_ofs;
@@ -721,7 +727,7 @@
 			   c->wbuf is empty. 
 			*/
 			*retlen = donelen;
-			return ret;
+			goto exit;
 		}
 		
 		donelen += wbuf_retlen;
@@ -760,7 +766,11 @@
 	if (c->wbuf_len && ino)
 		jffs2_wbuf_dirties_inode(c, ino);
 
-	return 0;
+	ret = 0;
+	
+exit:
+	up_write(&c->wbuf_sem);
+	return ret;
 }
 
 /*
@@ -789,6 +799,8 @@
 
 	/* Read flash */
 	if (!jffs2_can_mark_obsolete(c)) {
+		down_read(&c->wbuf_sem);
+
 		ret = c->mtd->read_ecc(c->mtd, ofs, len, retlen, buf, NULL, c->oobinfo);
 
 		if ( (ret == -EBADMSG) && (*retlen == len) ) {
@@ -811,23 +823,23 @@
 
 	/* if no writebuffer available or write buffer empty, return */
 	if (!c->wbuf_pagesize || !c->wbuf_len)
-		return ret;
+		goto exit;
 
 	/* if we read in a different block, return */
 	if ( (ofs & ~(c->sector_size-1)) != (c->wbuf_ofs & ~(c->sector_size-1)) ) 
-		return ret;	
+		goto exit;
 
 	if (ofs >= c->wbuf_ofs) {
 		owbf = (ofs - c->wbuf_ofs);	/* offset in write buffer */
 		if (owbf > c->wbuf_len)		/* is read beyond write buffer ? */
-			return ret;
+			goto exit;
 		lwbf = c->wbuf_len - owbf;	/* number of bytes to copy */
 		if (lwbf > len)	
 			lwbf = len;
 	} else {	
 		orbf = (c->wbuf_ofs - ofs);	/* offset in read buffer */
 		if (orbf > len)			/* is write beyond write buffer ? */
-			return ret;
+			goto exit;
 		lwbf = len - orbf; 		/* number of bytes to copy */
 		if (lwbf > c->wbuf_len)	
 			lwbf = c->wbuf_len;
@@ -835,6 +847,8 @@
 	if (lwbf > 0)
 		memcpy(buf+orbf,c->wbuf+owbf,lwbf);
 
+exit:
+	up_read(&c->wbuf_sem);
 	return ret;
 }
 
diff -auNr mtd-snapshot-20041008/include/linux/jffs2_fs_sb.h mtd-preepmpt-fix/include/linux/jffs2_fs_sb.h
--- mtd-snapshot-20041008/include/linux/jffs2_fs_sb.h	2003-10-09 02:00:05.000000000 +0400
+++ mtd-preepmpt-fix/include/linux/jffs2_fs_sb.h	2004-11-03 19:20:50.058681364 +0300
@@ -36,8 +36,9 @@
 	struct semaphore alloc_sem;	/* Used to protect all the following 
 					   fields, and also to protect against
 					   out-of-order writing of nodes.
-					   And GC.
-					*/
+					   And GC. Also protects the write buffer
+					   against concurrent writes. */
+	struct rw_semaphore wbuf_sem;	/* Protects the write buffer while it is read */
 	uint32_t cleanmarker_size;	/* Size of an _inline_ CLEANMARKER
 					 (i.e. zero for OOB CLEANMARKER */
 
diff -auNr mtd-snapshot-20041008/patches/patchin.sh mtd-preepmpt-fix/patches/patchin.sh
--- mtd-snapshot-20041008/patches/patchin.sh	1970-01-01 03:00:00.000000000 +0300
+++ mtd-preepmpt-fix/patches/patchin.sh	2004-10-04 02:00:14.000000000 +0400
@@ -0,0 +1,392 @@
+#!/bin/sh
+#
+# Patch mtd into kernel
+#
+# usage:patch [-j] kernelpath
+# 	kernelpath must be given
+#	-j includes filesystems (jffs, jffs2)
+#	
+# Works for Kernels >= 2.4.11 full functional
+# Works for Kernels >= 2.4 and <= 2.4.10 partly (JFFS2 support is missing)
+# For 2.2 Kernels it's actually disabled, as I have none to test it.
+#
+# You can use it for pristine kernels and for already patches kernels too.
+#
+# Detects Kernelversion and applies neccecary modifications
+# For Kernelversions < 2.4.20 ZLIB-Patch is applied, if 
+# filesystem option is set and ZLIB-Patch is not already there 
+#
+# Maybe some sed/awk experts would make it better, but I'm not
+# one of them. Feel free to make it better
+# 
+# Thomas (tglx@linutronix.de)
+#
+# $Id: patchin.sh,v 1.28 2004/10/02 22:14:38 gleixner Exp $
+#
+# 24-05-2004 havasi Patch fs/Kconfig
+# 05-05-2004 tglx Include include/mtd
+# 12-06-2003 dwmw2 Leave out JFFS1, do Makefile.common only if it exists.
+# 27-05-2003 dwmw2 Link Makefile to Makefile.common since we moved them around
+# 02-10-2003 tglx replaced grep -m by head -n 1, as older grep versions don't support -m	
+# 03-08-2003 tglx -c option for copying files to kernel tree instead of linking
+#		  moved file selection to variables
+
+# Preset variables
+FILESYSTEMS="no"
+BK="no"
+VERSION=0
+PATCHLEVEL=0
+SUBLEVEL=0
+ZLIBPATCH="no"
+RSLIBPATCH="no"
+DOCPATCH="no"
+CONFIG="Config.in"
+LNCP="ln -sf"
+METHOD="Link"
+
+
+# MTD - files and directories
+MTD_DIRS="drivers/mtd drivers/mtd/chips drivers/mtd/devices drivers/mtd/maps drivers/mtd/nand include/linux/mtd include/mtd"
+MTD_FILES="*.[ch] Makefile Rules.make"
+
+# JFFS2 files and directories
+FS_DIRS="fs/jffs2"
+FS_FILES="*.[ch] Makefile Rules.make"
+# kernel version < 2.4.20 needs zlib headers
+FS_INC_BEL2420="jffs*.h workqueue.h z*.h rb*.h suspend.h"
+# kernel version < 2.5.x
+FS_INC_BEL25="jffs2*.h workqueue.h rb*.h suspend.h"
+# kernelversion >= 2.5
+FS_INC_25="jffs2*.h"
+FS_INC_DIR="include/linux"
+
+# shared ZLIB patch
+ZLIB_DIRS="lib/zlib_deflate lib/zlib_inflate"
+ZLIB_FILES="*.[ch] Makefile"
+# shared REED_SOLOMON patch
+RSLIB_DIRS="lib/reed_solomon"
+RSLIB_FILES="*.[ch]"
+RSLIB_INC_DIR="include/linux"
+RSLIB_INC="rslib.h"
+# Documentation
+DOC_DIRS="Documentation/DocBook"
+DOC_FILES="*.tmpl"
+
+# Make text utils not suck
+export LANG=C
+export LC_ALL=C
+
+# Display usage of this script
+usage () {
+	echo "usage:  $0 [-c] [-j] kernelpath"
+	echo "   -c  -- copy files to kernel tree instead of building links"
+	echo "   -j  -- include jffs2 filesystem" 
+	echo "   -b  -- Check files out for write from BK" 
+	exit 1
+}
+
+# Function to patch kernel source
+patchit () {
+for DIR in $PATCH_DIRS 
+do
+	echo $DIR
+	mkdir -p $DIR
+	cd $TOPDIR/$DIR
+	FILES=`ls $PATCH_FILES 2>/dev/null`
+	if [ "$BK" = "yes" -a -d $DIR/SCCS ]; then
+	    pushd $LINUXDIR/$DIR
+	    bk co -ql $FILES
+	    popd
+	fi
+	for FILE in $FILES 
+	do
+		# If there's a Makefile.common it goes in place of Makefile
+		if [ "$FILE" = "Makefile" -a -r $TOPDIR/$DIR/Makefile.common ]; then
+		    if test $PATCHLEVEL -lt 5; then
+			rm -f $LINUXDIR/$DIR/Makefile.common 2>/dev/null
+			$LNCP $TOPDIR/$DIR/Makefile.common $LINUXDIR/$DIR/Makefile.common
+			SRCFILE=Makefile.24
+		    else
+			SRCFILE=Makefile.common
+		    fi
+		else
+		    SRCFILE=$FILE
+		fi
+		rm -f $LINUXDIR/$DIR/$FILE 2>/dev/null
+		$LNCP $TOPDIR/$DIR/$SRCFILE $LINUXDIR/$DIR/$FILE
+	done
+	cd $LINUXDIR
+done	
+}
+
+
+# Start of script
+
+# Get commandline options
+while getopts cjb opt
+do
+    case "$opt" in
+      j)  FILESYSTEMS=yes;;
+      c)  LNCP="cp -f"; METHOD="Copy";;
+      b)  BK=yes;;
+      \?)
+	  usage;
+    esac
+done
+shift `expr $OPTIND - 1`
+LINUXDIR=$1
+
+if [ -z $LINUXDIR ]; then
+    usage;
+fi
+
+if [ ! -f $LINUXDIR/Makefile -a "$BK" = "yes" ]; then
+    pushd $LINUXDIR
+    bk co Makefile
+    popd
+fi
+
+# Check if kerneldir contains a Makefile
+if [ ! -f $LINUXDIR/Makefile ] 
+then 
+	echo "Directory $LINUXDIR does not exist or is not a kernel source directory";
+	exit 1;
+fi
+
+# Get kernel version
+VERSION=`grep -s VERSION <$LINUXDIR/Makefile | head -n 1 | sed s/'VERSION = '//`
+PATCHLEVEL=`grep -s PATCHLEVEL <$LINUXDIR/Makefile | head -n 1 | sed s/'PATCHLEVEL = '//`
+SUBLEVEL=`grep -s SUBLEVEL <$LINUXDIR/Makefile | head -n 1 | sed s/'SUBLEVEL = '//`
+
+# Can we handle this ?
+if test $VERSION -ne 2 -o $PATCHLEVEL -lt 4
+then 
+	echo "Cannot patch kernel version $VERSION.$PATCHLEVEL.$SUBLEVEL";
+	exit 1;
+fi
+
+# Use Kconfig instead of Config.in for Kernels >= 2.5
+if test $PATCHLEVEL -gt 4
+then
+	CONFIG="Kconfig";
+fi
+MTD_FILES="$MTD_FILES $CONFIG"
+
+# Have we to use ZLIB PATCH ? 
+if [ "$FILESYSTEMS" = "yes" ]
+then
+	PATCHDONE=`grep -s zlib_deflate $LINUXDIR/lib/Makefile | head -n 1`
+	if test $PATCHLEVEL -eq 4 -a $SUBLEVEL -lt 20 
+	then
+		if [ "$PATCHDONE" = "" ] 
+		then
+			ZLIBPATCH=yes;
+		fi
+	fi
+fi
+
+# Have we to use REED_SOLOMON PATCH ?
+PATCHDONE=`grep -s reed_solomon $LINUXDIR/lib/Makefile | head -n 1`
+if [ "$PATCHDONE" = "" ]
+then
+	RSLIBPATCH=yes;
+fi
+
+# Have we to use DOCUMENTATION PATCH ?
+PATCHDONE=`grep -s mtdnand $LINUXDIR/$DOC_DIRS/Makefile | head -n 1`
+if [ "$PATCHDONE" = "" ]
+then
+    if test $PATCHLEVEL -gt 4 
+    then
+	DOCPATCH=yes;
+    fi
+fi
+
+# Check which header files we need depending on kernel version
+HDIR="include/linux"
+if test $PATCHLEVEL -eq 4 
+then	
+	# 2.4 below 2.4.20 zlib headers are neccecary
+	if test $SUBLEVEL -lt 20
+	then
+		JFFS2_H=$FS_INC_BEL2420
+	else
+		JFFS2_H=$FS_INC_BEL25
+	fi
+else
+	#	>= 2.5
+	JFFS2_H=$FS_INC_25
+fi
+
+echo Patching $LINUXDIR 
+echo Include Filesytems: $FILESYSTEMS
+echo Zlib-Patch needed: $ZLIBPATCH
+echo RS-Lib-Patch needed: $RSLIBPATCH
+echo Documentation Patch needed: $DOCPATCH
+echo Method: $METHOD
+read -p "Can we start now ? [y/N]" ANSWER
+echo ""
+
+if [ "$ANSWER" != "y" ]
+then
+	echo Patching Kernel cancelled
+	exit 1;
+fi
+
+# Here we go
+cd `dirname $0`
+THISDIR=`pwd`
+TOPDIR=`dirname $THISDIR`
+
+cd $LINUXDIR
+
+# make directories, if necessary
+# remove existing files/links and link/copy the new ones
+echo "Patching MTD"
+PATCH_DIRS=$MTD_DIRS
+PATCH_FILES=$MTD_FILES
+patchit;
+
+# check, if we have to include JFFS(2)
+if [ "$FILESYSTEMS" = "yes" ]
+then
+	echo "Patching JFFS(2)"
+	
+	PATCH_DIRS=$FS_DIRS
+	PATCH_FILES=$FS_FILES
+	patchit;
+
+	PATCH_DIRS=$FS_INC_DIR
+	PATCH_FILES=$JFFS2_H
+	patchit;
+
+	# this is the ugly part	
+	PATCHDONE=`grep -s jffs2 fs/Makefile | head -n 1`
+	if [ "$PATCHDONE" = "" ]
+	then
+		echo "Add JFFS2 to Makefile and Config.in manually. JFFS2 is included as of 2.4.12"	
+	else
+		if test $PATCHLEVEL -lt 5
+		then
+			JFFS=`grep -n JFFS fs/Config.in | head -n 1 | sed s/:.*//`
+			CRAMFS=`grep -n CRAMFS fs/Config.in | head -n 1 | sed s/:.*//`
+			let JFFS=JFFS-1
+			let CRAMFS=CRAMFS-1
+			sed "$JFFS"q fs/Config.in >Config.tmp
+			cat $TOPDIR/fs/Config.in >>Config.tmp
+			sed 1,"$CRAMFS"d fs/Config.in >>Config.tmp
+			mv -f Config.tmp fs/Config.in
+			
+			if [ -f include/linux/crc32.h ] 
+			then
+				# check, if it is already defined there
+				CRC32=`grep -s 'crc32(' include/linux/crc32.h | head -n 1`
+				if [ "$CRC32" = "" ]
+				then
+					# patch in header from fs/jffs2
+					LASTLINE=`grep -n '#endif' include/linux/crc32.h | head -n 1 | sed s/:.*//`
+					let LASTLINE=LASTLINE-1
+					sed "$LASTLINE"q include/linux/crc32.h >Crc32.tmp
+					cat fs/jffs2/crc32.h >>Crc32.tmp
+					echo "#endif" >>Crc32.tmp
+					mv -f Crc32.tmp include/linux/crc32.h
+				fi
+			else
+				rm -f include/linux/crc32.h
+				$LNCP $TOPDIR/fs/jffs2/crc32.h include/linux
+			fi
+		
+                else
+			JFFS=`grep -n JFFS fs/Kconfig | head -n 1 | sed s/:.*//`
+			CRAMFS=`grep -n CRAMFS fs/Kconfig | head -n 1 | sed s/:.*//`
+			let JFFS=JFFS-1
+			let CRAMFS=CRAMFS-1
+			sed "$JFFS"q fs/Kconfig >Kconfig.tmp
+			cat $TOPDIR/fs/Kconfig >>Kconfig.tmp
+			sed 1,"$CRAMFS"d fs/Kconfig >>Kconfig.tmp
+			mv -f Kconfig.tmp fs/Kconfig
+                fi
+	fi
+fi
+
+if [ "$ZLIBPATCH" = "yes" ]
+then
+	echo "Patching ZLIB"
+	
+	PATCH_DIRS=$ZLIB_DIRS
+	PATCH_FILES=$ZLIB_FILES
+	patchit;
+
+	patch -p1 -i $TOPDIR/lib/patch-Makefile
+fi
+
+echo "Patching RS Lib"
+if [ "$RSLIBPATCH" = "yes" ]
+then
+	if test $PATCHLEVEL -eq 4 
+	then
+		patch -p1 -i $TOPDIR/lib/Makefile24-rs.diff
+		patch -p1 -i $TOPDIR/lib/Config.in-rs.diff
+	else
+		patch -p1 -i $TOPDIR/lib/Makefile26-rs.diff
+		patch -p1 -i $TOPDIR/lib/Kconfig-rs.diff
+	fi
+	
+	mkdir -p lib/reed_solomon
+	
+fi
+
+	PATCH_DIRS=$RSLIB_DIRS
+	PATCH_FILES=$RSLIB_FILES
+	patchit;
+
+	PATCH_DIRS=$RSLIB_INC_DIR
+	PATCH_FILES=$RSLIB_INC
+	patchit;
+	if test $PATCHLEVEL -eq 6 
+	then
+		mv -f lib/reed_solomon/rslib.c lib/reed_solomon/reed_solomon.c
+	fi
+
+if test $PATCHLEVEL -eq 4 
+then
+	PATCH_DIRS=$RSLIB_DIRS
+	PATCH_FILES="Makefile24"
+	patchit;
+	rm -f $LINUXDIR/lib/reed_solomon/Makefile 2>/dev/null
+	mv -f $LINUXDIR/lib/reed_solomon/Makefile24 $LINUXDIR/lib/reed_solomon/Makefile
+else	
+	PATCH_DIRS=$RSLIB_DIRS
+	PATCH_FILES="Makefile26"
+	patchit;
+	rm -f $LINUXDIR/lib/reed_solomon/Makefile 2>/dev/null
+	mv -f $LINUXDIR/lib/reed_solomon/Makefile26 $LINUXDIR/lib/reed_solomon/Makefile
+fi
+
+echo "Patching Documentation"
+if [ "$DOCPATCH" = "yes" ]
+then
+    patch -p1 -i $TOPDIR/$DOC_DIRS/Makefile.diff
+fi
+
+PATCH_DIRS=$DOC_DIRS
+PATCH_FILES=$DOC_FILES
+patchit;
+
+
+echo "Patching done"
+
+# some BUG() definitions were moved to asm/bug.h in the 2.5 kernels
+#  so fake having one to avoid build errors.
+if test $PATCHLEVEL -lt 5; then
+	if [ ! -r $LINUXDIR/include/asm/bug.h ]; then
+		touch $LINUXDIR/include/asm/bug.h
+	fi
+fi
+
+if test $PATCHLEVEL -lt 5
+then 
+	# FIXME: SED/AWK experts should know how to do it automagic
+	echo "Please update Documentation/Configure.help from $TOPDIR/Documentation/Configure.help"
+fi
+

--------------070908010709010006020101--
