Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1ePDo1-0000Wf-UQ
 for linux-mtd@lists.infradead.org; Wed, 13 Dec 2017 20:39:08 +0000
Date: Wed, 13 Dec 2017 21:38:44 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Colin Ian King <colin.king@canonical.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][mtd-next] mtd: nand: remove redundant check of len
Message-ID: <20171213213844.78efe253@bbrezillon>
In-Reply-To: <f0326a5b-1be8-c3be-9c42-2d3677d52239@canonical.com>
References: <20171213201743.27324-1-colin.king@canonical.com>
 <20171213212425.6fe999cb@bbrezillon>
 <f0326a5b-1be8-c3be-9c42-2d3677d52239@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 13 Dec 2017 20:30:04 +0000
Colin Ian King <colin.king@canonical.com> wrote:

> On 13/12/17 20:24, Boris Brezillon wrote:
> > On Wed, 13 Dec 2017 20:17:43 +0000
> > Colin King <colin.king@canonical.com> wrote:
> >   
> >> From: Colin Ian King <colin.king@canonical.com>
> >>
> >> The check of len being zero is redundant as it has already been
> >> sanity checked for this value at the start of the function. Hence
> >> it is impossible for this test to be true and so the redundant
> >> code can be removed.  
> > 
> > Nope, it's not the same test, the initial test is
> > 
> > 	if (len && !buf)  
> 
> Ah, the current tip from linux-next has:
> 
> 1912        if (!len || !buf)
> 1913                return -EINVAL;
> 
> ..so I guess that's why it got picked up by static analysis.

Hm, that's weird, that's not what I see [1] in linux-next.

[1]https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/mtd/nand/nand_base.c#n1488

> 
> > 
> > not
> > 
> > 	if (len)
> > 
> > So this test is not redundant.
> >   
> >>
> >> Detected by CoverityScan, CID#1462748 ("Logically dead code")
> >>
> >> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> >> ---
> >>  drivers/mtd/nand/nand_base.c | 4 ----
> >>  1 file changed, 4 deletions(-)
> >>
> >> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> >> index afd5e18db81c..9daaa23db943 100644
> >> --- a/drivers/mtd/nand/nand_base.c
> >> +++ b/drivers/mtd/nand/nand_base.c
> >> @@ -1507,10 +1507,6 @@ static int nand_read_param_page_op(struct nand_chip *chip, u8 page, void *buf,
> >>  		};
> >>  		struct nand_operation op = NAND_OPERATION(instrs);
> >>  
> >> -		/* Drop the DATA_IN instruction if len is set to 0. */
> >> -		if (!len)
> >> -			op.ninstrs--;
> >> -
> >>  		return nand_exec_op(chip, &op);
> >>  	}
> >>    
> >   
> 
