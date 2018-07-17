Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ffOrI-0002As-Jb
 for linux-mtd@lists.infradead.org; Tue, 17 Jul 2018 12:13:37 +0000
Date: Tue, 17 Jul 2018 14:13:14 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org
Subject: Re: [RFC PATCH 3/3] mtd: rawnand: add hooks that may be called
 during nand_scan()
Message-ID: <20180717141314.2c033ad5@bbrezillon>
In-Reply-To: <20180717140939.020794ac@xps13>
References: <20180717095454.27935-1-miquel.raynal@bootlin.com>
 <20180717095454.27935-4-miquel.raynal@bootlin.com>
 <20180717140332.7f47f9da@bbrezillon>
 <20180717140939.020794ac@xps13>
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

On Tue, 17 Jul 2018 14:09:39 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> > > 1/ if the driver does not implement its own controller, the
> > >    chip->controller hook is not populated before nand_scan() so it
> > >    cannot be dereferenced: use chip->hwcontrol instead (which is
> > >    statically allocated and will be referenced later by chip->controller
> > >    anyway).    
> > 
> > Not related to this patch, but I'd rename chip->hwcontrol into
> > chip->dummycontroller or something that clearly shows that this field
> > should only be used when the controller driver is dumb and can only
> > control a single chip.  
> 
> I like this idea but was not sure of a good name for it. If you are
> okay I'll do the change in the same patch renaming nand_hw_control ->
> nand_controller and nand_hw_control_init -> nand_controller_init. I
> think it's related enough.

Yep, sounds good. Just remember to mention it in your commit message.
