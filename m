Received: from mo6-p05-ob.rzone.de ([2a01:238:20a:202:5305::1])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UbXuM-0004Dd-Kq
 for linux-mtd@lists.infradead.org; Sun, 12 May 2013 15:09:56 +0000
Message-ID: <518FB09D.3070101@denx.de>
Date: Sun, 12 May 2013 17:09:17 +0200
From: Stefan Roese <sr@denx.de>
MIME-Version: 1.0
To: Vikram Narayanan <vikram186@gmail.com>
Subject: Re: mtd_oobtest fails with GPMI-NAND
References: <50F97DB5.7040801@gmail.com> <50FCA426.6030309@freescale.com>
 <5105E4CE.1090800@gmail.com> <5105EE9B.9050405@freescale.com>
 <5106AFAA.1020502@gmail.com> <51072EA4.7000201@freescale.com>
 <51073373.4080006@gmail.com> <510735B3.1040509@freescale.com>
 <5107F899.5090506@gmail.com> <5108852C.5040002@freescale.com>
 <510CB507.4020105@gmail.com> <518A6228.6050608@denx.de>
 <518B96FC.6000806@gmail.com> <518C91AA.8040107@denx.de>
 <518F86CE.6060408@gmail.com>
In-Reply-To: <518F86CE.6060408@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Vikram,

On 05/12/2013 02:10 PM, Vikram Narayanan wrote:
>>>> I might be seeing something similar on my iMX6 board. Here
>>>> mtd_subpagetest sometimes fails.
>>>
>>> AFAIR, subpagetest passed for me when I tested.
>>>
>>> BTW, What kind of errors are you getting? Any logs?
>>
>> Sure. Here 2 logs with v3.9.1:
>>
>> # insmod mtd_subpagetest.ko dev=3
>> [  315.947734] mtd_subpagetest: verified up to eraseblock 0
>> [  317.140658] mtd_subpagetest: error: read failed at 0xd60800
> 
>> [ 2561.996470] mtd_subpagetest: error: read failed at 0xe380800
> 
> Looks like it is happening at random. Two different physical locations 
> on two different runs.

These locations (blocks) where the errors happen are not always
identical. But some blocks reoccur. And this Linux test stops
when one error is detected. The U-Boot reported multiple blocks,
where some blocks were most of the time defective.

So its not really random.

>>>> What is the current status on your platform? Did you resolve this
>>>> problem? If yes, what did you have to change/fix?
>>>
>>> Unfortunately no. I haven't got enough time to look into this.
>>
>> Too bad. Could you please explain again, how you first noticed
>> that the you might have a problem with NAND on your imx6 board?
> 
> For me, the error (-74) happened when the kernel is finally trying to 
> mount the rootfs. It is random as well.
> 
> <http://www.linux-mtd.infradead.org/faq/ubi.html#L_ecc_error>
> As suggested in the above link, I tried to run the oobtest and it was 
> failing due to the missing ecc_layout structure. That's how this thread 
> was born.
> 
>> We noticed a problem first in U-Boot by using the following
>> commands:
>>
>> => nand erase.part ubi; ubi part ubi
>>
>> This works the first time without any problem. But the 2nd time
>> it leads to "uncorrectable errors" (0xfe) while reading from some
>> blocks. And those failing blocks tend to be the same (more or less).
> 
>> Perhaps you might want to test this in U-Boot (if you use it)
>> as well.
> 
> I'm using u-boot v2012.10, with no extra patches for mtd/ubi layers.
> 
> I tried in both the ways. Issued "nand erase; ubi part" and "ubi part" 
> alone. For me, It didn't give any "uncorrectable errors" error you've 
> mentioned.
> 
> The only error I came across in u-boot is "fixable bit-flip" issue. My 
> colleagues have reported it sometime back. But I couldn't reproduce it 
> and neither could they.

Could you please post a link to this thread?

> Can you please post the logs for the "uncorrectable errors" in u-boot?
> That might give some hints to Huang.

Sure. Please note that I tracked the error (-74) back to the U-Boot
imx NAND driver (mxs_nand.c):

	/* Loop over status bytes, accumulating ECC status. */
	status = nand_info->oob_buf + mxs_nand_aux_status_offset();
	for (i = 0; i < mxs_nand_ecc_chunk_cnt(mtd->writesize); i++) {
		if (status[i] == 0x00)
			continue;

		if (status[i] == 0xff)
			continue;

		if (status[i] == 0xfe) {
			failed++;
			continue;
		}

		corrected += status[i];
	}

I could also add some code to the Linux driver to see, if the error
happens at the same place (status == 0xfe). I'm pretty sure that this
is the case though.


Here the logs from U-Boot:

=> nand erase.part ubi;
NAND erase.part: device 0 offset 0x1100000, size 0x1ef00000
Erasing at 0x1ffe0000 -- 100% complete.
OK
=> ubi part ubi
UBI: mtd1 is detached from ubi0
UBI: attaching mtd1 to ubi0
UBI: physical eraseblock size:   131072 bytes (128 KiB)
UBI: logical eraseblock size:    126976 bytes
UBI: smallest flash I/O unit:    2048
UBI: VID header offset:          2048 (aligned 2048)
UBI: data offset:                4096
UBI error: ubi_io_read: error -74 while reading 64 bytes from PEB 3093:0, read 64 bytes
UBI error: ubi_io_read: error -74 while reading 64 bytes from PEB 3956:0, read 64 bytes
UBI error: ubi_read_volume_table: the layout volume was not found
UBI error: ubi_init: cannot attach mtd1
UBI error: ubi_init: UBI error: cannot initialize UBI, error -22
UBI init error 22


Another thing to mention is, that using this command (nand erase;
nand erase;ubi part) never triggers this problem. So an additional
erase somehow seems to fix this problem. Still not sure why this is
the case.

Vikram, which NAND part/chip are you using again?

Thanks,
Stefan
