Received: from gateway-1237.mvista.com ([12.44.186.158] helo=av.mvista.com)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CX8El-00088y-7b
	for linux-mtd@lists.infradead.org; Wed, 24 Nov 2004 20:15:56 -0500
Message-ID: <41A53246.7040704@mvista.com>
Date: Wed, 24 Nov 2004 17:15:50 -0800
From: Todd Poynor <tpoynor@mvista.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
References: <20041123222521.GA17741@slurryseal.ddns.mvista.com>
	<1101304647.8191.9015.camel@hades.cambridge.redhat.com>
In-Reply-To: <1101304647.8191.9015.camel@hades.cambridge.redhat.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Supporting flash that powers up locked
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David Woodhouse wrote:
> We already have a bit to set in the partition flags to show that a
> partition should be read-only. 

Yeah I saw that the bit is really an amalgam of 
MTD_CLEAR_BITS|MTD_SET_BITS that are also involved in other capability 
combos (MTD_CAP_NANDFLASH, et al) and wasn't sure if there were other 
side effects of messing with those at runtime.

> I'd rather do this with a blacklist of the chips which lock themselves,
> and have the chip driver automatically unlock it at boot time and
> suspend time (or automatically as required).

I did receive some pushback when I previously tried to do something 
similar, since we'd often be unlocking bootloader firmware and such.

It may be better to err on the side of caution and make it the 
responsibility of userspace to unlock the needed portions.  Assuming the 
root fs is read-only then boot time probably isn't a problem.  System 
resume time could be a problem, since we can't guarantee nothing will 
write to previously-writeable filesystems before the "restore flash 
state" script runs.  So if the dangers of unlocking bootloaders etc. 
aren't felt to be that important then unlocking all blocks is the easier 
solution.

Another option suggested previously was to require userspace to unlock 
needed blocks, but keep a bitmap of unlocked blocks and restore the 
flash to the same state at mtd resume, so writeable file systems 
continue to be writeable at resume time (and no userspace callback is 
needed at resume time).

If, all in all, unlocking the whole chip is still the best way to go 
then I'll send a proposed patch for Intel K3 StrataFlash.  Thanks,


-- 
Todd
