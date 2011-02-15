Received: from mail-gx0-f177.google.com ([209.85.161.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PpPAJ-0005ra-Ca
	for linux-mtd@lists.infradead.org; Tue, 15 Feb 2011 17:58:20 +0000
Received: by gxk21 with SMTP id 21so208151gxk.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 15 Feb 2011 09:58:17 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <Pine.LNX.4.64.1102151536400.2784@lnxricardw.se.axis.com>
References: <AANLkTikWMGSCzGdPUBgtZKY2F6=pZ=6X+p7LUUmuKhp+@mail.gmail.com>
	<Pine.LNX.4.64.1102151355160.2784@lnxricardw.se.axis.com>
	<AANLkTimS2Dqn9W+1zMsb=wgQAPKZaPZ+UePUmAGbQLCz@mail.gmail.com>
	<Pine.LNX.4.64.1102151536400.2784@lnxricardw.se.axis.com>
Date: Tue, 15 Feb 2011 17:58:17 +0000
Message-ID: <AANLkTi=zwmN2T7T=dePB0PJk_+Ahdvzjrn9t-rA7TtVa@mail.gmail.com>
Subject: Re: CONFIG_MTD_NAND_VERIFY_WRITE with Software ECC
From: David Peverley <pev@sketchymonkey.com>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Ricard,

I did some more Googling and found a couple more interesting articles
; I don't know if you've read them (I assume you probably have!) but
thought I'd repost for anyone else interested as this seems to be a
really fascinating and not often discussed topic! :
  http://www.broadbandreports.com/r0/download/1507743~59e7b9dda2c0e0a0f7ff119a7611c641/flash_mem_summit_jcooke_inconvenient_truths_nand.pdf

I found the following also really interesting, especially for the
analysis of lots of devices with a plot of numbers of initial bad
blocks marked which I'd always wondered about! :
  http://trs-new.jpl.nasa.gov/dspace/bitstream/2014/40761/1/08-07.pdf

> Either the file system, or some flash management layer such as UBI should
> take care of this, but I know that jffs2 doesn't at any rate. I'd agree it
> makes sense for the lower level to to the best of its capability guarantee
> that the data written actually does get written on the flash.
Well, we're using YAFFS2 - I haven't looked into how it deals with
these scenarios though... I'll see if I can figure out how it behaves.

> I think that the application note in some respects simplifies matters a bit.
> If you have a block that is wearing out, due to a large number of
> erase/write cycles, it will exhibit several failure modes at an increasing
> rate, in particular long-term data loss. At some point one could argue that
> the block is essentially worn out, and mark it as bad, even though an
> erase/write/verify cycle actually might be successful. I don't think that is
> what is happening in your case though.
That's all to do with what one considers a "Bad Block" - I'd agree
that the repeated failures can show that there might be an issue but
all the literature I've read today state that only permanent failures
are regarded as showing a bad block and these are reported via the
flashes status read. In fact I found a Micron Appnote AN1819

> I don't know if anyone else here on this list has any experiences to share.
> Frankly, if I saw errors of that type I would start looking for hardware
> problems, or some sort of hardware or software induced contention on the
> flash chip bus. Not that that would necessarily be the right approach, but
> I've seen errors of that type occurring as the result of out-of-spec level
> shifters between the MCU and flash chip, or incorrectly set up bus timing
> towards the flash.
We're looking into these possibilities as well - However as is often
the case, such problems provoke testing of less used code paths so
it's quite a good thing to look at the right thing to do in this event
in conjunction with fixing the root cause of the problem...

Thanks again!

~Pev
