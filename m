Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LpdWw-0000OD-Qs
	for linux-mtd@lists.infradead.org; Fri, 03 Apr 2009 07:09:43 +0000
Subject: Re: Ubiattach problem after flashing an image
From: Artem Bityutskiy <dedekind@infradead.org>
To: simon polette <spolette@gmail.com>
In-Reply-To: <72795ccb0904020658s35f8fd6aw97798be53ed7d559@mail.gmail.com>
References: <72795ccb0904020658s35f8fd6aw97798be53ed7d559@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 03 Apr 2009 10:09:18 +0300
Message-Id: <1238742558.20906.103.camel@localhost.localdomain>
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

Hi,

On Thu, 2009-04-02 at 15:58 +0200, simon polette wrote:
> Hi,
> 
> I'm using the last mtd utils version provided by the git mtd
> repository. I want to flash an ubi image built with mkfs.ubfis and
> ubinize into a Nand flash. Once the nand is flashed, when I try to
> attach ubi, I get this error :
> 
> # ubiattach  /dev/ubi_ctrl -m 2
> [  968.980000] UBI: attaching mtd2 to ubi1
> [  969.000000] UBI: physical eraseblock size:   131072 bytes (128 KiB)
> [  969.030000] UBI: logical eraseblock size:    129024 bytes
> [  969.050000] UBI: smallest flash I/O unit:    2048
> [  969.060000] UBI: sub-page size:              512
> [  969.080000] UBI: VID header offset:          512 (aligned 512)
> [  969.100000] UBI: data offset:                2048
> [  969.330000] UBI error: vtbl_check: volume table check failed:
> record 1, error 9
> ubiattach: error!: cannot attach mtd2
>            error 22 (Invalid argument)
> 
> The ubi image I use is ok because I already successfully flashed it
> and used it with this hardware. This error appeared since I upgraded
> both mtd utils and Linux kernel, but even if come back to the previous
> versions I was used to work with, this error persist. I think I'm
> doing something wrong, but don't know where at all.
> Any idea is welcome.

You did not enable debugging, as it is asked for here:
http://www.linux-mtd.infradead.org/doc/ubifs.html#L_how_send_bugreport

But I took a look into the code, and the following is error 9:

                if (reserved_pebs > ubi->good_peb_count) {
                        dbg_err("too large reserved_pebs %d, good PEBs %d",
                                reserved_pebs, ubi->good_peb_count);
                        err = 9;
                        goto bad;
                }

This means you created a too large UBI volume in the image,
and your real flash is smaller.

Try to enable UBI debugging, and type dmesg, then you'll see
reserved and real eraseblock numbers.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
