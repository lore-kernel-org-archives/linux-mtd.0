Subject: Re: [PATCH] panic.c: export panic_on_oops
From: David Woodhouse <dwmw2@infradead.org>
To: Ingo Molnar <mingo@elte.hu>
In-Reply-To: <20091012142634.GB4565@elte.hu>
References: <20091012111545.GB8857@elte.hu>
	<1255346731.9659.31.camel@localhost> <20091012113758.GB11035@elte.hu>
	<20091012140149.6789efab@marrow.netinsight.se>
	<20091012120951.GA16799@elte.hu>
	<20091012142714.56362465@marrow.netinsight.se>
	<20091012123210.GB22766@elte.hu>
	<20091012140821.5dfa1598@lxorguk.ukuu.org.uk>
	<20091012132503.GD25464@elte.hu>
	<1255354342.30919.17.camel@macbook.infradead.org>
	<20091012142634.GB4565@elte.hu>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 12 Oct 2009 15:36:21 +0100
Message-Id: <1255358181.9111.14.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Artem Bityutskiy <dedekind1@gmail.com>, LKML <linux-kernel@vger.kernel.org>,
	"Koskinen Aaro \(Nokia-D/Helsinki\)" <aaro.koskinen@nokia.com>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	Simon Kagstrom <simon.kagstrom@netinsight.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Alan Cox <alan@lxorguk.ukuu.org.uk>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2009-10-12 at 16:26 +0200, Ingo Molnar wrote:
> Not if the failure is say a s2ram hang that requires a power cycle. Also 
> there are certain classes of bugs that only occur on cold boot. Plus 
> there's the "need to unplug the battery to revive the system" class of 
> bugs (but they are rare).

So you need to build in enough ECC to cope with the decay which happens
when RAM isn't being refreshed for a few seconds... :)

> So i think the MTD / flash stuff is powerful. 

Yeah, definitely. I was just pointing out that we can actually do a lot
better on today's commodity hardware too.

-- 
dwmw2
