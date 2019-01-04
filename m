Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gfLM7-0003bk-Hr
 for linux-mtd@lists.infradead.org; Fri, 04 Jan 2019 09:01:29 +0000
Date: Fri, 4 Jan 2019 10:01:17 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: Richard Weinberger <richard@nod.at>
Cc: Kenneth Johansson <ken@kenjo.org>, linux-mtd@lists.infradead.org, Miquel
 Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v2] mtd: rawnand: nandsim: Add support to disable
 subpage writes.
Message-ID: <20190104100117.394876ec@bbrezillon>
In-Reply-To: <20190104095302.236a19dc@bbrezillon>
References: <20181222124008.28046-1-ken@kenjo.org>
 <10756fcb-b284-5465-ed5c-8251cb00d9c2@kenjo.org>
 <6672633.KqxhzBgVKO@blindfold> <20190104095302.236a19dc@bbrezillon>
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

+Miquel

Kenneth, please Cc the NAND maintainers next time.

On Fri, 4 Jan 2019 09:53:02 +0100
Boris Brezillon <bbrezillon@kernel.org> wrote:

> Hi Richard,
> 
> On Thu, 03 Jan 2019 21:43:13 +0100
> Richard Weinberger <richard@nod.at> wrote:
> 
> > > It's true that you could change the vid offset with ubiattach but that 
> > > require you know that the LEB missmatch error you get is fixed by a 
> > > different vid offset and you need to understand what that value should be.
> > > This way you only need to match the basic mtd parameters and the rest 
> > > will just work automatically.    
> > 
> > I agree that adding a parameter to nandsim to control subpage behavior
> > is nice.
> > But please keep in mind that nandsim will never perfectly match your hardware.
> > 
> > Boris, unless you have objections I'm fine to control NAND_NO_SUBPAGE_WRITE
> > in nandsim using a module parameter.  
> 
> Hm, I'd really like to have nandsim replaced by something more generic
> at some point (mtdsim or MTD/NAND emulation in qemu using a virtio
> iface), so adding new features/option to this driver is something I'd
> like to avoid. This being said, this new MTD/NAND emulation
> infrastructure is not there yet, and I don't think I'll have time to
> work on it (I started working on mtdsim a while back, and someone took
> over this work, but it stopped at some point).
> 
> To sum-up, if you think this is absolutely necessary (given the
> discussion I'm not convinced it is) I'm okay to add this module param,
> but I'd prefer if people were working on a solution to replace all
> those emulation layers we have right now (mtdram, nandsim, ...).
> 
> Regards,
> 
> Boris
