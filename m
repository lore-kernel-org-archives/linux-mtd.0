Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X7NXH-0005qC-TP
 for linux-mtd@lists.infradead.org; Wed, 16 Jul 2014 11:38:12 +0000
Message-ID: <1405510644.5423.8.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 6/7] New utility ubidump
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: hujianyang <hujianyang@huawei.com>
Date: Wed, 16 Jul 2014 14:37:24 +0300
In-Reply-To: <53C6618F.3010707@huawei.com>
References: <53BA491E.8060502@huawei.com> <53BA4B98.1080000@huawei.com>
 <1405497907.1920.27.camel@sauron.fi.intel.com>
 <53C63DA2.5080200@huawei.com>
 <1405507040.1906.18.camel@sauron.fi.intel.com>
 <53C6618F.3010707@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2014-07-16 at 19:27 +0800, hujianyang wrote:
> > 
> > Things like UBI volume table, UBI fast-map stuff are not "headers", so I
> > am not sure if using word "headers" a good idea. Probably we want
> > options like --ubifs and --ubi to denote ubi and ubifs-level stuff. The
> > default would be "everything".
> > 
> > But again, if you start smaller, and upstream a good tool for
> > UBIFS-level stuff, it will be easier to add UBI stuff separately.
> > 
> > Besides, I have some additional vision, which you do not have to
> > implement, but which should be taken into account. E.g., ubidump which
> > does not need UBI/UBIFS drivers, ubidump which can deal with an image
> > generated with nanddump without "mounting" it, etc. So I was thinking
> > doing small steps at a time would make it easier for me and for you to
> > make a tool which has limited functionality today, but which can be
> > later extended to support more functionality.
> > 
> 
> It seems you what more than me. I think you are right. I need to
> reconsider how to realize these above, not hole of them, but a
> good architecture that can be extended easily.
> 
> So I think getting data from mtd driver is a good choice and then
> run it with an image file. Current UBI functionality has lots of
> limit and it is basing on UBI driver. But we need to do more work
> in user space (rebuilding volume table and so on) in this way. I
> think it's worth.
> 
> Give me some time to re-create this utility. I will send it to you
> if I finished it. If you get some new ideas, please tell me as soon
> as possible.

I am not trying to make you do a lot more than you need.

If you are analyzing an MTD image without "mounting" it, the only way to
find out the LEB->PEB mapping is to do full scan, and basically copy the
UBI driver code. This is a lot of work.

In your case you have the driver, and it is fine to add an ioctl which
provides LEB->PEB mapping. This is a lot simpler.

So I envision that the tool would work like this.

$ ubidump my.img --lnum 5 
  - dump LEB 5, will need to scan the entire image.

$ ubidump /dev/ubiX_Y --lnum 5
  - will just ask the UBI driver to give the PEB number for LEB 5, then
find out the MTD device for this volume (should be possible by checking
the sysfs files), and then reads the MTD device, and gets the UBI-level
information from there.

Something like this, just quick thoughts.

-- 
Best Regards,
Artem Bityutskiy
