Received: from mga09.intel.com ([134.134.136.24])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YKmeO-00045H-9N
 for linux-mtd@lists.infradead.org; Mon, 09 Feb 2015 11:37:14 +0000
Message-ID: <1423481807.2573.56.camel@sauron.fi.intel.com>
Subject: Re: [RFC] UBIFS recovery
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Richard Weinberger <richard@nod.at>
Date: Mon, 09 Feb 2015 13:36:47 +0200
In-Reply-To: <54D89420.7060109@nod.at>
References: <54D33C36.9060805@huawei.com>
 <CALupW3CQ3YCvdx_tNeDGVo9cVTcmACyqsMRpr8+P2_4jwGgZMQ@mail.gmail.com>
 <1423243571.8637.579.camel@sauron.fi.intel.com> <54D4FAFD.9000009@nod.at>
 <1423244437.8637.587.camel@sauron.fi.intel.com> <54D4FD5C.1040909@nod.at>
 <54D822B0.8020605@huawei.com> <54D86819.90803@nod.at>
 <1423470384.2573.18.camel@sauron.fi.intel.com> <54D89420.7060109@nod.at>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Steve deRosier <derosier@gmail.com>,
 linux-mtd <linux-mtd@lists.infradead.org>, Sheng Yong <shengyong1@huawei.com>,
 hujianyang <hujianyang@huawei.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Richard,

On Mon, 2015-02-09 at 12:04 +0100, Richard Weinberger wrote:
> My points are:
> - If UBIFS can do a better job in dealing with corruptions, fix/improve it.

Right.

> - Having a debugfs/fsck would be a good tool for people like me that have to analyze/fix UBI/UBIFS failures.

Right. I think no one denies this. Correct, and I agree on this.

> - Having an UBIFS "force" mode *will* be abused in horrid ways.

I did not see anyone suggesting this. Was this suggested?

As I read it, Steve just expressed a high-level user standpoint: the
more you can do without external tools the better. I did not see him
suggesting "just mount at any price".

Artem.
