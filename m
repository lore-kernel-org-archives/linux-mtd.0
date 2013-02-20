Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1U87m8-0001W3-Mh
 for linux-mtd@lists.infradead.org; Wed, 20 Feb 2013 11:23:49 +0000
Message-ID: <1361359441.2734.48.camel@sauron.fi.intel.com>
Subject: Re: SELinux + ubifs: possible circular locking dependency
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>
Date: Wed, 20 Feb 2013 13:24:01 +0200
In-Reply-To: <5124B159.1040305@pengutronix.de>
References: <51123C80.2050400@pengutronix.de> <5115076E.3070703@pengutronix.de>
 <1360759673.12703.147.camel@sauron.fi.intel.com>
 <511BA51E.9000606@pengutronix.de>
 <1360826119.12703.155.camel@sauron.fi.intel.com>
 <511CD0EC.6070200@pengutronix.de>
 <1360843685.12703.165.camel@sauron.fi.intel.com>
 <5124B159.1040305@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2013-02-20 at 12:19 +0100, Marc Kleine-Budde wrote:
> > Hmm, probably I have to annotate the ui mutex. Let's drop security
> > mailing lists from the loop so far, I'll come up with a patch tomorrow.
> 
> Do you have a patch I can test?

Mark, I apologise for not keeping my promise, I got distracted. I will
_try_ to look at this again this week. Sorry!

-- 
Best Regards,
Artem Bityutskiy
