Received: from amanaus.varma-el.com ([195.144.240.154])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GZpOP-000793-Pc
	for linux-mtd@lists.infradead.org; Tue, 17 Oct 2006 09:54:10 -0400
Message-ID: <4534E078.9030301@varma-el.com>
Date: Tue, 17 Oct 2006 17:54:00 +0400
From: Andrey Volkov <avolkov@varma-el.com>
MIME-Version: 1.0
To: dedekind@infradead.org
Subject: Re: JFFS2 on Lite5200
References: <1161081183.22948.58.camel@localhost.localdomain>	
	<4534D8A5.7060206@varma-el.com> <1161092193.3260.61.camel@sauron>
In-Reply-To: <1161092193.3260.61.camel@sauron>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Andrea Galbusera <andrea.galbusera@teamware.it>,
	linux-mtd@lists.infradead.org, linuxppc-embedded@ozlabs.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy wrote:
> On Tue, 2006-10-17 at 17:20 +0400, Andrey Volkov wrote:
>> P.S. Artem, I repeat, I sent this patch _HALF_YEAR_AGO_
>> how about to fix scan.c?
> 
> Andrey,
> 
> I am not JFFS2 maintainer, David Woodhouse is.
Ok, I'll keep it in mind.

> 
> Just looked into your patch. I agree that it may make sense to teach
> JFFS2 to use only aligned addresses, but your patch changes
> include/asm-ppc/io.h which is probably not MTD's business. 
> It probably
> makes sense to submit these changes to a PPC maintainer separately.
> 
> A question - does this mean that one can write only 4-byte chunks to
> this NOR (?) flash?
> 
No, MPC5200 could write any size chunks, but it must be aligned (same
restrictions as in SH4), and this restriction applied only to LPB, but
not SDRAM.

Also, I've in view that jffs2(jffs3 ?) read/write stuff already used
functions which MTD drivers exported, but jffs2_scan_dirent_node and
friends - doesn't.

Andrey
