Date: Wed, 9 May 2018 10:28:26 -0300
From: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Richard
 Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian
 Norris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH 16/18] mtd: rawnand.h: use nested union kernel-doc markups
Message-ID: <20180509102826.26d38719@vento.lan>
In-Reply-To: <20180509142221.0fef7d1f@bbrezillon>
References: <cover.1525684985.git.mchehab+samsung@kernel.org>
 <39d8d4f0e0ff5a06be0303f7f4f2eac5fb45b9ca.1525684985.git.mchehab+samsung@kernel.org>
 <20180507114650.171edcc2@bbrezillon>
 <20180507083232.5a084ba7@vento.lan>
 <20180509091034.58dadd12@vento.lan>
 <20180509142221.0fef7d1f@bbrezillon>
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

Em Wed, 9 May 2018 14:22:21 +0200
Boris Brezillon <boris.brezillon@bootlin.com> escreveu:

> On Wed, 9 May 2018 09:10:34 -0300
> Mauro Carvalho Chehab <mchehab+samsung@kernel.org> wrote:
> 
> > Hi Boris,
> > 
> > Em Mon, 7 May 2018 08:32:32 -0300
> > Mauro Carvalho Chehab <mchehab+samsung@kernel.org> escreveu:
> >   
> > > Hi Boris,
> > > 
> > > Em Mon, 7 May 2018 11:46:50 +0200
> > > Boris Brezillon <boris.brezillon@bootlin.com> escreveu:    
> >   
> > > > Is there a simple
> > > > way we can get rid of the warning we have when not describing timings
> > > > but all of its fields?      
> > > 
> > > There's no direct way. It won't be hard to add a way to do it,
> > > like applying the enclosed patch with ends by declaring timings as:
> > > 
> > > 	* @timings:	 -- undescribed --
> > > 
> > > IMHO, this is uglier.    
> > 
> > Didn't hear from you.  
> 
> I replied just a few minutes ago ;).

OK!

> > What do you prefer for me to do with regards to
> > this patch?   
> 
> Will queue the initial patch to nand/next (I can also queue it to the
> fixes branch if you prefer).

No need. it can follow the usual workflow.

Thanks,
Mauro
