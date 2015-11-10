Received: from mail-pa0-x22b.google.com ([2607:f8b0:400e:c03::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZvwiE-0003Hy-Tz
 for linux-mtd@lists.infradead.org; Tue, 10 Nov 2015 00:23:04 +0000
Received: by pacdm15 with SMTP id dm15so190857512pac.3
 for <linux-mtd@lists.infradead.org>; Mon, 09 Nov 2015 16:22:42 -0800 (PST)
Date: Mon, 9 Nov 2015 16:22:39 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Scott Branden <sbranden@broadcom.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 "Andrew E. Mileski" <andrewm@isoar.ca>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Richard Weinberger <richard@nod.at>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: Hang on reboot in nand_get_device()
Message-ID: <20151110002239.GK12143@google.com>
References: <55958F4C.1020002@isoar.ca> <20151106180052.GE12143@google.com>
 <20151106195903.0d55d819@bbrezillon>
 <20151109194651.GI12143@google.com>
 <20151109215508.7b14f5f3@bbrezillon>
 <20151109223613.1e83b256@bbrezillon>
 <20151109214456.GJ12143@google.com> <56411579.6040507@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <56411579.6040507@broadcom.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Scott,

On Mon, Nov 09, 2015 at 01:51:53PM -0800, Scott Branden wrote:
> I'm confused as to what the outcome is here and what the final patch
> is.  Will this affect the previous fixes we made such that shutdown
> is called on reboot so that MTD operations to the controller are not
> in progress on reboot?

There is no "final outcome" yet, but the plan is below:

> On 15-11-09 01:44 PM, Brian Norris wrote:
> >On Mon, Nov 09, 2015 at 10:36:13PM +0100, Boris Brezillon wrote:
> >>Just want to add that this discussion shouldn't prevent your fix from
> >>being applied.
[...]
> >I'll send this as a proper patch, if that sounds OK:
> >
> >http://patchwork.ozlabs.org/patch/541065/

^^ I plan to resend that patch as an independent thread, and give people
a chance to test/ack/nak anything there. I'll CC you, so you can ensure
it doesn't break anything you did previously. (I don't see how it
would.)

> >>On Mon, 9 Nov 2015 21:55:08 +0100
> >>Boris Brezillon <boris.brezillon@free-electrons.com> wrote:
> >>
> >>It's even worst: I'm not waiting for the chip to become ready, so I'm
> >>potentially re-introducing the bug Scott was trying to solve with his
> >>reboot notifier.
> >
> >Ah, I see! Good catch. My distaste for duplication pays off, then :)

In case this hunk was confusing: Boris was providing another reason to
reject one of his suggested alternative patches, and I was agreeing with
him.

Stay tuned.

Brian

P.S. Richard and I had some discussion on IRC, and I think there was a
rough agreement that the whole reboot handler dance really doesn't
belong (exclusively) in the MTD layer. Your patch was inspired by
problems with UBI, and (at least for non-initrd cases) we think UBI
should probably learn how to clean up after itself before we reboot. So
in the long term, there may be an attempt to fix up UBI and drop the MTD
reboot handlers. But that's probably not going to happen today.
