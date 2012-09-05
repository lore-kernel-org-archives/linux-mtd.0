Received: from mail-bk0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T9F8L-0000Ew-As
 for linux-mtd@lists.infradead.org; Wed, 05 Sep 2012 12:55:07 +0000
Received: by bkcji2 with SMTP id ji2so236932bkc.36
 for <linux-mtd@lists.infradead.org>; Wed, 05 Sep 2012 05:55:02 -0700 (PDT)
Message-ID: <50474BA3.2070404@gmail.com>
Date: Wed, 05 Sep 2012 14:54:59 +0200
From: simon widmer <simonxwidmer@gmail.com>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: UBIFS Informations
References: <503F7685.8030707@gmail.com>
 <1346673385.3061.48.camel@sauron.fi.intel.com>
In-Reply-To: <1346673385.3061.48.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Update: I tested on Kernel 2.6.24-24 without success. The same manner if 
i want to mount the image. What I discovered is that i noted earlier 
that i have to compile with:

$ mkfs.ubifs -q -r $PATH\/data_h -m 2048 -e 129024 -c 2047 -o temp_h.img
$ ubinize -o data_h.img -m 2048 -p 128KiB -s 512 ubinize_h.cfg

and i have no idea what option "-q" is (neither does mkfs.ubifs). so I 
just kicked it and compiled with:

$ mkfs.ubifs -r $PATH\/data_h -m 2048 -e 129024 -c 2047 -o temp_h.img
$ ubinize -o data_h.img -m 2048 -p 128KiB -s 512 ubinize_h.cfg

ubinize.cfg looks this way:

[data_h]
mode=ubi
image=temp_h.img
vol_id=0
vol_size=4MiB
vol_type=static
vol_name=data_h
vol_flags=autoresize

and the attaching procedure as follows:

UBI: attaching mtd8 to ubi0
UBI: physical eraseblock size:   131072 bytes (128 KiB)
UBI: logical eraseblock size:    129024 bytes
UBI: smallest flash I/O unit:    2048
UBI: sub-page size:              512
UBI: VID header offset:          512 (aligned 512)
UBI: data offset:                2048
UBI: attached mtd8 to ubi0
UBI: MTD device name:            "data_h"
UBI: MTD device size:            4 MiB
UBI: number of good PEBs:        32
UBI: number of bad PEBs:         0
UBI: max. allowed volumes:       128
UBI: wear-leveling threshold:    4096
UBI: number of internal volumes: 1
UBI: number of user volumes:     1
UBI: available PEBs:             0
UBI: total number of reserved PEBs: 32
UBI: number of PEBs reserved for bad PEB handling: 2
UBI: max/mean erase counter: 2/0
UBI: image sequence number: 165352633
UBI: background thread "ubi_bgt0d" started, PID 497

and finally the mounting procedure:

UBIFS error (pid 529): ubifs_read_node: bad node type (0 but expected 6)
UBIFS error (pid 529): ubifs_read_node: bad node at LEB 0:0
mount: wrong fs type, bad option, bad superblock on ubi0_0,
        missing codepage or helper program, or other error
        (UBIFS error (pid 529): ubifs_read_node: bad node type (0 but 
expected 6)
for several filesystems (e.g. nfUBIFS error (pid 529): ubifs_read_node: 
bad node at LEB 0:0
s, cifs) you might
        need a /sbin/mount.<type> helper program)
        In some cases useful info is found in syslog - try
        dmesg | tail  or so
