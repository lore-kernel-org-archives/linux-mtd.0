From: David Woodhouse <dwmw2@infradead.org>
To: Miernik <miernik@ctnet.pl>
In-Reply-To: <20031107004945.GA25590@ctnet.pl>
References: <1068028888.6065.20.camel@hades.cambridge.redhat.com>
	<slrnbqgacq.1t2.miernik@tarnica.ctnet.pl>
	<20031107004945.GA25590@ctnet.pl>
Content-Type: text/plain
Message-Id: <1068198800.6065.744.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Fri, 07 Nov 2003 09:53:21 +0000
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] gets the current CVS MTD code to compile with
	2.6.0-test9
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2003-11-07 at 01:49 +0100, Miernik wrote:
> Authors of the three changed files: please take a look what I did with 
> this, in case I'm destroying something you've meant to do.
> If it's OK, please merge it into CVS. 

Looks sane; I've committed all but pcmciamtd.c which you said on IRC you
were still working on.

-- 
dwmw2
