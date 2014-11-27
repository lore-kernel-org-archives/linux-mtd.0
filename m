Received: from mga03.intel.com ([134.134.136.65])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xu07f-0006G3-E9
 for linux-mtd@lists.infradead.org; Thu, 27 Nov 2014 14:32:43 +0000
Message-ID: <1417098723.5858.90.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v5 3/4] ubi-utils: ubidump: introduce ubidump
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: hujianyang <hujianyang@huawei.com>
Date: Thu, 27 Nov 2014 16:32:03 +0200
In-Reply-To: <546DB333.5080500@huawei.com>
References: <544788DA.9090401@huawei.com> <54478A47.3080102@huawei.com>
 <1414657165.23185.10.camel@sauron.fi.intel.com>
 <1414657828.23185.16.camel@sauron.fi.intel.com>
 <5452F133.2030701@huawei.com>
 <1414740722.23185.63.camel@sauron.fi.intel.com>
 <54536AA8.3030403@huawei.com>
 <1414761646.23185.71.camel@sauron.fi.intel.com>
 <546DB333.5080500@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Richard Weinberger <richard.weinberger@gmail.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Bill Pringlemeir <bpringlemeir@nbsps.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2014-11-20 at 17:24 +0800, hujianyang wrote:
> /tmp# ./ubidump /dev/ubi0_0 --lnum 0
> scan LEB 0:0
> look at LEB 0:0 (126976 bytes left)
> scanning superblock node at LEB 0:0
> look at LEB 0:4096 (122880 bytes left)
> hit empty space at LEB 0:4096
> stop scanning LEB 0 at offset 126976

Just do not introduce any options at all. Print all you can right away.

Let's say: no options means auto-detect everything and print everything.
Since all you can do right now is to dump UBIFS stuff, just do it.

If someone needs more - they will have to start adding options.

> By the way, I've replied the mail
> 
> "UBIFS assert failed in ubifs_set_page_dirty at 1421"
> 
> reported by jijiagang@hisilicon.com but mm people do not response.
> 
> http://lists.infradead.org/pipermail/linux-mtd/2014-November/056378.html
> 
> I will change some mm code and test if it works, do you have any
> suggestions about this?

It looks like mm people are not going to help.. I do not have time to
debug this. You can try implementing the merge handler, or debug this
further.
