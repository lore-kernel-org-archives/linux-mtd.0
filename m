Received: from mail-wr0-x229.google.com ([2a00:1450:400c:c0c::229])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f31p8-0004tp-Sb
 for linux-mtd@lists.infradead.org; Mon, 02 Apr 2018 15:56:48 +0000
Received: by mail-wr0-x229.google.com with SMTP id l49so14428698wrl.4
 for <linux-mtd@lists.infradead.org>; Mon, 02 Apr 2018 08:56:35 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CADFuHZ6c5p7opDgAoPc6oq8O6udSsFzW2VS721PNjoTh6v9D8g@mail.gmail.com>
References: <CADFuHZ4L4+-V2XYzTbpuMDL5BycfDU7QaVZo6z+PTTQA4cXFoA@mail.gmail.com>
 <CADFuHZ6c5p7opDgAoPc6oq8O6udSsFzW2VS721PNjoTh6v9D8g@mail.gmail.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Mon, 2 Apr 2018 17:56:33 +0200
Message-ID: <CAFLxGvzvLNs7ONc+N7YHziULyK-FEz+rE8ASv=F4nnHaSH1DfQ@mail.gmail.com>
Subject: Re: Question regarding container affecting the host system mounts
To: Ronak Desai <ronak.desai@rockwellcollins.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
 "linux-mtd @ lists . infradead . org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ronak Desai,

On Mon, Apr 2, 2018 at 5:40 PM, Ronak Desai
<ronak.desai@rockwellcollins.com> wrote:
> I am able to workaround this issue by marking the mount as unbinadable
> and clearing the flag (CL_COPY_UNBINDABLE) in "copy_tree" function in
> fs/namespace.c. This skips the unbindable mounts to get cloned inside
> the new namespace. For my use-case this is acceptable.
>
> On Thu, Mar 29, 2018 at 3:50 PM, Ronak Desai
> <ronak.desai@rockwellcollins.com> wrote:
>> I came across a problem where if the containers are running then it
>> affects the unmount process of the system's mount points. I am not
>> using these mount points as shared mounts with container.
>>
>> For example, I am using SD card and NAND as external storage device
>> and mounting it to a mount point in the ramfs. Then I am launching
>> containers and then when I try to unmount the NAND partition then my
>> "unmount" call succeeds but I don't see the UBIFS hooks being called
>> and because of that my UBI detach process fails. When I stopped the
>> container then I see that kernel is calling the unmount as I see my
>> debug prints inside the UBIFS for unmounting that partition.
>>
>> If I tried to mount my NAND partition once the container is up and try
>> to unmount then it does unmount and detach without issue. It seems
>> like there is an issue with namespace.
>>
>> I am using 4.1.8 kernel .  I traced the kernel code and I see that
>> copy_mnt_ns is calling copy_tree and which basically increasing the
>> active counts of the super block of my host mount points (NAND, SD cards).
>> I am using container but I do not wish to share any of my host storage
>> media with
>> container so in my container configuration I am only mounting the
>> tmpfs as the rootfs of container is in in tmpfs of host. But, still I
>> can't umount completely my host storage media if containers are
>> running.
>>
>> I have attached the log of the container start process with debugging
>> and where you can see it is increasing the super block active counts
>> for "ubifs".

Not sure if I understand the problem correctly, isn't this just a matter of
mount point propagation?
See MS_PRIVATE.

-- 
Thanks,
//richard
