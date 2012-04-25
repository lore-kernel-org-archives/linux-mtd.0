Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SMwbE-0000e3-23
 for linux-mtd@lists.infradead.org; Wed, 25 Apr 2012 07:25:16 +0000
Received: by lagy4 with SMTP id y4so1354453lag.36
 for <linux-mtd@lists.infradead.org>; Wed, 25 Apr 2012 00:25:12 -0700 (PDT)
Date: Wed, 25 Apr 2012 10:25:00 +0300
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v2 1/2] mtd: nand: add 'use_oob' argument to NAND
 {read,write}_page interfaces
Message-ID: <20120425102500.48fa791a@pixies.home.jungo.com>
In-Reply-To: <CAN8TOE-QLYH27tfizj9TNPQun7dFB8ZGbuzxixxdrDgCs1K4yQ@mail.gmail.com>
References: <1335212069-7450-1-git-send-email-computersforpeace@gmail.com>
 <1335212069-7450-2-git-send-email-computersforpeace@gmail.com>
 <20120424152855.28df673d@pixies.home.jungo.com>
 <CAN8TOE-QLYH27tfizj9TNPQun7dFB8ZGbuzxixxdrDgCs1K4yQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Viresh Kumar <viresh.kumar@st.com>, Nicolas Ferre <nicolas.ferre@atmel.com>,
 Vipin Kumar <vipin.kumar@st.com>, linux-mtd@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Florian Fainelli <ffainelli@freebox.fr>, Lei Wen <leiwen@marvell.com>,
 Jamie Iles <jamie@jamieiles.com>, prabhakar@freescale.com,
 Mike Dunn <mikedunn@newsguy.com>,
 Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
 Kevin Cernekee <cernekee@gmail.com>, Bastian Hecht <hechtb@gmail.com>,
 Axel Lin <axel.lin@gmail.com>, Li Yang <leoli@freescale.com>,
 Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>,
 Armando Visconti <armando.visconti@st.com>,
 Thomas Gleixner <tglx@linutronix.de>, Scott Branden <sbranden@broadcom.com>,
 Artem Bityutskiy <dedekind1@gmail.com>, Wolfram Sang <w.sang@pengutronix.de>,
 Matthieu CASTET <matthieu.castet@parrot.com>,
 Huang Shijie <b32955@freescale.com>, Jiandong Zheng <jdzheng@broadcom.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,

On Tue, 24 Apr 2012 20:42:02 -0700 Brian Norris <computersforpeace@gmail.com> wrote:
> > (still not completely happy with my suggestion, as the boolean
> > approach is not that elegant as you previously noted...)
> 
> I agree, but it seems like the primary alternative (using a 'uint8_t
> *oob' parameter) necessitates many hacks such that 'oob' is mostly
> reduced to a boolean. So I think I'll try to make the best of a
> boolean, since we need *some* solution.

Agreed, it is the primary (and reasonable) alternative.
(I was only hoping for an even better suggestion, but none so far)

> > IMO having a parameter called 'use_oob', but not using the parameter
> > value is very confusing.
> >
> > Maybe we need an indication that states "hey, you may skip filling the
> > oob_poi if you don't want to, that's okay (but if you'd like to fill
> > it for your own purposes, it's okay too)"...
> > More of a 'oob_must_be_read' or 'oob_expected' for the read case (and
> > 'oob_must_be_written' or 'oob_was_placed' for write).
> >
> > (tried to come-up with better names, no success ;-)
> 
> I'm not sure about the naming. I thought 'use_oob' was better than
> 'has_oob'. I also was working for name that:
> 
> (1) could be used for both read and write
> (2) wasn't too long
> 
> If I ignore (1) and add in:
> 
> (3) an indication that "you may skip filling the oob_poi if you don't
> want to" (only when the boolean is false)
> 
> then I might come up with something like:
> 
> for 'read' functions: oob_expected
> for 'write' functions: oob_provided
> 
> Or maybe something that hits all (1)-(3): oob_required. Then, saying
> "oob_required = false" doesn't mean that you *can't* use oob_poi.

I like all of your suggestions (oob_expected, oob_provided, and
also oob_required). Better than 'has_oob' or 'use_oob'.

These names implicitly suggest that we don't have to immediately port
those implementors that do fill/use 'oob_poi' even if it's not really
required.

> >> @@ -1139,7 +1142,7 @@ static int nand_read_page_swecc(struct mtd_info *mtd, struct nand_chip *chip,
> >>    uint8_t *ecc_code = chip->buffers->ecccode;
> >>    uint32_t *eccpos = chip->ecc.layout->eccpos;
> >>
> >> -   chip->ecc.read_page_raw(mtd, chip, buf, page);
> >> +   chip->ecc.read_page_raw(mtd, chip, buf, use_oob, page);
> >
> > Should pass 'true' instead of 'use_oob'.
> > That's because 'nand_read_page_swecc' later uses 'chip->oob_poi' and
> > expects it to be read.
> > (relevant for few other calls, e.g. nand_write_page_swecc)
> 
> Right, thanks. By "few other calls," did you mean that only
> nand_write_page_swecc and nand_read_page_swecc were relevant? I didn't
> find any others I missed that were used the same way.

Took another look at nand_base.c, only these two (for some reason I
initially thought, mistakenly, that the pattern is more widespread).

> > BTW you used 'bool', however convention for some other boolean parameters
> > around nand_base.c is 'int'.
> > (no preference, just like things consistent)
> 
> For reference, are the instances of 'int sndcmd' the only cases of
> int-used-as-boolean that you found? bool is clearer IMO, but for the
> sake of consistency I can switch. But now I just noticed docg4.c and
> denali.c use 'bool'...

I only looked at nand_base.c. Seems like 'int' more used: int getchip,
int allowbbt, int cached, int raw.

Also, grepping 'bool' within include/linux/mtd/* yielded just one
result; obviously there are interfaces that get or return a boolean.

I'm not familiar with current coding preference (kernel global or mtd
local), just prefer to be consistent.

Regards,
Shmulik
