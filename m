Received: from mail-pa0-x241.google.com ([2607:f8b0:400e:c03::241])
 by casper.infradead.org with esmtps (Exim 4.85 #2 (Red Hat Linux))
 id 1aUJds-0008PI-DG
 for linux-mtd@lists.infradead.org; Fri, 12 Feb 2016 19:44:37 +0000
Received: by mail-pa0-x241.google.com with SMTP id gc2so428204pab.3
 for <linux-mtd@lists.infradead.org>; Fri, 12 Feb 2016 11:44:15 -0800 (PST)
Date: Fri, 12 Feb 2016 11:44:11 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Li Yang <leoli@freescale.com>
Cc: Raghav Dogra <raghav@freescale.com>, linux-mtd@lists.infradead.org,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, oss@buserror.net,
 prabhakar.kushwaha@nxp.com, Jaiprakash Singh <b44839@freescale.com>
Subject: Re: [PATCH] mtd/ifc: Add support for IFC controller version 2.0
Message-ID: <20160212194411.GF21465@google.com>
References: <1454481372-10288-1-git-send-email-raghav@freescale.com>
 <CADRPPNTKFA8rkynJR4wCNgAmqvmiwYwTi2Uk9hDUMB4+N7ST_Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADRPPNTKFA8rkynJR4wCNgAmqvmiwYwTi2Uk9hDUMB4+N7ST_Q@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Feb 04, 2016 at 05:07:16PM -0600, Li Yang wrote:
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

To be clear: Scott, you were NACK'ing the DT binding change request,
right? I though we had an Ack on the previous revision (that Raghav
failed to carry).

> >
> > Signed-off-by: Jaiprakash Singh <b44839@freescale.com>
> > Signed-off-by: Raghav Dogra <raghav@freescale.com>
> 
> The patch cannot apply on latest 4.5-rc cleanly either.  Otherwise,

Yeah... neither this patch nor its (allegedly) dependent patch [1] apply
cleanly.

If you expect me to take this patch via MTD, please rebase to
l2-mtd.git as stated here:

http://linux-mtd.infradead.org/source.html

> Acked-by: Li Yang <leoyang.li@nxp.com>

Brian

[1] https://patchwork.ozlabs.org/patch/564785/
