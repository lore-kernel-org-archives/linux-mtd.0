Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YJVyM-0004LK-Rr
 for linux-mtd@lists.infradead.org; Thu, 05 Feb 2015 23:36:36 +0000
Message-ID: <54D3FE65.5030008@nod.at>
Date: Fri, 06 Feb 2015 00:36:05 +0100
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Steve deRosier <derosier@gmail.com>,
 hujianyang <hujianyang@huawei.com>
Subject: Re: [RFC] UBIFS recovery
References: <54D33C36.9060805@huawei.com>
 <CALupW3CQ3YCvdx_tNeDGVo9cVTcmACyqsMRpr8+P2_4jwGgZMQ@mail.gmail.com>
In-Reply-To: <CALupW3CQ3YCvdx_tNeDGVo9cVTcmACyqsMRpr8+P2_4jwGgZMQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
 Sheng Yong <shengyong1@huawei.com>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 05.02.2015 um 16:08 schrieb Steve deRosier:
> On Thu, Feb 5, 2015 at 1:47 AM, hujianyang <hujianyang@huawei.com> wrote:
>> There are two ways for UBIFS recovery. One is repairing UBIFS image
>> in userspace via UBI interfaces, the other is repairing the corrupted
>> data during mount by default or via a special mount option.
>>
>> The userspace tool is the most effective way to repair a partition.
>> It could have enough time and resource to whole scan the target and
>> cleanup the corrupted while the file-system offline. But it's hard
>> to program: many structures and functions in kernel need to be copied
>> into this utility, current ubi-utils focus mostly on UBI device, not
>> UBIFS, and the subsequent updating of file-system should consider the
>> userspace tool. It's too complicated.
>>
> 
> I hear (and agree with) several valid arguments for a tool in
> userspace. And I'd like to throw my support towards an in-driver
> solution. Flash filesystems are different than on-disk filesystems, in
> particular in their usecase: they're generally both critical and
> exclusive to embedded systems. As such, the entire filesystem might be
> on the corrupted UBIFS, so even if the filesystem is recoverable, if
> we can't mount it and get at the userspace tool, then we're toast.

No, embedded is not per se an excuse for doing bad/stupid things.
Embedded is *not* special.
There are folks out there that want a "force" mount option for UBIFS
to mount it in any case no matter in how bad shape it is.
But this will make the situation much worse as you'll get silent data
corruption/loss.
It is as stupid as running a "fsck -y /dev/sdXY" at every boot on a
regular disk filesystem.

UBIFS can only fully automatically recover *iff* it can guarantee that it
will be consistent after recovery and does not lose data.
If not is has to fail at mount time.
What does it help if UBIFS successfully mounts but /sbin/init is damaged or
the permissions of /etc/shadow are corrupted?
On the other hand, if UBIFS can do a better job at automatically and safe
recovery, lets improve it.

But what we really need is a fsck.ubifs and a debugfs.ubifs.
In-kernel recovery cannot replace a fsck as in-kernel will always be non-interactive.

> Often the kernel itself is stored in a separate read-only partition as
> a blob directly on the flash, and thus the kernel itself would be
> fine. The better UBI & UBIFS can recover to a usable state in-kernel,
> the better off we are I think.

Using an initramfs you can have an fsck.ubifs without a mounted root.

Thanks,
//richard
