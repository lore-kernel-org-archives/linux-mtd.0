Received: from szxga02-in.huawei.com ([119.145.14.65])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WhDNG-0006vW-FG
 for linux-mtd@lists.infradead.org; Mon, 05 May 2014 07:31:45 +0000
Message-ID: <53673E12.2010509@huawei.com>
Date: Mon, 5 May 2014 15:30:26 +0800
From: hujianyang <hujianyang@huawei.com>
MIME-Version: 1.0
To: <dedekind1@gmail.com>
Subject: Re: [PATCH v2] UBIFS: Fix assert failed in ubifs_set_page_dirty
References: <535B7B96.9030008@huawei.com> <536092CE.2090209@huawei.com>
 <1399273358.15290.0.camel@sauron.fi.intel.com>
 <1399274177.15290.7.camel@sauron.fi.intel.com>
In-Reply-To: <1399274177.15290.7.camel@sauron.fi.intel.com>
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

> However, I'll add "Cc: stable@vger.kernel.org", which means that once
> the patch hits Linuses tree, it'll also go to older stable kernel trees
> too, so all the careful users will end up having it too.

I really need this patch goes into stable, it's enough for me. I also
think the commit message is not good and thank you for changing the
subject.

Hu
