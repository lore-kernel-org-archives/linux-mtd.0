From: David Woodhouse <dwmw2@infradead.org>
To: David Vrabel <dvrabel@arcom.com>
In-Reply-To: <4030D2AB.7010002@arcom.com>
References: <4030D2AB.7010002@arcom.com>
Content-Type: text/plain
Message-Id: <1076941917.18703.29.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Mon, 16 Feb 2004 14:31:57 +0000
Content-Transfer-Encoding: 7bit
cc: linux-mtd list <linux-mtd@lists.infradead.org>
Subject: Re: CFI command set 0002 (AMD/Fujitsu) work.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2004-02-16 at 14:24 +0000, David Vrabel wrote:
> I'm currently working on cfi_cmdset_0002.c to get erase-suspend-program 
> working.  So far I've taken all the chip status checking code and 
> refactored it into a single function -- it was all a bit of a mess.

Thanks for doing this.


> 1. There's a fair amount of crap related to very broken SST chips (all 
> the stuff for retrying commands).  a) This is mess and appears only 
> applicable to a very few number of chips; b) I'm not sure it would even 
> work if talking to the chip is broken then retrying a few times won't 
> guarantee it will work.  I'd suggest removing this stuff from 
> cfi_cmdset_0002.c.  Clearly the SST chips aren't compliant even though 
> they claim to be.  Thoughts?

That seems reasonable to me. It's horrid. I wonder if we could do it in
a wrapper around the 'real' chip driver, only for the broken chips?

> 2. The "fast programming" feature (unlock bypass) which is currently 
> always disabled (due to "code brokeness"). I don't believe this will 
> ever work with erase-suspends.  Should the "fast programming" stuff be 
> removed?

Yes, drop it until/unless someone wants to make it work.

-- 
dwmw2
