Received: from mail-io0-x235.google.com ([2607:f8b0:4001:c06::235])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fTlcT-0002Vk-4n
 for linux-mtd@lists.infradead.org; Fri, 15 Jun 2018 10:06:15 +0000
Received: by mail-io0-x235.google.com with SMTP id l19-v6so10239823ioj.5
 for <linux-mtd@lists.infradead.org>; Fri, 15 Jun 2018 03:06:02 -0700 (PDT)
MIME-Version: 1.0
References: <0150f7263d53419196ec1574f4620201@SIWEX5A.sing.micron.com>
In-Reply-To: <0150f7263d53419196ec1574f4620201@SIWEX5A.sing.micron.com>
From: Martin Townsend <mtownsend1973@gmail.com>
Date: Fri, 15 Jun 2018 11:05:51 +0100
Message-ID: <CABatt_wgKnkwJhYqhTxcHxi9S8R2rO7aD3MP18emJVGh9MyzjQ@mail.gmail.com>
Subject: Re: mtdparts ro question
To: beanhuo@micron.com
Cc: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jun 15, 2018 at 10:13 AM Bean Huo (beanhuo) <beanhuo@micron.com> wrote:
>
> I don't know whether latest mtd-utils has this. But I think,  re-mount also can make this partition read/write. doesn't need reboot.

Thanks for the reply, do you mean using mount to remount the
filesystem, ie mount -o,remount rw

I tried this but I get the following
mount -o,remount rw /
mount: /: cannot remount rw read-write, is write-protected.

I can't find any trace of a re-mount utility.  I see there is a
flash_unlock but I think this is for flash devices that support
locking at a sector level.

Looking through the kernel source code there's a structure
mtd_partition that has a mask_flags field.  In
/drivers/mtd/cmdlinepart.c it will detect that the partition is
readonly and set the MTD_WRITEABLE flag to mask this out and make the
partition read only. Looking through the rest of the mtd source I
can't see anyway that this could get cleared from userspace.  So I'm
guessing once it's write protected it remains write protected.  I just
wanted to confirm this.  In fact it could be quite advantageous to
have it work this way as it will stop anyone tampering with the
rootfs.

Many Thanks,
Martin.
