Received: from gateway-1237.mvista.com ([12.44.186.158] helo=hermes.mvista.com)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EbNho-0000sO-01
	for linux-mtd@lists.infradead.org; Sun, 13 Nov 2005 14:40:07 -0500
Message-ID: <437796B7.9070800@mvista.com>
Date: Sun, 13 Nov 2005 11:40:39 -0800
From: Todd Poynor <tpoynor@mvista.com>
MIME-Version: 1.0
To: Pavel Machek <pavel@ucw.cz>
References: <20051110095050.GC2021@elf.ucw.cz>
	<1131616948.27347.174.camel@baythorne.infradead.org>
	<20051110103823.GB2401@elf.ucw.cz>
	<1131619903.27347.177.camel@baythorne.infradead.org>
	<20051110105954.GE2401@elf.ucw.cz>
	<1131621090.27347.184.camel@baythorne.infradead.org>
	<20051110224158.GC9905@elf.ucw.cz> <4373DEB4.5070406@mvista.com>
	<20051111001617.GD9905@elf.ucw.cz>
	<1131692514.3525.41.camel@localhost.localdomain>
	<20051112213355.GA4676@elf.ucw.cz>
In-Reply-To: <20051112213355.GA4676@elf.ucw.cz>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	kernel list <linux-kernel@vger.kernel.org>
Subject: Re: latest mtd changes broke collie
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Pavel Machek wrote:

> [Plus I get a warning from jffs2 that flashsize is not aligned to
> erasesize. Then I get lot of messages that empty flash at XXX ends at
> XXX.]

The datasheet ref'ed earlier says the chips have a 64KB erase block 
size, and the sharp driver multiplies that value by an interleave of 4 
chips to set the erase size.  What erase size is set under the new 
setup?  cat /proc/mtd or set loglevel for KERN_DEBUG at chip probe time. 
  The new code is setting it based on what was read from the CFI query 
info reported by the chip times the interleave factor (which apparently 
should be set as 4 after detecting 4 chips if CONFIG_MTD_CFI_I4=y).


-- 
Todd
