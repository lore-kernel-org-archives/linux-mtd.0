Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gS1lQ-0002to-HY
 for linux-mtd@lists.infradead.org; Wed, 28 Nov 2018 15:28:34 +0000
Date: Wed, 28 Nov 2018 16:28:10 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Schrempf Frieder <frieder.schrempf@kontron.de>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, "stable@vger.kernel.org" <stable@vger.kernel.org>, "David
 Woodhouse" <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mtd: nand: Fix memory allocation in nanddev_bbt_init()
Message-ID: <20181128162810.597a7fd3@bbrezillon>
In-Reply-To: <b7adc960-c81d-19c6-2122-cd6781b64a17@kontron.de>
References: <1543304637-27308-1-git-send-email-frieder.schrempf@kontron.de>
 <20181128154104.577d5923@bbrezillon>
 <7634bb45-6167-31e8-e169-b5c9bf7e2fc5@kontron.de>
 <20181128160215.45e5162e@bbrezillon>
 <b7adc960-c81d-19c6-2122-cd6781b64a17@kontron.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 28 Nov 2018 15:19:37 +0000
Schrempf Frieder <frieder.schrempf@kontron.de> wrote:

> On 28.11.18 16:02, Boris Brezillon wrote:
> > On Wed, 28 Nov 2018 14:55:45 +0000
> > Schrempf Frieder <frieder.schrempf@kontron.de> wrote:
> >   
> >> Hi Boris,
> >>
> >> On 28.11.18 15:41, Boris Brezillon wrote:  
> >>> On Tue, 27 Nov 2018 07:44:52 +0000
> >>> Schrempf Frieder <frieder.schrempf@kontron.de> wrote:
> >>>      
> >>>> Fix the size of the buffer allocated to store the in-memory BBT.
> >>>> This bug was previously hidden by a different bug, that was fixed in
> >>>> d098093ba06e.
> >>>>
> >>>> Fixes: 9c3736a3de21 ("mtd: nand: Add core infrastructure to deal with NAND devices")
> >>>> Cc: <stable@vger.kernel.org>
> >>>> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>  
> >>>
> >>> Looks like your From header does not match the SoB tag
> >>> ('Frieder Schrempf' vs 'Schrempf Frieder') and checkpatch does not like
> >>> that. I'll fix it when applying, but maybe you should fix
> >>> your .gitconfig to make them match.  
> >>
> >> Actually the From header in my local patch is correct (<first name>
> >> <last name>, Frieder Schrempf) as it comes from my git config. But since
> >> our company was renamed and our mail servers were transferred, our
> >> e-mails are sent with From=<last name> <first name>.
> >>
> >> It seems like git send-email or patchwork or whatever uses the
> >> information from the e-mail header instead of what is in the patch.
> >>
> >> I will try to raise this issue with our IT department as this would be
> >> best fixed on their side.  
> > 
> > There's another solution: make git send-email add a From header in the
> > message body.
> > 
> > git config --global sendemail.from "Schrempf Frieder <frieder.schrempf@kontron.de>"  
> 
> I don't get it. How would that change things? My From still wouldn't 
> match my SoB tags.

When there's a From line in the message Body, git am will use this one
instead of the one in the header section.
