Received: from wproxy.gmail.com ([64.233.184.200])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1D1sDF-00030e-Na
	for linux-mtd@lists.infradead.org; Thu, 17 Feb 2005 15:25:27 -0500
Received: by wproxy.gmail.com with SMTP id 40so242251wri
	for <linux-mtd@lists.infradead.org>;
	Thu, 17 Feb 2005 12:25:22 -0800 (PST)
Message-ID: <52249cdc0502171225706e3cf8@mail.gmail.com>
Date: Thu, 17 Feb 2005 15:25:22 -0500
From: Joe Barnett <joseph.barnett@gmail.com>
To: linux-mtd@lists.infradead.org
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: symlink corruption in jffs2
Reply-To: Joe Barnett <joseph.barnett@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I am trying to put a jffs2 filesystem down on a G5 ppc64 system. I can
build the filesystem fine, and get it into flash, mount it ect. The
problem I am finding is that a large number of the symbolic links are
corrupt. The file pointed to has garbage appended to the name (see
below). If I try to create a new symlink, it also gets corrupted. I
have turned on JFFS2 debug to level 3 and am still unable to locate
the source of the issue...  I am using the following options when I
run mkfs.jffs2:

mkfs.jffs2 -o myflashfs.img -d myroot -e 20000

I am using Common Intel StrataFlash, which I have confirmed that
driver is functional, as I can read and write large file to and from
the flash fine, so it isn't in the driver.  Has anyone seen this issue
before or does anyone have an idea of what may be causing this?  I did
see Any help would be greatly appreciated.

Kind regards,
Joseph Barnett

