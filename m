Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JRigR-0000eB-4n
	for linux-mtd@lists.infradead.org; Wed, 20 Feb 2008 06:43:59 +0000
Date: Wed, 20 Feb 2008 07:43:22 +0100
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 2.6.24] block2mtd: removing a device and typo fixes
Message-ID: <20080220064321.GB29587@lazybastard.org>
References: <chaz20080212134751.GI30304@artesyncp.com>
	<chaz20080212161034.GJ30304@artesyncp.com>
	<20080219150822.GA29587@lazybastard.org>
	<200802192333.39707.arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <200802192333.39707.arnd@arndb.de>
Cc: linux-mtd@lists.infradead.org, =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>,
	Stephane Chazelas <stephane.chazelas@emerson.com>,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 19 February 2008 23:33:38 +0100, Arnd Bergmann wrote:
> 
> Given that loop works in this way, I certainly see that as doable,
> but then I'd vote for using the existing ioctl semantics of
> LOOP_SET_FD and LOOP_DEL_FD on the mtdchar device, which already
> comes with an ioctl interface for mtd devices.
> I'd probably also allow the LOOP_{GET,SET}_STATUS{,64} commands,
> so you can actually use the existing losetup tool.
> That way, we wouldn't have to introduce a new API, just extend
> an existing one to work on more things.

I like this approach.  It somewhat collides with the mtd principle of
having a seperate module for every 2-3 lines of code, but maybe that is
not a bad thing after all.

Onto my list of code to write on rainy afternoons (and secretly hoping
for others to do it instead).

Jörn

-- 
Mundie uses a textbook tactic of manipulation: start with some
reasonable talk, and lead the audience to an unreasonable conclusion.
-- Bruce Perens
