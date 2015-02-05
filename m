Received: from mail-ig0-x235.google.com ([2607:f8b0:4001:c05::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YJO2w-0004Qx-Ob
 for linux-mtd@lists.infradead.org; Thu, 05 Feb 2015 15:08:47 +0000
Received: by mail-ig0-f181.google.com with SMTP id hn18so13024513igb.2
 for <linux-mtd@lists.infradead.org>; Thu, 05 Feb 2015 07:08:24 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <54D33C36.9060805@huawei.com>
References: <54D33C36.9060805@huawei.com>
Date: Thu, 5 Feb 2015 07:08:24 -0800
Message-ID: <CALupW3CQ3YCvdx_tNeDGVo9cVTcmACyqsMRpr8+P2_4jwGgZMQ@mail.gmail.com>
Subject: Re: [RFC] UBIFS recovery
From: Steve deRosier <derosier@gmail.com>
To: hujianyang <hujianyang@huawei.com>
Content-Type: text/plain; charset=UTF-8
Cc: Richard Weinberger <richard@nod.at>,
 linux-mtd <linux-mtd@lists.infradead.org>, Sheng Yong <shengyong1@huawei.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Feb 5, 2015 at 1:47 AM, hujianyang <hujianyang@huawei.com> wrote:
> There are two ways for UBIFS recovery. One is repairing UBIFS image
> in userspace via UBI interfaces, the other is repairing the corrupted
> data during mount by default or via a special mount option.
>
> The userspace tool is the most effective way to repair a partition.
> It could have enough time and resource to whole scan the target and
> cleanup the corrupted while the file-system offline. But it's hard
> to program: many structures and functions in kernel need to be copied
> into this utility, current ubi-utils focus mostly on UBI device, not
> UBIFS, and the subsequent updating of file-system should consider the
> userspace tool. It's too complicated.
>

I hear (and agree with) several valid arguments for a tool in
userspace. And I'd like to throw my support towards an in-driver
solution. Flash filesystems are different than on-disk filesystems, in
particular in their usecase: they're generally both critical and
exclusive to embedded systems. As such, the entire filesystem might be
on the corrupted UBIFS, so even if the filesystem is recoverable, if
we can't mount it and get at the userspace tool, then we're toast.
Often the kernel itself is stored in a separate read-only partition as
a blob directly on the flash, and thus the kernel itself would be
fine. The better UBI & UBIFS can recover to a usable state in-kernel,
the better off we are I think.

Just my thoughts on the matter.

- Steve
