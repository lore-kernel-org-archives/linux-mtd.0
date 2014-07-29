Received: from szxga01-in.huawei.com ([119.145.14.64])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XC4F5-0004b6-UU
 for linux-mtd@lists.infradead.org; Tue, 29 Jul 2014 10:02:49 +0000
Message-ID: <53D77103.6040600@huawei.com>
Date: Tue, 29 Jul 2014 18:01:39 +0800
From: hujianyang <hujianyang@huawei.com>
MIME-Version: 1.0
To: <dedekind1@gmail.com>
Subject: Re: [PATCH 6/7] New utility ubidump
References: <53BA491E.8060502@huawei.com> <53BA4B98.1080000@huawei.com>
 <1405497907.1920.27.camel@sauron.fi.intel.com> <53C63DA2.5080200@huawei.com>
 <1405507040.1906.18.camel@sauron.fi.intel.com> <53C6618F.3010707@huawei.com>
 <874myan0no.fsf@nbsps.com> <53CE1D97.6010609@huawei.com>
 <1406625280.23376.102.camel@sauron.fi.intel.com>
In-Reply-To: <1406625280.23376.102.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Bill Pringlemeir <bpringlemeir@nbsps.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> 
> If possible, please, try to implement few things at a time. Try to make
> your initial submission smaller, and then add more stuff on top. This
> way it is going to be easier to merge the work. Thanks!
>

I've resend the v2 patches. I spend a short vacation last week
and was busy with other stuff when I came back to work.

I think we can just apply binary data dump, ignore ubif/ubifs
format data at first to make initial submission smaller. How
do you feel about this?

just like:
ubidump /dev/ubiX_Y --lnum n

output binary/hex data.
