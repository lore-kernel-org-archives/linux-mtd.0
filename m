Received: from mga14.intel.com ([192.55.52.115])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X7MUZ-0001Kj-5R
 for linux-mtd@lists.infradead.org; Wed, 16 Jul 2014 10:31:19 +0000
Message-ID: <1405506656.1906.12.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 1/7] UBI: Add a new ioctl to support ubidump
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: hujianyang <hujianyang@huawei.com>
Date: Wed, 16 Jul 2014 13:30:56 +0300
In-Reply-To: <53C63C15.1020803@huawei.com>
References: <53BA491E.8060502@huawei.com> <53BA499B.5090206@huawei.com>
 <1405497558.1920.23.camel@sauron.fi.intel.com>
 <53C63C15.1020803@huawei.com>
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

On Wed, 2014-07-16 at 16:47 +0800, hujianyang wrote:
> Hi Artem,
> 
> Thank you for reviewing these patches.
> 
> > 
> > Do you really need to dump UBI headers?
> >
> 
> Yes, because I think ec_counter in ec_hdr and copy_flag, sqnum
> in vid_hdr are useful.
> 
> Current ->read() can just read data from data_offset where the
> leb located. And reading UBI headers by mtd functionality are
> very complicated, we don't know pnum either.
> 
> Maybe we can try other way instead of this ioctl, by adding an
> new function which can read the hole peb specified by lnum to
> user space.

Yes, this is a lot better approach. But I'd still suggest to start with
a smaller step - ubidump without the UBI headers dumping support. Then
add the UBI headers dumping support as a separate step.

-- 
Best Regards,
Artem Bityutskiy
