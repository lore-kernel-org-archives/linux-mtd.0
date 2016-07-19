Received: from mail-pf0-x243.google.com ([2607:f8b0:400e:c00::243])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bPZcL-0000ec-8c
 for linux-mtd@lists.infradead.org; Tue, 19 Jul 2016 18:19:44 +0000
Received: by mail-pf0-x243.google.com with SMTP id h186so1811829pfg.2
 for <linux-mtd@lists.infradead.org>; Tue, 19 Jul 2016 11:19:20 -0700 (PDT)
Date: Tue, 19 Jul 2016 11:19:16 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Richard Weinberger <richard@nod.at>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] mtd: nand: BUG_ON in case of no select_chip and
 cmd_ctrl
Message-ID: <20160719181916.GA85399@google.com>
References: <1468942904-26464-1-git-send-email-andrew.smirnov@gmail.com>
 <578E4AF0.7090507@nod.at> <20160719175912.11277116@bbrezillon>
 <578E4F13.1070100@nod.at> <20160719181248.2a71b5a7@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160719181248.2a71b5a7@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jul 19, 2016 at 06:12:48PM +0200, Boris Brezillon wrote:
> On Tue, 19 Jul 2016 18:02:27 +0200
> Richard Weinberger <richard@nod.at> wrote:
> > Am 19.07.2016 um 17:59 schrieb Boris Brezillon:
> > > On Tue, 19 Jul 2016 17:44:48 +0200
> > > Richard Weinberger <richard@nod.at> wrote:
> > >> Am 19.07.2016 um 17:41 schrieb Andrey Smirnov:  
> > >>> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> > >>> index ce7b2ca..57043a6 100644
> > >>> --- a/drivers/mtd/nand/nand_base.c
> > >>> +++ b/drivers/mtd/nand/nand_base.c
> > >>> @@ -3128,8 +3128,10 @@ static void nand_set_defaults(struct nand_chip *chip, int busw)
> > >>>  	if (chip->waitfunc == NULL)
> > >>>  		chip->waitfunc = nand_wait;
> > >>>  
> > >>> -	if (!chip->select_chip)
> > >>> +	if (!chip->select_chip) {
> > >>> +		BUG_ON(!chip->cmd_ctrl);    
> > >>
> > >> Please don't add new BUG_ON() calls. WARN_ON() is good enough to raise the driver developer's
> > >> attention and won't kill the machine.  
> > > 
> > > Not sure a BUG_ON() is worst than a NULL-pointer exception ;-).  
> > 
> > When this really just triggers a NULL-pointer exception, we don't need a BUG_ON or WARN_ON at
> > all since the kernel can tell anyway what went wrong.
> 
> Hm, that's not entirely true, depending on your debug options you don't
> have all the information to guess which line triggered the NULL pointer
> exception, and this makes it harder to debug.
> And I agree with Andrey here, it's better to complain at registration
> time than letting the controller register all its NAND devices and
> generate exceptions when the NAND is really used.

Yes, definitely better to complain at registration. But complaining
doesn't have to be BUG_ON().

> BTW, I don't quite understand the rational behind BUG_ON() eradication.
> I agree that they should not be used when the driver can recover from a
> specific failure, but that's not really the case here (some NAND
> controller drivers don't check nand_scan_tail() or nand_scan() return
> code).

It's really not helpful to anyone to have a single picky/buggy/whatever
driver crash the entire system (e.g., on an early prototype board; or
while somebody is tinkering and forgets something) when we could
perfectly easily just fail to register the driver. There are plenty of
other subsystems that do this, and the world hasn't caught fire yet.

And regarding the "drivers don't check ... return code": I'm pretty
tired of that excuse. I don't want to gate any more correct error
handling on the fact that drivers are s**t.

> The best solution would probably be to patch all those drivers and then
> return an error when one of the mandatory hooks is missing, but in the
> meantime I don't see any problem in adding BUG_ON() calls.

I do.

Regards,
Brian
