Received: from gw1.transmode.se ([213.115.205.20])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Pkj4G-0001wi-QX
	for linux-mtd@lists.infradead.org; Wed, 02 Feb 2011 20:12:46 +0000
In-Reply-To: <25631ED7-C6A0-44B1-B33D-F48DC48C812E@prograde.net>
References: <16826B66-31FE-41AD-A6EF-E668A45AF1FE@prograde.net>	<OF6FB39892.8BB946B6-ONC1257823.006654EE-C1257823.006801B7@transmode.se>
	<F4EC0B87-B4D8-4577-A36B-64E1723634BC@prograde.net>
	<OF669CD6B0.87299771-ONC1257823.007EE3A7-C1257823.007F2FD2@transmode.se>
	<25631ED7-C6A0-44B1-B33D-F48DC48C812E@prograde.net>
Subject: Re: Numonyx NOR and chip->mutex bug?
To: Michael Cashwell <mboards@prograde.net>
Message-ID: <OF695F4526.1DB1C212-ONC125782B.00602EFA-C125782B.006F0621@transmode.se>
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Date: Wed, 2 Feb 2011 21:12:40 +0100
MIME-Version: 1.0
Content-type: text/plain; charset=UTF-8
Cc: linux-mtd@lists.infradead.org, Holger brunck <holger.brunck@keymile.com>,
	Stefan Bigler <stefan.bigler@keymile.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



Michael Cashwell <mboards@prograde.net> wrote on 2011/02/02 17:20:46:

> From: Michael Cashwell <mboards@prograde.net>
> To: linux-mtd@lists.infradead.org
> Cc: Joakim Tjernlund <joakim.tjernlund@transmode.se>, Holger brunck <holger.brunck@keymile.com>, Stefan Bigler <stefan.bigler@keymile.com>
> Date: 2011/02/02 17:20
> Subject: Re: Numonyx NOR and chip->mutex bug?
>
> On Jan 25, 2011, at 6:09 PM, Joakim Tjernlund wrote:
>
> > On Jan 25, 2011, at 1:14 PM, Michael Cashwell wrote:
> >
> >> With this new part I'm seeing MTD errors that I think I've traced to cfi_cmdset_0001.c that I'd like to ask about.
> >>
> >> The error manifests when I write hard to a UBIFS file system on this NOR flash. What I see is a "NOR Flash: buffer write error" and then either "(block locked)" or "(Bad VPP)"
> >
> > Just check that you didn't get some old samples. We did.
>
> All I know is that the chips are marked with an '08 copyright. (The previous ones are '03.) So we are dealing with old(er) parts in any event. But from what I can tell, this particular part is the current one Numonyx/Micron are selling.

Don't think this marking has any meaning, In 03 I don't think these chips were available yet. You will have
to check the shipping slip, hopefully the factory that mounted these chips still has it.

>
> >> The fact that the errors stop if I comment out the chip->mutex calls while waiting [for command completion] suggests to me that there's a reentrancy problem. It doesn't mean the locks are wrong or that doing that is a real fix.
> >
> > Oh, I misread earlier. I figured you held the lock for all ops.
>
> In the end I found a failure in the following scenario. A block erase is underway and a request is made to access the chip in order to write data elsewhere. The erase is suspended and the buffered write is performed. When the chip is released after the write operation the code notices the
suspended erase and resumes it. But there seems to be a timing issue where the WSM ready bit SR.7 was checked "too soon" following issuing the resume command and it made the code think the erase was complete when it was not.
>
> The normal code paths that *start* erase or program operations have an inherent delay of several µs between writing the command and the first read of the WSM status. This delay is a side effect of a kernel cache invalidate call. But the key issue is that when resuming an erase no such cache
invalidation is done as it was already done when the erase originally began.
>
> That difference means there's very little time between the resume command write and the status read. The apparent result is that the WSM is reported "not busy" when in fact the resumption is still being acted upon. The code misinterprets this to mean the resumed erase is complete when it is not
and subsequent commands then go fully off the rails as a result.

Please post patches inline, much easier to comment on them.
Here is the relevant part I am interested in:

+++ linux-2.6.35.7-arm-gum-mod/drivers/mtd/chips/cfi_cmdset_0001.c  2011-01-27 16:11:27.000000000 -0500
@@ -1004,7 +1004,19 @@ static void put_chip(struct map_info *ma
      sending the 0x70 (Read Status) command to an erasing
      chip and expecting it to be ignored, that's what we
      do. */
+    /* numonyx data sheet clearly says to always reset the status bits
+     before resuming a suspended erase. not doing so results in
+     an ambiguous mixture of status bits once the command ends. */
+    map_write(map, CMD(0x50), adr);
hmm, I found this:
8.5
Program Resume
The Resume command instructs the device to continue programming, and
automatically clears Status Register bits SR[7,2]. This command can be written to any
address. If error bits are set, the Status Register should be cleared before issuing the
next instruction. RST# must remain deasserted (see Figure 32, “Buffer Program
Flowchart” on page 74).

Which I think disagrees with your statement. How did you arrive to this conclusion?

     map_write(map, CMD(0xd0), adr);
+    /* some numonyx P30 parts have an apparent delay after starting or
+     resuming some commands. this is normally covered by the cache
+     invalidation done between the command and the start of reading
+     for the busy status bit to clear. but no such cache invalidation
+     is done when resuming and this allows the status-reading thread
+     awakened below to read the status too soon and think its operation
+     has finished when it fact its resumption is still underway. */
+    udelay(20);

I don't follow your reasoning here. This Read Status command isn't
saved anywhere so how can the code get confused later on?
Perhaps the chip gets confused by this command?
Have you tried to remove the Read Status command?
What if you move the udelay after the Read Status?

     map_write(map, CMD(0x70), adr);
     chip->oldstate = FL_READY;
     chip->state = FL_ERASING;

>
> I cannot find a corresponding timing constraint in the data sheet. By rights, the bus cycle time alone should be enough between the write and read. But in practice, for these parts, it is not. This may be an undocumented erratum for current parts or just an anomaly for this batch. I have no way to
tell.
>
> I found the addition of a 20µs delay immediately after the erase resume command avoids the failure. I also tested 10µs and found it to be insufficient. I did not bisect the time further. I have also not explored any similar issue for resumed write operations because it appears that only kernels
doing XIP on MTD parts ever do that. I frankly expect the problem would occur then too but I'm not setup to do XIP and don't want to propose changes I cannot test.
>
> I've included the patch that I am using. It also addresses a few other warts and errata I found while debugging this. If these changes are found to have merit after review I'd be happy for them to be included in mainline. Let me know if I can assist in any way.
>
> Stephan, I hope this helps. Since yours is the only report at all similar to mine I'd be very interested in hearing about your progress.
>
> Best regards,
> -Mike Cashwell
>
> [attachment "linux-2.6.35.7-001-numonyx-errata.patch" deleted by Joakim Tjernlund/Transmode]
