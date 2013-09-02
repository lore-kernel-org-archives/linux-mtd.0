Received: from mail.karo-electronics.de ([81.173.242.67])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VGNQT-00074F-RB
 for linux-mtd@lists.infradead.org; Mon, 02 Sep 2013 06:15:50 +0000
Message-ID: <21028.11459.251694.775851@ipc1.ka-ro>
Date: Mon, 2 Sep 2013 08:14:27 +0200
From: =?utf-8?Q?Lothar_Wa=C3=9Fmann?= <LW@KARO-electronics.de>
To: David Woodhouse <dwmw2@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 04/25] mtd: nand: gpmi-nand: janitorial cleanup: (commas
 after last element of struct initializer)
In-Reply-To: <1377879189.22372.65.camel@shinybook.infradead.org>
References: <1375279887-17928-1-git-send-email-LW@KARO-electronics.de>
 <1375279887-17928-2-git-send-email-LW@KARO-electronics.de>
 <51F9C4C2.8040403@freescale.com>
 <20985.63269.929367.546435@ipc1.ka-ro>
 <1377879189.22372.65.camel@shinybook.infradead.org>
Cc: Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

David Woodhouse writes:
> On Thu, 2013-08-01 at 07:50 +0200, Lothar Waßmann wrote:
> > Huang Shijie writes:
> > > is it any bad influence if we do not apply this patch?
> > > 
> > > I am not clear what we can benefit from this patch.
> > > 
> > less eye sore when looking at the code and eventual copies of it in
> > other places.
> 
> But it's actually a *good* practice to have the redundant commas at the
> end of the line, in the general case.
> 
> It does absolutely no harm, and makes the final line appear *consistent*
> with the other lines. I don't see why it would make your eye sore on the
> final line when it's there and necessary on the previous lines.
> 
My patch _added_ the commas and _made_ the last lines consistent with
the other ones...


Lothar Waßmann
-- 
___________________________________________________________

Ka-Ro electronics GmbH | Pascalstraße 22 | D - 52076 Aachen
Phone: +49 2408 1402-0 | Fax: +49 2408 1402-10
Geschäftsführer: Matthias Kaussen
Handelsregistereintrag: Amtsgericht Aachen, HRB 4996

www.karo-electronics.de | info@karo-electronics.de
___________________________________________________________
