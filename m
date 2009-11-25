Received: from lazybastard.de ([212.112.238.170] helo=longford.logfs.org)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NDKDF-0002fT-Mp
	for linux-mtd@lists.infradead.org; Wed, 25 Nov 2009 15:55:31 +0000
Date: Wed, 25 Nov 2009 16:55:11 +0100
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 0/17] [LogFS] New flash filesystem
Message-ID: <20091125155510.GE10944@logfs.org>
References: <20091120181113.GA2159@logfs.org>
	<200911231318.39685.arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <200911231318.39685.arnd@arndb.de>
Cc: linux-fsdevel@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 23 November 2009 13:18:39 +0100, Arnd Bergmann wrote:
> On Friday 20 November 2009, Joern Engel wrote:
> > Mails are purely for review and comments.  If this is deemed
> > merge-ready, please the git tree at
> > http://git.kernel.org/?p=linux/kernel/git/joern/logfs.git
> > instead.
> 
> I think merging is overdue, the code looks great and if you're
> happy with it to go in, it's hard for anyone to argue with
> that.
> 
> It should definitely be included in linux-next, and I guess it
> should have been in there for some time, to get better
> compile-time coverage across architectures, and some
> more testing.
> 
> I can't find it in linux-next right now, but I could be
> looking at the wrong stuff again, as I have before.

Stephen,
do you have a reason not to add logfs to linux-next?

Jörn

-- 
Mundie uses a textbook tactic of manipulation: start with some
reasonable talk, and lead the audience to an unreasonable conclusion.
-- Bruce Perens
