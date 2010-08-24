Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Onmjv-0000Gc-Oe
	for linux-mtd@lists.infradead.org; Tue, 24 Aug 2010 06:12:08 +0000
Received: by fxm12 with SMTP id 12so4385257fxm.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 23 Aug 2010 23:12:06 -0700 (PDT)
Subject: Re: [PATCH v2] mtd/nand: Support Micron chips, pagesize >= 4KB
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Kevin Cernekee <cernekee@gmail.com>
In-Reply-To: <AANLkTi=d5B3sjAPZPEumkZwtGBEqyVTAVwHopShLdwFr@mail.gmail.com>
References: <4C4DEA3D.5070208@broadcom.com> <4C4F3691.9020505@broadcom.com>
	<1282465255.16502.52.camel@brekeke>
	<AANLkTim-XofxxyZt6epCcoQN=PL0vFdT0vjmk_5D=soY@mail.gmail.com>
	<4C722FAD.2030501@parrot.com>
	<AANLkTi=d5B3sjAPZPEumkZwtGBEqyVTAVwHopShLdwFr@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 24 Aug 2010 09:10:37 +0300
Message-ID: <1282630237.24044.106.camel@localhost>
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

On Mon, 2010-08-23 at 14:48 -0700, Kevin Cernekee wrote:
> On Mon, Aug 23, 2010 at 1:22 AM, Matthieu CASTET
> <matthieu.castet@parrot.com> wrote:
> >> The NAND controllers on certain legacy SoCs are not able to read the
> >> ONFI parameter page, even if the flash device itself supports ONFI.
> >
> > Why ?
> > Are there controllers that doesn't allow to send custom command ?
> 
> Yes.  The controllers I have here operate at a relatively high level
> (read page, write page, erase block).  Part of the reason for this is
> because the controller is designed for XIP and DMA - operations where
> it is not practical to have the CPU involved in building command
> sequences or wiggling ALE/CLE.
> 
> Newer versions of the hardware do have the ability to issue custom
> commands and perform ONFI queries, but the versions in the field right
> now do not.

Sorry for my ignorance. Correct me if I'm wrong. I think this should
work as follows:

1. First we add the ONFI detection to MTD, and make it work.
2. If we have an ONFI device which nevertheless does not allow us
reading ONFI data, then we run a 'onfi_broken_devices_quirk()' or
something like this. And this quirk tries to use whatever heuristics.

So, I was thinking that adding strange heuristics and quirks to generic
code is bad. We should _first_ add proper ONFI code, and _then_ add
exception for strange devices like you have.

Do I miss something?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
