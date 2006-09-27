Received: from nf-out-0910.google.com ([64.233.182.184])
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GSRkQ-0000Fg-Nc
	for linux-mtd@lists.infradead.org; Wed, 27 Sep 2006 06:14:19 +0100
Received: by nf-out-0910.google.com with SMTP id l37so401718nfc
	for <linux-mtd@lists.infradead.org>;
	Tue, 26 Sep 2006 22:13:18 -0700 (PDT)
Message-ID: <67f0a57c0609262213j56993210h654450841dcac92f@mail.gmail.com>
Date: Tue, 26 Sep 2006 23:13:17 -0600
From: "Martin Wedepohl" <martinatgd@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: JFFS2 problem with filename length > 7
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I'm running into a problem with filename lengths greater than 7 characters.
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
