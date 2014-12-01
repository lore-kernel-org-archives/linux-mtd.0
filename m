Received: from szxga01-in.huawei.com ([119.145.14.64])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XvG7H-0000fu-6Q
 for linux-mtd@lists.infradead.org; Mon, 01 Dec 2014 01:49:32 +0000
Message-ID: <547BC82D.6050608@huawei.com>
Date: Mon, 1 Dec 2014 09:45:17 +0800
From: hujianyang <hujianyang@huawei.com>
MIME-Version: 1.0
To: <dedekind1@gmail.com>
Subject: Re: [PATCH v5 3/4] ubi-utils: ubidump: introduce ubidump
References: <544788DA.9090401@huawei.com> <54478A47.3080102@huawei.com>
 <1414657165.23185.10.camel@sauron.fi.intel.com>
 <1414657828.23185.16.camel@sauron.fi.intel.com> <5452F133.2030701@huawei.com>
 <1414740722.23185.63.camel@sauron.fi.intel.com> <54536AA8.3030403@huawei.com>
 <1414761646.23185.71.camel@sauron.fi.intel.com> <546DB333.5080500@huawei.com>
 <1417098723.5858.90.camel@sauron.fi.intel.com>
In-Reply-To: <1417098723.5858.90.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"
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

On 2014/11/27 22:32, Artem Bityutskiy wrote:
> On Thu, 2014-11-20 at 17:24 +0800, hujianyang wrote:
>> /tmp# ./ubidump /dev/ubi0_0 --lnum 0
>> scan LEB 0:0
>> look at LEB 0:0 (126976 bytes left)
>> scanning superblock node at LEB 0:0
>> look at LEB 0:4096 (122880 bytes left)
>> hit empty space at LEB 0:4096
>> stop scanning LEB 0 at offset 126976
> 
> Just do not introduce any options at all. Print all you can right away.
> 
> Let's say: no options means auto-detect everything and print everything.
> Since all you can do right now is to dump UBIFS stuff, just do it.
> 
> If someone needs more - they will have to start adding options.
> 

Got it~!
