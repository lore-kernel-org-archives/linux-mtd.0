Received: from mga09.intel.com ([134.134.136.24])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YKjgA-00085m-8a
 for linux-mtd@lists.infradead.org; Mon, 09 Feb 2015 08:26:50 +0000
Message-ID: <1423470384.2573.18.camel@sauron.fi.intel.com>
Subject: Re: [RFC] UBIFS recovery
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Richard Weinberger <richard@nod.at>
Date: Mon, 09 Feb 2015 10:26:24 +0200
In-Reply-To: <54D86819.90803@nod.at>
References: <54D33C36.9060805@huawei.com>
 <CALupW3CQ3YCvdx_tNeDGVo9cVTcmACyqsMRpr8+P2_4jwGgZMQ@mail.gmail.com>
 <1423243571.8637.579.camel@sauron.fi.intel.com> <54D4FAFD.9000009@nod.at>
 <1423244437.8637.587.camel@sauron.fi.intel.com> <54D4FD5C.1040909@nod.at>
 <54D822B0.8020605@huawei.com> <54D86819.90803@nod.at>
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

On Mon, 2015-02-09 at 08:56 +0100, Richard Weinberger wrote:
> Am 09.02.2015 um 04:00 schrieb hujianyang:
> >> This is what fsck.ubifs should to. I was talking about a debugfs.ubifs which
> >> is able to extract files, ask questions, and tell the user what exactly is going
> >> wrong. Like "yes, I can dump you file /foo/bar.dat but rage 5m to 10m maybe be corrupted and the xattrs are gone".
> >>
> > 
> > Er, maybe I know what you mean.
> > 
> > So you think by debugfs.ubifs, we could get wanted file out from a partition
> > without mounting it? and do other things like (?)
> 
> This is the use case of a debugfs. See debugfs.ext2/3/4, etc...
> You can debug (analyze, get files your, etc...) from a broken filesystem
> without mounting it.

Lets consider hypothetical 2 gadgets using UBIFS: R-gadget and H-gadget.

1. R-gadget has UBIFS which refuses to mount whenever there is any
unexpected corruption.
2. H-gadget tries hard to mount in R/O mode and let the rest of the SW
stack have a file-system.

H-gadget is resilient. When things go wrong with the storage, it still
manages to boot, show a dialog explaining that there is a problem, let
users fetch all the important files, and then either reset to factory
defaults, or bring the device to the service point.

R-gadget, on the opposite, just does not boot when there are issues.
Users see nothing on the screen. When they google for "R-gadget does not
boot", they hit some forum discussions, very technical, talking about
some "debugfs", which is very confusing.

The new generation of R-gadget, however, does better job. Unlike the
first generation, shipped under tight TTM requirements, the second
generation gave the vendor a bit more time to polish it. So the vendor
managed to use "debugfs" stuff, and now R-gadget. But unfortunately,
this feature stopped working after first system upgrade, because of a
bug (probably not enough testing). The R-gadgets was asking strange
question about moving some "inodes" from a broken "bud". But the input
did not work, and users anyway had hard time understanding "inodes" and
"buds" (they thought and inoed is some kind of flower).

Anyway, the message is: I'd prefer H-gadget :-)
