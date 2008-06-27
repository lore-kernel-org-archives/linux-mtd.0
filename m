Message-ID: <4864FC90.8010608@freescale.com>
Date: Fri, 27 Jun 2008 09:43:28 -0500
From: Scott Wood <scottwood@freescale.com>
MIME-Version: 1.0
To: avorontsov@ru.mvista.com
Subject: Re: [PATCH] MTD: NAND: fsl_elbc_nand: fix OOB workability for	large
	page NAND chips
References: <20080626184156.GA2356@polina.dev.rtsoft.ru>
	<4863E721.60906@freescale.com>
	<20080626230621.GA22450@polina.dev.rtsoft.ru>
In-Reply-To: <20080626230621.GA22450@polina.dev.rtsoft.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Anton Vorontsov wrote:
> On Thu, Jun 26, 2008 at 01:59:45PM -0500, Scott Wood wrote:
>> Anton Vorontsov wrote:
>>> For large page chips, nand_bbt is looking into OOB area, and checking
>>> for "0xff 0xff" pattern at OOB offset 0. That is, two bytes should be
>>> reserved for bbt means.
>> Interesting... both the 8313 manual and the manual for a random large  
>> page NAND chip say that the bad block indicator is one byte.
> 
> Ok, great. If I understood David correctly, second byte is used (by some
> chips?) for redundancy, thus should not be a big problem if we'll ignore
> it. So, would you ack this part? Then I'll resend it with some typos
> fixed. ;-)

Acked-by: Scott Wood <scottwood@freescale.com>

>> BTW, I was just looking at NAND boot on this chip, and it seems that it  
>> expects ECCM=1 for large page devices, so we should make that the  
>> default (preferably at the same time as we fix this problem, so that we  
>> don't break compatibility with a working version).
> 
> Ugh. I think driver should support both. If we'll change (force) this in
> Linux, we'll break older u-boots (especially FSL U-Boots with NAND
> support enabled).

I'm not aware of a Freescale board with large page NAND...

> I believe that simply changing ECCM to 1 in the newer
> community u-boots would be less pain for everybody, no?

OK, though we'll have to load the existing FMR[ECCM] into priv->fmr on 
init, rather than starting with zero.

-Scott
