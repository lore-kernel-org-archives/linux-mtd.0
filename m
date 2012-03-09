Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S5xBx-0007mN-Ta
 for linux-mtd@lists.infradead.org; Fri, 09 Mar 2012 10:36:58 +0000
Message-ID: <1331289554.22872.61.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: cfi: Wait for Block Erase operation to finish
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Paul Parsons <lost.distance@yahoo.com>
Date: Fri, 09 Mar 2012 12:39:14 +0200
In-Reply-To: <1330554395.65878.YahooMailClassic@web29011.mail.ird.yahoo.com>
References: <1330554395.65878.YahooMailClassic@web29011.mail.ird.yahoo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org,
 Joakim Tjernlund <joakim.tjernlund@transmode.se>, philipp.zabel@gmail.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2012-02-29 at 22:26 +0000, Paul Parsons wrote:
> --- On Wed, 29/2/12, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> > Did you try to validate your setup
> > with mtd tests?
> 
> No I did not.
> 
> I've just quickly tried the readtest on all mtd partitions and they seemed
> to pass. A torturetest on a small unused partition reported "retried 3
> times, still errors, give-up", but a stresstest on the same partition passed.
> 
> Was there a specific test and set of options I should try?
> The hx4700 has NOR flash (Intel StrataFlash) so it looks like at least 4
> of the tests - pagetest, oobtest, subpagetest, nandecctest - are not
> appropriate.

In the past all tests either worked on nor or refused to load. I thought
stresstest should work as well. I do not have any specific test in mind,
threw out standard suggestion I give to people :-)

-- 
Best Regards,
Artem Bityutskiy
