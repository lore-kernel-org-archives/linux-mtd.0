Received: from tx2ehsobe004.messaging.microsoft.com ([65.55.88.14]
 helo=TX2EHSOBE007.bigfish.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RsJ4y-0002wh-CK
 for linux-mtd@lists.infradead.org; Tue, 31 Jan 2012 19:09:20 +0000
Message-ID: <4F283C59.2050800@freescale.com>
Date: Tue, 31 Jan 2012 13:09:13 -0600
From: Scott Wood <scottwood@freescale.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: GPMI-NAND: Wrong ECC size in driver
References: <201201040148.32847.marek.vasut@gmail.com>
 <201201050038.39448.marek.vasut@gmail.com> <4F04E558.7000002@freescale.com>
 <201201311233.06949.marek.vasut@gmail.com> <4F282519.5020802@gmail.com>
In-Reply-To: <4F282519.5020802@gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Cc: Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 Huang Shijie <b32955@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 01/31/2012 11:30 AM, Brian Norris wrote:
> There's another distinct possibility (one that I use on an out-of-tree
> driver): instead of calling "nand_scan()", separate it into its two
> sub-functions "nand_scan_ident()" and "nand_scan_tail()" so you have
> something like this
> 
>     ret = nand_scan_ident(mtd, pdata->max_chip_count, NULL);
>     chip->options |= NAND_NO_SUBPAGE_WRITE;
>     if (!ret)
>             ret = nand_scan_tail(mtd);
> 
> That way your option is set after we mask with NAND_CHIPOPTIONS_MSK. I'm
> not sure if this solution is better than really trying to tackle the
> issue of why we have that mask and whether it is still needed, but it
> solves the problem.


It's a bit hackish, but should work.  Why not get just rid of the mask,
though, if it's not actually doing anything constructive and is
requiring such workarounds?

-Scott
