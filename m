Message-ID: <428C7CCF.50606@netwinder.org>
Date: Thu, 19 May 2005 07:47:27 -0400
From: Ralph Siemsen <ralphs@netwinder.org>
MIME-Version: 1.0
To: Munira Ahmed <munira.ahmed@radixs.com>
References: <1116226208.31694.26.camel@server11>	<428899DA.3040507@netwinder.org>
	<1116293182.31694.47.camel@server11>	<428BC09E.7070307@netwinder.org>
	<1116467146.18096.45.camel@server11>
In-Reply-To: <1116467146.18096.45.camel@server11>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: stdio.h and kernel space
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Munira Ahmed wrote:
> S29WSxxxN. Does not seem to be supported

According to datasheet the programming sequence looks rather like the 
JEDEC standard method found in drivers/mtd/chips/jedec_probe.c, 
particularly the jedec_reset() function matches the code shown on page 
28 of the datasheet.

Datasheet i'm looking at is 
http://www.amd.com/us-en/assets/content_type/white_papers_and_tech_docs/s29ws-n_00_g0_e.pdf 
hopefully this is the right one ;)

So the standard driver might just need an extra entry for vendor/device 
codes.  Maybe ;)

-R
