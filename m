Received: from szxga01-in.huawei.com ([119.145.14.64])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X7Kt1-0008VF-7o
 for linux-mtd@lists.infradead.org; Wed, 16 Jul 2014 08:48:28 +0000
Message-ID: <53C63C15.1020803@huawei.com>
Date: Wed, 16 Jul 2014 16:47:17 +0800
From: hujianyang <hujianyang@huawei.com>
MIME-Version: 1.0
To: <dedekind1@gmail.com>
Subject: Re: [PATCH 1/7] UBI: Add a new ioctl to support ubidump
References: <53BA491E.8060502@huawei.com> <53BA499B.5090206@huawei.com>
 <1405497558.1920.23.camel@sauron.fi.intel.com>
In-Reply-To: <1405497558.1920.23.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"
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

Hi Artem,

Thank you for reviewing these patches.

> 
> Do you really need to dump UBI headers?
>

Yes, because I think ec_counter in ec_hdr and copy_flag, sqnum
in vid_hdr are useful.

Current ->read() can just read data from data_offset where the
leb located. And reading UBI headers by mtd functionality are
very complicated, we don't know pnum either.

Maybe we can try other way instead of this ioctl, by adding an
new function which can read the hole peb specified by lnum to
user space.
