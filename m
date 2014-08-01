Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XD7J9-0000P3-6O
 for linux-mtd@lists.infradead.org; Fri, 01 Aug 2014 07:31:19 +0000
Message-ID: <1406878239.20616.65.camel@sauron.fi.intel.com>
Subject: Re: [PATCH RFC v2] UBI: New ioctl() to support ubidump
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: hujianyang <hujianyang@huawei.com>
Date: Fri, 01 Aug 2014 10:30:39 +0300
In-Reply-To: <53DB0081.1040905@huawei.com>
References: <53D7677A.6000905@huawei.com> <53D768B5.6090409@huawei.com>
 <87vbqgb4re.fsf@nbsps.com> <53D85203.7030302@huawei.com>
 <87siliu9lm.fsf@nbsps.com> <53D9B1A0.8080300@huawei.com>
 <1406813088.20616.32.camel@sauron.fi.intel.com>
 <53DB0081.1040905@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Richard Weinberger <richard.weinberger@gmail.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Bill Pringlemeir <bpringlemeir@nbsps.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2014-08-01 at 10:50 +0800, hujianyang wrote:
> On 2014/7/31 21:24, Artem Bityutskiy wrote:
> > 
> > Hujianyang, AFAIU, right now you need an ability to dump UBIFS stuff.
> 
> Yes, but not all of what I want. I need this utility dumping UBI-level
> stuff too. The ability, not only to dump UBIFS stuff but also to dump
> UBI stuff will make it a useful tool.

OK.

> > You do not really need to know PEB number. So ubidump may
> > analyze /dev/ubiX_Y without knowing the PEB number, right? It can just
> > read from /dev/ubiX_Y directly. And print you all the UBIFS nodes.
> > 
> 
> Last version I sent to this maillist was reading data from UBI driver
> directly. But our .read() function in UBI driver jump over UBI stuff, so
> I read UBI stuff from an ioctl(). This isn't a common way as you said.

There are 2 layers involved: MTD and UBI.

On the MTD level, the entire flash contents is available (/dev/mtdX)
On the UBI level, only UBI volumes are available (/dev/ubiX_Y)

If I give you an UBI volume dump (cp /dev/ubiX_Y ubi.img), you will only
see the contents of the UBI volume. If there was UBIFS file-system, you
will see UBIFS nodes in the "ubi.img" file. You will not see UBI headers
there.

The ideal design would be treating /dev/ubiX_Y the same way as
'ubi.img'. IOW:

ubidump ubi.img
and
ubidump /dev/ubiX_Y

should give the same results.

If I give you an MTD image (nanddump -o mtd.img /dev/mtdX), you should
be able to see both UBIFS and UBI stuff in 'mtd.img'. You may see the
same information in /dev/mtdX. To get the LEB<->PEB mapping, you need to
do scanning, etc. So

ubidump mtd.img
and
ubidump /dev/mtdX

should be the same.

This is the basic picture.

Now what you want is to add an exception to this scheme. Namely, for the
'ubidump /dev/ubiX_Y' case: you want to get help from the driver, using
the ioctl you introduced.

Frankly, I am not 100% sure this is a good idea, would be nice to hear
from other people. I'd need to think a bit on this.

So what I suggested is the you do not submit this exception so far. Just
teach ubidump to handle UBI volumes. I.e., make it work with

ubidump ubi.img
ubidump /dev/ubiX_Y

yes, these 2 will dump only ubifs stuff. Limited functionality.

> 1) No UBI stuff and read UBIFS stuff from UBI-driver
> This is a easiest way and we don't need any ioctl either. We can't get
> UBI-level stuff right now but we can put this into our design of dumping
> an image file.

Yes. That's a good first step.

> 2) Read data from MTD-driver and find a way to get pnum
> This way is basing on my v2 work. We can put an ioctl() to kernel and
> if kernel don't support this ioctl(), this tool will do a full-scan on
> MTD device. It's transparent to user. But we should take some time to
> consider how to do this full-scan.

I guess, I'd need to think some more about the ioctl(), and may be
someone else suggests something.

> 3) Re-design this tool about dropping UBI driver based dumping.
> This way is like the exist ubiformat utility. We don't use UBI driver
> and just do read/write(maybe we can do some repairing later) with MTD
> device or image files. It's not small.

Probably, we'll think about this when we are done with 1) and may be 2).

-- 
Best Regards,
Artem Bityutskiy
