Received: from mdfmta010.mxout.tch.inty.net ([91.221.169.51]
 helo=smtp.demon.co.uk)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XgEuU-0003Je-8B
 for linux-mtd@lists.infradead.org; Mon, 20 Oct 2014 15:30:15 +0000
Date: Mon, 20 Oct 2014 16:25:36 +0100 (BST)
From: Steve B <steve@baconbits.demon.co.uk>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: UBI/UBFS: ubi_eba_read_leb() reporting unmapped LEB
In-Reply-To: <1413818380.7906.352.camel@sauron.fi.intel.com>
Message-ID: <alpine.DEB.2.02.1410201624320.2556@ubuntu>
References: <alpine.DEB.2.02.1410101444510.2556@ubuntu>
 <1413812127.7906.282.camel@sauron.fi.intel.com>
 <alpine.DEB.2.02.1410201442380.2556@ubuntu>
 <1413813912.7906.305.camel@sauron.fi.intel.com>
 <alpine.DEB.2.02.1410201529590.2556@ubuntu>
 <1413818380.7906.352.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Thank you very much for your suggestions Artem, gives me plenty to look
into :)


On Mon, 20 Oct 2014, Artem Bityutskiy wrote:

> On Mon, 2014-10-20 at 15:51 +0100, Steve B wrote:
>> The log on the target is very minimal as I was only capturing error
>> logs, so don't have much info to share on that, but here is the log from
>> the target:
>>
>> [   13.178297] UBIFS error (pid 1273): ubifs_read_node: bad node type (255 but expected 1)
>> [   13.178481] UBIFS error (pid 1273): ubifs_read_node: bad node at LEB 39:0, LEB mapping status 0
>> [   13.178668] Not a node, first 24 bytes:
>> [   13.178755] 00000000: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff                          ........................
>> [   13.179093] [<80012b7c>] (unwind_backtrace+0x0/0x11c) from [<80131138>] (ubifs_read_node+0x25c/0x2a0)
>> [   13.179311] [<80131138>] (ubifs_read_node+0x25c/0x2a0) from [<8014d2ac>] (ubifs_tnc_read_node+0x60/0x198)
>> [   13.185906] [<8014d2ac>] (ubifs_tnc_read_node+0x60/0x198) from [<801343e0>] (ubifs_tnc_locate+0xa8/0x180)
>> [   13.195449] [<801343e0>] (ubifs_tnc_locate+0xa8/0x180) from [<80126e1c>] (do_readpage+0x1bc/0x448)
>> [   13.204388] [<80126e1c>] (do_readpage+0x1bc/0x448) from [<801284f8>] (ubifs_readpage+0x3e8/0x428)
>> [   13.213246] [<801284f8>] (ubifs_readpage+0x3e8/0x428) from [<8008e6e4>] (generic_file_aio_read+0x328/0x6f4)
>> [   13.222973] [<8008e6e4>] (generic_file_aio_read+0x328/0x6f4) from [<800b37c4>] (do_sync_read+0x98/0xd4)
>> [   13.232342] [<800b37c4>] (do_sync_read+0x98/0xd4) from [<800b3e0c>] (vfs_read+0xa4/0x134)
>> [   13.240501] [<800b3e0c>] (vfs_read+0xa4/0x134) from [<800b4190>] (sys_read+0x34/0x68)
>> [   13.248316] [<800b4190>] (sys_read+0x34/0x68) from [<8000e280>] (ret_fast_syscall+0x0/0x30)
>> [   13.256639] UBIFS error (pid 1273): do_readpage: cannot read page 991 of inode 91, error -22
>> [   13.265085] UBIFS error (pid 1273): ubifs_read_node: bad node type (255 but expected 1)
>> [   13.273046] UBIFS error (pid 1273): ubifs_read_node: bad node at LEB 39:0, LEB mapping status 0
>>
>> I'm currently trying to create a test to more reliably reproduce the issue,
>> when I do I can share those logs.
>>
>> Fastmap doesn't exist in the kernel version we are running (3.4.0)
>>
>> The first test to show up this issue simple copies a file in a tight loop and
>> power is pulled randomly on the board. I am now trying to refine the test to speed
>> up the failure by randomly pulling the power in the NAND driver after a random
>> number of erase/write calls, but I haven't been able to reproduce the issue
>> with this.
>
> Being able to reproduce this would make it bughunting a relatively easy
> task.
>
> You could also try to establish a separate UBI power cut testing.
> Something like writing various patterns directly to the UBI volume,
> having power cut, and making sure that what you wrote before power cut
> is there is exactly what you wrote. UBI writes synchronously, so once
> the write returns, the data must be on the flash. And you should write
> in min. I/O unit sizes (on NAND page at a time).
>
> I guess you can have a mirror file (if you have a second media), or a
> fixed algorithm of how you select the LEB and offset to write. And you
> generate random power cuts, and then after boot-up you verify that the
> media contains valid data - everything, for which the write operation
> was finished, should be there.
>
> With this, you'd exclude the whole layer of UBIFS complexity. And if you
> are lucky, and the bug is in UBI, it will be much easier to catch and to
> fix.
>
> With a mirror file it is probably easy. You just do modify the mirror
> file, recored the last operation, sync the mirror file and the file
> where you recorded the operation, then you enable the random power cut,
> and start the operation on the UBI volume. The point is to not have
> power cut before the mirror file is being changed.
>
> Artem.
>
>
