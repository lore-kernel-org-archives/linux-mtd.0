Received: from mail-qg0-x229.google.com ([2607:f8b0:400d:c04::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YTqdU-0000sk-Al
 for linux-mtd@lists.infradead.org; Fri, 06 Mar 2015 11:41:44 +0000
Received: by qgef51 with SMTP id f51so11785796qge.0
 for <linux-mtd@lists.infradead.org>; Fri, 06 Mar 2015 03:41:21 -0800 (PST)
MIME-Version: 1.0
Date: Fri, 6 Mar 2015 19:41:21 +0800
Message-ID: <CAOx4H9D7AW8GFVfwbuWHP1zWsU3jE15HF3jndwX2tHF5rRHopQ@mail.gmail.com>
Subject: Problem accessing /dev/mtdblockn
From: t kevin <kevint324@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I'm encountering a strange problem with Kernel version 2.6.36.
Accessing mtd device is fine but not the corresponding mtdblock device.

root@home:/tmp# dd if=/dev/mtd9 of=m9.bin
13247+1 records in
13247+1 records out
6782496 bytes (6.5MB) copied, 2.714321 seconds, 2.4MB/s

root@home:/tmp# dd if=/dev/mtdblock9 of=m9b.bin
attempt to access beyond end of device
mtdblock9: rw=0, want=13248, limit=13247
Buffer I/O error on device mtdblock9, logical block 6623
dd: /dev/mtdblock9: Input/output error

ls -l :
-rw-r--r--    1 root     root       6782496 Jan  1 21:19 m9.bin
-rw-r--r--    1 root     root       6778880 Jan  1 21:19 m9b.bin

mtdinfo
mtd9
Name:                          testos
Type:                           nor
Eraseblock size:                65536 bytes, 64.0 KiB
Amount of eraseblocks:          103 (6782496 bytes, 6.5 MiB)
Minimum input/output unit size: 1 byte
Sub-page size:                  1 byte
Character device major/minor:   90:18
Bad blocks are allowed:         false
Device is writable:             false



Please get me some clue what went wrong.

Thans a lot
Kevin
