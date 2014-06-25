Received: from protonic.xs4all.nl ([83.163.252.89])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wzm3b-0002AW-Up
 for linux-mtd@lists.infradead.org; Wed, 25 Jun 2014 12:12:08 +0000
Date: Wed, 25 Jun 2014 14:11:33 +0200
From: David Jander <david.jander@protonic.nl>
To: "Gupta, Pekon" <pekon@ti.com>, "Brian Norris" <computersforpeace@gmail.com>
Subject: Re: [FRC] [PATCH] MTD: nand_base.c: Enable support for Samsung
 E-die SLC NAND
Message-ID: <20140625141133.247d62a3@archvile>
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73EAF7689@DBDE04.ent.ti.com>
References: <1403259137-22171-1-git-send-email-david@protonic.nl>
 <CAE94FHELXgoZ9Jm1E3_YT6D1SB=VAGWthZSjbsR+qqkUWn97PA@mail.gmail.com>
 <20980858CB6D3A4BAE95CA194937D5E73EAF6A08@DBDE04.ent.ti.com>
 <CAE94FHGNHDVygoviGgEtE2ZDyumjwa73tZiDnEBdSnnWCE03YQ@mail.gmail.com>
 <CAE94FHFvCoZyawRC=LL+PdBR3ig10crKJN6c_M_q=yGdOXnR9A@mail.gmail.com>
 <20980858CB6D3A4BAE95CA194937D5E73EAF7560@DBDE04.ent.ti.com>
 <20140625133129.060cd535@archvile>
 <20980858CB6D3A4BAE95CA194937D5E73EAF7689@DBDE04.ent.ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Ted Juan <ted.juan@gmail.com>,
 "sjhill@realitydiluted.com" <sjhill@realitydiluted.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Dear Pekon,

On Wed, 25 Jun 2014 11:55:26 +0000
"Gupta, Pekon" <pekon@ti.com> wrote:

> Hi David,
> 
> >From: David Jander [mailto:david.jander@protonic.nl]
> >>"Gupta, Pekon" <pekon@ti.com> wrote:
> >> >From: Ted Juan [mailto:ted.juan@gmail.com]
> >> >Dear Pekon,
> >> >
> >> >I backup the raw data to data2[] before doing
> >> >elm_decode_bch_error_page(); Dump  code is as below. The raw data is the
> >> >same with the correction data that all more than 8 bit-flips.
> >> >
> >> (a) In that case you should contact the Flash vendor here.
> >> Fresh NAND device from factory should not violate the spec.
> >> I don't suspect a driver issue here, because the raw data read itself
> >> has random bit-flips.
> >
> >Sorry to interrupt, but this does sound serious. Are you absolutely sure
> >your hardware is OK? Is the power-supply clean and well enough decoupled?
> >Timings within specs? If electrical specifications are not met, this could
> >explain the bit-flips.
> >
> I don't have the hardware (board), I'm just  helping Ted as I'm actively
> involved with OMAP NAND drivers from TI side. Ted is the original developer
> working on this board.

Ok.

> However, I don't suspect this to be board supply or noise issue because:
> (1) A timing mis-match would cause read-failure for whole word,
>   not just few bits in the word.

Yes that would be the most probable effect of a timing issue. Just a few
bit-flips in a word is unlikely (but not impossible!) to be caused by timing
issues.

> (2) Also, power-supply noise would not cause bit-flips in erased-page,
>  Because erase operation inside flash is usually driver by charged-pumps
>  so a dynamic supply noise may not cause random bit-flips. Though it can
> can erase-failures, which will be detected on reading STATUS register.

Please bear in mind that the erase can be successful for the first few
(milli-)seconds. If the power supply was out of specs during erase, it is
perfectly possible that a few random bits flip back to "programmed" state after
a while. That would not be caught by the status check.

> > It is possible that Samsung is at fault here (they screwed up the specs
> > for this
> >version anyway), but double checking the hardware looks like a good idea
> >here...
> >
> Agree. But hardware issue will be difficult to identify and debug.
> 
> Ted,
> Plz relax timing by 10-20% and check if that makes a difference.

That is a good idea to check, but I would also try to influence the
power-supply or -decoupling to see if that is sensible variable.
Do you have cold-spray? Try to use it and see if it affects the result.

Best regards,

P.S.: Anyone care to give comment on my patch? Not that you two effectively
hijacked this thread for only slightly tangentially related issues... ;-)

-- 
David Jander
Protonic Holland.
