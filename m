Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1RKdiO-0006bn-BM
	for linux-mtd@lists.infradead.org; Sun, 30 Oct 2011 22:18:53 +0000
Received: by faaf16 with SMTP id f16so6842761faa.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 30 Oct 2011 15:18:49 -0700 (PDT)
From: Marek Vasut <marek.vasut@gmail.com>
To: Mike Dunn <mikedunn@newsguy.com>
Subject: Re: [PATCH 00/13]  DocG3 fixes and write support
Date: Sun, 30 Oct 2011 23:18:47 +0100
References: <1319824292-11085-1-git-send-email-robert.jarzmik@free.fr>
	<87bosy6eab.fsf@free.fr> <4EADC4F5.2050201@newsguy.com>
In-Reply-To: <4EADC4F5.2050201@newsguy.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201110302318.47617.marek.vasut@gmail.com>
Cc: dedekind1@gmail.com, dwmw2@infradead.org, tcech@suse.cz,
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
	Robert Jarzmik <robert.jarzmik@free.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> Hi guys,
> 
> On 10/30/2011 02:04 AM, Robert Jarzmik wrote:
> > Marek Vasut <marek.vasut@gmail.com> writes:
> >> Hi,
> >> 
> >> can you sum up the situation about the another (docg4) driver for us not
> >> watching this too tightly? Was there any improvement/progress/... ?
> > 
> > The review is underway, my comments should be dealt with, and a V2 of the
> > patch should be sent. It's not in my hands.
> 
> I've been busy working on this, and should post a patch within the next few
> days.  Progress has been very good.  I still want to run the mtd tests in
> the kernel before posting the patch (except the torture test - I'm not
> ready to sacrifice my development Treo), but it continues to pass the
> nandtest userspace utility (part of mtd-utils) flawlessly, and a ubifs
> still appears to be working well.  The code is now in a much cleaner
> state.

CCing Tomas Cech, we might be able to get you a spare device if really 
necessary.
> 
> > The global view we have with Mike is that chips are different, and each
> > one deserves its own driver. Several registers are common, and the
> > docg3.h could become common.
> 
> Actually, I'm open on this.  My opinion is that they should share a header
> file for sure, because the register set largely overlaps.  To that end, my
> upcoming patch will adopt Robert's register #defines, with just a few
> additional ones that are G4 specific.
> 
> On the broader question of combined or separate drivers... a combined
> driver is certainly doable.  Each device would have to use its own set of
> low-level functions, but I think there's merit in combining them because
> it would provide a consistent interface with the mtd nand infrastructure
> code, which is rather messy.  But before that discussion can take place,
> the more fundamental question of whether or not the drivers should use the
> nand interface needs to be resolved.  I used the nand interface when I
> started on the G4 driver, because it *is* a nand device, and the legacy
> diskonchip.c driver was updated not long ago from a stand-alone driver to
> the nand interface.  I'm not knowledgeable enough of the mtd subsystem to
> argue for or against the nand interface, but the end result (once I
> invested the time slogging through nand_base.c) is fairly clean, with just
> a couple minor hacks to get around the fact that it doesnt have a
> "standard" nand controller.
> 
> Hopefully some mtd experts can share an opinion on this.
> 
> Thanks,
> Mike
