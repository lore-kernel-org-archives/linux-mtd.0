Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MNopx-0002MW-JB
	for linux-mtd@lists.infradead.org; Mon, 06 Jul 2009 14:06:36 +0000
Subject: Re: ubiattach problem
From: Artem Bityutskiy <dedekind@infradead.org>
To: Oren <oren_s3@VERIFONE.com>
In-Reply-To: <1246888221.17871.5.camel@tlvorens3lnx>
References: <1246888221.17871.5.camel@tlvorens3lnx>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 06 Jul 2009 17:05:42 +0300
Message-Id: <1246889142.20721.293.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2009-07-06 at 16:50 +0300, Oren wrote:
> HI,
> 
> I am trying to attached a ubi image to an MTD nand device.
> I am using kerenl version 2.6.27.18.
> using latest MTD-UTILS + ubi_utils.
> 
> For some reosone i get UBI error while trying to attache..
> DO i miss someting?
> 
> 
> dev:    size   erasesize  name
> mtd0: 01000000 00020000 "NAND-block1"
> mtd1: 01e00000 00020000 "jffs2"
> mtd2: 05200000 00020000 "NAND-block2"
> ./ubinfo
> UBI version:                    1
> Count of UBI devices:           0
> UBI control device major/minor: 10:63
> ubiformat /dev/mtd0 -s 2048 -f ubi_ncomp.img
> ubiformat: mtd0 (nand), size 16777216 bytes (16.0 MiB), 128 eraseblocks
> of 131072 bytes (128.0 KiB), min. I/O size 2048 bytes
> libscan: scanning eraseblock 127 -- 100 % complete  
> ubiformat: 128 eraseblocks are supposedly empty
> ubiformat: flashing eraseblock 16 -- 100 % complete  
> ubiformat: formatting eraseblock 127 -- 100 % complete
> ubiattach /dev/ubi_ctrl -m 0  
> [42949485.550000] UBI error: ubi_read_volume_table: the layout volume
> was not found
> [42949485.560000] UBI error: ubi_attach_mtd_dev: failed to attach by
> scanning, error -22
> ubiattach: error!: cannot attach mtd0
>            error 22 (Invalid argument)

Looks strange. Does dmesg has anything interesting when you enable
UBI debugging?
(http://www.linux-mtd.infradead.org/doc/ubi.html#L_how_send_bugreport)

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
