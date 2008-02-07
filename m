Received: from rv-out-0910.google.com ([209.85.198.188])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JN04G-0006hy-Oj
	for linux-mtd@lists.infradead.org; Thu, 07 Feb 2008 06:17:12 +0000
Received: by rv-out-0910.google.com with SMTP id c24so3820350rvf.42
	for <linux-mtd@lists.infradead.org>;
	Wed, 06 Feb 2008 22:17:03 -0800 (PST)
Message-ID: <47AAA255.4050009@gmail.com>
Date: Thu, 07 Feb 2008 11:46:53 +0530
From: Max Stirling <vicky.irobot@gmail.com>
MIME-Version: 1.0
To: Adams Richard-W36112 <rgadams@motorola.com>
Subject: Re: mtdblock mount issue
References: <47A71EF4.2090202@gmail.com>
	<A2EC06CB0E393B4C8EB220B286B7083E058EFCAC@ct11exm60.ds.mot.com>
In-Reply-To: <A2EC06CB0E393B4C8EB220B286B7083E058EFCAC@ct11exm60.ds.mot.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Adams Richard-W36112 wrote:
>> -----Original Message-----
>> From: linux-mtd-bounces@lists.infradead.org 
>> [mailto:linux-mtd-bounces@lists.infradead.org] On Behalf Of 
>> Max Stirling
>> Sent: Monday, February 04, 2008 6:20 AM
>> To: linux-mtd@lists.infradead.org
>> Subject: mtdblock mount issue
>>
>> Hi,
>>
>> I am trying to mount a cramfs partition from flash. I have 
>> the low level driver written and MTDBLOCK_RO module is enabled in MTD,
>>
>> My mount fails with invalid argument error.
>>
>> /mount: Mounting /dev/mtdblock on /home/crfs failed: Invalid argument/
>>
>> I am using a 512 byte NAND flash 16byte spare.
>>
>> I can find cramfs in /proc/filesytems and the mtdblock is 
>> under /proc/devices.
>>
>> I had enabled a few debug statements in the mtdblock_ro and 
>> the low level nand driver code. I find that the mount is 
>> reading 32 pages after which it fails with invalid argument. 
>> Below is the log.
>>
>> If you see the log below, the flow of code is
>>
>>  cramfs_read ==> do_blktrans_request ==> mtdblock_readsect 
>> ==> mt_read(my low level read function which returns success)
>>
>> I even dumped the hex of the data being read by my low level 
>> driver module and found to match the cramfs image that I 
>> wrote to the flash.
>>
>>
>> ######################*LOG*##########################
>>
>> /home # mkdir crfs
>> /home # cat /proc/devices | grep mtdblock
>>  31 mtdblock
>> /home # cat proc/filesystems | grep cramfs
>>     cramfs
>> /home #
>> /home # mknod /dev/mtdblock b 31 0
>> /home # mount -t cramfs /dev/mtdblock /home/crfs
>> mount: /dev/mtdblock is write-protected, mounting read-only
>> cramfs_read
>> do_blktrans_request nsect:8 block:0
>> mtdblock_readsect
>> mt_read offset:0
>> mt_read status:0
>> mtdblock_readsect
>> mt_read offset:512
>> mt_read status:0
>> mtdblock_readsect
>> mt_read offset:1024
>> mt_read status:0
>> mtdblock_readsect
>> mt_read offset:1536
>> mt_read status:0
>> mtdblock_readsect
>> mt_read offset:2048
>> mt_read status:0
>> mtdblock_readsect
>> mt_read offset:2560
>> mt_read status:0
>> mtdblock_readsect
>> mt_read offset:3072
>> mt_read status:0
>> mtdblock_readsect
>> mt_read offset:3584
>> mt_read status:0
>> do_blktrans_request nsect:8 block:0
>> mtdblock_readsect
>> mt_read offset:4096
>> mt_read status:0
>> mtdblock_readsect
>> mt_read offset:4608
>> mt_read status:0
>> mtdblock_readsect
>> mt_read offset:5120
>> mt_read status:0
>> mtdblock_readsect
>> mt_read offset:5632
>> mt_read status:0
>> mtdblock_readsect
>> mt_read offset:6144
>> mt_read status:0
>> mtdblock_readsect
>> mt_read offset:6656
>> mt_read status:0
>> mtdblock_readsect
>> mt_read offset:7168
>> mt_read status:0
>> mtdblock_readsect
>> mt_read offset:7680
>> mt_read status:0
>> do_blktrans_request nsect:8 block:0
>> mtdblock_readsect
>> mt_read offset:8192
>> mt_read status:0
>> mtdblock_readsect
>> mt_read offset:8704
>> mt_read status:0
>> mtdblock_readsect
>> mt_read offset:9216
>> mt_read status:0
>> mtdblock_readsect
>> mt_read offset:9728
>> mt_read status:0
>> mtdblock_readsect
>> mt_read offset:10240
>> mt_read status:0
>> mtdblock_readsect
>> mt_read offset:10752
>> mt_read status:0
>> mtdblock_readsect
>> mt_read offset:11264
>> mt_read status:0
>> mtdblock_readsect
>> mt_read offset:11776
>> mt_read status:0
>> do_blktrans_request nsect:8 block:0
>> mtdblock_readsect
>> mt_read offset:12288
>> mt_read status:0
>> mtdblock_readsect
>> mt_read offset:12800
>> mt_read status:0
>> mtdblock_readsect
>> mt_read offset:13312
>> mt_read status:0
>> mtdblock_readsect
>> mt_read offset:13824
>> mt_read status:0
>> mtdblock_readsect
>> mt_read offset:14336
>> mt_read status:0
>> mtdblock_readsect
>> mt_read offset:14848
>> mt_read status:0
>> mtdblock_readsect
>> mt_read offset:15360
>> mt_read status:0
>> mtdblock_readsect
>> mt_read offset:15872
>> mt_read status:0
>> cramfs_read
>> mount: Mounting /dev/mtdblock on /home/crfs failed: Invalid argument
>> /home #
>>
>> ########################################################
>>
>>
>> I hope I have provided the maximum information. Looking 
>> forward for some 
>> help.
>>
>>     
>
> You need to mount the file system as read only. I believe I've seen this
> error when I've mounted a squashfs (also a read only file system)
> without specifying the read only option.
>
> Try this command:
> mount /dev/mtdblock /home/crfs  -t cramfs -o ro
>
> Rick
>   
Thanks mate.  After some debugging I found that in cramfs_read function 
it calls read_cache_page and the returned superblock magic is not 
correct from cramfs_read.

I am not sure whatz gone wrong since in my low level driver code I 
dumped the data that is being copied to the buffer that readsect from 
block_ro passed and the magic was right there.

Have to dig into what might be causing this wrong data to be returned by 
read_cache_page. One more thing that I noticed was that for every run 
the magic in the page that read_cache_page returns is different !!!

I am using linux kernel 2.6.10, the latest kernel calls 
read_mapping_page_async in cramfs_read. Not sure if this was a fix to 
what I have been seeing or something wrong here.


-- 
Max Stirling
