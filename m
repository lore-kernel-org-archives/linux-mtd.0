Received: from mga09.intel.com ([134.134.136.24])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XQvxY-0006zt-5z
 for linux-mtd@lists.infradead.org; Mon, 08 Sep 2014 10:14:08 +0000
Message-ID: <1410171221.10764.132.camel@sauron.fi.intel.com>
Subject: Re: Ubi patch proposition for 3.10.y
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Willy Tarreau <w@1wt.eu>
Date: Mon, 08 Sep 2014 13:13:41 +0300
In-Reply-To: <20140908100453.GA28903@1wt.eu>
References: <CAGGh5h0KjexqaoEt8vvVXAEqCr625675XG4d71KdEuhrQVPr3w@mail.gmail.com>
 <1410170318.10764.119.camel@sauron.fi.intel.com>
 <20140908100453.GA28903@1wt.eu>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

On Mon, 2014-09-08 at 12:04 +0200, Willy Tarreau wrote:
> > But better, if people started paying more attention to "fastmap", we may
> > agree that from now on we are careful about the sending the fixes to the
> > stable queue.
> 
> Personally, I think that whatever feature provided in a kernel release is
> subject to being used and deserves its fixes. There are some cases where
> we *know* that some features are not used (eg: when they don't work without
> a lot of patching or tweaking), but if they seem to work for end users, they
> are likely to be used.

Well, adding stable tags is does not come for free. Whey you add a
stable tag, you need to make sure it applies to the older kernel, and
you need to also pick the possible dependencies. You need test it with
older kernel.

While in general what you say makes sense, for this specific "fastmap"
case the maintainers (me and Richard) did not think the overhead is
worth the benefits.

If now the situation has changed, we may start being more careful.

-- 
Best Regards,
Artem Bityutskiy
