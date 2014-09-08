Received: from 1wt.eu ([62.212.114.60])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XQwaa-0002I0-HY
 for linux-mtd@lists.infradead.org; Mon, 08 Sep 2014 10:54:29 +0000
Date: Mon, 8 Sep 2014 12:53:59 +0200
From: Willy Tarreau <w@1wt.eu>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: Ubi patch proposition for 3.10.y
Message-ID: <20140908105359.GB28903@1wt.eu>
References: <CAGGh5h0KjexqaoEt8vvVXAEqCr625675XG4d71KdEuhrQVPr3w@mail.gmail.com>
 <1410170318.10764.119.camel@sauron.fi.intel.com>
 <20140908100453.GA28903@1wt.eu>
 <1410171221.10764.132.camel@sauron.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1410171221.10764.132.camel@sauron.fi.intel.com>
Cc: richard@nod.at,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 jean-philippe francois <jp.francois@cynove.com>, stable@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Sep 08, 2014 at 01:13:41PM +0300, Artem Bityutskiy wrote:
> Well, adding stable tags is does not come for free. Whey you add a
> stable tag, you need to make sure it applies to the older kernel, and
> you need to also pick the possible dependencies. You need test it with
> older kernel.
> 
> While in general what you say makes sense, for this specific "fastmap"
> case the maintainers (me and Richard) did not think the overhead is
> worth the benefits.

I understand and am not pressuring anyone to do the backport. Sometimes if
something appears to be clearly broken, for example to the point where data
corruption may result from the use of any feature, a patch to disable the
feature or make it depend on CONFIG_BROKEN might be good as well to warn
users they must not use it because it's too broken.

Regards,
Willy
