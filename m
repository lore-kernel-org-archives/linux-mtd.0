Received: from mail-pl0-x241.google.com ([2607:f8b0:400e:c01::241])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eaqeG-00050J-Ho
 for linux-mtd@lists.infradead.org; Sun, 14 Jan 2018 22:21:06 +0000
Received: by mail-pl0-x241.google.com with SMTP id 66so2350421plc.13
 for <linux-mtd@lists.infradead.org>; Sun, 14 Jan 2018 14:20:53 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20180114153915.4c6141a4@bbrezillon>
References: <1514946369-3674-1-git-send-email-bradleybolen@gmail.com>
 <20180114153915.4c6141a4@bbrezillon>
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Sun, 14 Jan 2018 19:20:52 -0300
Message-ID: <CAAEAJfDB59gnAJf+m7gPRhT-oknJ=bOEYdEvv=5snLW9G1yNqQ@mail.gmail.com>
Subject: Re: [PATCH] UBI: block: Must use a mutex when using
 idr_alloc/idr_remove
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Bradley Bolen <bradleybolen@gmail.com>, linux-mtd@lists.infradead.org,
 Artem Bityutskiy <dedekind1@gmail.com>, Richard Weinberger <richard@nod.at>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 14 January 2018 at 11:39, Boris Brezillon
<boris.brezillon@free-electrons.com> wrote:
> +Ezequiel
>
> Hi Bradley,
>
> On Tue,  2 Jan 2018 21:26:09 -0500
> Bradley Bolen <bradleybolen@gmail.com> wrote:
>
>> This fixes a race condition where running ubiblock on multiple volumes
>> simultaneously produces the following splat.
>>
>> kernel BUG at kernel-source/fs/sysfs/group.c:113!
>> Internal error: Oops - BUG: 0 [#1] PREEMPT SMP ARM
>> [<c01e4160>] (internal_create_group) from [<c01e43fc>]
>> (sysfs_create_group+0x20/0x24)
>> [<c01e43fc>] (sysfs_create_group) from [<c00e4800>]
>> (blk_trace_init_sysfs+0x18/0x20)
>> [<c00e4800>] (blk_trace_init_sysfs) from [<c02bc734>]
>> (blk_register_queue+0x6c/0x154)
>> [<c02bc734>] (blk_register_queue) from [<c02cd610>]
>> (device_add_disk+0x2c8/0x450)
>> [<c02cd610>] (device_add_disk) from [<c0430fac>]
>> (ubiblock_create+0x254/0x2e4)
>> [<c0430fac>] (ubiblock_create) from [<c0421a3c>]
>> (vol_cdev_ioctl+0x3e0/0x564)
>> [<c0421a3c>] (vol_cdev_ioctl) from [<c018a55c>] (vfs_ioctl+0x30/0x44)
>> [<c018a55c>] (vfs_ioctl) from [<c018ad2c>] (do_vfs_ioctl+0x694/0x798)
>> [<c018ad2c>] (do_vfs_ioctl) from [<c018ae74>] (SyS_ioctl+0x44/0x6c)
>> [<c018ae74>] (SyS_ioctl) from [<c0010720>] (ret_fast_syscall+0x0/0x34)
>>

I'm a little confused, how does this stack trace relates to idr?

>
> Missing Fixes and Cc-stable tags.
>
>> Signed-off-by: Bradley Bolen <bradleybolen@gmail.com>
>
>
> Reviewed-by: Boris Brezillon <boris.brezillon@free-electrons.com>
>
> BTW, just had a quick look at the code, and I think the locking can be
> simplified a bit by keeping the devices_lock for the whole
> ubiblock_create() operation instead of acquiring/releasing it several
> times in the function (see [1]). It makes sense to do fine grained
> locking when operations protected by the lock are time sensitive, but I
> don't think this is the case here.
>

Agreed. Something like this perhaps http://ix.io/E8G ?
Notice that ubiblock_remove_all seemed to require locking as well.
--=20
Ezequiel Garc=C3=ADa, VanguardiaSur
www.vanguardiasur.com.ar
