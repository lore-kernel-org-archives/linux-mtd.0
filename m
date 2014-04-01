Received: from mail-out.m-online.net ([212.18.0.10])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WUz4S-0001xL-Lj
 for linux-mtd@lists.infradead.org; Tue, 01 Apr 2014 13:49:45 +0000
Date: Tue, 1 Apr 2014 15:49:18 +0200
From: Gerhard Sittig <gsi@denx.de>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [RFC] mtd: nand: Preparatory patch for adding on-die ECC
 controller support. This patch adds NAND_ECC_HW_ON_DIE and all other changes
 to generic code.
Message-ID: <20140401134908.GP2775@book.gsilab.sittig.org>
References: <1395975504-11301-1-git-send-email-davidm@egauge.net>
 <20980858CB6D3A4BAE95CA194937D5E73EAB9437@DBDE04.ent.ti.com>
 <CALnQHM0YEfXFoRggA+dfRzJifA3khw8C02K7LHe-LnVvO1XxXw@mail.gmail.com>
 <20140401091237.GI6400@brian-ubuntu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20140401091237.GI6400@brian-ubuntu>
Cc: David Mosberger <davidm@egauge.net>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Gupta,
 Pekon" <pekon@ti.com>, "dedekind1@gmail.com" <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2014-04-01 at 02:12 -0700, Brian Norris wrote:
> 
> BTW, do these flash power on in any particular default mode? Can you
> order versions that have on-die ECC enabeld/disabled by default? Is that
> perhaps what the READ_ID "Internal ECC" flag actually means
> (disabled/enabled by default)?

According to the datasheet the chips come out of RESET with
on-die-ECC disabled.  The setup that I have seen does enable the
in-chip feature within an early loader.  Subsequently running
bootloaders and OSes (here: U-Boot and Linux) find the chip with
on-die-ECC enabled.

I understand that READ_ID will tell you whether on-die-ECC is
supported by the chip.  The GETFEATURE request tells you whether
it's enabled.  And SETFEATURE allows you to control whether it's
enabled or disabled.


virtually yours
Gerhard Sittig
-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr. 5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-0 Fax: +49-8142-66989-80  Email: office@denx.de
