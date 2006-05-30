Received: from wohnheim.fh-wedel.de ([213.39.233.138])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1Fl6Tt-0007yU-QU
	for linux-mtd@lists.infradead.org; Tue, 30 May 2006 11:50:20 -0400
Date: Tue, 30 May 2006 17:50:01 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: David Woodhouse <dwmw2@infradead.org>
Message-ID: <20060530155001.GA26220@wohnheim.fh-wedel.de>
References: <20060530152406.GA15284@wohnheim.fh-wedel.de>
	<1149003621.2885.185.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1149003621.2885.185.camel@hades.cambridge.redhat.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH,RFC] [MTD] replace MTD_NORFLASH with MTD_GENERIC_TYPE
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 30 May 2006 16:40:20 +0100, David Woodhouse wrote:
> On Tue, 2006-05-30 at 17:24 +0200, Jörn Engel wrote:
> > Apart from the text substitution, the STMicro ECC-NOR and Intel Sibley
> > flashes need special treatment.  This patch introduces a special
> > kernel-only flag for them that jffs2 uses to call special code.  It
> > should be noted that special code for these devices should not be
> > used.  But until jffs2 is clean in that respect, the flag serves as a
> > reminder that a cleanup is still required at some point.
> 
> Explain. Why shouldn't the existing code be used? What should we do
> instead?
> 
> ??? only a certain number of combinations of features in _real_ hardware
> -- fairly much covered by 'ROM, RAM, NOR, NAND and Sibley/ECC-NOR'.
> Enumerating those, and coping specifically with those, makes as much
> sense as handling arbitrary combinations of feature flags.

Until recently, we had four different variants of jffs2 wbuf code,
depending on the flash type.  I fail to see the difference between
those four and have already merged two of them.  Unless I am missing
something important, the other three can also be combined into one.

But doing so would result in something like
	if ((mtd->type == MTD_NAND) || (mtd->type == MTD_SIBLEY) ||
			(mtd->type == MTD_ECCNOR) ||
			(mtd->type == MTD_DATAFLASH))

Or, more realistically, in something like the recent situation, where
each one of those cases had its own copy of special code because
people don't realize that their type is no different from another
long-merged type.  Note that Nico didn't notice and copied the ECC_NOR
code almost verbatim.  Considering that he is a solid developer
otherwise, what would an average or below-average hacker come up with?

Jörn

-- 
Victory in war is not repetitious.
-- Sun Tzu
