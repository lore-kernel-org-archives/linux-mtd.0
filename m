Received: from mail-out.m-online.net ([212.18.0.9])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WVbpB-00015h-1p
 for linux-mtd@lists.infradead.org; Thu, 03 Apr 2014 07:12:35 +0000
Date: Thu, 3 Apr 2014 09:10:58 +0200
From: Gerhard Sittig <gsi@denx.de>
To: David Mosberger <davidm@egauge.net>
Subject: Re: [PATCH v4 1/5] mtd: nand: Detect Micron flash with on-die ECC
 (aka "internal ECC") enabled.
Message-ID: <20140403071058.GF11339@book.gsilab.sittig.org>
References: <1396308537-16013-1-git-send-email-davidm@egauge.net>
 <1396308537-16013-2-git-send-email-davidm@egauge.net>
 <20140401063958.GA6400@brian-ubuntu>
 <CALnQHM1Z048h0BvbhAwussYH27mdV9kO6Q=74Wqa1CHpsbi4+w@mail.gmail.com>
 <20980858CB6D3A4BAE95CA194937D5E73EAC059F@DBDE04.ent.ti.com>
 <CACwUX0O2NZYU+FysS46Rtvpm2C5G06yee1C1rSM2CEm0XEo-_A@mail.gmail.com>
 <20140402164933.GC11339@book.gsilab.sittig.org>
 <CALnQHM3B=-159u1BesCbEN=XQuosG0mkGb-emQUJJFETR7gd=g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALnQHM3B=-159u1BesCbEN=XQuosG0mkGb-emQUJJFETR7gd=g@mail.gmail.com>
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

On Wed, 2014-04-02 at 11:02 -0600, David Mosberger wrote:
> 
> AFAIK, ECC selection is *per chip* (not per filesystem)
> and is hard-coded by a combination of config-options
> and platform-specific drivers.  Isn't that true?

Let's look at the boot stages:

- ROM loader code reads bootloader code
- bootloader code reads bootloader configuration, and boot files
  (kernel image, device tree)
- OS kernels read and write the filesystem

So each of those phases run at different times and operate on
different areas of the chip.

- the bootloader need not write nor modify ROM loader data
- the OS kernel need not write nor modify bootloader data or boot
  files

Which means that you can perfectly operate those individual areas
with different ECC methods, depending on the capabilities of the
software that is running at this moment, and your preferences or
having access to different levels of hardware support, the will
or capability/incapability to sync among those components, or to
adjust and update these individual boot phases, etc.

I really don't see that enabling on-die-ECC in one stage requires
all other stages to follow.  It's one apparent approach, but need
not be the only one.  That's what previous messages tried to say.

Does this explanation help answer your question?


virtually yours
Gerhard Sittig
-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr. 5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-0 Fax: +49-8142-66989-80  Email: office@denx.de
