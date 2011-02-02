Received: from mail.ch.keymile.com ([193.17.201.103])
	by canuck.infradead.org with smtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Pkgdz-00016a-BM
	for linux-mtd@lists.infradead.org; Wed, 02 Feb 2011 17:37:28 +0000
Message-ID: <4D499651.8070904@keymile.com>
Date: Wed, 02 Feb 2011 18:37:21 +0100
From: Stefan Bigler <stefan.bigler@keymile.com>
MIME-Version: 1.0
To: Michael Cashwell <mboards@prograde.net>
Subject: Re: Numonyx NOR and chip->mutex bug?
References: <16826B66-31FE-41AD-A6EF-E668A45AF1FE@prograde.net>	<OF6FB39892.8BB946B6-ONC1257823.006654EE-C1257823.006801B7@transmode.se>	
	<F4EC0B87-B4D8-4577-A36B-64E1723634BC@prograde.net>
	<OF669CD6B0.87299771-ONC1257823.007EE3A7-C1257823.007F2FD2@transmode.se>
	<25631ED7-C6A0-44B1-B33D-F48DC48C812E@prograde.net>
In-Reply-To: <25631ED7-C6A0-44B1-B33D-F48DC48C812E@prograde.net>
Content-Type: text/plain;
	charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: 8bit
Cc: Holger brunck <holger.brunck@keymile.com>, linux-mtd@lists.infradead.org,
	Joakim Tjernlund <joakim.tjernlund@transmode.se>
Reply-To: stefan.bigler@keymile.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Michael

Thank you for the patch. I applied it, but without success.
I still have the simular situation as before:

here my log

ubimkvol /dev/ubi0 -s 6MiB -N test1
[2299][209] do_erase_oneblock start adr=0x00020000 len=0x20000
[2299][209] map_write 0x50 to 0x00020000
[2299][209] map_write 0x20 to 0x00020000
[2299][209] map_write 0xd0 to 0x00020000
[2299][465] map_write 0xb0 to 0x03fe5000
[2307][465] erase suspend 1         adr=0x03fe5000
[2307][465] map_write 0x70 to 0x03fe5000
[2307][465] map_write 0xe8 to 0x03fe5000
[2307][209] map_write 0x70 to 0x00020000
[2307][209] map_write 0x50 to 0x00020000
[2307][209] map_write 0xd0 to 0x00020000
[2307][209] map_write 0x70 to 0x00020000
[2311][209] erase resumed 2b        adr=0x00020000
[2319][209] do_erase_oneblock end   adr=0x00020000 len=0x20000
[2319][465] map_write 0x1ff to 0x03fe5000
[2319][465] map_write 0xc03c0000 to 0x03fe5000
[2319][465] map_write 0xc03c0000 to 0x03fe5002
...
[2327][465] map_write 0xc03c0000 to 0x03fe53fc
[2327][465] map_write 0xc03c0000 to 0x03fe53fe
[2327][465] map_write 0xd0 to 0x03fe5000
[3387][465] map_write 0x50 to 0x03fe5000
[3387][465] map_write 0x70 to 0x03fe5000
[3395][465] 50000000.flash: buffer write error status 0xb0 
adr=0x03fe5400 len=0x0 (0x400)

I will have a look tomorrow.

Best regards
Stefan


Am 02/02/2011 05:20 PM, schrieb Michael Cashwell:
> On Jan 25, 2011, at 6:09 PM, Joakim Tjernlund wrote:
>
>> On Jan 25, 2011, at 1:14 PM, Michael Cashwell wrote:
>>
>>> With this new part I'm seeing MTD errors that I think I've traced to cfi_cmdset_0001.c that I'd like to ask about.
>>>
>>> The error manifests when I write hard to a UBIFS file system on this NOR flash. What I see is a "NOR Flash: buffer write error" and then either "(block locked)" or "(Bad VPP)"
>> Just check that you didn't get some old samples. We did.
> All I know is that the chips are marked with an '08 copyright. (The previous ones are '03.) So we are dealing with old(er) parts in any event. But from what I can tell, this particular part is the current one Numonyx/Micron are selling.
>
>>> The fact that the errors stop if I comment out the chip->mutex calls while waiting [for command completion] suggests to me that there's a reentrancy problem. It doesn't mean the locks are wrong or that doing that is a real fix.
>> Oh, I misread earlier. I figured you held the lock for all ops.
> In the end I found a failure in the following scenario. A block erase is underway and a request is made to access the chip in order to write data elsewhere. The erase is suspended and the buffered write is performed. When the chip is released after the write operation the code notices the suspended erase and resumes it. But there seems to be a timing issue where the WSM ready bit SR.7 was checked "too soon" following issuing the resume command and it made the code think the erase was complete when it was not.
>
> The normal code paths that *start* erase or program operations have an inherent delay of several µs between writing the command and the first read of the WSM status. This delay is a side effect of a kernel cache invalidate call. But the key issue is that when resuming an erase no such cache invalidation is done as it was already done when the erase originally began.
>
> That difference means there's very little time between the resume command write and the status read. The apparent result is that the WSM is reported "not busy" when in fact the resumption is still being acted upon. The code misinterprets this to mean the resumed erase is complete when it is not and subsequent commands then go fully off the rails as a result.
>
> I cannot find a corresponding timing constraint in the data sheet. By rights, the bus cycle time alone should be enough between the write and read. But in practice, for these parts, it is not. This may be an undocumented erratum for current parts or just an anomaly for this batch. I have no way to tell.
>
> I found the addition of a 20µs delay immediately after the erase resume command avoids the failure. I also tested 10µs and found it to be insufficient. I did not bisect the time further. I have also not explored any similar issue for resumed write operations because it appears that only kernels doing XIP on MTD parts ever do that. I frankly expect the problem would occur then too but I'm not setup to do XIP and don't want to propose changes I cannot test.
>
> I've included the patch that I am using. It also addresses a few other warts and errata I found while debugging this. If these changes are found to have merit after review I'd be happy for them to be included in mainline. Let me know if I can assist in any way.
>
> Stephan, I hope this helps. Since yours is the only report at all similar to mine I'd be very interested in hearing about your progress.
>
> Best regards,
> -Mike Cashwell
>
