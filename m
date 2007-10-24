Subject: Re: [PATCH] allow use of mtd and jffs2 on uml
From: David Woodhouse <dwmw2@infradead.org>
To: Jason Lunz <lunz@falooley.org>
In-Reply-To: <20071024011712.GA3762@falooley.org>
References: <22c797d00709272118i33d32b9dy93d5f5ec8f8edd30@mail.gmail.com>
	<20071024011712.GA3762@falooley.org>
Content-Type: text/plain
Date: Wed, 24 Oct 2007 07:51:29 +0100
Message-Id: <1193208689.26096.48.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: atom ota <atomota@sleepyhammer.com>, Jeff Dike <jdike@addtoit.com>,
	linux-mtd@lists.infradead.org, uml-user@lists.sourceforge.net
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Tue, 2007-10-23 at 18:17 -0700, Jason Lunz wrote:
> 
> The patch below makes it work. It's crude and I make no excuses for
> it,
> but it does let jffs2-on-block2mtd work on uml without problems.
> 
> I think the addition of CONFIG_MTD_CHIPREG is an ugly hack in
> particular, and improperly done at that (it stays off for !UML, I
> think).

Why build anything in chips/ or maps/ ? 

We should make sure mtdram, nandsim and onenandsim are all buildable
too.

-- 
dwmw2
