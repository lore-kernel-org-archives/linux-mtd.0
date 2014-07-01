Received: from szxga02-in.huawei.com ([119.145.14.65])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X1mPp-0005DW-Qq
 for linux-mtd@lists.infradead.org; Tue, 01 Jul 2014 00:59:22 +0000
Message-ID: <53B207AC.5000701@huawei.com>
Date: Tue, 1 Jul 2014 08:58:20 +0800
From: hujianyang <hujianyang@huawei.com>
MIME-Version: 1.0
To: Akshay Bhat <abhat@lutron.com>
Subject: Re: UBIFS Panic
References: <53AC825F.7040602@lutron.com> <53ACD890.4030805@huawei.com>
 <53B15F8E.3030309@lutron.com>
In-Reply-To: <53B15F8E.3030309@lutron.com>
Content-Type: text/plain; charset="UTF-8"
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

> 
> # umount /var/log
> # umount /var/db
> # mount -t ubifs ubi0:logging /var/log
> mount: mounting ubi0:logging on /var/log failed: No space left on device
> # mount -t ubifs ubi0:database /var/db
> mount: mounting ubi0:database on /var/db failed: No space left on device
> 

It's interesting.

Can you re-mount these partitions after reboot? I would like to see
the kernel message when this mounting failed happens.

Besides, Could you mount another partition after this failure? Example,
database2 on your system. I think some calculate information goes
wrong on your global UBI layer so you can't mount partitions of your
device ubi0 any more.
