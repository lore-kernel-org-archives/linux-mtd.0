Received: from mail-qg0-f47.google.com ([209.85.192.47])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WTYtX-00020m-T3
 for linux-mtd@lists.infradead.org; Fri, 28 Mar 2014 15:40:37 +0000
Received: by mail-qg0-f47.google.com with SMTP id 63so4518601qgz.20
 for <linux-mtd@lists.infradead.org>; Fri, 28 Mar 2014 08:40:14 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20140328125600.GC3998@book.gsilab.sittig.org>
References: <1395875121-9320-1-git-send-email-davidm@egauge.net>
 <20980858CB6D3A4BAE95CA194937D5E73EAB5F84@DBDE04.ent.ti.com>
 <20140327112722.GQ3998@book.gsilab.sittig.org>
 <CALnQHM0PkQUQk0uYGBL3TwgWaComHfZNBxu1e45_FJK2i+TrbA@mail.gmail.com>
 <20140328125600.GC3998@book.gsilab.sittig.org>
Date: Fri, 28 Mar 2014 09:40:14 -0600
Message-ID: <CALnQHM0Pq=s1fwDeOHVRz95=JQx9h4sKg2aprAHE-5pqZmkihw@mail.gmail.com>
Subject: Re: [PATCH] mtd: nand: Add support for Micron on-die ECC controller
 (rev2).
From: David Mosberger <davidm@egauge.net>
To: Gerhard Sittig <gsi@denx.de>
Content-Type: text/plain; charset=ISO-8859-1
Cc: "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
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

Gerhard,

On Fri, Mar 28, 2014 at 6:56 AM, Gerhard Sittig <gsi@denx.de> wrote:

> Upon read, the chip does ECC detection and correction in
> transparent ways.  So you probably just fetch the status and the
> page's content (the writesize count), omitting the OOB area.
> What would you get when you keep reading after the page size?
> Probably the OOB area.  Is it required to read this as well, to
> have it around in the write case?

Yeah, I see where the confusion comes from: ECC is not calculated
when transferring data between the chip and the host.  Instead, ECC is
calculated
when moving a page between the flash array and the chip-internal buffer.

You can transfer data between the host and the chip-internal buffer
in any way you want as it doesn't involve the ECC engine at all.

Instead, it's the READ/PAGEPROG commands that take care of checking/updating
the ECC bytes.

In the datasheet, you can see that from the fact that the chip's RDY
line will stay low
longer with internal ECC enabled: for READ, its t_R_ECC (45-70us) instead of
t_R (25us), for PROGRAM PAGE it's t_PROG_ECC (220-600us) instead of
t_PROG (200-600us).

  --david
-- 
eGauge Systems LLC, http://egauge.net/, 1.877-EGAUGE1, fax 720.545.9768
