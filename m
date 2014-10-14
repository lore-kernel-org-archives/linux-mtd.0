Received: from smtprelay0083.hostedemail.com ([216.40.44.83]
 helo=smtprelay.hostedemail.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xe7Xr-0007Lb-Qp
 for linux-mtd@lists.infradead.org; Tue, 14 Oct 2014 19:14:08 +0000
Message-ID: <1413314020.26864.7.camel@joe-AO725>
Subject: Re: [PATCH v4] mtd: ubi: Extend UBI layer debug/messaging capabilities
From: Joe Perches <joe@perches.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Date: Tue, 14 Oct 2014 12:13:40 -0700
In-Reply-To: <20141014184702.GA12662@arch.hh.imgtec.org>
References: <1413296037-22346-1-git-send-email-tlinder@codeaurora.org>
 <20141014143902.GA9768@arch.hh.imgtec.org>
 <1413299343.7906.103.camel@sauron.fi.intel.com>
 <20141014184702.GA12662@arch.hh.imgtec.org>
Content-Type: text/plain; charset="ISO-8859-1"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Tanya Brokhman <tlinder@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 Artem Bityutskiy <dedekind1@gmail.com>,
 open list <linux-kernel@vger.kernel.org>, linux-mtd@lists.infradead.org,
 Richard Weinberger <richard@nod.at>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2014-10-14 at 15:47 -0300, Ezequiel Garcia wrote:
> On 14 Oct 06:09 PM, Artem Bityutskiy wrote:
> > On Tue, 2014-10-14 at 11:39 -0300, Ezequiel Garcia wrote:
> > > Please use some pr_fmt for this. Something like this before the headers
> > > should be enough:
> > > 
> > > #define pr_fmt(fmt) "UBI: block:" fmt
> > 
> > Sinc ubiblock is a device, there should be a 'struct device' somewhere,
> > so probably dev_printk() and other dev_*() printing functions would be a
> > better choice?
> > 
> 
> A quick code dig shows you should get the struct device associated
> to the struct gendisk, with the disk_to_dev() macro.
> 
> In other words, something like this should work, provided 'dev' is defined
> in the scope as a struct ubiblock:
> 
>   #define ubiblock_err(x) dev_err(disk_to_dev(dev->gd), x)
> 
> When the gendisk is not available, a simple pr_{} would work.

Or maybe combine these in the ubi_<level> calls passing
NULL when there is no struct ubi_device *

void ubi_err(const struct ubi_device *ubi, fmt. ...)
{
	struct va_format vaf;
	va_list args;

	va_start(args, fmt);

	vaf.fmt = fmt;
	vaf.va = &args;

	if (ubi && ubi->gd)
		dev_err(disk_to_dev(dev->gd), "UBI-%d error: %pF %pV",
			ubi->ubi_num, __builtin_return_address(0), &vaf);
	else if (ubi)
		printk(KERN_ERR "UBI-%d error: %pf: %pV",
		       ubi->ubi_num, __builtin_return_address(0), &vaf);
	else
		printk(KERN_ERR "UBI: error: %pf: %pV",
		       __builtin_return_address(0), &vaf);

	va_end(args);
}
