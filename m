Received: from smtp1.gdcanada.com ([209.29.50.245] helo=gdcanada.com)
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GSKTZ-0002nP-Jr
	for linux-mtd@lists.infradead.org; Tue, 26 Sep 2006 22:28:26 +0100
Content-Class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: JFFS2 problem with filename length > 7
Date: Tue, 26 Sep 2006 15:27:52 -0600
Message-ID: <2142BCFA1F7F0D468F8EE6C8DE719E6801C23A6A@CGYSVW100.gdcan.com>
From: "Wedepohl, Martin" <Martin.Wedepohl@gdcanada.com>
To: <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I'm running into a problem with filename lengths greater than 7
characters.
Everything is fine until I unmount and then remount the device.

I'm running Linux 2.6.17 on a PowerPC 5200.

Any help would be greatly appreciated

bash-3.00# uname -r
2.6.17-g4e21eb5f-dirty
bash-3.00# eraseall /dev/mtd7
Erased 2048 Kibyte @ 0 -- 100% complete.
bash-3.00# mount -t jffs2 /dev/mtdblock7 /mnt
bash-3.00# touch /mnt/1
bash-3.00# touch /mnt/22
bash-3.00# touch /mnt/333
bash-3.00# touch /mnt/4444
bash-3.00# touch /mnt/55555
bash-3.00# touch /mnt/666666
bash-3.00# touch /mnt/7777777
bash-3.00# touch /mnt/88888888
bash-3.00# touch /mnt/999999999
bash-3.00# touch /mnt/aaaaaaaaaa
bash-3.00# ls -al /mnt
total 4
drwxr-xr-x   3 root root    0 Jan  1 01:01 .
drwxr-xr-x  15 7099  500 4096 Sep 26  2006 ..
-rw-r--r--   1 root root    0 Jan  1 01:01 1
-rw-r--r--   1 root root    0 Jan  1 01:01 22
-rw-r--r--   1 root root    0 Jan  1 01:01 333
-rw-r--r--   1 root root    0 Jan  1 01:01 4444
-rw-r--r--   1 root root    0 Jan  1 01:01 55555
-rw-r--r--   1 root root    0 Jan  1 01:01 666666
-rw-r--r--   1 root root    0 Jan  1 01:01 7777777
-rw-r--r--   1 root root    0 Jan  1 01:01 88888888
-rw-r--r--   1 root root    0 Jan  1 01:01 999999999
-rw-r--r--   1 root root    0 Jan  1 01:01 aaaaaaaaaa
bash-3.00# umount /dev/mtdblock7
bash-3.00# mount -t jffs2 /dev/mtdblock7 /mnt
bash-3.00# ls -al /mnt
ls: /mnt/8888: No such file or directory
ls: /mnt/9999: No such file or directory
ls: /mnt/aaaa: No such file or directory
total 4
drwxr-xr-x   3 root root    0 Jan  1 01:00 .
drwxr-xr-x  15 7099  500 4096 Sep 26  2006 ..
-rw-r--r--   1 root root    0 Jan  1 01:01 1
-rw-r--r--   1 root root    0 Jan  1 01:01 22
-rw-r--r--   1 root root    0 Jan  1 01:01 333
-rw-r--r--   1 root root    0 Jan  1 01:01 4444
-rw-r--r--   1 root root    0 Jan  1 01:01 55555
-rw-r--r--   1 root root    0 Jan  1 01:01 666666
-rw-r--r--   1 root root    0 Jan  1 01:01 7777777
bash-3.00#

The information contained in this e-mail message is PRIVATE. It may =
contain confidential information and may be legally privileged. It is =
intended for the exclusive use of the addressee(s). If you are not the =
intended recipient, you are hereby notified that any dissemination, =
distribution or reproduction of this communication is strictly =
prohibited. If the intended recipient(s) cannot be reached or if a =
transmission problem has occurred, please notify the sender immediately =
by return e-mail and destroy all copies of this message.=20
Thank you.=20
