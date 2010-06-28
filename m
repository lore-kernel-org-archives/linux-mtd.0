Received: from demumfd002.nsn-inter.net ([93.183.12.31])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OT9af-0003K1-Ox
	for linux-mtd@lists.infradead.org; Mon, 28 Jun 2010 08:21:18 +0000
Message-ID: <4C285B76.5010108@web.de>
Date: Mon, 28 Jun 2010 10:21:10 +0200
From: re <re.wirth@web.de>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: UBIFS failed to recover master node
References: <AANLkTimPxrQzSS_n6CofW8ePwCKuE7sbENJZXUl1Yszl@mail.gmail.com>
	<1274763982.2106.2.camel@localhost>
In-Reply-To: <1274763982.2106.2.camel@localhost>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, twebb <taliaferro62@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

 Am 25.05.2010 07:06, schrieb Artem Bityutskiy:
> On Mon, 2010-05-24 at 11:22 -0400, twebb wrote:
>> I've had several cases where our MLC NAND flash appears corrupted in
>> such a way that one of three UBIFS volumes can not be mounted due to
>> "failed to recover master node".  I haven't been able to reproduce the
>> problem, but we've had at least 5 incidents where this has occurred.
>> (A partial capture from one of the failures is below.)
>>
>> I'm starting to investigate this problem and don't know if this is a
>> UBIFS/UBI problem or a NAND driver problem.  I'm starting the process
>> of back-porting the latest UBIFS code to our 2.6.29 kernel - hoping
>> that new UBIFS code will solve the problem.  However, this may also be
>> a driver problem and I wonder if I also need to update that driver
>> (pxa3xx_nand).  Any suggestions for debugging this problem?
>>
>> Thanks,
>> twebb
>>
>>
>> capture:
>> [root@ESIedge mtd-utils]# mount -t ubifs ubi0_0 /mnt/
>> [  239.605869] UBI error: ubi_io_read: error -74 while reading 516096
>> bytes from PEB 4:8192, read 516096 bytes
>> [  239.616317] UBIFS error (pid 676): ubifs_scan: corrupt empty space
>> at LEB 2:268135
>> [  239.623996] UBIFS error (pid 676): ubifs_scanned_corruption:
>> corruption at LEB 2:268135
>> [  239.642101] UBIFS error (pid 676): ubifs_scan: LEB 2 scanning failed
>> [  239.976396] UBI error: ubi_io_read: error -74 while reading 516096
>> bytes from PEB 4:8192, read 516096 bytes
>> [  239.986742] UBIFS error (pid 676): ubifs_recover_master_node:
>> failed to recover master node
>> mount: mounting ubi0_0 on /mnt/ failed: Invalid argument
> And BTW, it is a good idea not to erase/re-flash this device if you want
> to fix this problem.
>
Our power off tests causes this sporadic error too  (ubifs_recover_master_node: failed
to recover master node).
We use kernel 2.6.29 with the git-patch (from 3/2010) for 47MB NOR flash partition.

I tried to find with debugging  the error reason.
The recover of the master_node reads the master_node1 and master_node2.
The master_node1 was emty.
The error was detected in:
int ubifs_recover_master_node(struct ubifs_info *c)
    ....
    if (mst1) {
       ......
    } else {
        if (!mst2)
            goto out_err;          
        /* 1st LEB was unmapped and about to be written, so there must
         * be no room left in 2nd LEB.         */
        offs2 = (void *)mst2 - buf2;
        if (offs2 + sz + sz <= c->leb_size)
            goto out_err;                               !!!!!!!!!!!!!!!!!!!
        mst = mst2;
    }
I checked the values of the compare "if (115712 + 512 +512  (=116736) <= 130944)".
I skipped this error for test purpose. The master_node was recovered. I saw no problems
with the FS. I was not able to follow this check.

I was able to provoke this error manual.
My UBIFS use LEB:1 for the first master_node and LEB:2 for the second.
I searched the LEB:1 and deleted this sector.
The following loading and mounting causes the error.
A ignoring of the error causes a successful recovery.
I used 15 MB and 47 MB NOR flash partitions for this tries.
The 15MB partition flash checks the error in the compare "if (9216 + 512 +512  (=10240)
<= 130944)",
These values are independent to the PEB of LEB:1 and LEB:2 and independent to the free
space of the FS.

Regards
Reinhold
