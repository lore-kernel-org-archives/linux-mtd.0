Received: from szxga01-in.huawei.com ([119.145.14.64])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YKePV-0001YS-0v
 for linux-mtd@lists.infradead.org; Mon, 09 Feb 2015 02:49:17 +0000
Message-ID: <54D81FF2.3090702@huawei.com>
Date: Mon, 9 Feb 2015 10:48:18 +0800
From: hujianyang <hujianyang@huawei.com>
MIME-Version: 1.0
To: Richard Weinberger <richard@nod.at>
Subject: Re: [RFC] UBIFS recovery
References: <54D33C36.9060805@huawei.com>	
 <CALupW3CQ3YCvdx_tNeDGVo9cVTcmACyqsMRpr8+P2_4jwGgZMQ@mail.gmail.com>
 <1423243571.8637.579.camel@sauron.fi.intel.com> <54D4FAFD.9000009@nod.at>
In-Reply-To: <54D4FAFD.9000009@nod.at>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Cc: Steve deRosier <derosier@gmail.com>,
 linux-mtd <linux-mtd@lists.infradead.org>, Sheng Yong <shengyong1@huawei.com>,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2015/2/7 1:33, Richard Weinberger wrote:
> Am 06.02.2015 um 18:26 schrieb Artem Bityutskiy:
>> On Thu, 2015-02-05 at 07:08 -0800, Steve deRosier wrote:
>>> I hear (and agree with) several valid arguments for a tool in
>>> userspace. And I'd like to throw my support towards an in-driver
>>> solution. Flash filesystems are different than on-disk filesystems, in
>>> particular in their usecase: they're generally both critical and
>>> exclusive to embedded systems. As such, the entire filesystem might be
>>> on the corrupted UBIFS, so even if the filesystem is recoverable, if
>>> we can't mount it and get at the userspace tool, then we're toast.
>>> Often the kernel itself is stored in a separate read-only partition as
>>> a blob directly on the flash, and thus the kernel itself would be
>>> fine. The better UBI & UBIFS can recover to a usable state in-kernel,
>>> the better off we are I think.
>>
>> Yes, being able to mount a corrupted FS R/O sounds like a good goal. We
>> are not speaking of recovery here, just about mounting R/O and providing
>> access to as much uncorrupted data as we can.
>>
>> If FS index is not corrupted, this sounds quite doable. If the index is
>> corrupted, though, this requires full scan and index rebuild. Other wise
>> we'd mount and show empty file-system.
> 
> While I agree that mounting RO to get access to data is a feasible goal
> I really think that this is the job of a debugfs.ubifs tool.
> The kernel cannot ask questions, such a tool can.
> 

Hi Richard,

What's the different between fsck.ubifs and debugfs.ubifs? Debugfs.ubifs
seems need to provide more debugging option, not just recovery. Could you
please talk more about your thinking?

For mounting R/O case, I think we could do it directly in kernel.

Thanks,
Hu
