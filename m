Received: from mail017.syd.optusnet.com.au ([210.49.20.175])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17LCUk-0000Ed-00
	for <linux-mtd@lists.infradead.org>; Fri, 21 Jun 2002 01:41:47 +0100
Received: from max.ctam.local (198.142.103.111.optusnet.com.au [198.142.103.111] (may be forged))
	by mail017.syd.optusnet.com.au (8.11.1/8.11.1) with ESMTP id g5L0fgX29151
	for <linux-mtd@lists.infradead.org>; Fri, 21 Jun 2002 10:41:42 +1000
Received: from k9.ctam.local ([192.168.0.55] helo=ctam.com.au)
	by max.ctam.local with esmtp (Exim 3.12 #1 (Debian))
	id 17LCUf-0005vF-00
	for <linux-mtd@lists.infradead.org>; Fri, 21 Jun 2002 10:41:41 +1000
Message-ID: <3D127644.3050004@ctam.com.au>
Date: Fri, 21 Jun 2002 10:41:40 +1000
From: Brendan J Simon <brendan.simon@ctam.com.au>
Reply-To: brendan.simon@ctam.com.au
MIME-Version: 1.0
To: Linux MTD <linux-mtd@lists.infradead.org>
Subject: Re: doc2000 nftl[abcd] devices
References: <3D115F9B.9030203@ctam.com.au> <12942.1024563800@redhat.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
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


David Woodhouse wrote:

>brendan.simon@ctam.com.au said:
>
>> Now I try the same thing with nftlb and I get errors saying "Cannot
>>open  disk drive".  It should be the same process shouldn't it ?  Any
>>ideas of  where to look to fix or debug this ??  I've had a look at
>>nftldump and I  can see the 3 sets of media headers and they seem like
>>they are in the  right place.
>>
>
>It should be the same process, yes -- although perhaps you might want a 
>file system directly on each NFTL device, rather than partitioning them. 
>
>Stick some debugging printks into the nftl_open routine to see why it fails.
>(Or just enable debugging so the existing ones happen.)
>
<6>NFTL_open
<6>ENODEV: nftlnum = 1, thisNFTL = 0, minor = 16, ip = c3e56ba0, fp = 
c0192820
<6>NFTL_open
<6>ENODEV: nftlnum = 1, thisNFTL = 0, minor = 16, ip = c3e56ba0, fp = 
c0192820

I'm getting ENODEV.  It seems that the NFTLs[] array doesn't have the 
appropriate information.  How is this setup ?  I'm using modules so is 
it initialised so I assume it's initialised when I do an "insmod nftl". 
 Which routine scans the DOC2000 for NFTL devices and initialises the 
NFTLs[] array.  Interesting how nftl_open is called twice.  I'm not sure 
why ?

Here is a more detailed log:

# insmod nftl
Using /lib/modules/2.4.18-pre8/kernel/drivers/mtd/nftl.o
NFTL driver: nftlcore.c $Revision: 1.3 $, nftlmount.c $Revision: 1.6 $
NFTL_notify_add for DiskOnChip 2000
mtd->read = c500ac6c, size = 8388608, erasesize = 8192
NFTL_setup
Partition check:
 (== 0x%lx sects)
a:<6>NFTL_request
NFTL Read  request, from sector 0x0000 for 0x0002 sectors
Waiting for mutex
Got mutex
NFTL read request of 0x2 sectors @ 0 (req->nr_sectors == 8)
NFTL read request completed OK
end_request(1)
NFTL_request
NFTL Read  request, from sector 0x0002 for 0x0002 sectors
Waiting for mutex
Got mutex
NFTL read request of 0x2 sectors @ 2 (req->nr_sectors == 6)
NFTL read request completed OK
end_request(1)
NFTL_request
NFTL Read  request, from sector 0x0004 for 0x0002 sectors
Waiting for mutex
Got mutex
NFTL read request of 0x2 sectors @ 4 (req->nr_sectors == 4)
NFTL read request completed OK
end_request(1)
NFTL_request
NFTL Read  request, from sector 0x0006 for 0x0002 sectors
Waiting for mutex
Got mutex
NFTL read request of 0x2 sectors @ 6 (req->nr_sectors == 2)
NFTL read request completed OK
end_request(1)
 p1
devfs_register(disc): NULL ops, got c5017c8c from major table
devfs_register(part1): NULL ops, got c5017c8c from major table

#
#
# /util-linux/bin/fdisk /dev/nftlb
NFTL_open
ENODEV: nftlnum = 1, thisNFTL = 0, minor = 16, ip = c3e56ba0, fp = c0192820
NFTL_open
ENODEV: nftlnum = 1, thisNFTL = 0, minor = 16, ip = c3e56ba0, fp = c0192820

Unable to open /dev/nftlb
# grep -i nftl /proc/kmsg
<6>NFTL driver: nftlcore.c $Revision: 1.3 $, nftlmount.c $Revision: 1.6 $
<6>NFTL_notify_add for DiskOnChip 2000
<6>NFTL_setup
<4>a:<6>NFTL_request
<6>NFTL Read  request, from sector 0x0000 for 0x0002 sectors
<6>NFTL read request of 0x2 sectors @ 0 (req->nr_sectors == 8)
<6>NFTL read request completed OK
<6>NFTL_request
<6>NFTL Read  request, from sector 0x0002 for 0x0002 sectors
<6>NFTL read request of 0x2 sectors @ 2 (req->nr_sectors == 6)
<6>NFTL read request completed OK
<6>NFTL_request
<6>NFTL Read  request, from sector 0x0004 for 0x0002 sectors
<6>NFTL read request of 0x2 sectors @ 4 (req->nr_sectors == 4)
<6>NFTL read request completed OK
<6>NFTL_request
<6>NFTL Read  request, from sector 0x0006 for 0x0002 sectors
<6>NFTL read request of 0x2 sectors @ 6 (req->nr_sectors == 2)
<6>NFTL read request completed OK
<6>NFTL_open
<6>ENODEV: nftlnum = 1, thisNFTL = 0, minor = 16, ip = c3e56ba0, fp = 
c0192820
<6>NFTL_open
<6>ENODEV: nftlnum = 1, thisNFTL = 0, minor = 16, ip = c3e56ba0, fp = 
c0192820

Thanks,
Brendan Simon.
