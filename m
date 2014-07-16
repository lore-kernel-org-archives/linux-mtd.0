Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X7Mal-0003MA-To
 for linux-mtd@lists.infradead.org; Wed, 16 Jul 2014 10:37:44 +0000
Message-ID: <1405507040.1906.18.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 6/7] New utility ubidump
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: hujianyang <hujianyang@huawei.com>
Date: Wed, 16 Jul 2014 13:37:20 +0300
In-Reply-To: <53C63DA2.5080200@huawei.com>
References: <53BA491E.8060502@huawei.com> <53BA4B98.1080000@huawei.com>
 <1405497907.1920.27.camel@sauron.fi.intel.com>
 <53C63DA2.5080200@huawei.com>
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

On Wed, 2014-07-16 at 16:53 +0800, hujianyang wrote:
> > I envision that in the future people may want to specify PEB number
> > instead of LEB number, and '-n' becomes a confusing name for the option.
> > Could you please only support '--lnum', and drop '-n' altogether. Then
> > in the future someone may add '--pnum' support.
> 
> Yes, you are right. I'll change it in next version.
> 
> > 
> >> +"-i, --info		show explicit information about NODEs\n"
> > 
> > I do not understand what this means from the description. Would you
> > please try to describe it better in the help text?
> > 
> >> +"-H, --header		show only header information\n"
> >> +"-N, --node		show only NODEs information\n"
> > 
> > Same for these.
> > 
> > Thanks!
> > 
> 
> -H for UBI-level info and -N for UBIFS-level info.
> -i means dump UBIFS Nodes by function ubifs_dump_node, not just
> scan them.
> 
> I will re-describe them.

Things like UBI volume table, UBI fast-map stuff are not "headers", so I
am not sure if using word "headers" a good idea. Probably we want
options like --ubifs and --ubi to denote ubi and ubifs-level stuff. The
default would be "everything".

But again, if you start smaller, and upstream a good tool for
UBIFS-level stuff, it will be easier to add UBI stuff separately.

Besides, I have some additional vision, which you do not have to
implement, but which should be taken into account. E.g., ubidump which
does not need UBI/UBIFS drivers, ubidump which can deal with an image
generated with nanddump without "mounting" it, etc. So I was thinking
doing small steps at a time would make it easier for me and for you to
make a tool which has limited functionality today, but which can be
later extended to support more functionality.

-- 
Best Regards,
Artem Bityutskiy
