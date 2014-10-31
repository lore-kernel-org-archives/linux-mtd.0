Received: from szxga03-in.huawei.com ([119.145.14.66])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xk9aM-0000QJ-H0
 for linux-mtd@lists.infradead.org; Fri, 31 Oct 2014 10:37:39 +0000
Message-ID: <5453663A.8080608@huawei.com>
Date: Fri, 31 Oct 2014 18:36:42 +0800
From: hujianyang <hujianyang@huawei.com>
MIME-Version: 1.0
To: Artem Bityutskiy <dedekind1@gmail.com>, Brian Norris
 <computersforpeace@gmail.com>
Subject: Report: mtd-utils: "Floating point exception" with ubiformat
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Here is an interesting problem. I used a nand flash driver with
wrong partition table and an error like this occurred:

# insmod nandflash.ko

[454096.098834] mtd: partition "ubi1" is out of reach -- disabled


The display of /proc/mtd shows the size of mtd1 is zero:

# cat /proc/mtd
dev:    size   erasesize  name
mtd0: 20000000 00020000 "ubi0"
mtd1: 00000000 00000000 "ubi1"
mtd2: 20000000 00020000 "rest"


When performing ubiformat with this mtd1, the utility breaks
down with a message:

# ubiformat /dev/mtd1
Floating point exception


I used to think it is because ubiformat can't deal with a zero
size MTD device. So I want to add something like a error branch
for this. But now I find it is because the "erasesize" in
"/sys/class/mtd/mtd1" is zero.

:/sys/class/mtd/mtd1# cat erasesize
0

So function mtd_get_dev_info1() in lib/libmtd.c, line 777

"""
mtd->eb_cnt = mtd->size / mtd->eb_size;
"""

will crash the program because mtd->eb_size is zero.


Do you think it is a valuable problem to deal with? Keep the
existing logic is OK. But can we add something in mtd-utils
to indicate this error than "Floating point exception"?


Thanks~!

Hu
