Received: from dsl-210-15-250-78.nsw.netspace.net.au ([210.15.250.78]
	helo=mail.magtech.com.au)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CZdxo-0000RU-Nq
	for linux-mtd@lists.infradead.org; Wed, 01 Dec 2004 18:32:51 -0500
Received: from mail.magtech.com.au (localhost [127.0.0.1])
	by localhost.magtech.com.au (Postfix) with ESMTP id 9D0F689572F
	for <linux-mtd@lists.infradead.org>;
	Thu,  2 Dec 2004 10:32:44 +1100 (EST)
Received: from [192.168.65.196] (unknown [192.168.65.196])
	by mail.magtech.com.au (Postfix) with ESMTP id 7ECA4894003
	for <linux-mtd@lists.infradead.org>;
	Thu,  2 Dec 2004 10:32:44 +1100 (EST)
Message-ID: <41AE549B.5@magellan-technology.com>
Date: Thu, 02 Dec 2004 10:32:43 +1100
From: Aras Vaichas <arasv@magellan-technology.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
References: <41AD79B1.4050303@avantwave.com>
In-Reply-To: <41AD79B1.4050303@avantwave.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: patching cvs mtd to linux 2.4.27-vsr1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

mike wrote:
> Dear all
>    Thanks for helping
>    I have some problem when patching cvs mtd to linux 2.4.27-vsr1. after 
> i use the patches/patchin.sh -c -j /usr/src/linux. I compile kernel as 
> */usr/src/linux-2.4.27-vrs1/include/linux/mtd/map.h:127:2: #error "No 
> bus width supported. What's the point?"
> 
> *I check that there is not define of the map_bankwidth on anywhere of 
> the kernel source. Am i patch wrong kernel version?

Hi Mike,

I'm in the middle of doing exactly the same thing because I need to get the 
YAFFS CVS version to work reliably. I currently have a 2.4.27-vrs1 system that 
compiles but YAFFS doesn't work. The 2.6 version for AT91 is coming along, so 
hopefully we won't have to do this 2.4 backporting for much longer, but I've 
got a March deadline for this project so I can't wait.

There are a few things that you have to change for the MTD CVS to work on 
2.4.27-vrs1. Note that I was doing what I could to get the kernel to compile, 
so there may well be some major problems with what I've done.

* after patching with the MTD code you will have to restore the configuration 
entries for AT91 in drivers/mtd/devices/Config.in and 
drivers/mtd/nand/Config.in. otherwise you won't have Dataflash and 
NAND/Smartmedia available anymore. Copy over the AT91 specific entries from an 
original patched 2.4.27-vrs1

Don't forget to reselect these entries in "make menuconfig"

* set in kernel config: MTD->RAM/ROM/FLASH chip drivers -> specific CFI Flash 
Geometry Selection -> 8 or 16 or 32 ... etc  This should solve your problem of 
the "No bus width"

* you need to use an older version of mtdchar.c because this file uses newer 
devfs functions. Unless you know how to make the current version of mtdchar.c 
work with 2.4 kernels, I can email you this file. If you make it work with 2.4, 
can you send it to me too?

* /drivers/mtd/cmdlinepart.c, I removed the static keyword so it compiles but 
my cmdline partitions no longer any more, but at least it compiles!
- static int parse_cmdline_partitions(struct mtd_info *master,
+ int parse_cmdline_partitions(struct mtd_info *master,

* Now for the fiddly bits. Let's begin with at91_nand.c

root@gentoo linux-2.4.27-vrs1-yaffs # diff -U 0 
../linux-2.4.27-vrs1-OLD/drivers/at91/mtd/at91_nand.c drivers/at91/mtd/at91_nand.c

-static void at91_hwcontrol(int cmd)
+static void at91_hwcontrol(struct mtd_info *mtd, int cmd)

-       while (!my_nand->dev_ready())
+       while (!my_nand->dev_ready(at91_mtd))

-static int at91_device_ready(void)
+static int at91_device_ready(struct mtd_info *mtd)

-       if (nand_scan (at91_mtd)) {
+#define CHIPS_TO_SCAN  1
+       if (nand_scan (at91_mtd, CHIPS_TO_SCAN)) {


I wasn't sure what to do with the data_cache problem, so I just commented it 
out for now:

-       my_nand->data_cache = kmalloc (sizeof(u_char) * (at91_mtd->oobblock + 
at91_mtd->oobsize), GFP_KERNEL);
-       if (!my_nand->data_cache) {
-               printk ("Unable to allocate AT91 NAND data cache.\n");
-               err = -ENOMEM;
-               goto out_buf;
-       }
-       my_nand->cache_page = -1;
+//     my_nand->data_cache = kmalloc (sizeof(u_char) * (at91_mtd->oobblock + 
at91_mtd->oobsize), GFP_KERNEL);
+//     if (!my_nand->data_cache) {
+//             printk ("Unable to allocate AT91 NAND data cache.\n");
+//             err = -ENOMEM;
+//             goto out_buf;
+//     }
+//     my_nand->cache_page = -1;

-       kfree (my_nand->data_cache);
+//     kfree (my_nand->data_cache);

-       kfree (my_nand->data_cache);
+//     kfree (my_nand->data_cache);


* and at91_dataflash.c

root@gentoo linux-2.4.27-vrs1-yaffs # diff -U 0 
../linux-2.4.27-vrs1-OLD/drivers/at91/mtd/at91_dataflash.c 
drivers/at91/mtd/at91_dataflash.c

-               struct mtd_partition **pparts, const char *mtd_id);
+               struct mtd_partition **pparts,
+               unsigned long origin);

-       device->module = THIS_MODULE;
+       device->owner = THIS_MODULE;

-       mtd_parts_nr = parse_cmdline_partitions(device, &mtd_parts, mtdID);
+       mtd_parts_nr = parse_cmdline_partitions(device, &mtd_parts, 0);


I think that's pretty well it. Please tell me if I have missed anything! 
Hopefully you should be a lot closer to compiling now.

regards,

Aras Vaichas
