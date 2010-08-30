Received: from mail-vw0-f49.google.com ([209.85.212.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Oq3XR-0005nT-Tq
	for linux-mtd@lists.infradead.org; Mon, 30 Aug 2010 12:32:39 +0000
Received: by vws11 with SMTP id 11so5508523vws.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 30 Aug 2010 05:32:36 -0700 (PDT)
Subject: Re: [PATCH v2] mtd/nand: Support Micron chips, pagesize >= 4KB
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Kevin Cernekee <cernekee@gmail.com>
In-Reply-To: <AANLkTik6657CazQWORXN5fUxancjiUmsQ9ciC035E2T=@mail.gmail.com>
References: <4C4DEA3D.5070208@broadcom.com> <4C4F3691.9020505@broadcom.com>
	<1282465255.16502.52.camel@brekeke>
	<AANLkTim-XofxxyZt6epCcoQN=PL0vFdT0vjmk_5D=soY@mail.gmail.com>
	<4C722FAD.2030501@parrot.com>
	<AANLkTi=d5B3sjAPZPEumkZwtGBEqyVTAVwHopShLdwFr@mail.gmail.com>
	<1282630237.24044.106.camel@localhost>
	<AANLkTik6657CazQWORXN5fUxancjiUmsQ9ciC035E2T=@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 30 Aug 2010 15:32:22 +0300
Message-ID: <1283171542.12995.56.camel@brekeke>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Maxim Levitsky <maximlevitsky@gmail.com>,
	Matthieu CASTET <matthieu.castet@parrot.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	David Woodhouse <dwmw2@infradead.org>, Brian Norris <norris@broadcom.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2010-08-25 at 17:43 -0700, Kevin Cernekee wrote:
> > So, I was thinking that adding strange heuristics and quirks to generic
> > code is bad. We should _first_ add proper ONFI code, and _then_ add
> > exception for strange devices like you have.
> 
> Unfortunately, I think the heuristic/quirk logic is unavoidable for
> Samsung and other non-ONFI vendors.
> 
> So the question becomes: if nand_base.c already has to have
> heuristic/quirk code anyway, and some controller(s) can't speak ONFI
> so they need even MORE heuristic/quirk code than the others - do we
> add the latter code into nand_base.c or just put it in the driver?

OK, I can apply it to the dunno branch and let dwmw2 decide. But this
patch does not apply anymore to to my tree. Brian, would you refresh and
resend? Also, Florian said he is going to send ONFI support soon, may be
it'll make sens to wait a bit and re-send the patch on top of ONFI
support?

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
