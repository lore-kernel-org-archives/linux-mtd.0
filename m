Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wrjuq-00037v-Cl
 for linux-mtd@lists.infradead.org; Tue, 03 Jun 2014 08:17:52 +0000
Message-ID: <1401783447.11182.164.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] UBIFS: Add an assertion for clean_zn_cnt
From: Artem Bityutskiy <dedekind1@gmail.com>
To: hujianyang <hujianyang@huawei.com>
Date: Tue, 03 Jun 2014 11:17:27 +0300
In-Reply-To: <538D6FE7.80209@huawei.com>
References: <538D6FE7.80209@huawei.com>
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

On Tue, 2014-06-03 at 14:49 +0800, hujianyang wrote:
> This patch adds a new ubifs_assert() in ubifs_tnc_close() to check
> if there are any leaks of per-filesystem @clean_zn_cnt. This new
> assert inspects whether the return value of ubifs_destroy_tnc_subtree()
> is equal to @clean_zn_cnt or not while umount.

Pushed to linux-ubifs.git, thanks!

-- 
Best Regards,
Artem Bityutskiy
