From: David Woodhouse <dwmw2@infradead.org>
To: Todd Poynor <tpoynor@mvista.com>
In-Reply-To: <41A53246.7040704@mvista.com>
References: <20041123222521.GA17741@slurryseal.ddns.mvista.com>
	<1101304647.8191.9015.camel@hades.cambridge.redhat.com>
	<41A53246.7040704@mvista.com>
Content-Type: text/plain
Date: Thu, 25 Nov 2004 09:36:21 +0000
Message-Id: <1101375381.13352.22.camel@localhost.localdomain>
Mime-Version: 1.0
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

On Wed, 2004-11-24 at 17:15 -0800, Todd Poynor wrote:
> David Woodhouse wrote:
> > We already have a bit to set in the partition flags to show that a
> > partition should be read-only. 
> 
> Yeah I saw that the bit is really an amalgam of 
> MTD_CLEAR_BITS|MTD_SET_BITS that are also involved in other capability 
> combos (MTD_CAP_NANDFLASH, et al) and wasn't sure if there were other 
> side effects of messing with those at runtime.

No, we have it separately for partitions.

> > I'd rather do this with a blacklist of the chips which lock themselves,
> > and have the chip driver automatically unlock it at boot time and
> > suspend time (or automatically as required).
> 
> I did receive some pushback when I previously tried to do something 
> similar, since we'd often be unlocking bootloader firmware and such.

Look at the use of MTD_WRITEABLE in, e.g., solutionengine.c. We already
have a way to prevent accidental access to the bootloader.

When they made the locking automatic instead of remembering the previous
state, the whole point of it changed. It's no longer useful for
protecting bootloaders all by itself; you can't infer anything useful
from the fact that you found the flash locked.

On the new chips of which you speak, all the locking can do is give us a
little more protection against random read/write cycles causing damage
to the contents of the flash. So let's use it for that. Leave the flash
locked at most times, and unlock a sector as we need to use it. 

-- 
dwmw2
