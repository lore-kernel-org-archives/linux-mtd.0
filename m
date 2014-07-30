Received: from 71-19-161-253.dedicated.allstream.net ([71.19.161.253]
 helo=nsa.nbspaymentsolutions.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XCWO4-0001kG-Vm
 for linux-mtd@lists.infradead.org; Wed, 30 Jul 2014 16:06:01 +0000
From: Bill Pringlemeir <bpringlemeir@nbsps.com>
To: hujianyang <hujianyang@huawei.com>
Subject: Re: [PATCH RFC v2] UBI: New ioctl() to support ubidump
References: <53D7677A.6000905@huawei.com> <53D768B5.6090409@huawei.com>
 <87vbqgb4re.fsf@nbsps.com> <53D85203.7030302@huawei.com>
Date: Wed, 30 Jul 2014 11:53:09 -0400
In-Reply-To: <53D85203.7030302@huawei.com> (hujianyang@huawei.com's message of
 "Wed, 30 Jul 2014 10:01:39 +0800")
Message-ID: <87siliu9lm.fsf@nbsps.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Richard Weinberger <richard.weinberger@gmail.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 29 Jul 2014, hujianyang@huawei.com wrote:

> But I'm worry about the performance. As we dump one specified peb
> now, we can't record the mapping table and need to do full scan
> each time running this utility.

You can record the table if you know that the MTD is not changing.  If
you introduce the 'ioctl()' to the kernel, it will most likely be on an
active file system.  I guess this is a big decision in the tools design.

Supporting an active file system is much more difficult.  For the case
of an real MTD backing store, I was thinking this would run from another
partition or an initramfs; UBI/UbiFS would not be active.  It could
possibly attempt to repair the UBI/UbiFs, while nothing else is using
it.  The other use case is to read out the flash via some tools and
loopback mount it with nandsim on a PC for diagnosis; a post-mortem
analysis.

If you wish to run the utility on an active MTD, I would suggest some
'freeze/thaw' type function to stop UBI/UbiFs and then just use the tool
on the 'frozen' MTD.  Maybe this exists already for suspend/resume or
something else.  It might only be a debug type interface; so
conditionally compiled for developers.  It needs a hook so you can
trigger the freeze on some condition via code.

I think others don't understand why you would want the 'ubidump' to run
on an active file system?  At least, I don't understand this?  Is there
some use case we are missing?  I am quite sure that you can perform
better diagnostics on a 'frozen' image where you can look at the whole
image state.

Fwiw,
Bill Pringlemeir.
