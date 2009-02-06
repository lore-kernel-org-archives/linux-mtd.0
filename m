Received: from fgwmail7.fujitsu.co.jp ([192.51.44.37])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LVJpq-0006uf-AH
	for linux-mtd@lists.infradead.org; Fri, 06 Feb 2009 06:05:06 +0000
Received: from m5.gw.fujitsu.co.jp ([10.0.50.75])
	by fgwmail7.fujitsu.co.jp (Fujitsu Gateway) with ESMTP id
	n1664xn0013932 for <linux-mtd@lists.infradead.org> (envelope-from
	iram.shahzad@jp.fujitsu.com); Fri, 6 Feb 2009 15:04:59 +0900
Received: from smail (m5 [127.0.0.1])
	by outgoing.m5.gw.fujitsu.co.jp (Postfix) with ESMTP id 5484F45DE51
	for <linux-mtd@lists.infradead.org>;
	Fri,  6 Feb 2009 15:04:59 +0900 (JST)
Received: from s5.gw.fujitsu.co.jp (s5.gw.fujitsu.co.jp [10.0.50.95])
	by m5.gw.fujitsu.co.jp (Postfix) with ESMTP id 358F645DE4D
	for <linux-mtd@lists.infradead.org>;
	Fri,  6 Feb 2009 15:04:59 +0900 (JST)
Received: from s5.gw.fujitsu.co.jp (localhost.localdomain [127.0.0.1])
	by s5.gw.fujitsu.co.jp (Postfix) with ESMTP id 053E8E08006
	for <linux-mtd@lists.infradead.org>;
	Fri,  6 Feb 2009 15:04:59 +0900 (JST)
Received: from ml13.s.css.fujitsu.com (ml13.s.css.fujitsu.com [10.249.87.103])
	by s5.gw.fujitsu.co.jp (Postfix) with ESMTP id AB826E08002
	for <linux-mtd@lists.infradead.org>;
	Fri,  6 Feb 2009 15:04:58 +0900 (JST)
Received: from ml13.css.fujitsu.com (ml13 [127.0.0.1])
	by ml13.s.css.fujitsu.com (Postfix) with ESMTP id 8950CFD0003
	for <linux-mtd@lists.infradead.org>;
	Fri,  6 Feb 2009 15:04:58 +0900 (JST)
Received: from sky (x154150.ao.fst.fujitsu.com [10.90.154.150])
	by ml13.s.css.fujitsu.com (Postfix) with SMTP id 3DB76FD0001
	for <linux-mtd@lists.infradead.org>;
	Fri,  6 Feb 2009 15:04:58 +0900 (JST)
Message-ID: <4C336FC8FE0F441DA6FAB8337E58BB54@sky>
From: "Iram Shahzad" <iram.shahzad@jp.fujitsu.com>
To: <linux-mtd@lists.infradead.org>
Subject: cannot access NAND STL partition
Date: Fri, 6 Feb 2009 15:06:42 +0900
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="iso-2022-jp";
	reply-type=original
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi

I am having the following problem related to reading data
from NAND. Any hints will be highly appreciated.

Problem in short:
-------------------
I can read some partitions but cannot read other ones.

Problem in long:
-------------------
I need to access my rootfs from Linux. The rootfs is located
in NAND. If I write the rootfs in the NAND using u-boot or
Linux itself, then I can read the rootfs from Linux without
problem.

But the flash has to be programmed using a special flash
writer. While doing this the flash is divided into several
partitions, some partitions are STL and the others are BML.
Now I find that u-boot/Linux can read BML partitions correctly
but cannot read STL partitions. Reading STL partition gives
unexpected data.

For test, I am able to place my rootfs in the BML partition
in which case everything works fine. But finally I have to
place the rootfs in STL partition.

Do you have any idea how can Linux read data from STL partition?
I guess I need some kind of translation layer on top of my
low level NAND driver but am not sure about that.
Currently I am using the following components.
    drivers/mtd/cmdlinepart + drivers/mtd/onenand

Is FTL/NFTL used for this purpose?

Best regards
Iram
