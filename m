Received: from mail-la0-x22f.google.com ([2a00:1450:4010:c03::22f])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WX6GI-0001hQ-CA
 for linux-mtd@lists.infradead.org; Mon, 07 Apr 2014 09:54:43 +0000
Received: by mail-la0-f47.google.com with SMTP id pn19so4540673lab.34
 for <linux-mtd@lists.infradead.org>; Mon, 07 Apr 2014 02:54:20 -0700 (PDT)
Subject: Re: [PATCH] mtd: cfi_cmdset_0001 - fixup for PC28F512P33TFA
From: Christoph Fritz <chf.fritz@googlemail.com>
To: Christian Riesch <christian.riesch@gmail.com>
In-Reply-To: <080F496E4E3B84A0EEF7E915@[172.22.2.41]>
References: <1396287151.4857.50.camel@mars>
 <OFA78F5CB9.63C292B4-ONC1257CAC.006FBDC4-C1257CAC.0070B588@transmode.se>
 <1396303460.4857.111.camel@mars>
 <OFA7BCC382.7C5EA8B7-ONC1257CAD.002CA0C1-C1257CAD.002EAA92@LocalDomain>
 <OFCD64B0EF.BC0E327D-ONC1257CAD.003CE517-C1257CAD.003DCE3D@transmode.se>
 <1396364991.4850.37.camel@mars>
 <OFDA5ED549.208718B9-ONC1257CAD.0068922B-C1257CAD.006990F4@transmode.se>
 <1396393830.6474.31.camel@mars>
 <OF12157674.86C034EE-ONC1257CAE.00287492-C1257CAE.0028C422@transmode.se>
 <49896FD866D95E20142E6B80@[172.22.2.41]> <1396646233.17753.237.camel@mars>
 <080F496E4E3B84A0EEF7E915@[172.22.2.41]>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 07 Apr 2014 11:54:14 +0200
Message-ID: <1396864454.3285.160.camel@lovely>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Marius Achilles <M.Achilles@phytec.de>,
 Joakim Tjernlund <joakim.tjernlund@transmode.se>,
 Artem Bityutskiy <dedekind1@gmail.com>, linux-mtd@lists.infradead.org,
 Andrea Adami <andrea.adami@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2014-04-07 at 10:41 +0200, Christian Riesch wrote:
> > The board is back on my desk and I did some further promising tests.
> 
> Since the board is "on your desk", I guess you did the test at room 
> temperature, right? Your desk is not cooled down to -40°C, right?

Further tests, as done with the disabled suspend erase patch, will be in
a climatic exposure test cabinet. Here on my desk I use massive amounts
of cooling spray. Its tin is labeled for cooling down to max -35°C.

> At first sight I thought it was quite strange that a delay of 1000us does 
> not solve the problem, whereas it works fine with 1024us. But then I had a 
> look at the implementation of cfi_udelay(): Actually, 
> cfi_udelay(900)/cond_resched() becomes udelay(900), cfi_udelay(1000) 
> becomes msleep(1), and cfi_udelay(1024) becomes msleep(2).

Nice catch! According to timers-howto.txt [1] usleep_range() should be
used here because:

    msleep(1~20) may not do what the caller intends, and
    will often sleep longer (~20 ms actual sleep for any
    value given in the 1~20ms range)

[1] https://www.kernel.org/doc/Documentation/timers/timers-howto.txt

> > Preferably I would go with a cleaned up version of patch "TESTHACK 12",
> > after some more stress testings have been passed. What do you think?
> 
> You should thoroughly test it at -40°C. This temperature required the 
> largest delays for the M29EW.

I'll try to kick of some tests with usleep_range() in a climatic
exposure test cabinet the next days.

> > I now also have a contact to Micron, so I hope they can shed some light
> > on this issue.
> 
> I am looking forward to their response ;-)

I also invited them to this open discussion.

Thanks
  -- Christoph
