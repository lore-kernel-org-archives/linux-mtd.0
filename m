Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18HInG-0007Tl-00
	for <linux-mtd@lists.infradead.org>; Thu, 28 Nov 2002 07:09:02 +0000
Date: Thu, 28 Nov 2002 08:39:27 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Paul Nash <paulnash@wildseed.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Restart problems after writing to mtdblock?
Message-ID: <20021128073927.GA9207@wohnheim.fh-wedel.de>
References: <43CB1396676FD4119F03001083FD299401A1C6BC@neptune.kirkland.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <43CB1396676FD4119F03001083FD299401A1C6BC@neptune.kirkland.local>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

On Wed, 27 November 2002 18:33:31 -0800, Paul Nash wrote:
> 
> Partially answering my question, it looks like I was partly correct.  It
> appears that MTD is setup to lazily delay a reset to read array mode until
> an actual read request comes along.  In my case, this is fatal.
> 
> I'm wondering if a reasonable solution is to do something like install a
> reboot_notifier so I can guarantee the chip is back in Read Array mode.
> Where would be a good place to do such a thing, or if this is a bad idea,
> what is a better one?  Thanks...
> 
>> I'm quite certain that what's happening is the flash chip (intel 640J part,
>> 1x16 arrangement) is not being taken out of Read Array mode, so the
>> bootloader can't fetch instructions.  On our StrongARM board at the moment,
>> we don't have nRESET_OUT fed into the flash chip.  We're investingating
>> that, but I would like to knoew the root cause.

Frankly, if the hardware doesn't reset the flash chips on reboot, you
have broken hardware and have to deal with it.
A reboot_notifier would work, unless you have a power fail. Not good.

Hacking cfi_cmdset_0001.c to bring the chips back into read mode
whenever possible would work better, breaking only on power fail
during a write or erase operation. Still not good.

So, unless you want to live with the problem, there is no alternative
to fixing the hardware.

Jörn

-- 
You can't tell where a program is going to spend its time. Bottlenecks
occur in surprising places, so don't try to second guess and put in a
speed hack until you've proven that's where the bottleneck is.
-- Rob Pike
