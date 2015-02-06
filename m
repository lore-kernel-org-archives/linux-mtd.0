Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YJmu0-0004XX-Jd
 for linux-mtd@lists.infradead.org; Fri, 06 Feb 2015 17:41:12 +0000
Message-ID: <1423244437.8637.587.camel@sauron.fi.intel.com>
Subject: Re: [RFC] UBIFS recovery
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Richard Weinberger <richard@nod.at>
Date: Fri, 06 Feb 2015 19:40:37 +0200
In-Reply-To: <54D4FAFD.9000009@nod.at>
References: <54D33C36.9060805@huawei.com>
 <CALupW3CQ3YCvdx_tNeDGVo9cVTcmACyqsMRpr8+P2_4jwGgZMQ@mail.gmail.com>
 <1423243571.8637.579.camel@sauron.fi.intel.com> <54D4FAFD.9000009@nod.at>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Steve deRosier <derosier@gmail.com>,
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

On Fri, 2015-02-06 at 18:33 +0100, Richard Weinberger wrote:
> Am 06.02.2015 um 18:26 schrieb Artem Bityutskiy:
> > On Thu, 2015-02-05 at 07:08 -0800, Steve deRosier wrote:
> >> I hear (and agree with) several valid arguments for a tool in
> >> userspace. And I'd like to throw my support towards an in-driver
> >> solution. Flash filesystems are different than on-disk filesystems, in
> >> particular in their usecase: they're generally both critical and
> >> exclusive to embedded systems. As such, the entire filesystem might be
> >> on the corrupted UBIFS, so even if the filesystem is recoverable, if
> >> we can't mount it and get at the userspace tool, then we're toast.
> >> Often the kernel itself is stored in a separate read-only partition as
> >> a blob directly on the flash, and thus the kernel itself would be
> >> fine. The better UBI & UBIFS can recover to a usable state in-kernel,
> >> the better off we are I think.
> > 
> > Yes, being able to mount a corrupted FS R/O sounds like a good goal. We
> > are not speaking of recovery here, just about mounting R/O and providing
> > access to as much uncorrupted data as we can.
> > 
> > If FS index is not corrupted, this sounds quite doable. If the index is
> > corrupted, though, this requires full scan and index rebuild. Other wise
> > we'd mount and show empty file-system.
> 
> While I agree that mounting RO to get access to data is a feasible goal
> I really think that this is the job of a debugfs.ubifs tool.
> The kernel cannot ask questions, such a tool can.

The user-space tool would turn a corrupted FS into an uncorrupted FS.

But if the driver could provide you read access to uncorrupted files
even though the file-system is corrupted, this would be useful. The
driver would not need to do any recovery - no write or erase operation
allowed.

I think this is hard in general, but probably doable for some cases.

Artem.
