Received: from mail-ob0-x22e.google.com ([2607:f8b0:4003:c01::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZtErm-00011p-3g
 for linux-mtd@lists.infradead.org; Mon, 02 Nov 2015 13:09:42 +0000
Received: by obbwb3 with SMTP id wb3so94246648obb.0
 for <linux-mtd@lists.infradead.org>; Mon, 02 Nov 2015 05:09:21 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <9B6BBBFFF27FBB469F5F9ECB4655AFDA40FBA7@bruexc005.brumgt.local>
References: <9B6BBBFFF27FBB469F5F9ECB4655AFDA40FBA7@bruexc005.brumgt.local>
Date: Mon, 2 Nov 2015 14:09:20 +0100
Message-ID: <CAFLxGvziG728VCtfeDUd1=uze6RBSxDmtaU=8eGQnxFqbBwvkA@mail.gmail.com>
Subject: Re: MTD mounting problem
From: Richard Weinberger <richard.weinberger@gmail.com>
To: "Krug, Markus" <Markus.Krug@bruker.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Nov 2, 2015 at 1:21 PM, Krug, Markus <Markus.Krug@bruker.com> wrote:
> and /proc/mtd shows:
> dev:    size   erasesize  name
> mtd0: 00100000 00010000 "qspi-fsbl-uboot"
> mtd1: 00500000 00010000 "qspi-linux"
> mtd2: 00020000 00010000 "qspi-device-tree"
> mtd3: 005e0000 00010000 "qspi-rootfs"
> mtd4: 00400000 00010000 "qspi-bitstream"
> mtd5: 01000000 00010000 "qspi-data"
> So everything seems to be fine.
> But in /dev there are only mtd0, mtd1, mtdblock0 and mtdblock1.
> So I added with mknod the missing partitions.

This should not happen.
Is your /dev really not managed by udev or devtmpfs?

> Then I run:
> flash_eraseall /dev/mtd5 (no problem)
> mount -t jffs2 /dev/mtdblock5 /mnt
> the mounting failed:
> mount: mounting /dev/mtdblock5 on /mnt failed: No such device
>
> Does someone know whats going wrong?

I think the root cause is the missing device node.
Please double check why it is not present.

-- 
Thanks,
//richard
