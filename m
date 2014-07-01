Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X1z6r-00018U-D3
 for linux-mtd@lists.infradead.org; Tue, 01 Jul 2014 14:32:37 +0000
Message-ID: <1404225133.6841.105.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] UBIFS: Remove useless @ecc in struct ubifs_scan_leb
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: hujianyang <hujianyang@huawei.com>
Date: Tue, 01 Jul 2014 17:32:13 +0300
In-Reply-To: <53A8F49C.9000805@huawei.com>
References: <53A8F49C.9000805@huawei.com>
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

On Tue, 2014-06-24 at 11:46 +0800, hujianyang wrote:
> We set @ecc in ubifs_scan_leb only if leb_read returns EBADMSG and
> do not use it any more. This patch removes this variable and adds
> comments about EBADMSG handling.

Pushed to linux-ubifs.git, thanks!

-- 
Best Regards,
Artem Bityutskiy
