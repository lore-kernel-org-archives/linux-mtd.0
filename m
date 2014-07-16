Received: from szxga03-in.huawei.com ([119.145.14.66])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X7Nr8-0008AG-FX
 for linux-mtd@lists.infradead.org; Wed, 16 Jul 2014 11:58:43 +0000
Message-ID: <53C668B7.4090804@huawei.com>
Date: Wed, 16 Jul 2014 19:57:43 +0800
From: hujianyang <hujianyang@huawei.com>
MIME-Version: 1.0
To: <dedekind1@gmail.com>
Subject: Re: [PATCH 6/7] New utility ubidump
References: <53BA491E.8060502@huawei.com> <53BA4B98.1080000@huawei.com>
 <1405497907.1920.27.camel@sauron.fi.intel.com> <53C63DA2.5080200@huawei.com>
 <1405507040.1906.18.camel@sauron.fi.intel.com> <53C6618F.3010707@huawei.com>
 <1405511021.5423.12.camel@sauron.fi.intel.com>
In-Reply-To: <1405511021.5423.12.camel@sauron.fi.intel.com>
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

> 
> This is why I suggest to start small, do just the UBIFS nodes dump,
> nothing else. Just forget about UBI. Then let's review that and make
> part of mtd-utils. This will clarify the vision, and we may add UBI
> support then separately.
>

So just use simple way to do UBIFS dump and then step by step
make it a strong utility.

It's not too hard. I will first realize an UBIFS dump as you
showed by mtd driver.
