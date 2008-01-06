Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JBd5j-0003gU-Uo
	for linux-mtd@lists.infradead.org; Sun, 06 Jan 2008 21:31:42 +0000
Date: Sun, 6 Jan 2008 22:25:42 +0100
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Erez Zadok <ezk@cs.sunysb.edu>
Subject: Re: [PATCH] block2mtd lockdep_init_map warning
Message-ID: <20080106212542.GA5262@lazybastard.org>
References: <20080106131343.GA3120@lazybastard.org>
	<200801061911.m06JBldW020012@agora.fsl.cs.sunysb.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <200801061911.m06JBldW020012@agora.fsl.cs.sunysb.edu>
Cc: peterz@infradead.org, =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>,
	linux-kernel@vger.kernel.org, mingo@redhat.com,
	linux-mtd@lists.infradead.org, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 6 January 2008 14:11:47 -0500, Erez Zadok wrote:
> 
> The problem appears to be an interaction of two components--module loading
> and lockdep--that's perhaps why it wasn't given enough attention.

Correct.  For modules lockdep depends on initializations done after
module_init has finished.  However block2mtd is an odd sod that can call
into lockdep code during module_init, causing the bug you noticed.

Several solutions are possible.  Modules could get two initcalls, one to
decide whether module load should get aborted, the other run later,
after the remaining module initializations are done.  Or the module
loader could always do the initializations and revoke them later, if
module_init failed.

But I personally am too unfamiliar with the module code to trust my
judgement and have yet to receive feedback.  Even you seem to ignore my
mails and not even Cc: me later on.  I must have done something really
horrible in my last life, it seems.

Jörn

-- 
A quarrel is quickly settled when deserted by one party; there is
no battle unless there be two.
-- Seneca
