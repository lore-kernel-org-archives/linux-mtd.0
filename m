Subject: Re: [PATCH] panic.c: export panic_on_oops
From: David Woodhouse <dwmw2@infradead.org>
To: Ingo Molnar <mingo@elte.hu>
In-Reply-To: <20091012120951.GA16799@elte.hu>
References: <1255241458-11665-1-git-send-email-dedekind1@gmail.com>
	<20091012111545.GB8857@elte.hu> <1255346731.9659.31.camel@localhost>
	<20091012113758.GB11035@elte.hu>
	<20091012140149.6789efab@marrow.netinsight.se>
	<20091012120951.GA16799@elte.hu>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 12 Oct 2009 13:15:48 +0100
Message-Id: <1255349748.10605.13.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Artem Bityutskiy <dedekind1@gmail.com>, LKML <linux-kernel@vger.kernel.org>,
	"Koskinen Aaro \(Nokia-D/Helsinki\)" <aaro.koskinen@nokia.com>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	Simon Kagstrom <simon.kagstrom@netinsight.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linus Torvalds <torvalds@linux-foundation.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2009-10-12 at 14:09 +0200, Ingo Molnar wrote:
> Also, would it be possible to just simplify the thing and not do any 
> buffering at all? Extra buffering complexity in a console driver is only 
> asking for trouble. Or is flash storage write cycles optimization that 
> important in this case?

That and the fact that on NAND flash you have to write full pages at a
time -- that's 512 bytes, 2KiB or 4KiB depending on the type of chip. So
we really do want to buffer it where we can.

We don't want to write a 2KiB page for every line of printk output.

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
