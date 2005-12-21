Received: from 66.239.25.20.ptr.us.xo.net ([66.239.25.20] helo=zoot.lnxi.com)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1Ep9HB-00015l-2E
	for linux-mtd@lists.infradead.org; Wed, 21 Dec 2005 14:05:29 -0500
To: Dave Peterson <dsp@llnl.gov>
References: <200512201642.05224.dsp@llnl.gov>
	<m3vexjqlc2.fsf@maxwell.lnxi.com> <200512211037.17680.dsp@llnl.gov>
From: ebiederman@lnxi.com (Eric W. Biederman)
Date: Wed, 21 Dec 2005 12:05:20 -0700
In-Reply-To: <200512211037.17680.dsp@llnl.gov> (Dave Peterson's message of
	"Wed, 21 Dec 2005 10:37:17 -0800")
Message-ID: <m38xueqnin.fsf@maxwell.lnxi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-mtd@lists.infradead.org
Subject: Re: ichxrom driver question
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dave Peterson <dsp@llnl.gov> writes:

> On Tuesday 20 December 2005 17:40, Eric W. Biederman wrote:
>> Hmm. Immediately after the erase operation you should see all f's.
>
> I tried it a few times.  My recollection is that after the first
> attempt at erasing, the first part of the flash memory contained
> all f's and the rest contained data that appeared to be the old BIOS.
> On a subsequent attempt, I saw all zeros, and this is what I still
> see when I try to flash the BIOS again.
>
>> The only thing I can think of that might trigger what you are seeing
>> is a cached flash chip.
>
> What does "cached flash chip" mean?  I have very little familiarity
> with how these flash chips operate.

The flash chips contents being cached in the cpus cache.
cat /proc/mtrr and see if covers the 0xfff80000 - 0xffffffff
range where your flash chip lives.

>> The ICH3-S is more of a conduit.  The usual questions are:
>>
>> Is there motherboard specific magic that denies writes?
>> What is the actual flash chip you are flashing.
>
> How do I determine whether there is motherboard-specific magic?

Usually I see if I can read out the id on the flash chip.  That
tests to see if writes make it to the device because you have
to write a command.

> The motherboard is a Supermicro P4DPR-iGM and the flash chip is an
> Intel 82802AB.

Ok.  That is one of the configurations I have tested although I
haven't gone back and regression tested on one of those boards
in a while.

>> Except for the possibility of bad cache I can't think of anything
>> that would cause the wrong data to be written.  Are you certain
>> you have a good flash image?
>
> The flash image I tried to install was an exact duplicate of the
> currently installed flash image, obtained as follows:
>
>     # dd if=/dev/mtd0 of=bios_image
>
> I was just testing the BIOS flashing mechanism to see if it worked.

Ok.  That sounds sane.  Are you running linuxbios right now or something
else?

Eric
