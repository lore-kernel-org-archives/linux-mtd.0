Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xmg4w-0003QP-Ry
 for linux-mtd@lists.infradead.org; Fri, 07 Nov 2014 09:43:39 +0000
Message-ID: <1415353395.958.300.camel@sauron.fi.intel.com>
Subject: Re: Report: mtd-utils: "Floating point exception" with ubiformat
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: hujianyang <hujianyang@huawei.com>, Brian Norris
 <computersforpeace@gmail.com>
Date: Fri, 07 Nov 2014 11:43:15 +0200
In-Reply-To: <5453663A.8080608@huawei.com>
References: <5453663A.8080608@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
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

On Fri, 2014-10-31 at 18:36 +0800, hujianyang wrote:
> Do you think it is a valuable problem to deal with? Keep the
> existing logic is OK. But can we add something in mtd-utils
> to indicate this error than "Floating point exception"?

I think a work-around in mtd-utils is needed for sure. Because even if
we change the kernel, the change will only affect new kernels.

And I think changing the kernel is worthwhile too. It is extremely
unlikely, in my opinion, that someone relies on this illogical behavior
which happens only for zero-size partitions.  May be we can also
disallow zero-size partitions?

Artem.
