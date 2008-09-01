Received: from qw-out-1920.google.com ([74.125.92.148])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KaARx-0003rT-36
	for linux-mtd@lists.infradead.org; Mon, 01 Sep 2008 14:32:13 +0000
Received: by qw-out-1920.google.com with SMTP id 4so203695qwk.24
	for <linux-mtd@lists.infradead.org>;
	Mon, 01 Sep 2008 07:32:11 -0700 (PDT)
Date: Mon, 1 Sep 2008 18:29:50 +0400
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
To: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: warning during mtd registration in 2.6.27-rc5
Message-ID: <20080901142949.GA18081@doriath.ww600.siemens.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: axboe@kernel.dk, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Since commit abf5439370491dd6fbb4fe1a7939680d2a9bc9d4
I'm seeing this problem:

kobject (c3abad68): tried to init an initialized object, something is seriously wrong.
[<c0027ff0>] (dump_stack+0x0/0x14) from [<c013c484>] (kobject_init+0x40/0x78)
[<c013c444>] (kobject_init+0x0/0x78) from [<c013ca24>] (kobject_init_and_add+0x20/0x44)
 r5:c3abad68 r4:c3ac2520
[<c013ca08>] (kobject_init_and_add+0x4/0x44) from [<c0137c6c>] (blk_register_filter+0x48/0x60)
 r5:c3ab4060 r4:c3aba880
[<c0137c24>] (blk_register_filter+0x0/0x60) from [<c01366c4>] (add_disk+0x60/0xb8)
 r4:c3ac2400
[<c0136664>] (add_disk+0x0/0xb8) from [<c01a6994>] (add_mtd_blktrans_dev+0x210/0x244)
 r5:c3ab4060 r4:00000001
[<c01a6784>] (add_mtd_blktrans_dev+0x0/0x244) from [<c01a6bbc>] (mtdblock_add_mtd+0x58/0x64)
 r8:c03c7910 r7:c3ab6100 r6:c03c6bd4 r5:c03c6c04 r4:c3ab6100
[<c01a6b64>] (mtdblock_add_mtd+0x0/0x64) from [<c01a6144>] (blktrans_notify_add+0x3c/0x68)
 r5:c3ab6100 r4:c03c6c04
[<c01a6108>] (blktrans_notify_add+0x0/0x68) from [<c01a3a20>] (add_mtd_device+0xc0/0x120)
 r6:c03c6b80 r5:c3ab6100 r4:c03c6bc4
[<c01a3960>] (add_mtd_device+0x0/0x120) from [<c01a4e50>] (add_one_partition+0x468/0x500)
 r6:c3ac2000 r5:00700000 r4:c3ab6100
[<c01a49e8>] (add_one_partition+0x0/0x500) from [<c01a4f20>] (add_mtd_partitions+0x38/0x7c)
[<c01a4ee8>] (add_mtd_partitions+0x0/0x7c) from [<c0016a48>] (sharpsl_nand_init+0x1dc/0x238)
....

This happens when adding mtd partitions. I've traced it to the fact that
mtd partition devices share the genhd queue with the whole chip block device.
Thus blk_register_filter receives the same pointer for the chip and for each
registered partition.

-- 
With best wishes
Dmitry
