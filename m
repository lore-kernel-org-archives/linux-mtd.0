Received: from mail-ob0-f181.google.com ([209.85.214.181])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WUjmV-00087y-Vr
 for linux-mtd@lists.infradead.org; Mon, 31 Mar 2014 21:30:12 +0000
Received: by mail-ob0-f181.google.com with SMTP id wp4so10009801obc.12
 for <linux-mtd@lists.infradead.org>; Mon, 31 Mar 2014 14:29:45 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20140331194522.GL2775@book.gsilab.sittig.org>
References: <1396025800-18444-1-git-send-email-davidm@egauge.net>
 <20140329131642.GA2775@book.gsilab.sittig.org>
 <CALnQHM2whsLcM_4q76Skgjj4oVjgAbofX7iAVBgqZkPOu5UWEQ@mail.gmail.com>
 <20140331194522.GL2775@book.gsilab.sittig.org>
Date: Mon, 31 Mar 2014 14:58:12 -0600
Message-ID: <CALnQHM29vnXxpFNEe1rtgc1-yuSSy8e6hSna-WJ+=YvzZJ1pAQ@mail.gmail.com>
Subject: Re: [REV3] mtd: nand: Prepare for Micron on-die ECC controller
 support.
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

On Mon, Mar 31, 2014 at 1:45 PM, Gerhard Sittig <gsi@denx.de> wrote:

> Isn't there the ONFI SETFEATURE request?  And don't you use this
> very request to disable and enable chip internal ECC support, to
> get the raw (uncorrected) bits after bitflips were detected?  So
> I understand that there is support to enable this mode at will,
> and we already have (or will have) code to do so.
>
> If we consider disabling on-die-ECC support when we find it
> enabled and know it's not what the user wants to run, then the
> next logical step might be to support enabling this feature if
> the user wants it and the chip doesn't have it enabled at this
> point in time.
>
> So I guess the buffers should get allocated as soon as the chip
> supports on-die-ECC.  (While the allocation should only get
> introduced in the phase where the raw-read and bitflip count gets
> added.)

The ECC-mode of the driver never changes.
Sure, what you describe could be implemented as an additional feature
in the future (I don't have any plans to do so since it makes little sense to
me, as no other ECC-mode uses the layout of the on-die-controller).

To be honest, I'm a bit confused: on the one hand, you're asking me to
simplify the patches into smaller pieces, on the other you seem to ask
for new features.

  --david
-- 
eGauge Systems LLC, http://egauge.net/, 1.877-EGAUGE1, fax 720.545.9768
