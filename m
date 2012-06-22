Received: from lvk-gate.cmc.msu.ru ([188.44.42.233] helo=mail.lvk.cs.msu.su)
 by bombadil.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Si6MP-00025U-Ow
 for linux-mtd@lists.infradead.org; Fri, 22 Jun 2012 16:05:28 +0000
From: "Nikita V. Youshchenko" <nyoushchenko@mvista.com>
To: Richard Weinberger <richard@nod.at>
Subject: ubi_update_fastmap: could not find an early PEB
Date: Fri, 22 Jun 2012 20:05:01 +0400
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <201206222005.02308@blacky.localdomain>
Cc: Rob Taylor <rtaylor@mvista.com>, Alexander Kaliadin <akaliadin@mvista.com>,
 linux-mtd@lists.infradead.org, Pavan Jadhav <pjadhav@mvista.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello.

I'm trying to make ubi fastmap working on a vendor kernel, based on linux 
3.0.15, on target hardware. For that I've successfully backported the 
patchset and it's dependences from 'fastmap' branch of 
git://git.infradead.org/linux-ubi.git

I'm able to compile and boot resulting kernel.

However, as for now, I can't make it working.

# ubiattach /dev/ubi_ctrl -m 2
UBI: fastmap pool size: 256
UBI: attaching mtd2 to ubi0
UBI: physical eraseblock size:   131072 bytes (128 KiB)
UBI: logical eraseblock size:    126976 bytes
UBI: smallest flash I/O unit:    2048
UBI: VID header offset:          2048 (aligned 2048)
UBI: data offset:                4096
UBI: max. sequence number:       0
UBI: attached mtd2 to ubi0
UBI: MTD device name:            "nand.ubi"
UBI: MTD device size:            992 MiB
UBI: number of good PEBs:        7918
UBI: number of bad PEBs:         18
UBI: number of corrupted PEBs:   0
UBI: max. allowed volumes:       128
UBI: wear-leveling threshold:    4096
UBI: number of internal volumes: 1
UBI: number of user volumes:     1
UBI: available PEBs:             4531
UBI: total number of reserved PEBs: 3387
UBI: number of PEBs reserved for bad PEB handling: 79
UBI: max/mean erase counter: 4/1
UBI: image sequence number:  0
UBI: background thread "ubi_bgt0d" started, PID 2705
UBI device number 0, total 7918 LEBs (1005395968 bytes, 958.8 MiB), 
available 4531 LEBs (575328256 bytes, 548.7 MiB), LEB size 126976 bytes 
(124.0 KiB)

# ubidetach /dev/ubi_ctrl -m 2
UBI error: ubi_update_fastmap: could not find an early PEB
UBI: mtd2 is detached from ubi0


... and fastmap is not created and thus not used.

As far as I understand, this happens because all PEBs at the beginning of 
device are occupied. But this will always be the case after creating image 
with ubinize...

How to overcome this?

Nikita
