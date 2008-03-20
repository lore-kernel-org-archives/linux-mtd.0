Received: from lazybastard.de ([212.112.238.170] helo=longford.logfs.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JcKqX-0001LK-7O
	for linux-mtd@lists.infradead.org; Thu, 20 Mar 2008 13:30:26 +0000
Date: Thu, 20 Mar 2008 13:31:39 +0100
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Adrian McMenamin <adrian@newgolddream.dyndns.info>
Subject: Re: [Fwd: Re: [PATCH] 2/2 mtd: Add support for the Dreamcast VMU
	flash]
Message-ID: <20080320123139.GE1355@logfs.org>
References: <1205961641.6276.6.camel@localhost.localdomain>
	<20080320100353.GA409@logfs.org>
	<21996.85.118.17.158.1206014214.squirrel@newgolddream.dyndns.info>
	<20080320112029.GB1355@logfs.org>
	<47111.85.118.17.158.1206017802.squirrel@newgolddream.dyndns.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <47111.85.118.17.158.1206017802.squirrel@newgolddream.dyndns.info>
Cc: MTD <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 20 March 2008 12:56:42 -0000, Adrian McMenamin wrote:
> On Thu, March 20, 2008 11:20 am, JÃ¶rn Engel wrote:
> > On Thu, 20 March 2008 11:56:54 -0000, Adrian McMenamin wrote:
> >> >> +
> >> >> +	((unsigned long *)sendbuf)[0] = cpu_to_be32(MAPLE_FUNC_MEMCARD);
> >> >> +	((unsigned long *)sendbuf)[1] = cpu_to_be32(partition << 24 | num);
> > So why do you use void* for data you actually dereference?
> 
> Because for other devices data can be passed as 16 bit structures as well
> as 32 bit ones.

Hogwash!  If you ever deal with 16bit structures here you have a bug.
cpu_to_be32() only makes sense when actually dealing with __be32.
Either your variable is and should be called __be32, or it isn't and you
have a bug right in front of you.

Jörn

-- 
It does not matter how slowly you go, so long as you do not stop.
-- Confucius
