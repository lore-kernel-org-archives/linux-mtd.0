Received: from sigma.superhosting.bg ([91.196.124.10])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1M9jNY-0005l3-DF
	for linux-mtd@lists.infradead.org; Thu, 28 May 2009 17:27:03 +0000
Message-ID: <4A1EC95A.1090806@rsc.bg>
Date: Thu, 28 May 2009 20:26:50 +0300
From: Stanislav Popov <s.popov@rsc.bg>
MIME-Version: 1.0
To: dedekind@infradead.org
Subject: Re: UBIFS ubimkvol issue and some others...
References: <4A1E8740.9050208@rsc.bg>
	<1243523800.11172.63.camel@localhost.localdomain>
In-Reply-To: <1243523800.11172.63.camel@localhost.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thanks for your reply!
Please find my answers/questions below.

Artem Bityutskiy wrote:
> On Thu, 2009-05-28 at 15:44 +0300, Stanislav Popov wrote:
>   
>> Hi all,
>>
>> I am trying to use UbiFS but having some issues.
>> I read the documentations and FAQs for UBI and UbiFS.
>> My kernel is pretty old (2.6.21) (I am not able to update it now)
>> but I successfully added UbiFS in it!
>>     
>
> How? It is not trivial. Did you use my old 2.6.21 backport tree?
>   
Yes, I ported it with the backport patch.
>   
>> I have problems with some of the coomands:
>> ------------------------------------------------------
>> # /mtdinfo
>> Count of MTD devices:           6
>> Present MTD devices:
>> mtdinfo: error!: libmtd failed get MTD device 0 information
>>          error 2 (No such file or directory)
>> ------------------------------------------------------
>> The following is one of the main issues:
>> # /ubiformat /dev//mtd5
>> ubiformat: error!: cannot get information about "/dev//mtd5"
>>            error 2 (No such file or directory)
>>     
>
> Do you have /dev/mtd* devices?
> What is in /proc/mtd?
>
>   
Yes, I have /dev/mtd* devices. What I see in kernel boot message (log is 
in my first post) is that /dev/mtd5 is successfully
attached (ubi.mtd kernel parameter)... Btw it is working using yaffs.
>> [<c01bcca0>] (ubi_eba_unmap_leb+0x0/0xac) from [<c01b8c84>] 
>> (ubi_change_vtbl_record+0xb0/0x114)
>>  r8:c3289e68 r7:c1d6dbd0 r6:00000000 r5:c1d6d800 r4:c3289d70
>> [<c01b8bd4>] (ubi_change_vtbl_record+0x0/0x114) from [<c01ba444>] 
>> (ubi_create_volume+0x510/0x640)
>>  r7:00000000 r6:00000000 r5:c3289d70 r4:c29b9140
>> [<c01b9f34>] (ubi_create_volume+0x0/0x640) from [<c01bbe80>] 
>> (ubi_cdev_ioctl+0x26c/0x3dc)
>> [<c01bbc14>] (ubi_cdev_ioctl+0x0/0x3dc) from [<c008fdd4>] 
>> (do_ioctl+0x7c/0x90)
>> [<c008fd58>] (do_ioctl+0x0/0x90) from [<c00900bc>] (vfs_ioctl+0x2d4/0x2f4)
>>  r7:00000036 r6:bee7cb78 r5:c28dd280 r4:c2975d40
>> [<c008fde8>] (vfs_ioctl+0x0/0x2f4) from [<c009011c>] (sys_ioctl+0x40/0x64)
>>  r9:c3288000 r8:c0023744 r6:40986f00 r5:fffffff7 r4:c2975d40
>> [<c00900dc>] (sys_ioctl+0x0/0x64) from [<c0022f60>] 
>> (ret_fast_syscall+0x0/0x2c)
>>  r6:bee7cc40 r5:bee7cf97 r4:00000003
>> Code: e5931004 e24b202c e50b302c e5832004 (e5812000
>>
>> Set volume siznote: ubimkvol[705] exited with preempt_count 2
>> e to 64329216
>> BUG: scheduling while atomic: ubimkvol/0x40000002/705
>> Segmentation fault
>>     
>
> Not sure. Probably related to your back-port. You'll have
> to debug this yourself.
>   
Do you have any ideas how can I start debuging it ?

BR,
Stanislav
