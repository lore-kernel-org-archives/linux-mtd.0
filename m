Received: from [85.21.88.6] (helo=buildserver.ru.mvista.com)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KC0Xo-0006Op-GJ
	for linux-mtd@lists.infradead.org; Thu, 26 Jun 2008 23:06:25 +0000
Date: Fri, 27 Jun 2008 03:06:21 +0400
From: Anton Vorontsov <avorontsov@ru.mvista.com>
To: Scott Wood <scottwood@freescale.com>
Subject: Re: [PATCH] MTD: NAND: fsl_elbc_nand: fix OOB workability for
	large page NAND chips
Message-ID: <20080626230621.GA22450@polina.dev.rtsoft.ru>
References: <20080626184156.GA2356@polina.dev.rtsoft.ru>
	<4863E721.60906@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf8
Content-Disposition: inline
In-Reply-To: <4863E721.60906@freescale.com>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
Reply-To: avorontsov@ru.mvista.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jun 26, 2008 at 01:59:45PM -0500, Scott Wood wrote:
> Anton Vorontsov wrote:
>> For large page chips, nand_bbt is looking into OOB area, and checking
>> for "0xff 0xff" pattern at OOB offset 0. That is, two bytes should be
>> reserved for bbt means.
>
> Interesting... both the 8313 manual and the manual for a random large  
> page NAND chip say that the bad block indicator is one byte.

Ok, great. If I understood David correctly, second byte is used (by some
chips?) for redundancy, thus should not be a big problem if we'll ignore
it. So, would you ack this part? Then I'll resend it with some typos
fixed. ;-)

> BTW, I was just looking at NAND boot on this chip, and it seems that it  
> expects ECCM=1 for large page devices, so we should make that the  
> default (preferably at the same time as we fix this problem, so that we  
> don't break compatibility with a working version).

Ugh. I think driver should support both. If we'll change (force) this in
Linux, we'll break older u-boots (especially FSL U-Boots with NAND
support enabled). I believe that simply changing ECCM to 1 in the newer
community u-boots would be less pain for everybody, no?

-- 
Anton Vorontsov
email: cbouatmailru@gmail.com
irc://irc.freenode.net/bd2
