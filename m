Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Nzn3b-0006qu-8Z
	for linux-mtd@lists.infradead.org; Thu, 08 Apr 2010 08:25:48 +0000
Subject: Re: ubiattach error!
From: Artem Bityutskiy <dedekind1@gmail.com>
To: jerry <jerrydreaming@gmail.com>
In-Reply-To: <71103bce1003230226q7fce2443vad3853d7c6d6d947@mail.gmail.com>
References: <71103bce1003230226q7fce2443vad3853d7c6d6d947@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 08 Apr 2010 11:23:52 +0300
Message-ID: <1270715032.6754.108.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2010-03-23 at 17:26 +0800, jerry wrote:
> hi all,
> I am trying to use ubi to attach mtd3(3.9G),but there are some
> question.the mlc is SAMSUNG K9LBG080D,the kernel version is 2.6.28
> # flash_erase  /dev/mtd3;
> 
> # ubiattach /dev/ubi_ctrl -m 3
> UBI: attaching mtd3 to ubi0
> UBI: physical eraseblock size:   524288 bytes (512 KiB)
> UBI: logical eraseblock size:    516096 bytes
> UBI: smallest flash I/O unit:    4096
> UBI: VID header offset:          4096 (aligned 4096)
> UBI: data offset:                8192
> UBI: empty MTD device detected
> UBI: create volume table (copy #1)
> UBI: create volume table (copy #2)
> UBI: attached mtd3 to ubi0
> UBI: MTD device name:            "Filesys partition"
> UBI: MTD device size:            4078 MiB
> UBI: number of good PEBs:        8156
> UBI: number of bad PEBs:         0
> UBI: max. allowed volumes:       128
> UBI: wear-leveling threshold:    4096
> UBI: number of internal volumes: 1
> UBI: number of user volumes:     0
> UBI: available PEBs:             8071
> UBI: total number of reserved PEBs: 85
> UBI: number of PEBs reserved for bad PEB handling: 81
> UBI: max/mean erase counter: 0/0
> UBI: background thread "ubi_bgt0d" started, PID 452
> UBI device number 0, total 8156 LEBs (fae48000 bytes, 3.9 GiB),
> available 8071 LEBs (f8472000 bytes, 3.9 GiB), LEB size 7e000 bytes
> (504.0 KiB)
> 
> # ubimkvol /dev/ubi0 -n 0 -N uu -s 100MiB;
> Volume ID 0, size 204 LEBs (105283584 bytes, 100.4 MiB), LEB size
> 516096 bytes (504.0 KiB), dynamic, name "uu", alignment 1
> 
> # ubidetach /dev/ubi_ctrl -m 3
> UBI: mtd3 is detached from ubi0
> 
> # ubiattach /dev/ubi_ctrl -m 3
> UBI: attaching mtd3 to ubi0
> UBI: physical eraseblock size:   524288 bytes (512 KiB)
> UBI: logical eraseblock size:    516096 bytes
> UBI: smallest flash I/O unit:    4096
> UBI: VID header offset:          4096 (aligned 4096)
> UBI: data offset:                8192
> UBI error: ubi_scan_add_used: two LEBs with same sequence number 4
> ubiattach: error!: cannot attach mtd3
>           error 22 (Invalid argument)

Looks weird, is this reproducible with nandsim?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
