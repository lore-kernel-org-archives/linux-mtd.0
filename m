Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 1893HX-0008KQ-00
	for <linux-mtd@lists.infradead.org>; Tue, 05 Nov 2002 12:58:11 +0000
Date: Tue, 5 Nov 2002 14:28:19 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: vijay vijay <vijay_peshkar@hotmail.com>
Cc: linux-mtd@lists.infradead.org, vijay.peshkar@wipro.com
Subject: Re: mtd2 partition mapping on mtd1?...
Message-ID: <20021105132819.GA24128@wohnheim.fh-wedel.de>
References: <F152wVn20lbhsKd6QR700003f5b@hotmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <F152wVn20lbhsKd6QR700003f5b@hotmail.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

On Tue, 5 November 2002 11:42:14 +0000, vijay vijay wrote:
> The fact that am hardcoding my root fs address in cramfs_read
> instead of picking it up from mtd0(which am able to operate on after
> bootup) still bothers me. Any (better) way of telling the kernel to
> pick rootfs from mtd0?. Have tried with root=/dev/mtd0.
> Am building an initrd image.

Even though mtd is quite another beast, you need a block device when
mounting an fs. Try root=/dev/mtdblock0.

If this does not work, edit init/main.c or init/do_mounts.c (depending
on kernel version). Look for root_dev_names and add your
/dev/mtdblock? to that array.

> One more query:
> My kernel and another partition will have raw data. What api's to
> operate on them?. Tried __raw_writel etc., but that doesn't seem
> to change the flash location data.

I don't really understand this question. Do you want to operate from
user space or kernel space? Do you want to read, write or move the
data?

Jörn

-- 
You can't tell where a program is going to spend its time. Bottlenecks
occur in surprising places, so don't try to second guess and put in a
speed hack until you've proven that's where the bottleneck is.
-- Rob Pike
