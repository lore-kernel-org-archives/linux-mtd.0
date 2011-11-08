Received: from mail-bw0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RNtH6-0008Vz-TL
 for linux-mtd@lists.infradead.org; Tue, 08 Nov 2011 21:32:09 +0000
Received: by bkat2 with SMTP id t2so1179875bka.36
 for <linux-mtd@lists.infradead.org>; Tue, 08 Nov 2011 13:32:06 -0800 (PST)
Subject: Re: ubi on MLC nand flash
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Dunn <mikedunn@newsguy.com>
Date: Tue, 08 Nov 2011 23:32:03 +0200
In-Reply-To: <4EB6A6A8.7010703@newsguy.com>
References: <4EB6A6A8.7010703@newsguy.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1320787925.17770.31.camel@koala>
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2011-11-06 at 07:24 -0800, Mike Dunn wrote:
> Hi everyone,
> 
> I recently started to do serious testing of UBI on the diskonchip G4 MLC nand
> driver I'm finishing up.

Sounds promising - we've got another serious mtd community memeber! :-)

>   I started with the io_basic ubi test in mtd-utils.

Makes sense to exclude UBIFS and test UBI directly first indeed.

> What I find is that, after a few minutes, enough PEBs are marked as bad to
> exhaust the reserve PEB pool

I guess you can make it larger, the default 1% is just something which
was good enough for our super-robust OneNAND flash.

Also, for MLC you probably want a smaller WL threshold, I heard that
modern MLCs have ereaseblock liftimes smaller than 10000 erase-cycles.
So the default 4096 might be too big.

> , UBI switches to r/o mode, and the test fails.  The
> reason is that - on this device at least - bit flips seem to be persistent;
> i.e., you will get e.g. 1 bit flip every time you read a certain page. 
> Consequently, when the bit flip occurs and the PEB gets scrubbed, the torture
> test fails because the bit flip reoccurs, and the PEB is marked bad.

A quick hack you can do to go further in your investigations without
being block by this issue is to hack your driver and make it to just not
return -EUCLEAN in case of 1 bit flip or may be even 2. Then you can see
ahead what else happens to UBI.

WRT the real solution - I agree with Ivan - see his e-mail, and I'll
send some comments on that.

> I expected that eventually I might have to dig into the "program disturb",
> "read-disturb" or "paired pages" MLC issues, but the problem seems more
> fundamental.  My general impression is that UBI is too unforgiving for this
> device.  The ecc can correct up to 4 bit flips, so 1 bit flip seems to not be a
> big deal.  I'm new to UBI so this is not a critique or a proposal, I'm just
> hoping some experts can offer some advice or opinions.  The obvious remedy is to
> set a higher threshold for marking a PEB as bad, say 2 or 3 bit flips.

You are right - UBI is too unforgiving. But this should be fixable, it
just needs a brave knight to do the job :-)

Artem.
