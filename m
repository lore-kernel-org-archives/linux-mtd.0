From: David Woodhouse <dwmw2@infradead.org>
To: Kay Sievers <kay.sievers@vrfy.org>
In-Reply-To: <1148299789.26156.3.camel@pim.off.vrfy.org>
References: <000c01c67d89$93035ae0$253682a4@nap.st.com>
	<1148299024.12285.26.camel@pmac.infradead.org>
	<1148299789.26156.3.camel@pim.off.vrfy.org>
Content-Type: text/plain
Date: Mon, 22 May 2006 13:49:08 +0100
Message-Id: <1148302148.12285.40.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Davide CASCONE <davide.cascone@st.com>,
	Christian Gierke <ch@gierke.de>
Subject: Re: latest patch download
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2006-05-22 at 14:09 +0200, Kay Sievers wrote:
> 
> Something like this?:
> 
> http://git.infradead.org/?p=mtd-2.6.git;a=commitdiff;h=HEAD;hp=v2.6.17-rc1

Aha, thanks. So what Davide actually wanted was something like:

http://git.infradead.org/?p=mtd-2.6.git;a=commitdiff_plain;h=HEAD;hp=linus

It doesn't have the full set of commit comments, but the patch looks
good. Thanks.


Another feature request... if you look at http://git.infradead.org/ it's
just a list of trees, and it's quite hard to pick out the one you want.
It'd be really nice if we could split the 'official' trees up from the
users' trees -- and also if the users' trees which don't have anything
new are somehow less prominent -- by being greyed out, strikethrough or
something.

There's a whole bunch of trees there which I already pulled from, so
they contain nothing that isn't in their parent.

-- 
dwmw2
