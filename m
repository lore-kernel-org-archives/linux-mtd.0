From: David Woodhouse <dwmw2@infradead.org>
To: Todd Poynor <tpoynor@mvista.com>
In-Reply-To: <20041123222521.GA17741@slurryseal.ddns.mvista.com>
References: <20041123222521.GA17741@slurryseal.ddns.mvista.com>
Content-Type: text/plain
Message-Id: <1101304647.8191.9015.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Wed, 24 Nov 2004 13:57:28 +0000
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

On Tue, 2004-11-23 at 14:25 -0800, Todd Poynor wrote:
> Flash chips that power up with all blocks locked (such as K3
> StrataFlash) seem to be showing up on more and more platforms.  At the
> risk of being a pest, I'd like to push for some agreement on how to
> handle this and possibly get the support into linux-mtd.
> 
> Below is a patch to the partition driver to use the partition map as the
> source of information for whether a partition is to be writeable and to
> unlock blocks upon write if the block is found to be locked when this
> was not intended.  It intercepts an EROFS return from the chip driver on
> a write/erase, unlocks blocks, and retries the write/erase, if the
> partition is marked writeable.  If the partition is not writeable, or if
> the partition has been explicitly locked, then the locked blocks are
> left alone and the EROFS is returned to the caller.

We already have a bit to set in the partition flags to show that a
partition should be read-only. 

I'd rather do this with a blacklist of the chips which lock themselves,
and have the chip driver automatically unlock it at boot time and
suspend time (or automatically as required).

-- 
dwmw2
