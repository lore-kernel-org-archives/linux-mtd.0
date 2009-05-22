Received: from a237-248.24online.fi ([84.239.237.248] helo=mail.oliotalo.fi)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1M7UWk-0005Dh-W6
	for linux-mtd@lists.infradead.org; Fri, 22 May 2009 13:11:17 +0000
Received: from [192.168.1.33] (a228-85.24online.fi [84.239.228.85])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.oliotalo.fi (Postfix) with ESMTPSA id E3CCDF000A0
	for <linux-mtd@lists.infradead.org>;
	Fri, 22 May 2009 16:11:07 +0300 (EEST)
Message-ID: <4A16A46B.8030302@oliotalo.fi>
Date: Fri, 22 May 2009 16:11:07 +0300
From: =?ISO-8859-1?Q?Kaius_H=E4ggblom?= <kaius@oliotalo.fi>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: Problem to attach NAND MTD-device to UBI
References: <4A169E16.6010305@oliotalo.fi>
In-Reply-To: <4A169E16.6010305@oliotalo.fi>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

If I use ubiformat with parameter -s512 I get the device attached, but 
still ubimkvol
fails:

/ # ./ubiformat /dev/mtd4 -s512
ubiformat: mtd4 (NAND), size 134217728 bytes (1280 MiB), 131072 
eraseblocks of 131072 bytes (1280 KiB), min. I/O size 2048 bytes
libscan: scanning eraseblock 1023 -- 100 % complete 
ubiformat: 1021 eraseblocks are supposedly empty
ubiformat: bad eraseblocks: 29, 912, 991
ubiformat: formatting eraseblock 1023 -- 100 % complete 
/ # ubiattach /dev/ubi_ctrl -m4     
UBI: attaching mtd4 to ubi0
UBI: physical eraseblock size:   131072 bytes (128 KiB)
UBI: logical eraseblock size:    129024 bytes
UBI: smallest flash I/O unit:    2048
UBI: sub-page size:              512
UBI: VID header offset:          512 (aligned 512)
UBI: data offset:                2048
UBI: attached mtd4 to ubi0
UBI: MTD device name:            "NAND_Flash 1"
UBI: MTD device size:            128 MiB
UBI: number of good PEBs:        1021
UBI: number of bad PEBs:         3
UBI: max. allowed volumes:       128
UBI: wear-leveling threshold:    4096
UBI: number of internal volumes: 1
UBI: number of user volumes:     0
UBI: available PEBs:             1007
UBI: total number of reserved PEBs: 14
UBI: number of PEBs reserved for bad PEB handling: 10
UBI: max/mean erase counter: 0/0
UBI: background thread "ubi_bgt0d" started, PID 497
UBI device number 0, total 1021 LEBs (131733504 bytes, 1256 MiB), 
available 1007 LEBs (129927168 bytes, 1239 MiB), LEB size 129024 
bytes (1260 KiB)

/ # ubimkvol /dev/ubi0 -m -N "TEST"
Set volume size to 129927168
UBI error: ubi_io_write: error -5 while writing 512 bytes to PEB 
1023:512, written 0 bytes
UBI warning: ubi_eba_write_leb: failed to write VID header to LEB 
2147479551:0, PEB 1023
UBI: try another PEB
UBI error: ubi_io_write: error -5 while writing 512 bytes to PEB 
1022:512, written 0 bytes
UBI warning: ubi_eba_write_leb: failed to write VID header to LEB 
2147479551:0, PEB 1022
UBI: try another PEB
UBI error: ubi_io_write: error -5 while writing 512 bytes to PEB 
1021:512, written 0 bytes
UBI warning: ubi_eba_write_leb: failed to write VID header to LEB 
2147479551:0, PEB 1021
UBI: try another PEB
UBI error: ubi_io_write: error -5 while writing 512 bytes to PEB 
1020:512, written 0 bytes
UBI warning: ubi_eba_write_leb: failed to write VID header to LEB 
2147479551:0, PEB 1020
UBI warning: ubi_ro_mode: switch to read-only mode
UBI error: ubi_io_write: read-only mode
UBI error: erase_worker: failed to erase PEB 0, error -30
UBI error: do_work: work failed with error code -30
UBI error: ubi_thread: ubi_bgt0d: work failed with error code -30
UBI error: ubi_create_volume: cannot create volume 0, error -30
ubimkvol error: cannot UBI create volume
error 30 (Read-only file system)

r,
kaius
