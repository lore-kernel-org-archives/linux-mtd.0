Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WhD9A-0001H4-0O
 for linux-mtd@lists.infradead.org; Mon, 05 May 2014 07:17:08 +0000
Message-ID: <1399274177.15290.7.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v2] UBIFS: Fix assert failed in ubifs_set_page_dirty
From: Artem Bityutskiy <dedekind1@gmail.com>
To: hujianyang <hujianyang@huawei.com>
Date: Mon, 05 May 2014 10:16:17 +0300
In-Reply-To: <1399273358.15290.0.camel@sauron.fi.intel.com>
References: <535B7B96.9030008@huawei.com> <536092CE.2090209@huawei.com>
 <1399273358.15290.0.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Laurence Withers <lwithers@guralp.com>,
 linux-mtd <linux-mtd@lists.infradead.org>, adrian.hunter@intel.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2014-05-05 at 10:02 +0300, Artem Bityutskiy wrote:
> On Wed, 2014-04-30 at 14:06 +0800, hujianyang wrote:
> > Hi, all
> > 
> > Basing on the perious mail, I would like to show a clear figure
> > about the race I have found.
> 
> Looks correct, thanks. This probably needs to go the the stable tree.

I think the patch is correct and fixes a real problem where we end up
with a dirty page but no budget allocated for this page.

So the subject is not very good - it looks like the patch just silence a
warning, but it actually fixes a real problem.

I'll change the subject.

It looks like this patch should be merged to Linuses tree for 3.15, but
I would like to play safe and postpone it to 3.16, because I did not
test it myself, and only one person's Tested-by: is not enough to make
me confident the patch is bullet-proof.

However, I'll add "Cc: stable@vger.kernel.org", which means that once
the patch hits Linuses tree, it'll also go to older stable kernel trees
too, so all the careful users will end up having it too.

How does this sound?

And thanks for excellent analysis.

-- 
Best Regards,
Artem Bityutskiy
