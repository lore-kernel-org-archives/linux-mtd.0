Received: from 66.239.25.20.ptr.us.xo.net ([66.239.25.20] helo=zoot.lnxi.com)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1EpiGi-0005MG-QG
	for linux-mtd@lists.infradead.org; Fri, 23 Dec 2005 03:27:22 -0500
To: Dave Peterson <dsp@llnl.gov>
References: <200512201642.05224.dsp@llnl.gov>
	<200512211037.17680.dsp@llnl.gov> <m38xueqnin.fsf@maxwell.lnxi.com>
	<200512211812.10597.dsp@llnl.gov>
From: ebiederman@lnxi.com (Eric W. Biederman)
Date: Fri, 23 Dec 2005 01:26:40 -0700
In-Reply-To: <200512211812.10597.dsp@llnl.gov> (Dave Peterson's message of
	"Wed, 21 Dec 2005 18:12:10 -0800")
Message-ID: <m3r784kym7.fsf@maxwell.lnxi.com>
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

> On Wednesday 21 December 2005 11:05, Eric W. Biederman wrote:
>> > What does "cached flash chip" mean?  I have very little familiarity
>> > with how these flash chips operate.
>>
>> The flash chips contents being cached in the cpus cache.
>> cat /proc/mtrr and see if covers the 0xfff80000 - 0xffffffff
>> range where your flash chip lives.
>
> The MTRR setup looks ok:
>
>     # cat /proc/mtrr
>     reg00: base=0x00000000 (   0MB), size=2048MB: write-back, count=1
>     #

Ok.  That plus the knowledge you are running under LinuxBIOS ensures
me it isn't the cache.

>> > How do I determine whether there is motherboard-specific magic?
>>
>> Usually I see if I can read out the id on the flash chip.  That
>> tests to see if writes make it to the device because you have
>> to write a command.
>
> How do I do this?

In dmesg it should print out what chip it finds.   If you can write
to the chip you are clearly past that point. 

>> > The flash image I tried to install was an exact duplicate of the
>> > currently installed flash image, obtained as follows:
>> >
>> >     # dd if=/dev/mtd0 of=bios_image
>> >
>> > I was just testing the BIOS flashing mechanism to see if it worked.
>>
>> Ok.  That sounds sane.  Are you running linuxbios right now or something
>> else?
>
> Yes, I'm using linuxbios.

The only thing I can possibly think of is that you didn't erase the
chip after a dd to it from /dev/zero or something like that.  As only
resets can set bits to 1 that could trigger it.  Although the
error checking should catch that case.  The cfi_command_set_1
isn't quite as paranoid as the AMD command set because it hasn't seen
anywhere near as many problems.

I don't want to blame the code but I don't have a clue what is
in 2.6.9, and I don't want to debug old code.  As we are quickly
running out of candidates I recommend testing the latest code.

I guess there is one additional possibility.  You could be seeing
aliases of the same chip.  It is pretty unlikely but possible and
if somehow the data was a different written to different parts
of the aperture that could cause problems.

The only other thing I can think of is to recommend using lbflash
as it automates this step and does a lot of checks along the way.
Directly using the mtd device is ok but is much more error prone.

Eric
