Received: from mail-oa0-f49.google.com ([209.85.219.49])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WVOZI-0002CI-3q
 for linux-mtd@lists.infradead.org; Wed, 02 Apr 2014 17:03:16 +0000
Received: by mail-oa0-f49.google.com with SMTP id o6so592851oag.36
 for <linux-mtd@lists.infradead.org>; Wed, 02 Apr 2014 10:02:51 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20140402164933.GC11339@book.gsilab.sittig.org>
References: <1396308537-16013-1-git-send-email-davidm@egauge.net>
 <1396308537-16013-2-git-send-email-davidm@egauge.net>
 <20140401063958.GA6400@brian-ubuntu>
 <CALnQHM1Z048h0BvbhAwussYH27mdV9kO6Q=74Wqa1CHpsbi4+w@mail.gmail.com>
 <20980858CB6D3A4BAE95CA194937D5E73EAC059F@DBDE04.ent.ti.com>
 <CACwUX0O2NZYU+FysS46Rtvpm2C5G06yee1C1rSM2CEm0XEo-_A@mail.gmail.com>
 <20140402164933.GC11339@book.gsilab.sittig.org>
Date: Wed, 2 Apr 2014 11:02:50 -0600
Message-ID: <CALnQHM3B=-159u1BesCbEN=XQuosG0mkGb-emQUJJFETR7gd=g@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] mtd: nand: Detect Micron flash with on-die ECC
 (aka "internal ECC") enabled.
From: David Mosberger <davidm@egauge.net>
To: Gerhard Sittig <gsi@denx.de>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Gupta,
 Pekon" <pekon@ti.com>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Gerhard,

On Wed, Apr 2, 2014 at 10:50 AM, Gerhard Sittig <gsi@denx.de> wrote:

> Just provide tools, don't encode policy.

Hey, I'm all for separating mechanism and policy.
It's just not what exists in the NAND driver now.
AFAIK, ECC selection is *per chip* (not per filesystem)
and is hard-coded by a combination of config-options
and platform-specific drivers.  Isn't that true?

> Please take a step back, take a deep breath, and try to see why
> people are asking questions.  It's not that you are being
> rejected or need to "defend" something.  It's the opposite that
> we are trying to create something that scratches more than one
> personal itch, and serves other people's needs as well as yours.

Yes, and I'm just trying to understand where you're coming from.

  --david
-- 
eGauge Systems LLC, http://egauge.net/, 1.877-EGAUGE1, fax 720.545.9768
