Received: from mail-pb0-x22a.google.com ([2607:f8b0:400e:c01::22a])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WUuBx-0002qi-An
 for linux-mtd@lists.infradead.org; Tue, 01 Apr 2014 08:37:09 +0000
Received: by mail-pb0-f42.google.com with SMTP id rr13so9535259pbb.29
 for <linux-mtd@lists.infradead.org>; Tue, 01 Apr 2014 01:36:47 -0700 (PDT)
Date: Tue, 1 Apr 2014 01:36:44 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: David Mosberger <davidm@egauge.net>
Subject: Re: [PATCH] mtd: nand: Add support for Micron on-die ECC controller
 (rev2).
Message-ID: <20140401083644.GG6400@brian-ubuntu>
References: <1395875121-9320-1-git-send-email-davidm@egauge.net>
 <20980858CB6D3A4BAE95CA194937D5E73EAB5F84@DBDE04.ent.ti.com>
 <CALnQHM3Yn01qJdpHaqhA3Z+onVeaROTF0esv7S-ctY3y7dgNjw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALnQHM3Yn01qJdpHaqhA3Z+onVeaROTF0esv7S-ctY3y7dgNjw@mail.gmail.com>
Cc: Gerhard Sittig <gsi@denx.de>,
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

On Fri, Mar 28, 2014 at 09:52:37AM -0600, David Mosberger wrote:
> On Thu, Mar 27, 2014 at 12:56 AM, Gupta, Pekon <pekon@ti.com> wrote:
> 
> >>+      set_on_die_ecc(mtd, chip, 1);
> >>+
> >>+      chkoob = chkbuf + mtd->writesize;
> >>+      rawoob = rawbuf + mtd->writesize;
> >>+      eccpos = chip->ecc.layout->eccpos;
> >>+      for (i = 0; i < chip->ecc.steps; ++i) {
> >>+              /* Count bit flips in the actual data area: */
> >>+              flips = bitdiff(chkbuf, rawbuf, chip->ecc.size);
> >>+              /* Count bit flips in the ECC bytes: */
> >>+              for (j = 0; j < chip->ecc.bytes; ++j) {
> >
> > You should check bit-flips in complete OOB region (mtd->oobsize) not just ecc.bytes.
> 
> I was under the impression that OOB data bytes cannot be assumed to be
> ECC protected.
> As it happens, when using Internal ECC on those Micron chips, *some*
> of the OOB databytes
> are ECC protected, but I didn't think it was necessary to count those
> for bitflips, since OOB users
> won't assume ECC protection anyhow.  Am I wrong about that?

This is a touchy subject. Most of your comments are correct;
traditionally, ECC did not protect OOB, and some of the main users of it
(like JFFS2) assume that it isn't. This is patently false on some modern
systems, which do protect it.

But for this case, the max_bitflips count is used for determining when
the error rate is unacceptably high, not just to see whether your data
is currently corrupt. So if extra bitflips in this (otherwise
unimportant) spare area might eventually cause the ECC hardware to
report an error, then we need to count them.

Brian
