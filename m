Date: Thu, 6 Sep 2007 16:04:28 +0530 (IST)
From: Satyam Sharma <satyam@infradead.org>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [2/2] 2.6.23-rc5: known regressions with patches
In-Reply-To: <1189072799.2745.68.camel@shinybook.infradead.org>
Message-ID: <alpine.LFD.0.999.0709061600250.3781@enigma.security.iitk.ac.in>
References: <46DBDCF4.6040805@googlemail.com> <46DBDDC6.9030602@googlemail.com>
	<1189072799.2745.68.camel@shinybook.infradead.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=UTF-8
Cc: Michal Piotrowski <michal.k.k.piotrowski@gmail.com>,
	LKML <linux-kernel@vger.kernel.org>, linux-mtd@lists.infradead.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Linus Torvalds <torvalds@linux-foundation.org>, Ingo Molnar <mingo@elte.hu>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On Thu, 6 Sep 2007, David Woodhouse wrote:
> 
> This isn't really a regression -- it's been like this for years. It's a
> non-functional configuration which doesn't really make sense, and would
> only crop up with randconfig (or crack).
> 
> Linus was offered the patch a few weeks ago, but didn't take it -- it's
> not really a priority for 2.6.23. It's in my git tree and will be pushed
> when the 2.6.24 merge window opens.
> 
> http://git.infradead.org/?p=mtd-2.6.git;a=commitdiff;h=241651d04d672fb685b2874707016cbbf95931e5

You shouldn't push this even for 2.6.24 ... I can't see why/how a runtime
BUG() scores over erroring out at build-time itself. And if there is no
codepath that leads to that BUG() at runtime, then what's the point of
adding dead code ...

So I wonder if what you're actually looking for is some kind of Kconfig
dependencies that will *prevent* the kind of .config from being generated
that Ingo ran into ?


Satyam
