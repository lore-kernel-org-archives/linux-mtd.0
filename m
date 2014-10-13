Received: from mga09.intel.com ([134.134.136.24])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XdfW4-0006zv-BP
 for linux-mtd@lists.infradead.org; Mon, 13 Oct 2014 13:18:24 +0000
Message-ID: <1413206263.7906.18.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 3/4] UBI: Fastmap: Care about the protection queue
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Richard Weinberger <richard@nod.at>
Date: Mon, 13 Oct 2014 16:17:43 +0300
In-Reply-To: <542EF3BF.1070401@nod.at>
References: <1412029248-22454-1-git-send-email-richard@nod.at>
 <1412029248-22454-4-git-send-email-richard@nod.at>
 <1412346676.3795.62.camel@sauron.fi.intel.com> <542EF3BF.1070401@nod.at>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2014-10-03 at 21:06 +0200, Richard Weinberger wrote:
> Fastmap needs basically access to all internal state of UBI, which
> lives mostly
> within wl.c

Sounds like a very strong assertion, smells a bit fishy, need the
details.

> It needs to iterate over the used, free, erase, scrub RB-trees, the
> protection queue, etc. to
> collect the exact state of all PEBs.

When? In 'ubi_write_fastmap()' when forming the FM pool data structures?

I think you can just add a function like this to wl.c:

int ubi_wl_get_peb_info(int pnum, struct ubi_wl_peb_info *pebinfo)

Yoy will give it the PEB number you are interested in, it will return
you the information you need in 'pebinfo'. The information will contain
the EC, the state (used, free, etc).

If you need just the EC, then you do not even need the ubi_wl_peb_info
data structure.

Then you just iterate over all PEBs and fill the FM pool data
structures.

Would something like this work?

Artem.
