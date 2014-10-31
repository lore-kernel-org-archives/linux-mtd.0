Received: from szxga03-in.huawei.com ([119.145.14.66])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xk1nO-0005lY-5r
 for linux-mtd@lists.infradead.org; Fri, 31 Oct 2014 02:18:34 +0000
Message-ID: <5452F133.2030701@huawei.com>
Date: Fri, 31 Oct 2014 10:17:23 +0800
From: hujianyang <hujianyang@huawei.com>
MIME-Version: 1.0
To: <dedekind1@gmail.com>
Subject: Re: [PATCH v5 3/4] ubi-utils: ubidump: introduce ubidump
References: <544788DA.9090401@huawei.com> <54478A47.3080102@huawei.com>
 <1414657165.23185.10.camel@sauron.fi.intel.com>
 <1414657828.23185.16.camel@sauron.fi.intel.com>
In-Reply-To: <1414657828.23185.16.camel@sauron.fi.intel.com>
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

> 
> And "-i" / "--info" are not the best names, I think. "-u" / "--ubifs"
> would be better.
> 

Oh, I'd like to reserve this "--ubifs" when we are ready to dump ubi-level
stuff. So in my previous design, "--ubifs" and "--ubi" are used to indicate
only dump the specific area of an eraseblock.

How about an option like "--node" ? Do you insist on "--ubifs" or have
another suggestion?

> And regarding the -l option. What if I do not specify it? What will be
> dumped? Everything? Nothing? I'd vote for duping everything (all LEBs).
> 

It will return an error now, like:

"lnum was not specified (use -h for help)"

Dumping everything is useful and easy to achieve. I will do that~!
