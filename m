Received: from host.buserror.net ([209.198.135.123])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aRV24-0000K2-NR
 for linux-mtd@lists.infradead.org; Fri, 05 Feb 2016 01:17:57 +0000
Message-ID: <1454635050.2486.25.camel@buserror.net>
From: Scott Wood <oss@buserror.net>
To: Li Yang <leoli@freescale.com>, Raghav Dogra <raghav@freescale.com>
Cc: linux-mtd@lists.infradead.org, linuxppc-dev
 <linuxppc-dev@lists.ozlabs.org>,  prabhakar.kushwaha@nxp.com, Brian Norris
 <computersforpeace@gmail.com>,  Jaiprakash Singh <b44839@freescale.com>
Date: Thu, 04 Feb 2016 19:17:30 -0600
In-Reply-To: <CADRPPNTKFA8rkynJR4wCNgAmqvmiwYwTi2Uk9hDUMB4+N7ST_Q@mail.gmail.com>
References: <1454481372-10288-1-git-send-email-raghav@freescale.com>
 <CADRPPNTKFA8rkynJR4wCNgAmqvmiwYwTi2Uk9hDUMB4+N7ST_Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] mtd/ifc: Add support for IFC controller version 2.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2016-02-04 at 17:07 -0600, Li Yang wrote:
> On Wed, Feb 3, 2016 at 12:36 AM, Raghav Dogra <raghav@freescale.com> wrote:
> > The new IFC controller version 2.0 has a different memory map page.
> > Upto IFC 1.4 PAGE size is 4 KB and from IFC2.0 PAGE size is 64KB.
> > This patch segregates the IFC global and runtime registers to appropriate
> > PAGE sizes.
> 
> If the global registers and the runtime registers are so independent
> that they have to be on different page boundaries, it would make more
> sense for them to be defined as separate reg regions in the device
> tree at the very beginning.  Then we would only need to change the
> device tree now and it would be future proof for any page size.

That's great if you have a time machine.  Otherwise, NACK.

-Scott
