Received: from mail-vw0-f49.google.com ([209.85.212.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OoQZO-0007RV-H7
	for linux-mtd@lists.infradead.org; Thu, 26 Aug 2010 00:43:55 +0000
Received: by vws11 with SMTP id 11so1291751vws.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 25 Aug 2010 17:43:52 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1282630237.24044.106.camel@localhost>
References: <4C4DEA3D.5070208@broadcom.com> <4C4F3691.9020505@broadcom.com>
	<1282465255.16502.52.camel@brekeke>
	<AANLkTim-XofxxyZt6epCcoQN=PL0vFdT0vjmk_5D=soY@mail.gmail.com>
	<4C722FAD.2030501@parrot.com>
	<AANLkTi=d5B3sjAPZPEumkZwtGBEqyVTAVwHopShLdwFr@mail.gmail.com>
	<1282630237.24044.106.camel@localhost>
Date: Wed, 25 Aug 2010 17:43:52 -0700
Message-ID: <AANLkTik6657CazQWORXN5fUxancjiUmsQ9ciC035E2T=@mail.gmail.com>
Subject: Re: [PATCH v2] mtd/nand: Support Micron chips, pagesize >= 4KB
From: Kevin Cernekee <cernekee@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=UTF-8
Cc: Maxim Levitsky <maximlevitsky@gmail.com>,
	Matthieu CASTET <matthieu.castet@parrot.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	David Woodhouse <dwmw2@infradead.org>, Brian Norris <norris@broadcom.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Aug 23, 2010 at 11:10 PM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> 1. First we add the ONFI detection to MTD, and make it work.

OK

> 2. If we have an ONFI device which nevertheless does not allow us
> reading ONFI data, then we run a 'onfi_broken_devices_quirk()' or
> something like this. And this quirk tries to use whatever heuristics.

OK

It's more of a "broken controller quirk" than a "broken flash device
quirk," though.

It would be helpful to know if there are any other controller designs
that are unable to read the ONFI parameter page.  i.e. is this a
problem to be solved in the common code, or a driver-specific
situation?

> So, I was thinking that adding strange heuristics and quirks to generic
> code is bad. We should _first_ add proper ONFI code, and _then_ add
> exception for strange devices like you have.

Unfortunately, I think the heuristic/quirk logic is unavoidable for
Samsung and other non-ONFI vendors.

So the question becomes: if nand_base.c already has to have
heuristic/quirk code anyway, and some controller(s) can't speak ONFI
so they need even MORE heuristic/quirk code than the others - do we
add the latter code into nand_base.c or just put it in the driver?
