From: David Woodhouse <dwmw2@infradead.org>
To: Robin Gilks <robin.gilks@tait.co.nz>
In-Reply-To: <4058DFA1.2080707@tait.co.nz>
References: <405632E3.9040509@tait.co.nz>  <4058DFA1.2080707@tait.co.nz>
Content-Type: text/plain
Message-Id: <1079599371.16952.119.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Thu, 18 Mar 2004 08:42:52 +0000
Content-Transfer-Encoding: 7bit
cc: mtd list <linux-mtd@lists.infradead.org>
Subject: Re: mtdparts howto required!!
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2004-03-18 at 12:30 +1300, Robin Gilks wrote:
> Don't you just love it when someone replies to their own post!!

I do when they've solved their own problem. :)

> Problem solved - it would be nice if it were written down somewhere that 
> the physmap.c example is only that - a non-working example in that it 
> doesn't define a master mtd device which means you can't define the 
> partitions on it!!

I'm not sure I understand this. What does physmap.c need to do other
than passing in the 'master' mtd device as the first argument to
parse_mtd_partitions()?

> Also, when a master device is defined there is nothing to indicate that 
> the mtdparts command line has to use the same name as the mtd_id - in 
> fact I've found nothing that defines what mtd_id is.

cmdlinepart.c line 13:
 * <mtd-id>  := unique name used in mapping driver/device

I'll add '(mtd->name)' to that in the hope of making it clearer.

> Oh well - its kept me entertained for 3 days instead of doing real work...

Patches to improve documentation are always welcome :)

-- 
dwmw2
