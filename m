Received: from mail-pz0-f43.google.com ([209.85.210.43])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SJPpy-0007Rf-M1
 for linux-mtd@lists.infradead.org; Sun, 15 Apr 2012 13:49:55 +0000
Received: by dadn15 with SMTP id n15so7071090dad.16
 for <linux-mtd@lists.infradead.org>; Sun, 15 Apr 2012 06:49:52 -0700 (PDT)
Message-ID: <4F8AD1E5.6080307@gmail.com>
Date: Sun, 15 Apr 2012 21:49:25 +0800
From: Mark <xiaoming1981.zhang@gmail.com>
MIME-Version: 1.0
To: zxm927@163.com
Subject: Why the nand chip driver "should never return -EBADMSG if it failed
 to read all the request data"
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

During UBIFS power cut tests I get this error message:

...
UBI error: ubi_io_read: error -77 while reading 126976 bytes from PEB
21:4096, read 2048 bytes
UBIFS error (pid 484): ubifs_start_scan: cannot read 126976 bytes from
LEB 18:0, error -5
mount: mounting ubi13_0 on /usr/local/appdata failed: Input/output error
...

I found that's because the nand driver return immediately in an ECC
unrecoverable error. So my question is:
1. Why the nand driver must continue to read all the left data?
2. Why it still can be mount successfully with YAFFS?

And, after I patched the nand driver, in most of the situations the
UBIFS can be successfully recovered, but I still get this error:

...
UBI error: ubi_io_read: error -77 while reading 126976 bytes from PEB
2:4096, read 126976 bytes
UBIFS error (pid 481): insert_node: duplicate sqnum in replay
mount: mounting ubi13_0 on /usr/local/hmt/appdata failed: Invalid argument
...

Does this mean this should never happen to UBIFS? Then what could be the 
reason?
Thank you very much, and my test environment:

# uname -a
Linux (none) 2.6.31-3.3 #10 SMP Wed Apr 11 09:18:13 CST 2012 mips GNU/Linux

# Run this script, and cut power
# while :; do cp -a /usr/local/platform/f2 /usr/local/appdata/ && sync; done

# ls -l /usr/local/platform/f2
-rw-rw-r--    1 506      506        1048576 Apr 11  2012
/usr/local/platform/f2

# xxd f2
0000000: 0001 0203 0405 0607 0809 0a0b 0c0d 0e0f  ................
0000010: 0001 0203 0405 0607 0809 0a0b 0c0d 0e0f  ................
0000020: 0001 0203 0405 0607 0809 0a0b 0c0d 0e0f  ................
0000030: 0001 0203 0405 0607 0809 0a0b 0c0d 0e0f  ................

# mount
rootfs on / type rootfs (rw)
...
ubi12:platform on /usr/local/platform type ubifs (rw,relatime)
ubi13_0 on /usr/local/appdata type ubifs (rw,sync,relatime)
ubi14_0 on /usr/local/.appmid type ubifs (rw,relatime)

-- 
Have fun,
Mark Zhang
