Received: from szxga03-in.huawei.com ([119.145.14.66])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WpTbG-0002Xl-Au
 for linux-mtd@lists.infradead.org; Wed, 28 May 2014 02:28:18 +0000
Message-ID: <53854980.2000204@huawei.com>
Date: Wed, 28 May 2014 10:27:12 +0800
From: hujianyang <hujianyang@huawei.com>
MIME-Version: 1.0
To: <dedekind1@gmail.com>
Subject: Re: [PATCH] ubifs: add missing ui pointer in debugging code
References: <20140513202750.GA27516@earthship.olsr.leipzig.freifunk.net>
 <53731C00.1020203@huawei.com> <1401193701.1304.135.camel@sauron.fi.intel.com>
In-Reply-To: <1401193701.1304.135.camel@sauron.fi.intel.com>
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

I think you made a small mistake:

>         spin_lock(&ui->ui_lock);
> -       ubifs_assert(page->index <= ui->synced_i_size << PAGE_CACHE_SIZE);
> +       ubifs_assert(page->index <= ui->synced_i_size >> PAGE_CACHE_SIZE);

Here should be PAGE_CACHE_SHIFT, not PAGE_CACHE_SIZE.

Thanks.

Hu
