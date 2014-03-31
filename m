Received: from mail-out.m-online.net ([212.18.0.10])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WUi9S-0005W2-DP
 for linux-mtd@lists.infradead.org; Mon, 31 Mar 2014 19:45:47 +0000
Date: Mon, 31 Mar 2014 21:45:22 +0200
From: Gerhard Sittig <gsi@denx.de>
To: David Mosberger <davidm@egauge.net>
Subject: Re: [REV3] mtd: nand: Prepare for Micron on-die ECC controller
 support.
Message-ID: <20140331194522.GL2775@book.gsilab.sittig.org>
References: <1396025800-18444-1-git-send-email-davidm@egauge.net>
 <20140329131642.GA2775@book.gsilab.sittig.org>
 <CALnQHM2whsLcM_4q76Skgjj4oVjgAbofX7iAVBgqZkPOu5UWEQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALnQHM2whsLcM_4q76Skgjj4oVjgAbofX7iAVBgqZkPOu5UWEQ@mail.gmail.com>
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

On Mon, 2014-03-31 at 12:33 -0600, David Mosberger wrote:
> 
> On Sat, Mar 29, 2014 at 7:16 AM, Gerhard Sittig <gsi@denx.de> wrote:
> 
> > so the additional buffers only get allocated when upon
> > identification the on-die-ECC feature already is enabled?
> 
> Yes.
> 
> > not
> > when it's supported, and might get enabled at any later point in
> > time?
> 
> There is no way to switch ECC mode later on, is there?

Isn't there the ONFI SETFEATURE request?  And don't you use this
very request to disable and enable chip internal ECC support, to
get the raw (uncorrected) bits after bitflips were detected?  So
I understand that there is support to enable this mode at will,
and we already have (or will have) code to do so.

If we consider disabling on-die-ECC support when we find it
enabled and know it's not what the user wants to run, then the
next logical step might be to support enabling this feature if
the user wants it and the chip doesn't have it enabled at this
point in time.

So I guess the buffers should get allocated as soon as the chip
supports on-die-ECC.  (While the allocation should only get
introduced in the phase where the raw-read and bitflip count gets
added.)


virtually yours
Gerhard Sittig
-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr. 5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-0 Fax: +49-8142-66989-80  Email: office@denx.de
