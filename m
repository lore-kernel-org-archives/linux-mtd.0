Subject: Re: [PATCH] panic.c: export panic_on_oops
From: David Woodhouse <dwmw2@infradead.org>
To: Ingo Molnar <mingo@elte.hu>
In-Reply-To: <20091012132503.GD25464@elte.hu>
References: <1255241458-11665-1-git-send-email-dedekind1@gmail.com>
	<20091012111545.GB8857@elte.hu> <1255346731.9659.31.camel@localhost>
	<20091012113758.GB11035@elte.hu>
	<20091012140149.6789efab@marrow.netinsight.se>
	<20091012120951.GA16799@elte.hu>
	<20091012142714.56362465@marrow.netinsight.se>
	<20091012123210.GB22766@elte.hu>
	<20091012140821.5dfa1598@lxorguk.ukuu.org.uk>
	<20091012132503.GD25464@elte.hu>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 12 Oct 2009 14:32:22 +0100
Message-Id: <1255354342.30919.17.camel@macbook.infradead.org>
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

On Mon, 2009-10-12 at 15:25 +0200, Ingo Molnar wrote:
> 
> I care about this because i still havent given up hope that the company 
> you are working for will finally give us some permanent storage in the 
> CPU itself, so that we can have cross-reboot printk buffering ;-) 

Why would it have to be in the CPU? If we had decent firmware, couldn't
we just look at the old kernel's log_buf in RAM?

On machines where coreboot is supported (which is mostly machines
_other_ than those from my employer, unfortunately), you ought to be
able to do this today.

-- 
dwmw2
