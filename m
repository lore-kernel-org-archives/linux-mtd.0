Received: from mail-lb0-x233.google.com ([2a00:1450:4010:c04::233])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WV7pZ-0000CR-Ot
 for linux-mtd@lists.infradead.org; Tue, 01 Apr 2014 23:10:59 +0000
Received: by mail-lb0-f179.google.com with SMTP id p9so7644905lbv.10
 for <linux-mtd@lists.infradead.org>; Tue, 01 Apr 2014 16:10:34 -0700 (PDT)
Subject: Re: [PATCH] mtd: cfi_cmdset_0001 - fixup for PC28F512P33TFA
From: Christoph Fritz <chf.fritz@googlemail.com>
To: Joakim Tjernlund <joakim.tjernlund@transmode.se>
In-Reply-To: <OFDA5ED549.208718B9-ONC1257CAD.0068922B-C1257CAD.006990F4@transmode.se>
References: <1396287151.4857.50.camel@mars>
 <OFA78F5CB9.63C292B4-ONC1257CAC.006FBDC4-C1257CAC.0070B588@transmode.se>
 <1396303460.4857.111.camel@mars>
 <OFA7BCC382.7C5EA8B7-ONC1257CAD.002CA0C1-C1257CAD.002EAA92@LocalDomain>
 <OFCD64B0EF.BC0E327D-ONC1257CAD.003CE517-C1257CAD.003DCE3D@transmode.se>
 <1396364991.4850.37.camel@mars>
 <OFDA5ED549.208718B9-ONC1257CAD.0068922B-C1257CAD.006990F4@transmode.se>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 02 Apr 2014 01:10:30 +0200
Message-ID: <1396393830.6474.31.camel@mars>
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

On Tue, 2014-04-01 at 21:13 +0200, Joakim Tjernlund wrote:
> Christoph Fritz <chf.fritz@googlemail.com> wrote on 2014/04/01 17:09:51:
> > I already tried all sorts of combinations of various delays and 0xff
> > writes, which can be used wasteful without impact. And yes, errors are
> > happening less -- but are still happening (at for example -2°C starting
> > udev or a filesys-bench program like bonnie++).
> 
> Amazing Micron still sells these defect chips

Yeah, and it was pain to do all these kinds of tests to get it reliably
working for a real world application where minus degrees can happen. For
me it would be no problem to keep this quirk in my private queue, but
involving a bigger audience seems to be right considering the facts.

> > Sure, it's possible that I missed the holy right
> > delay-0xff-quirk-combination to get this NOR flash reliable working for
> > its specified temperature range. But until nobody has found it, I would
> > prefer to stick to my posted quirk and just disable suspend erase.
> 
> Problem is, if you add that quirk no-one will be able to remove it later 
> so we
> better make sure there isn't a less intrusive solution.

What about a comment or printk which makes that clear? I anyway don't
think that there are interested users of this specific NOR flash left
using a current kernel -- but who knows, right.

> hmm, have you checked you bus timing? Perhaps you need to relax it 
> somewhat.

Sure, I rechecked the WEIM interface (imx35 bus) settings more than
once. I also did testings with most relaxed settings (highest delays
possible). But still, flash errors do occur.

I should mention that a PC28F256P33BFE (a similar 32 MB NOR flash) works
without any quirk in all my testing environments just reliable as it
should be.
 
> > Maybe someone from Micron can help?
> 
> Yes, you should contact them.

Is there anybody out there knowing a contact without the need of going
through a business-ticket-support-hell ?

Thanks
  -- Christoph
