Received: from mail-wm0-x235.google.com ([2a00:1450:400c:c09::235])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eKQlc-0003nN-9x
 for linux-mtd@lists.infradead.org; Thu, 30 Nov 2017 15:28:49 +0000
Received: by mail-wm0-x235.google.com with SMTP id l141so13769913wmg.1
 for <linux-mtd@lists.infradead.org>; Thu, 30 Nov 2017 07:28:27 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <d868125b-638e-4007-7a90-22937ffca9c6@nedap.com>
References: <d868125b-638e-4007-7a90-22937ffca9c6@nedap.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Thu, 30 Nov 2017 16:28:25 +0100
Message-ID: <CAFLxGvwW_1ydC9XHFG+-UvY_L=h9TLQ5Eh0jgcGBPFyU9qf0-w@mail.gmail.com>
Subject: Re: Mounting issue with old rootfs and new kernel
To: Jaap de Jong <jaap.dejong@nedap.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Jaap,

On Thu, Nov 30, 2017 at 4:22 PM, Jaap de Jong <jaap.dejong@nedap.com> wrote:
> Hi
>
> I'm hoping for some pointers.
>
> I have this a created with openembedded classic.
>
> It works just fine when running with an old kernel (2.6.35)
>
> Now with the same rootfs and a newer kernel (4.9.28) it damages the old
> rootfs in such a way that it becomes unusable.
>
> This is the error it shows:
>
>                         [    1.523437] ubi0 error: ubi_read_volume_table:
> the layout volume was not found
>                         [    1.531250] ubi0 error: ubi_attach_mtd_dev:
> failed to attach mtd3, error -22

Are these really the only erros/warnings from UBI?

>                         [    1.539062] UBI error: cannot attach mtd3
>                         [    1.546875] Kernel panic - not syncing: VFS:
> Unable to mount root fs on unknown-block(0,0)
>                         [    1.546875] Rebooting in 1 seconds..RomBOOT
>
> As far as I can see the kernel configuration seems to be ok.
>
> Any ideas?

If the MTD layout had changed I'd expect more errors from UBI.
Is this NAND?

Did you compare the MTD partition layout and number of bad blocks?

-- 
Thanks,
//richard
