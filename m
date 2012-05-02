Received: from mail-yx0-f177.google.com ([209.85.213.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SPVWg-0003CR-DA
 for linux-mtd@lists.infradead.org; Wed, 02 May 2012 09:07:12 +0000
Received: by yenm7 with SMTP id m7so461936yen.36
 for <linux-mtd@lists.infradead.org>; Wed, 02 May 2012 02:07:07 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CADZ6=asdcCJOnPJfkV67wNHu2CX16NTzmN5z14nDhqGVvHdo4g@mail.gmail.com>
References: <CADZ6=aumk74QxF3kjenFYqQUZ-OaPT8gmrN-xUGE6NPPyq87NQ@mail.gmail.com>
 <CADZ6=asURkKX6VB_UsmtcMnU5N8Xq_Lv7uRpkvYmQ3YBU7tvhQ@mail.gmail.com>
 <Pine.LNX.4.64.1205020933520.20592@lnxricardw.se.axis.com>
 <CADZ6=asdcCJOnPJfkV67wNHu2CX16NTzmN5z14nDhqGVvHdo4g@mail.gmail.com>
From: Gregory CLEMENT <gclement00@gmail.com>
Date: Wed, 2 May 2012 11:06:47 +0200
Message-ID: <CADx9zJBwrSWbBQ0KbP-kr2CmYcLs5g3vn10VQdAp6qHwyQbJiw@mail.gmail.com>
Subject: Re: State of read-only filesystems in NAND / MTD bad blocks handling
 when reading
To: Thilo Fromm <fromm@dresearch-fe.de>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: David Wagner <deubeuliou@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Ricard Wanderlof <ricard.wanderlof@axis.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Le 2 mai 2012 10:25, Thilo Fromm <fromm@dresearch-fe.de> a =E9crit :
> Hello Richard,
>
> thanks for your response.
>
>>> > I'm on a TI embedded system on kernel 2.6.37. Could you please fill m=
e
>>> > in on the current state of readonly filesystems living in NAND flash
>>> > w/ bad blocks?
> [ ... ]
>>> >
>>> > This means I can safely write the root fs into a MTD partition, but I
>>> > cannot read it back safely (let alone mount it). Is there a generic
>>> > way to have the MTD driver auto-skip bad blocks? What happened to
>>> > MTD_BLOCK_RO_BBFREE?
>>>
>>> Is no-one else using read-only filesystems in NAND flash w/ bad blocks
>>> in it? Do I miss something obvious? Help?
>>
>> It is true that read-only file systems such as cramfs cannot in the gene=
ral
>> case operate on nand flash because of the bad blocks issue.
>
> Oh, bummer.
>
>> One way is to use a file system intended for flashes, but mount it
>> read-only. I.e. use a jffs2 filesystem, mounted readonly.
>
> Yupp, or I coud hack up SquashFS to be bad blocks aware. However, it
> feels kind of wrong to me to leave bad block handling to the file
> system layer. Because I would have to provide bad block awareness to
> every read-only FS I am planning to use. Over and over again.
>
>> Or, let UBI handle the flash, and use ubifs in a static volume, which me=
ans
>> it will be non-writable. Last time I checked it wasn't possible to use f=
ile
>> systems such as cramfs on UBI, because UBI did not supply a block device
>> which is required by cramfs. I seem to remember some patch to add block
>> devices to UBI, not sure what the state of that is.
>
> I think a simpler option would be to have your (read-only squash-)root
> FS image in a static UBI volume and mount it via loop-back. This is
> currently our fallback option. Still this feels like way too much
> overhead for what we're looking for.
>
> It's rather easy for both boot loader and Linux to write to a raw
> flash device, skipping bad blocks along the way. It's also easy for
> the boot loader to read back what was written, also skipping bad
> blocks. Finally, using an user space tool like "nanddump", I can read
> back what *really* has been written without a problem.
>
> Unfortunately it seems to be impossible to provide this read behavior
> via an MTD API to other parts of the linux kernel. All the workarounds
> seem such a waste, and this bad block-free read-only API seems such a
> good idea for a lot of things I'm really curious why the work on
> something as cool as MTD_BLOCK_RO_BBFREE =A0ceased in 2006.
>
>> A slightly different solution is to have the root file system as an
>> initramfs, stored with the kernel. That way, you unpack a large
>> kernel+rootfs image to memory and run it there. It tends to be a bit
>> wasteful on both flash and RAM though. Also, the file system is always
>> writable, but of course any writes are not mirrored back to the flash.
>
> Exactly, and the RAM requirements hurt most, I think. However, this is
> still a fallback alternative, so thanks for suggesting this.
>
> Since I really like the idea of a MTD block device that skips bad
> blocks when reading I'm currently in the process of re-animating the
> BBFREE patch <http://lists.infradead.org/pipermail/linux-mtd/2006-Novembe=
r/016835.html>:
> it compiles for me, but still has some major issues. I'll keep this
> list up to date on my progress.

Hi,

a few years ago I also tried to reanimated this patch, it was nearly
adopted, but there were some argue about bit flipping during read or
why create a new device driver: see
http://lists.infradead.org/pipermail/linux-mtd/2007-November/019938.html
and the dozen of email of this thread.

Finally Ricard Wanderlof share his experience about bit flipping
during reading and concluded that "At least for this chip [ST 256
Mbit flash], it seemed that if a block has only been written a few
times, then there seems to be virtually no limit to how many times it
can be read without bit flips occurring ".

About "why create a new device driver" vitally Wool explained it was
explicitly directed by David because he didn't want to add confusion.

But this patch were never merged in the end, maybe I should have to
push more.

Since this, at Free Electrons we worked on the same kind of feature
but based on UBI: ubiblk, see http://lwn.net/Articles/452944/

There were still some minor issue that prevents the patches to be
included in mtd. I hope David will find time to solve them soon.

Regards,

--=20
Gregory CLEMENT
