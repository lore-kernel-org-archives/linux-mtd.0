Received: from mail-yk0-x233.google.com ([2607:f8b0:4002:c07::233])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WVMlu-0006kJ-C8
 for linux-mtd@lists.infradead.org; Wed, 02 Apr 2014 15:08:11 +0000
Received: by mail-yk0-f179.google.com with SMTP id 9so303675ykp.24
 for <linux-mtd@lists.infradead.org>; Wed, 02 Apr 2014 08:07:48 -0700 (PDT)
MIME-Version: 1.0
Sender: dmosberger@gmail.com
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73EAC059F@DBDE04.ent.ti.com>
References: <1396308537-16013-1-git-send-email-davidm@egauge.net>
 <1396308537-16013-2-git-send-email-davidm@egauge.net>
 <20140401063958.GA6400@brian-ubuntu>
 <CALnQHM1Z048h0BvbhAwussYH27mdV9kO6Q=74Wqa1CHpsbi4+w@mail.gmail.com>
 <20980858CB6D3A4BAE95CA194937D5E73EAC059F@DBDE04.ent.ti.com>
Date: Wed, 2 Apr 2014 09:07:48 -0600
Message-ID: <CACwUX0O2NZYU+FysS46Rtvpm2C5G06yee1C1rSM2CEm0XEo-_A@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] mtd: nand: Detect Micron flash with on-die ECC
 (aka "internal ECC") enabled.
From: David Mosberger-Tang <davidm@egauge.net>
To: "Gupta, Pekon" <pekon@ti.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: David Mosberger <davidm@egauge.net>, Gerhard Sittig <gsi@denx.de>,
 Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Pekon,

On Wed, Apr 2, 2014 at 1:27 AM, Gupta, Pekon <pekon@ti.com> wrote:

> You have to consider multiple scenarios here (as Brian also suggested).
>
> (1) If a system does _not_ boot from NAND, instead it enables NAND
> only in kernel (like for rootfs). Then you need a mechanism to
> enable/disable on-die ECC in the kernel, the same way boot-loader does.

Why?  Like I said before, on-die ECC does not get turned on "accidentally".
Furthermore, it is always *safe* to use on-die ECC,  unlike the ECC provided
by the platform-specific drivers.

> (2) If a boot-loader, has enabled on-die ECC, but kernel driver supports
> even higher ECC scheme, then you need a hook in driver to allow user
> to 'disable' this feature.

Does that really happen in practice?

I'm much more worried about someone using too weak an ECC than wanting
to use a stronger than required ECC.  In fact, that's what got us
into this mess: we ended up using SWECC on a chip that required multi-bit
ECC (yes, shame on us that we didn't catch that, but stuff happens; obviously
we were not the only ones caught off-guard by this change).

  --david
