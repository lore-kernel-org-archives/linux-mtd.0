Received: from nz-out-0506.google.com ([64.233.162.225])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1I6f3d-0005ZV-Pe
	for linux-mtd@lists.infradead.org; Fri, 06 Jul 2007 00:04:40 -0400
Received: by nz-out-0506.google.com with SMTP id z3so86390nzf
	for <linux-mtd@lists.infradead.org>;
	Thu, 05 Jul 2007 21:04:36 -0700 (PDT)
Message-ID: <d843180a0707052104p488bdc03hea6f8ce32e5e9ea9@mail.gmail.com>
Date: Fri, 6 Jul 2007 12:04:35 +0800
From: "He Yong" <hoffer1127@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [Questions] about NFTL
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,all

I am in trouble when I want mount different types of fs on mtd->nand
devices' different partitions.
I want use yaffs2 on partition-1,2 for application and FAT on
partition-3 for data.
in order to build FAT on NAND devices, I knew I need a Flash
Translation Layer, then I found NFTL in kernel(2.6.20) MTD menu, but
I saw the comments of the NFTL module, it says "it's for M-Systems
DiskOnChip 2000 and Millennium". Does NFTL support normal NAND driver?

I tried to use nftl in one of my Nand partitions, in init, the kernel shows:
.....
0x10000000-0x18000000 : "nftl"
mtd: Giving out device 4 to nftl
NFTL: add_mtd for nftl
Could not find valid boot record
NFTL: could not mount device
.....

I found that the nftl partition needs to be formatted.
but, in mtd-utils' nftl_format.c I found that it only supports erase
size less than 0x8000( that is 32 KB), and 512B page size. does NFTL
has a large (2KB) page version?  or I need chenge some codes to
support 2KB Flash?

Thanks!

--He Yong


-- 
Best Regards!

He Yong

School of Information Security,
Shanghai Jiaotong University,
Dong cuan Road #800,
Minhang, Shanghai, P.R.China
