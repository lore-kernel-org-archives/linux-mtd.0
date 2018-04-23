Received: from mail-wr0-x22c.google.com ([2a00:1450:400c:c0c::22c])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fAYBl-0004Oh-U3
 for linux-mtd@lists.infradead.org; Mon, 23 Apr 2018 09:55:42 +0000
Received: by mail-wr0-x22c.google.com with SMTP id p18-v6so20271381wrm.1
 for <linux-mtd@lists.infradead.org>; Mon, 23 Apr 2018 02:55:01 -0700 (PDT)
Subject: Re: [PATCH] mtdcore: add writeable attribute in sysfs
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: linux-mtd@lists.infradead.org
References: <20180412134232.14006-1-charles-antoine.couret@essensium.com>
 <20180420214327.25b8ac15@bbrezillon>
From: Couret Charles-Antoine <charles-antoine.couret@essensium.com>
Message-ID: <730d293f-f32f-1854-afc9-e3d5aa7338b0@essensium.com>
Date: Mon, 23 Apr 2018 11:54:57 +0200
MIME-Version: 1.0
In-Reply-To: <20180420214327.25b8ac15@bbrezillon>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Le 20/04/2018 à 21:43, Boris Brezillon a écrit :
> Hi Charles-Antoine,
Hi,
> Hm, why don't you remove the RO constraint on such partitions then? I
> mean, if the device can be written, even rarely, it's no longer a
> read-only device.
Sometimes the partition is set as read-only but it is not the case in 
reality, it is only a software flag.
 From my experience, it is often to protect the bootloader to be changed 
from Linux system. To avoid corruption (or to get full control)
>> Or to protect the device without using mtdro virtual device to read the content.
> What's the point? Only root can access /dev/mtdX. Looks like you want
> to protect against inadvertent write to the wrong MTD dev, but I'm not
> sure this is the kernel responsibility to enforce that.
Yes the idea is to keep (or to set) this additional protection and 
having a way to by-pass only when it is relevant (to make an update or 
to do something special).
I am not sure that is a big deal to add this change on the kernel, the 
code is very light and simple.
> Missing Signed-off-by tag.
Thanks, I will add that.
> Please align parameters on the open-parenthesis.
Thanks, sorry for this issue.
>
> What happens if you turn a RW device into a RO while it's still being
> used by someone? Not sure at all this is safe.
>
> Regards,
>
> Boris
The writeable flag is checked before the write operation. If this flag 
is cleared while a process is writing something, the write operation can 
be completed. But after this completion, no other write operations are 
allowed.

I will make some tests tomorrow to check this part. But normally that 
should not be an issue.
Regards,
Charles-Antoine Couret
