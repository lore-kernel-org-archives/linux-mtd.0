Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WrNdq-0004SB-FP
 for linux-mtd@lists.infradead.org; Mon, 02 Jun 2014 08:30:50 +0000
Message-ID: <1401697826.11182.119.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] UBIFS: Remove incorrect assertion in shrink_tnc()
From: Artem Bityutskiy <dedekind1@gmail.com>
To: hujianyang <hujianyang@huawei.com>
Date: Mon, 02 Jun 2014 11:30:26 +0300
In-Reply-To: <53894EF4.5030607@huawei.com>
References: <53894EF4.5030607@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Dolev Raviv <draviv@codeaurora.org>,
 linux-mtd <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2014-05-31 at 11:39 +0800, hujianyang wrote:
> I hit the same assert failed as Dolev Raviv reported in Kernel v3.10
> shows like this:

...

> Signed-off-by: hujianyang <hujianyang@huawei.com>

hujianyang,

looks like you got it right, thanks for your excellent analysis.

I think we want to include this patch to the stable tree, so I add

Cc: stable@vger.kernel.org

I've pushed it to the master branch of the UBIFS tree, thanks!

Also, having a

Tested-by: Dolev Raviv <draviv@codeaurora.org>

if possible, would increase our confidence in sending this patch to the
stable tree.

Thank you!

-- 
Best Regards,
Artem Bityutskiy
