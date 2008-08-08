Subject: Re: Jffs2 crach in 2.6.25.6.atmel.1
From: David Woodhouse <dwmw2@infradead.org>
To: Haavard Skinnemoen <haavard.skinnemoen@atmel.com>
In-Reply-To: <20080808150524.5263de89@hskinnemo-gx745.norway.atmel.com>
References: <6B5648EA2E2C2D42AF2FF7691522AD92417C1C@wpr01.wprmedical.local>
	<20080808150524.5263de89@hskinnemo-gx745.norway.atmel.com>
Content-Type: text/plain
Date: Fri, 08 Aug 2008 14:48:07 +0100
Message-Id: <1218203287.12232.165.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Eirik Aanonsen <eaa@wprmedical.com>, kernel@avr32linux.org,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2008-08-08 at 15:05 +0200, Haavard Skinnemoen wrote:
> > JFFS2 error: (349) __jffs2_dbg_acct_sanity_check_nolock: eeep, space
> > accounting for block at 0xffffffff is screwed.

That's very suspicious. We set jeb->offset for each eraseblock when the
file system is first mounted, and never change it. Either the block
pointer is bogus, or something has scribbled on the memory. 

Can you check the eraseblock pointer? Determine whether it's within the
c->blocks[c->nr_blocks] array?

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
