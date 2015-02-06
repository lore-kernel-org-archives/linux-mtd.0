Received: from mga03.intel.com ([134.134.136.65])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YJmfs-0006E7-C3
 for linux-mtd@lists.infradead.org; Fri, 06 Feb 2015 17:26:36 +0000
Message-ID: <1423243571.8637.579.camel@sauron.fi.intel.com>
Subject: Re: [RFC] UBIFS recovery
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Steve deRosier <derosier@gmail.com>
Date: Fri, 06 Feb 2015 19:26:11 +0200
In-Reply-To: <CALupW3CQ3YCvdx_tNeDGVo9cVTcmACyqsMRpr8+P2_4jwGgZMQ@mail.gmail.com>
References: <54D33C36.9060805@huawei.com>
 <CALupW3CQ3YCvdx_tNeDGVo9cVTcmACyqsMRpr8+P2_4jwGgZMQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Richard Weinberger <richard@nod.at>,
 linux-mtd <linux-mtd@lists.infradead.org>, Sheng Yong <shengyong1@huawei.com>,
 hujianyang <hujianyang@huawei.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2015-02-05 at 07:08 -0800, Steve deRosier wrote:
> I hear (and agree with) several valid arguments for a tool in
> userspace. And I'd like to throw my support towards an in-driver
> solution. Flash filesystems are different than on-disk filesystems, in
> particular in their usecase: they're generally both critical and
> exclusive to embedded systems. As such, the entire filesystem might be
> on the corrupted UBIFS, so even if the filesystem is recoverable, if
> we can't mount it and get at the userspace tool, then we're toast.
> Often the kernel itself is stored in a separate read-only partition as
> a blob directly on the flash, and thus the kernel itself would be
> fine. The better UBI & UBIFS can recover to a usable state in-kernel,
> the better off we are I think.

Yes, being able to mount a corrupted FS R/O sounds like a good goal. We
are not speaking of recovery here, just about mounting R/O and providing
access to as much uncorrupted data as we can.

If FS index is not corrupted, this sounds quite doable. If the index is
corrupted, though, this requires full scan and index rebuild. Other wise
we'd mount and show empty file-system.

I can see a potential problem of reading "insane" data from flash (some
circular never ending references, etc) - the driver should be very
careful about those. On the other hand, the driver should be careful
even if we are not talking about corruptions.

Artem.
