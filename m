Subject: Re: [2/2] 2.6.23-rc5: known regressions with patches
From: David Woodhouse <dwmw2@infradead.org>
To: Michal Piotrowski <michal.k.k.piotrowski@gmail.com>
In-Reply-To: <46DBDDC6.9030602@googlemail.com>
References: <46DBDCF4.6040805@googlemail.com> <46DBDDC6.9030602@googlemail.com>
Content-Type: text/plain
Date: Thu, 06 Sep 2007 10:59:59 +0100
Message-Id: <1189072799.2745.68.camel@shinybook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>,
	Ingo Molnar <mingo@elte.hu>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	LKML <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2007-09-03 at 12:11 +0200, Michal Piotrowski wrote:
> MTD
> 
> Subject         : error: implicit declaration of function 'cfi_interleave'
> References      : http://lkml.org/lkml/2007/8/6/272
> Last known good : ?
> Submitter       : Ingo Molnar <mingo@elte.hu>
> Caused-By       : ?
> Handled-By      : David Woodhouse <dwmw2@infradead.org>
> Patch           : http://lkml.org/lkml/2007/8/9/586
> Status          : patch available 

This isn't really a regression -- it's been like this for years. It's a
non-functional configuration which doesn't really make sense, and would
only crop up with randconfig (or crack).

Linus was offered the patch a few weeks ago, but didn't take it -- it's
not really a priority for 2.6.23. It's in my git tree and will be pushed
when the 2.6.24 merge window opens.

http://git.infradead.org/?p=mtd-2.6.git;a=commitdiff;h=241651d04d672fb685b2874707016cbbf95931e5

-- 
dwmw2
