Received: from mail-la0-f47.google.com ([209.85.215.47])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WV0KX-0004TJ-79
 for linux-mtd@lists.infradead.org; Tue, 01 Apr 2014 15:10:26 +0000
Received: by mail-la0-f47.google.com with SMTP id pn19so2828763lab.34
 for <linux-mtd@lists.infradead.org>; Tue, 01 Apr 2014 08:09:57 -0700 (PDT)
Subject: Re: [PATCH] mtd: cfi_cmdset_0001 - fixup for PC28F512P33TFA
From: Christoph Fritz <chf.fritz@googlemail.com>
To: Joakim Tjernlund <joakim.tjernlund@transmode.se>
In-Reply-To: <OFCD64B0EF.BC0E327D-ONC1257CAD.003CE517-C1257CAD.003DCE3D@transmode.se>
References: <1396287151.4857.50.camel@mars>
 <OFA78F5CB9.63C292B4-ONC1257CAC.006FBDC4-C1257CAC.0070B588@transmode.se>
 <1396303460.4857.111.camel@mars>
 <OFA7BCC382.7C5EA8B7-ONC1257CAD.002CA0C1-C1257CAD.002EAA92@LocalDomain>
 <OFCD64B0EF.BC0E327D-ONC1257CAD.003CE517-C1257CAD.003DCE3D@transmode.se>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 01 Apr 2014 17:09:51 +0200
Message-ID: <1396364991.4850.37.camel@mars>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, Marius Achilles <M.Achilles@phytec.de>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Joakim,

 thanks for your input, please see my further comments below.

On Tue, 2014-04-01 at 13:15 +0200, Joakim Tjernlund wrote:
> > There has been complaints in the past with no erase suspend.
> > You get delays considering that an erase takes c.a 1 sek so
> > once you get into a state where GC is erasing lots of blocks and other
> > progs wants read/write you will notice.

Yes it's not a fine solution, it's a quirk for a hardware with issues.
But here for me it's better to get delays than having to suffer from
flash errors.

> > > > The document mentions other ways to get around this problem, I 
> suggest you 
> > > > explore
> > > > these first.
> > > 
> > > Already tried the “0xFF” dummy write cycle suggestion, should have
> > > mentioned that.
> > 
> > OK, but one more workaround(the udelay part) is required, right?
> 
> There something odd with the patches in the mentioned doc.
> 1) "Resolving ERASE SUSPEND Hangups" touches the same code as
> 2) "ERASE SUSPEND Following ERASE RESUME"
> 
> 1) says to add write(0xff) and 2) adds a udelay
> 
> What should it be, both? in what order?
> 
> I suspect that any write(0xff) can be there unconditionally, provided that 
> the cmd0001 spec allows it.
> The delay could be a quirk default to 0

I already tried all sorts of combinations of various delays and 0xff
writes, which can be used wasteful without impact. And yes, errors are
happening less -- but are still happening (at for example -2°C starting
udev or a filesys-bench program like bonnie++).

Sure, it's possible that I missed the holy right
delay-0xff-quirk-combination to get this NOR flash reliable working for
its specified temperature range. But until nobody has found it, I would
prefer to stick to my posted quirk and just disable suspend erase.

Maybe someone from Micron can help?

 Thanks
  -- Christoph
