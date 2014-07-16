Received: from mga09.intel.com ([134.134.136.24])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X7K7p-0006TI-He
 for linux-mtd@lists.infradead.org; Wed, 16 Jul 2014 07:59:43 +0000
Message-ID: <1405497558.1920.23.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 1/7] UBI: Add a new ioctl to support ubidump
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: hujianyang <hujianyang@huawei.com>
Date: Wed, 16 Jul 2014 10:59:18 +0300
In-Reply-To: <53BA499B.5090206@huawei.com>
References: <53BA491E.8060502@huawei.com> <53BA499B.5090206@huawei.com>
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


On Mon, 2014-07-07 at 15:17 +0800, hujianyang wrote:
> Add a new ioctl to dump EC header and VID header to user space. This
> ioctl is called without lock so I think users *should not* run ubidump
> when volume is mounted.
> 
> Struct ubi_ebdump_req is used to transfer data between user space and
> kernel space. Can I find a way to set buffer length from '64' to
> UBI_VID_HDR_SIZE and UBI_EC_HDR_SIZE?
> 
> 
> Signed-off-by: hujianyang <hujianyang@huawei.com>

I've never seen an ioctl for retrieving an on-the-media data structure,
do you have any examples? I think the traditional way is that the
user-space reads all the information from the disk itself.

Do you really need to dump UBI headers?

Could you please drop this functionality for now, and provide an ubidump
which only dumps UBIFS data structures for now.

Then we can talk and think about the UBI-level headers dumping.

-- 
Best Regards,
Artem Bityutskiy
