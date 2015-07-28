Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZK6ZW-0003rk-N6
 for linux-mtd@lists.infradead.org; Tue, 28 Jul 2015 15:13:42 +0000
Date: Tue, 28 Jul 2015 17:13:16 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Michal Suchanek
 <hramrach@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Petros Angelatos <petrosagg@gmail.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] New NAND chip IDs
Message-ID: <20150728171316.67bb4351@bbrezillon>
In-Reply-To: <20150728171013.58cbc608@bbrezillon>
References: <cover.1438093758.git.hramrach@gmail.com>
 <55B79696.40906@redhat.com> <20150728171013.58cbc608@bbrezillon>
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

On Tue, 28 Jul 2015 17:10:13 +0200
Boris Brezillon <boris.brezillon@free-electrons.com> wrote:

> Hi Hans,
> 
> On Tue, 28 Jul 2015 16:49:58 +0200
> Hans de Goede <hdegoede@redhat.com> wrote:
> 
> > Hi,
> > 
> > On 07/28/2015 04:29 PM, Michal Suchanek wrote:
> > > Hello,
> > >
> > > the NAND chips on Cubietech boards are not known to Linux.
> > >
> > > I used Petros Angelatos' patch from sunxi experimental tree for one chip and
> > > added another chip.
> > >
> > > I hope it's ok to send both patches to avoid merge conflict.
> > 
> > I do not think that these patches are a good idea, this will lead to an
> > ever growing manual maintained list of ids, and that is not maintainable
> > IMHO.
> > 
> > For Samsung chips we only need the ecc strength and size the rest is already
> > detected on the fly, and I've a patch in my personal tree to get the
> > ecc strengt and size from the nand without needing to have an entry per
> > chip:
> > 
> > https://github.com/jwrdegoede/linux-sunxi/commit/53b335d33232753b7aa70298009158baadf5a6bf
> > 
> > This is IMHO a much better solution.
> 
> Hm, IMHO it's not: the nand ids table also store information about
> supported NAND timings, and maybe we'll have to add new things (like
> the read-retry implementation to use for a specific chip).

Oops, sorry, I didn't look at the patch before answering, and I thought
you were suggesting to put the information inside the DT.
Forget my previous answer.


-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
