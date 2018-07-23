Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fhiym-0004JC-Ia
 for linux-mtd@lists.infradead.org; Mon, 23 Jul 2018 22:06:58 +0000
Received: by mail-wr1-x443.google.com with SMTP id e7-v6so2139411wrs.9
 for <linux-mtd@lists.infradead.org>; Mon, 23 Jul 2018 15:06:45 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180723221002.736e0830@bbrezillon>
References: <20171206025342.7266-1-Zhiqiang.Hou@nxp.com>
 <20171206025342.7266-3-Zhiqiang.Hou@nxp.com>
 <20180723181350.GA58212@ban.mtv.corp.google.com>
 <20180723221002.736e0830@bbrezillon>
From: Brian Norris <computersforpeace@gmail.com>
Date: Mon, 23 Jul 2018 15:06:43 -0700
Message-ID: <CAN8TOE904WXMScHo1b2jhusz-L8eGBK=gzUUX079ZVfiFk+HoQ@mail.gmail.com>
Subject: Re: [PATCHv3 2/2] mtd: m25p80: restore the status of SPI flash when
 exiting
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Zhiqiang Hou <Zhiqiang.Hou@nxp.com>, linux-mtd@lists.infradead.org,
 Linux Kernel <linux-kernel@vger.kernel.org>,
 David Woodhouse <dwmw2@infradead.org>,
 Boris BREZILLON <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris,

On Mon, Jul 23, 2018 at 1:10 PM, Boris Brezillon
<boris.brezillon@bootlin.com> wrote:
> On Mon, 23 Jul 2018 11:13:50 -0700
> Brian Norris <computersforpeace@gmail.com> wrote:
>> I noticed this got merged, but I wanted to put my 2 cents in here:
>
> I wish you had replied to this thread when it was posted (more than
> 6 months ago). Reverting the patch now implies making some people
> unhappy because they'll have to resort to their old out-of-tree
> hacks :-(.

I'd say I'm sorry for not following things closely these days, but I'm
not really that sorry. There are plenty of other capable hands. And if
y'all shoot yourselves in the foot, so be it. This patch isn't going
to blow things up, but now that I did finally notice it (because it
happened to show up in a list of backports I was looking at), I
thought better late than never to remind you.

For way of notification: Marek already noticed that we've started down
a slippery slope months ago:

https://lkml.org/lkml/2018/4/8/141
Re: [PATCH] mtd: spi-nor: clear Extended Address Reg on switch to
3-byte addressing.

I'm not quite sure why that wasn't taken to its logical conclusion --
that the hack should be reverted.

This problem has been noted many times already, and we've always
stayed on the side of *avoiding* this hack. A few references from a
search of my email:

http://lists.infradead.org/pipermail/linux-mtd/2013-March/046343.html
[PATCH 1/3] mtd: m25p80: utilize dedicated 4-byte addressing commands

http://lists.infradead.org/pipermail/barebox/2014-September/020682.html
[RFC] MTD m25p80 3-byte addressing and boot problem

http://lists.infradead.org/pipermail/linux-mtd/2015-February/057683.html
[PATCH 2/2] m25p80: if supported put chip to deep power down if not used

>> On Wed, Dec 06, 2017 at 10:53:42AM +0800, Zhiqiang Hou wrote:
>> > From: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
>> >
>> > Restore the status to be compatible with legacy devices.
>> > Take Freescale eSPI boot for example, it copies (in 3 Byte
>> > addressing mode) the RCW and bootloader images from SPI flash
>> > without firing a reset signal previously, so the reboot command
>> > will fail without reseting the addressing mode of SPI flash.
>> > This patch implement .shutdown function to restore the status
>> > in reboot process, and add the same operation to the .remove
>> > function.
>>
>> We have previously rejected this patch multiple times, because the above
>> comment demonstrates a broken product.
>
> If we were to only support working HW parts, I fear Linux would not
> support a lot of HW (that's even more true when it comes to flashes :P).

You stopped allowing UBI to attach to MLC NAND recently, no? That
sounds like almost the same boat -- you've probably killed quite a few
shitty products, if they were to use mainline directly.

Anyway, that's derailing the issue. Supporting broken hardware isn't
something you try to do by applying the same hack to all systems. You
normally try to apply your hack as narrowly as possible. You seem to
imply that below. So maybe that's a solution to move forward with. But
I'd personally be just as happy to see the patch reverted.

>> You cannot guarantee that all
>> reboots will invoke the .shutdown() method -- what about crashes? What
>> about watchdog resets? IIUC, those will hit the same broken behavior,
>> and have unexepcted behavior in your bootloader.
>
> Yes, there are corner cases that are not addressed with this approach,

Is a system crash really a corner case? :D

> but it still seems to improve things. Of course, that means the
> user should try to re-route all HW reset sources to SW ones (RESET input
> pin muxed to the GPIO controller, watchdog generating an interrupt
> instead of directly asserting the RESET output pin), which is not always
> possible, but even when it's not, isn't it better to have a setup that
> works fine 99% of the time instead of 50% of the time?

Perhaps, but not at the expense of future development. And
realistically, no one is doing that if they have this hack. Most
people won't even know that this hack is protecting them at all (so
again, they won't try to mitigate the problem any further).

>> I suppose one could argue for doing this in remove(), but AIUI you're
>> just papering over system bugs by introducing the shutdown() function
>> here. Thus, I'd prefer we drop the shutdown() method to avoid misleading
>> other users of this driver.
>
> I understand your point. But if the problem is about making sure people
> designing new boards get that right, why not complaining at probe time
> when things are wrong?
>
> I mean, spi_nor_restore() seems to only do something on very specific
> NORs (those on which a SW RESET does not resets the addressing
> mode).

The point isn't that SW RESET doesn't reset the addressing mode -- it
does on any flash I've seen. The point is that most systems are built
around a stateless assumption in these flash. IIRC, there wasn't even
a SW RESET command at all until these "huge" flash came around and
stateful addressing modes came about. So boot ROMs and bootloaders
would have to be updated to start figuring out when/how to do this SW
RESET. And once two vendors start doing it differently (I'm not sure:
have they done this already? I think so) it's no longer something a
boot ROM will get right.

The only way to get this stuff right is to have a hardware reset, or
else to avoid all of the stateful modes in software.

> So, how about adding a flag that says "my board has the NOR HW
> RESET pin wired" (there would be a DT props to set that flag). Then you
> add a WARN_ON() when this flag is not set and a NOR chip impacted by
> this bug is detected.

I'd kinda prefer the reverse. There really isn't a need to document
anything for a working system (software usually can't control this
RESET pin). The burden should be on the b0rked system to document
where it needs unsound hacks to survive.

> This way you make sure people are informed that
> they're doing something wrong, and for those who can't change their HW
> (because it's already widely deployed), you have a fix that improve
> things.

Or even better: put this hack behind a DT flag, so that one has to
admit that their board design is broken before it will even do
anything. Proposal: "linux,badly-designed-flash-reset".

But, I'd prefer just (partially?) reverting this, and let the authors
submit something that works. We're not obligated to keep bad hacks in
the kernel.

Brian
