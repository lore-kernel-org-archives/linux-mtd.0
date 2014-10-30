Received: from mga09.intel.com ([134.134.136.24])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xjl8G-0008BW-OL
 for linux-mtd@lists.infradead.org; Thu, 30 Oct 2014 08:31:01 +0000
Message-ID: <1414657828.23185.16.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v5 3/4] ubi-utils: ubidump: introduce ubidump
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: hujianyang <hujianyang@huawei.com>
Date: Thu, 30 Oct 2014 10:30:28 +0200
In-Reply-To: <1414657165.23185.10.camel@sauron.fi.intel.com>
References: <544788DA.9090401@huawei.com> <54478A47.3080102@huawei.com>
 <1414657165.23185.10.camel@sauron.fi.intel.com>
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

On Thu, 2014-10-30 at 10:19 +0200, Artem Bityutskiy wrote:
> On Wed, 2014-10-22 at 18:43 +0800, hujianyang wrote:
> > +static const char optionsstr[] =
> > +"-h, --help            print help message\n"
> > +"-l, --lnum            logic eraseblock num to dump\n"
> > +"-i, --info            show explicit information about ubifs-level\n"
> 
> So what does this '-i' option do? I cannot grasp this from the comment.

Ok, I think I see what you mean here. This is about dumping UBIFS data
in addition to the UBI data.

First of all, let's re-phrase this. Do not use word "explicit", it does
not seem to bear any useful meaning here. Just say "also dump UBIFS
nodes" or something like this.

And "-i" / "--info" are not the best names, I think. "-u" / "--ubifs"
would be better.

And regarding the -l option. What if I do not specify it? What will be
dumped? Everything? Nothing? I'd vote for duping everything (all LEBs).

Artem.
