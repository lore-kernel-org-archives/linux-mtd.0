Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X1xKO-0002fJ-4i
 for linux-mtd@lists.infradead.org; Tue, 01 Jul 2014 12:38:28 +0000
Message-ID: <1404218285.6841.44.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 0/4] UBIFS: Fix code issues detected by Fortify
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: hujianyang <hujianyang@huawei.com>
Date: Tue, 01 Jul 2014 15:38:05 +0300
In-Reply-To: <5397C0E7.9070602@huawei.com>
References: <5397C0E7.9070602@huawei.com>
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

On Wed, 2014-06-11 at 10:37 +0800, hujianyang wrote:
> With the help of Fortify, I found some problems in source
> code. I would like to fix them in this series of patches.
> 
> hujianyang (4):
>   UBIFS: Add missing error handling in create_default_filesystem()
>   UBIFS: Add missing error handling in dump_lpt_leb()
>   UBIFS: Add missing break in dbg_chk_pnode()
>   UBIFS: Remove useless statements

Pushed patches 1-3 as is, but removed one change from patch 4, and
pushed too.

-- 
Best Regards,
Artem Bityutskiy
