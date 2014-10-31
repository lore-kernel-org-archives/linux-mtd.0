Received: from mga09.intel.com ([134.134.136.24])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xk6h7-0005RZ-Hw
 for linux-mtd@lists.infradead.org; Fri, 31 Oct 2014 07:32:26 +0000
Message-ID: <1414740722.23185.63.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v5 3/4] ubi-utils: ubidump: introduce ubidump
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: hujianyang <hujianyang@huawei.com>
Date: Fri, 31 Oct 2014 09:32:02 +0200
In-Reply-To: <5452F133.2030701@huawei.com>
References: <544788DA.9090401@huawei.com> <54478A47.3080102@huawei.com>
 <1414657165.23185.10.camel@sauron.fi.intel.com>
 <1414657828.23185.16.camel@sauron.fi.intel.com>
 <5452F133.2030701@huawei.com>
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

On Fri, 2014-10-31 at 10:17 +0800, hujianyang wrote:
> > 
> > And "-i" / "--info" are not the best names, I think. "-u" / "--ubifs"
> > would be better.
> > 
> 
> Oh, I'd like to reserve this "--ubifs" when we are ready to dump ubi-level
> stuff. So in my previous design, "--ubifs" and "--ubi" are used to indicate
> only dump the specific area of an eraseblock.
> 
> How about an option like "--node" ? Do you insist on "--ubifs" or have
> another suggestion?

The idea is that you introduce an option, and then you do not change
it's name. So the name should be informative. What is more informative
for "also dump ubifs nodes": --node or --ubifs ?

You can always add --ubi later.

For now, if --ubifs is not specified, you should do basically nothing,
because you cannot dump UBI right now.

Does this make sense for you?

Artem.