SYM LINK CORRUPTION:
:/flash/lib# ls -l
total 4934
drwxr-xr-x  2  500  500       0 Sep 10  2004 init
-rwxr-xr-x  1 root root   94420 Oct 14  2004 ld-2.3.2.so
lrwxrwxrwx  1 root root      11 Feb 17  2005 ld.so.1 -> ld-2.3.2.so?10
-rw-r--r--  1 root root    4832 Oct 14  2004 libBrokenLocale-2.3.2.so
lrwxrwxrwx  1 root root      24 Feb 17  2005 libBrokenLocale.so.1 ->
libBrokenLocale-2.3.2.so
-rw-r--r--  1 root root   14636 Oct 14  2004 libSegFault.so
lrwxrwxrwx  1 root root      15 Feb 17  2005 libacl.so.1 -> libacl.so.1.1.0?.3
-rw-r--r--  1 root root   31124 Feb  3  2004 libacl.so.1.1.0
-rw-r--r--  1 root root   11384 Oct 14  2004 libanl-2.3.2.so
lrwxrwxrwx  1 root root      15 Feb 17  2005 libanl.so.1 ->
libanl-2.3.2.so?.so?so
lrwxrwxrwx  1 root root      16 Feb 17  2005 libattr.so.1 -> libattr.so.1.1.0
-rw-r--r--  1 root root   17216 Apr 28  2004 libattr.so.1.1.0
lrwxrwxrwx  1 root root      15 Feb 17  2005 libblkid.so.1 -> libblkid.so.1.0?3?
-rw-r--r--  1 root root   31628 May  5  2004 libblkid.so.1.0
-rw-r--r--  1 root root 1298544 Oct 14  2004 libc-2.3.2.so
lrwxrwxrwx  1 root root      13 Feb 17  2005 libc.so.6 -> libc-2.3.2.so?
lrwxrwxrwx  1 root root      14 Feb 17  2005 libcap.so.1 -> libcap.so.1.10
-rw-r--r--  1 root root   19352 Apr 14  2004 libcap.so.1.10
lrwxrwxrwx  1 root root      17 Feb 17  2005 libcom_err.so.2 ->
libcom_err.so.2.1?
-rw-r--r--  1 root root   11824 May  5  2004 libcom_err.so.2.1
-rw-r--r--  1 root root   21104 Oct 14  2004 libcrypt-2.3.2.so
lrwxrwxrwx  1 root root      17 Feb 17  2005 libcrypt.so.1 ->
libcrypt-2.3.2.so?o?so
lrwxrwxrwx  1 root root      15 Feb 17  2005 libdb.so.2 ->
libdb1-2.2.5.so?.so?so
-rw-r--r--  1 root root  280284 Jun 10  2004 libdb.so.3
-rw-r--r--  1 root root   56140 Apr 12  2004 libdb1-2.2.5.so
lrwxrwxrwx  1 root root      15 Feb 17  2005 libdb1.so.2 ->
libdb1-2.2.5.so?.76?.so?
lrwxrwxrwx  1 root root      15 Feb 17  2005 libdb2.so.2 ->
libdb2.so.2.7.7?.76?.so?
-rw-r--r--  1 root root  312572 Jun 10  2004 libdb2.so.2.7.7
-rw-r--r--  1 root root   11252 Oct 14  2004 libdl-2.3.2.so
lrwxrwxrwx  1 root root      14 Feb 17  2005 libdl.so.2 -> libdl-2.3.2.so
lrwxrwxrwx  1 root root      13 Feb 17  2005 libe2p.so.2 -> libe2p.so.2.3?so
-rw-r--r--  1 root root   24944 May  5  2004 libe2p.so.2.3
lrwxrwxrwx  1 root root      16 Feb 17  2005 libext2fs.so.2 -> libext2fs.so.2.4
-rw-r--r--  1 root root  109108 May  5  2004 libext2fs.so.2.4
-rw-r--r--  1 root root   56732 Sep  8  2004 libgcc_s.so.1
lrwxrwxrwx  1 root root      17 Feb 17  2005 libhistory.so.4 ->
libhistory.so.4.3?
-rw-r--r--  1 root root   31468 Jun 13  2004 libhistory.so.4.3
-rw-r--r--  1 root root  478124 Oct 14  2004 libm-2.3.2.so
lrwxrwxrwx  1 root root      13 Feb 17  2005 libm.so.6 ->
libm-2.3.2.so?.25.0?2-2.10.0.so?libbz2.so.1.0.2??xZZZZZZZZZZZZZZ
-rw-r--r--  1 root root   18604 Oct 14  2004 libmemusage.so
lrwxrwxrwx  1 root root      17 Feb 17  2005 libncurses.so.5 ->
libncurses.so.5.4?
-rw-r--r--  1 root root  291516 May 27  2004 libncurses.so.5.4
-rw-r--r--  1 root root   78036 Oct 14  2004 libnsl-2.3.2.so
lrwxrwxrwx  1 root root      15 Feb 17  2005 libnsl.so.1 ->
libnsl-2.3.2.so?.so?2.so
-rw-r--r--  1 root root   32224 Oct 14  2004 libnss_compat-2.3.2.so
lrwxrwxrwx  1 root root      22 Feb 17  2005 libnss_compat.so.2 ->
libnss_compat-2.3.2.so
-rw-r--r--  1 root root   14488 Oct 14  2004 libnss_dns-2.3.2.so
lrwxrwxrwx  1 root root      19 Feb 17  2005 libnss_dns.so.2 ->
libnss_dns-2.3.2.so?so
-rw-r--r--  1 root root   43060 Oct 14  2004 libnss_files-2.3.2.so
lrwxrwxrwx  1 root root      21 Feb 17  2005 libnss_files.so.2 ->
libnss_files-2.3.2.so?2.10.0.so?libbz2.so.1.0.2??xZZZZZZZZZZZZZZ
-rw-r--r--  1 root root   16852 Oct 14  2004 libnss_hesiod-2.3.2.so
lrwxrwxrwx  1 root root      22 Feb 17  2005 libnss_hesiod.so.2 ->
libnss_hesiod-2.3.2.so
-rw-r--r--  1 root root   38984 Oct 14  2004 libnss_nis-2.3.2.so
lrwxrwxrwx  1 root root      19 Feb 17  2005 libnss_nis.so.2 ->
libnss_nis-2.3.2.so?2.so
-rw-r--r--  1 root root   47452 Oct 14  2004 libnss_nisplus-2.3.2.so
lrwxrwxrwx  1 root root      23 Feb 17  2005 libnss_nisplus.so.2 ->
libnss_nisplus-2.3.2.so?
lrwxrwxrwx  1 root root      14 Feb 17  2005 libpam.so.0 -> libpam.so.0.76
-rw-r--r--  1 root root   37772 Jul  2  2004 libpam.so.0.76
lrwxrwxrwx  1 root root      19 Feb 17  2005 libpam_misc.so.0 ->
libpam_misc.so.0.76?.so?
-rw-r--r--  1 root root   13996 Jul  2  2004 libpam_misc.so.0.76
lrwxrwxrwx  1 root root      15 Feb 17  2005 libpamc.so.0 -> libpamc.so.0.76?
-rw-r--r--  1 root root   15232 Jul  2  2004 libpamc.so.0.76
-rw-r--r--  1 root root   10292 Oct 14  2004 libpcprofile.so
lrwxrwxrwx  1 root root      16 Feb 17  2005 libpopt.so.0 -> libpopt.so.0.0.0
-rw-r--r--  1 root root   34736 Aug 29  2004 libpopt.so.0.0.0
-rw-r--r--  1 root root   51972 Apr 13  2004 libproc.so.3.2.1
-rw-r--r--  1 root root   85254 Oct 14  2004 libpthread-0.10.so
lrwxrwxrwx  1 root root      18 Feb 17  2005 libpthread.so.0 ->
libpthread-0.10.so
lrwxrwxrwx  1 root root      18 Feb 17  2005 libreadline.so.4 ->
libreadline.so.4.3
-rw-r--r--  1 root root  202856 Jun 13  2004 libreadline.so.4.3
-rw-r--r--  1 root root   64124 Oct 14  2004 libresolv-2.3.2.so
lrwxrwxrwx  1 root root      18 Feb 17  2005 libresolv.so.2 ->
libresolv-2.3.2.so
-rw-r--r--  1 root root   28460 Oct 14  2004 librt-2.3.2.so
lrwxrwxrwx  1 root root      14 Feb 17  2005 librt.so.1 -> librt-2.3.2.so
lrwxrwxrwx  1 root root      17 Feb 17  2005 libslang.so.1 -> libslang.so.1.4.9?
lrwxrwxrwx  1 root root      22 Feb 17  2005 libslang.so.1-UTF8 ->
libslang.so.1-UTF8.4.9
-rw-r--r--  1 root root  436276 Sep 22  2004 libslang.so.1-UTF8.4.9
-rw-r--r--  1 root root  436024 Sep 22  2004 libslang.so.1.4.9
lrwxrwxrwx  1 root root      12 Feb 17  2005 libss.so.2 -> libss.so.2.0
-rw-r--r--  1 root root   24552 May  5  2004 libss.so.2.0
-rw-r--r--  1 root root   19524 Oct 14  2004 libthread_db-1.0.so
lrwxrwxrwx  1 root root      19 Feb 17  2005 libthread_db.so.1 ->
libthread_db-1.0.so?so
-rw-r--r--  1 root root    8660 Oct 14  2004 libutil-2.3.2.so
lrwxrwxrwx  1 root root      16 Feb 17  2005 libutil.so.1 -> libutil-2.3.2.so
lrwxrwxrwx  1 root root      14 Feb 17  2005 libuuid.so.1 -> libuuid.so.1.2
-rw-r--r--  1 root root   16032 May  5  2004 libuuid.so.1.2
lrwxrwxrwx  1 root root      16 Feb 17  2005 libwrap.so.0 -> libwrap.so.0.7.6
-rw-r--r--  1 root root   36120 Aug 29  2004 libwrap.so.0.7.6
drwxr-xr-x  3  509  503       0 Feb 17  2005 modules
drwxr-xr-x  2  500  500       0 Jul  2  2004 security
:/flash/lib#
