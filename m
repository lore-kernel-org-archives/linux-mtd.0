Subject: Re: [2/2] 2.6.23-rc5: known regressions with patches
From: David Woodhouse <dwmw2@infradead.org>
To: Satyam Sharma <satyam@infradead.org>
In-Reply-To: <alpine.LFD.0.999.0709061600250.3781@enigma.security.iitk.ac.in>
References: <46DBDCF4.6040805@googlemail.com> <46DBDDC6.9030602@googlemail.com>
	<1189072799.2745.68.camel@shinybook.infradead.org>
	<alpine.LFD.0.999.0709061600250.3781@enigma.security.iitk.ac.in>
Content-Type: text/plain
Date: Thu, 06 Sep 2007 11:28:11 +0100
Message-Id: <1189074491.2745.78.camel@shinybook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

On Thu, 2007-09-06 at 16:04 +0530, Satyam Sharma wrote:
> You shouldn't push this even for 2.6.24 ... I can't see why/how a runtime
> BUG() scores over erroring out at build-time itself. And if there is no
> codepath that leads to that BUG() at runtime, then what's the point of
> adding dead code ...
>
> So I wonder if what you're actually looking for is some kind of Kconfig
> dependencies that will *prevent* the kind of .config from being generated
> that Ingo ran into ?

I looked at that but decided against it. There's too much hand-holding
and arbitrary 'automatic' crap in the Kconfig crap already, and I
couldn't see a way to do it that didn't make that worse.

As long as we no longer break randconfig builds, it'll be fine. It's not
as if people _run_ those kernels, let alone actually exercise the code
path in question.

-- 
dwmw2
