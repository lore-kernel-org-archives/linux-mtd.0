Received: from [212.122.115.61] (helo=ia.mail)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BNSeE-0001KQ-9c
	for linux-mtd@lists.infradead.org; Tue, 11 May 2004 09:29:58 +0100
Received: from josepascual by ia.mail
	with SMTP (MDaemon.PRO.v6.7.9.R)
	for <linux-mtd@lists.infradead.org>; Tue, 11 May 2004 10:39:11 +0200
From: "Jose Pascual" <josepascual@almudi.com>
To: <linux-mtd@lists.infradead.org>
Date: Tue, 11 May 2004 10:38:53 +0200
Message-ID: <035301c43733$643a7930$0319a8c0@dominio1.ingalmudi.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Subject: symbolic link with jffs2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I'm using kernel 2.4.25-vrs2 and my own patch for my specific board.
I updated my kernel to 14/4/2004 MTD snapshot (cvs).

I have mounted a jffs2 fs in mtdblock2 (nor in my case) but when I make
symbolic link something doesn't work as you can se below, (appear some ?
simbols in name, so symbolic links are broken)

do you have seen this problem before? any suggestion?

----------------------------------------------------------------
[root@IA-CPU-9200 lib]$ls -la
total 1534
drwxrwxrwx    1 root     root            0 Jan  1 00:18 .
drwxr-xr-x    1 root     root            0 Jan  1 00:17 ..
-rwxr-xr-x    1 root     root       116853 Dec 21  2003 ld-2.2.3.so
lrwxrwxrwx    1 root     root           11 Jan  1 00:16 ld-linux.so.2 ->
ld-2.2.3.so?1?.so?
-rwxr-xr-x    1 root     root      1348598 Dec 21  2003 libc-2.2.4.so
lrwxrwxrwx    1 root     root           13 Jan  1 00:16 libc.so.6 ->
libc-2.2.4.so?.so?
-rwxr-xr-x    1 root     root        29479 Dec 21  2003
libcrypt-2.2.3.so
lrwxrwxrwx    1 root     root           13 Jan  1 00:16 libcrypt.so ->
libcrypt.so.1?.so?
lrwxrwxrwx    1 root     root           17 Jan  1 00:16 libcrypt.so.1 ->
libcrypt-2.2.3.so?
-rwxrwxrwx    1 root     root        74712 Dec 21  2003
libpthread-0.8.so
lrwxrwxrwx    1 root     root           15 Jan  1 00:16 libpthread.so ->
libpthread.so.0?.2
lrwxrwxrwx    1 root     root           17 Jan  1 00:18 libpthread.so.0
-> libpthread-0.8.so?
lrwxrwxrwx    1 root     root           17 Jan  1 00:16
libpthread.so.0.bad -> libpthread-0.8.so?
[root@IA-CPU-9200 lib]$
----------------------------------------------------------------

thank you in advanced
