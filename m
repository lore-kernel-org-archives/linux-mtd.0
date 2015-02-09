Received: from mga03.intel.com ([134.134.136.65])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YKj8r-0000Un-NP
 for linux-mtd@lists.infradead.org; Mon, 09 Feb 2015 07:52:26 +0000
Message-ID: <1423468308.2573.4.camel@sauron.fi.intel.com>
Subject: Re: [RFC] UBIFS recovery
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: hujianyang <hujianyang@huawei.com>
Date: Mon, 09 Feb 2015 09:51:48 +0200
In-Reply-To: <54D81C9B.8070500@huawei.com>
References: <54D33C36.9060805@huawei.com>
 <1423242166.8637.566.camel@sauron.fi.intel.com>
 <54D81C9B.8070500@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Richard Weinberger <richard@nod.at>,
 linux-mtd <linux-mtd@lists.infradead.org>, Sheng Yong <shengyong1@huawei.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2015-02-09 at 10:34 +0800, hujianyang wrote:
> Good suggestions. I will try to realize periodically commit first. But I
> don't know if this feature is really needed. Switch to R/O and revert to
> last comitted state? But we just consider about log before, never think
> about index.

I think the right way to approach this problem is to come up with a high
level summary of the problems we are trying to solve, and the solutions,
along with some analysis of the solutions. This does not have to be very
detailed, but it should put everyone involved into the same page.

Artem.
