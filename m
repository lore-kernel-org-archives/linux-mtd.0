Received: from mail-yh0-x229.google.com ([2607:f8b0:4002:c01::229])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WV3CG-0001Pg-3L
 for linux-mtd@lists.infradead.org; Tue, 01 Apr 2014 18:14:04 +0000
Received: by mail-yh0-f41.google.com with SMTP id v1so9426119yhn.14
 for <linux-mtd@lists.infradead.org>; Tue, 01 Apr 2014 11:13:42 -0700 (PDT)
MIME-Version: 1.0
Sender: dmosberger@gmail.com
In-Reply-To: <20140401180128.GJ29542@ld-irv-0074>
References: <1396308537-16013-1-git-send-email-davidm@egauge.net>
 <1396308537-16013-6-git-send-email-davidm@egauge.net>
 <20140401075020.GD6400@brian-ubuntu>
 <CALnQHM2Afp8LD6MtGQTT5jrcb9xJdYXRGD0TZ_s5GASZsbRZeg@mail.gmail.com>
 <20140401173305.GI29542@ld-irv-0074>
 <20140401180128.GJ29542@ld-irv-0074>
Date: Tue, 1 Apr 2014 12:13:42 -0600
Message-ID: <CACwUX0O2TqerbTwLb-73o54BwDUc5e=0uYBCWk3Sd3oaMUSFsg@mail.gmail.com>
Subject: Re: [PATCH v4 5/5] mtd: nand: Improve bitflip detection for on-die
 ECC scheme.
From: David Mosberger-Tang <davidm@egauge.net>
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: David Mosberger <davidm@egauge.net>, Gerhard Sittig <gsi@denx.de>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Pekon Gupta <pekon@ti.com>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Brian,

On Tue, Apr 1, 2014 at 12:01 PM, Brian Norris
<computersforpeace@gmail.com> wrote:

> The point is that we don't write code into the generic framework that
> assumes Micron is the only one to implement it, if possible. This type
> of replaceable feature is best left as a callback which can be set to
> NULL, I think. Or if you can find a better point at which the
> implementation specifics can be abstracted, that can work as well. But
> regardless, my high level comment must be addressed -- you wrote this
> code as if Micron is the only one to implement on-die ECC.
>
> FWIW, the Toshiba BENAND (Built-in ECC NAND) datasheet I saw doesn't
> advertise the ability to disable its ECC, but it does report per-sector
> bitflip information (nice!). Also, I think it hides the ECC syndrome
> bytes from the user, so most drivers could possibly ignore the built-in
> ECC entirely if desired.

I can only make the patch as good as I know how to.
If you need a perfect patch before doing *anything*, chances are
the situation won't improve at all.

I really don't understand when Linux kernel development stopped
accepting improvements just because they're not perfect.  Incremental
improvements are part and parcel of Linux development, at least that's
what I always thought.

The patch as it stands is safe and it improves on the status quo.
If that's not good enough, fine, I tried to do my part.

Really, there is no direct benefit for me to spend time getting this merged.
I'm doing it because I thought it's the right thing to do to contribute back
a little bit since my company by relying on Linux is really is standing on
the shoulders of giants.

I'm sorry if I have sent too many patch revisions in too short amount
of time.  I tried to incorporate feedback and avoid duplicate comments
by providing updated patches.  Also, I don't have much time available,
so the longer this process takes, the less likely I'll be able to finish it
(please don't take that as a threat, it's really just my reality).

  --david
