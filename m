Received: from szxga01-in.huawei.com ([119.145.14.64])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XCgdp-0005ag-Bd
 for linux-mtd@lists.infradead.org; Thu, 31 Jul 2014 03:02:56 +0000
Message-ID: <53D9B1A0.8080300@huawei.com>
Date: Thu, 31 Jul 2014 11:01:52 +0800
From: hujianyang <hujianyang@huawei.com>
MIME-Version: 1.0
To: Bill Pringlemeir <bpringlemeir@nbsps.com>
Subject: Re: [PATCH RFC v2] UBI: New ioctl() to support ubidump
References: <53D7677A.6000905@huawei.com> <53D768B5.6090409@huawei.com>
 <87vbqgb4re.fsf@nbsps.com> <53D85203.7030302@huawei.com>
 <87siliu9lm.fsf@nbsps.com>
In-Reply-To: <87siliu9lm.fsf@nbsps.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
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

On 2014/7/30 23:53, Bill Pringlemeir wrote:
> 
> You can record the table if you know that the MTD is not changing.  If
> you introduce the 'ioctl()' to the kernel, it will most likely be on an
> active file system.  I guess this is a big decision in the tools design.

This ioctl() doesn't need UBIFS filesystem to be mounted, just needs
UBI driver. We can keep this partition not active during this tool
running.

But a properly configured kernel requirement you said in last mail
worries me most. I think you are right and want to have a try. But
I've discussed these stuff with Artem and he said, just quote:

""
So I envision that the tool would work like this.

$ ubidump my.img --lnum 5
  - dump LEB 5, will need to scan the entire image.

$ ubidump /dev/ubiX_Y --lnum 5
  - will just ask the UBI driver to give the PEB number for LEB 5, then
find out the MTD device for this volume (should be possible by checking
the sysfs files), and then reads the MTD device, and gets the UBI-level
information from there.

Something like this, just quick thoughts.
""
http://lists.infradead.org/pipermail/linux-mtd/2014-July/054674.html


We can keep a temporary file to record the mapping table but that will
make the initial submission much more complicated. But this way you
mentioned to record the table should be considered to add into this tool
in the future.

> 
> I think others don't understand why you would want the 'ubidump' to run
> on an active file system?  At least, I don't understand this?  Is there
> some use case we are missing?  I am quite sure that you can perform
> better diagnostics on a 'frozen' image where you can look at the whole
> image state.
> 

Yes, I want this tool to be flexible before. But dumping with an active
partition really useless as you said now. Because in most cases, the
volumes we want to dump must have something wrong.


I think we need to make a lighter version and submit it to ubi-utils
at beginning, then make it strongly step by step. Despite all that,
we should have a clear design of what we need now. So I'm happy with
your sharing of your thoughts.

The "freeze/thaw" method will result a complex tool. We can use some
functionality to make sure UBIFS partition is not active. Should I need
to add them in this version or enable them in the future? Do you think
it is a key problem of this tool? This utility may tolerance some data
mistake caused by peb update race in my considering.
