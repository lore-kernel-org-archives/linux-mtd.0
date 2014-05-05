Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WhCvV-0003X6-Hf
 for linux-mtd@lists.infradead.org; Mon, 05 May 2014 07:03:01 +0000
Message-ID: <1399273358.15290.0.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v2] UBIFS: Fix assert failed in ubifs_set_page_dirty
From: Artem Bityutskiy <dedekind1@gmail.com>
To: hujianyang <hujianyang@huawei.com>
Date: Mon, 05 May 2014 10:02:38 +0300
In-Reply-To: <536092CE.2090209@huawei.com>
References: <535B7B96.9030008@huawei.com> <536092CE.2090209@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Laurence Withers <lwithers@guralp.com>,
 linux-mtd <linux-mtd@lists.infradead.org>, adrian.hunter@intel.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Wed, 2014-04-30 at 14:06 +0800, hujianyang wrote:
> Hi, all
> 
> Basing on the perious mail, I would like to show a clear figure
> about the race I have found.

Looks correct, thanks. This probably needs to go the the stable tree.

-- 
Best Regards,
Artem Bityutskiy
