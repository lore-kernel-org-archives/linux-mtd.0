Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WpG9k-0003tR-D0
 for linux-mtd@lists.infradead.org; Tue, 27 May 2014 12:07:02 +0000
Message-ID: <1401192395.1304.129.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] UBIFS: Fix dump messages in ubifs_dump_lprops
From: Artem Bityutskiy <dedekind1@gmail.com>
To: hujianyang <hujianyang@huawei.com>
Date: Tue, 27 May 2014 15:06:35 +0300
In-Reply-To: <537C6FB1.4020305@huawei.com>
References: <537C6FB1.4020305@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2014-05-21 at 17:19 +0800, hujianyang wrote:
> Function ubifs_read_one_lp will not set @lp and returns
> an error when ubifs_read_one_lp failed. We should not
> perform ubifs_dump_lprop in this case because @lp is not
> initialized as we wanted.
> 
> Signed-off-by: hujianyang <hujianyang@huawei.com>

Pushed to linux-ubifs.git, thanks!

-- 
Best Regards,
Artem Bityutskiy
