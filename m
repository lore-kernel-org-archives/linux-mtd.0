Received: from [119.145.14.64] (helo=szxga01-in.huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X0M2U-0007CR-UQ
 for linux-mtd@lists.infradead.org; Fri, 27 Jun 2014 02:37:24 +0000
Message-ID: <53ACD890.4030805@huawei.com>
Date: Fri, 27 Jun 2014 10:36:00 +0800
From: hujianyang <hujianyang@huawei.com>
MIME-Version: 1.0
To: Akshay Bhat <abhat@lutron.com>
Subject: Re: UBIFS Panic
References: <53AC825F.7040602@lutron.com>
In-Reply-To: <53AC825F.7040602@lutron.com>
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

On 2014/6/27 4:28, Akshay Bhat wrote:
> Hi,
> 
> I was performing a stress test on UBI file system on a ARM based embedded board
> (Beagle Bone). We have a SLC NAND flash and the MTD_UBI_WL_THRESHOLD is set to
> 4096. I have 2 scripts running in the background in a infinite while loop:
> Script1: dd if=/dev/zero of=/var/db/test bs=2M count=1
> Script2: dd if=/dev/urandom of=/var/log/test bs=2M count=1 2> /dev/null
> Note: The above directories are mounted as (sync,relatime).
> 

How did you release data on the flash? What's the partitions on your system?
Did you use MTD_UBI_FASTMAP?

> After the running the scripts for 5 days and max_ec reached the
> MTD_UBI_WL_THRESHOLD. At this point I got panic1 (see below) and the ubi volume
> switched to read-only mode. I rebooted the board, changed the transfer size in
> the script from 2M to 140K and the scripts ran for 2+ days and I got panic 2 (See
> below).

Did you try umount after this error happen and mount partition again, then
re-run your scripts to see what will happen?

> [81438.785011] UBIFS error (pid 31441): do_commit: commit failed, error -30
> [81438.785034] UBIFS error (pid 31441): ubifs_write_inode: can't write inode 79,
> error -30
>

Later error -30 is caused by former error -28 which is reported by UBI layer.
Did you run df to see how much space left on your device?

I think each time you get an error -28 from UBI layer, you will see an ubi_err.
But I didn't see it in your log. Does anyone else know something about it?
