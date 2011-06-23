Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QZmtR-0007A8-6V
	for linux-mtd@lists.infradead.org; Thu, 23 Jun 2011 16:36:39 +0000
Received: by wyf23 with SMTP id 23so1760957wyf.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 23 Jun 2011 09:36:32 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1303460103.2757.48.camel@localhost>
References: <4DB033E4.6030105@parrot.com> <4DB06693.5000100@parrot.com>
	<1303460103.2757.48.camel@localhost>
Date: Thu, 23 Jun 2011 09:36:32 -0700
Message-ID: <BANLkTimwOp4uPfQ0udLDycor2MjotUxiHw@mail.gmail.com>
Subject: Re: bbt and bitflip
From: Brian Norris <computersforpeace@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Matthieu CASTET <matthieu.castet@parrot.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

On Fri, Apr 22, 2011 at 1:15 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> On Thu, 2011-04-21 at 19:17 +0200, Matthieu CASTET wrote:
>> Here a quick and dirty patch to make them more robust.
>> Any comment are welcomed.
>
> Would be great if you could test it and submit a nice patch with proper
> commit message and Signed-off-by.

I am interested in Artem's comments on the robustness of flash-based
BBT (here, and more recently on
http://lists.infradead.org/pipermail/linux-mtd/2011-June/036557.html).
I recently have moved to using flash-based BBT (in-band, actually),
and it seemed like several NAND drivers use flash-based BBT as well.
Is it really that un-trustworthy?

So I guess I'm looking for areas of improvement. I see a few suggestions here:

"Also the pattern and version in oob isn't protected by ecc. They can
be corrupted."

I noticed this one recently. My hardware ECC actually *can* do ECC for
what little OOB is actually free, but I realized that the nand_base
code doesn't even try to check the ECC stats (in nand_do_read_oob())
whereas some similar code for nand_do_read_ops *does* check the ECC
stats. Is it fair to adapt the code from nand_do_read_ops to
nand_do_read_oob so that both check for ECC errors, just in case the
hardware supports it? Would this cause any API problems, if users
didn't expect OOB reads to return ECC error statuses? For now, this
would only have any effect if a driver replaces the chip->ecc.read_oob
function with something that performs ECC operations independently and
increments the ECC counters.

And speaking of BBT in OOB:
Anyone know why the flash-based ident pattern and version is
"traditionally" stored in OOB? It was quite recently that Sebastian
Andrzej Siewior added the NAND_USE_FLASH_BBT_NO_OOB flag (which is
slated to be renamed/replaced, FYI). It seems like ...NO_OOB is a
generally good (or at least better) idea. Then we wouldn't even have
to worry much about ECC in OOB.

"read_bbt which ignore ecc bit flip/error"

If I understand right, read_bbt just prints warning message on ECC
flips/errors and otherwise ignores them? Would Matthieu's "quick and
dirty" patch be an OK start for fixing this? (where in the absence of
a valid backup tableb, an ECC error causes a flash rescan and an ECC
bitflip causes an erase/rewrite "scrub"?)

"The bbt should be protected with CRC and if it gets corrupted we
should re-scan the flash and re-create it."

Wouldn't CRC just be a lesser replacement for proper ECC protection?
Or am I missing something?

Brian
