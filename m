Received: from szxga03-in.huawei.com ([119.145.14.66])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YKejl-0000cs-Os
 for linux-mtd@lists.infradead.org; Mon, 09 Feb 2015 03:10:14 +0000
Message-ID: <54D824D7.90902@huawei.com>
Date: Mon, 9 Feb 2015 11:09:11 +0800
From: hujianyang <hujianyang@huawei.com>
MIME-Version: 1.0
To: Steve deRosier <derosier@gmail.com>
Subject: Re: [RFC] UBIFS recovery
References: <54D33C36.9060805@huawei.com>
 <CALupW3CQ3YCvdx_tNeDGVo9cVTcmACyqsMRpr8+P2_4jwGgZMQ@mail.gmail.com>
In-Reply-To: <CALupW3CQ3YCvdx_tNeDGVo9cVTcmACyqsMRpr8+P2_4jwGgZMQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
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

Hi Steve,

On 2015/2/5 23:08, Steve deRosier wrote:
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
> solution. 

Thanks~!

> Flash filesystems are different than on-disk filesystems, in
> particular in their usecase: they're generally both critical and
> exclusive to embedded systems. As such, the entire filesystem might be
> on the corrupted UBIFS, so even if the filesystem is recoverable, if
> we can't mount it and get at the userspace tool, then we're toast.
> Often the kernel itself is stored in a separate read-only partition as
> a blob directly on the flash, and thus the kernel itself would be
> fine. The better UBI & UBIFS can recover to a usable state in-kernel,
> the better off we are I think.
> 
> Just my thoughts on the matter.
> 
> - Steve
> 
> .
> 

I think it's a good standpoint you are providing. It's a problem like
filesystem dirver and filesystem partition. But it may not only exit
in UBIFS. A good user configuration is always needed to solve problems
like this.

Maybe an acceptable solution is mount the filesystem R/O first and then
perform other recoveries.

Thanks,
Hu
