Received: from mail-out.m-online.net ([212.18.0.9])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ve8pE-0001fq-2g
 for linux-mtd@lists.infradead.org; Wed, 06 Nov 2013 19:31:37 +0000
From: Marek Vasut <marex@denx.de>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 2/2] mtd: gpmi: Revert "mtd: gpmi: remove the nand_scan()"
Date: Wed, 6 Nov 2013 20:31:08 +0100
References: <1383758172-29798-1-git-send-email-festevam@gmail.com>
 <CAOMZO5AsQELFqmRO95GACR90XurovYW8LHUtKfHaiqEhxWnSSw@mail.gmail.com>
 <CAN8TOE-qtxmBjrS2aGUzSirOJE7S4uHzqjXcKL+NhthPRM-2Wg@mail.gmail.com>
In-Reply-To: <CAN8TOE-qtxmBjrS2aGUzSirOJE7S4uHzqjXcKL+NhthPRM-2Wg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201311062031.08728.marex@denx.de>
Cc: Fabio Estevam <fabio.estevam@freescale.com>,
 David Woodhouse <dwmw2@infradead.org>, stable@vger.kernel.org,
 Huang Shijie <b32955@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Fabio Estevam <festevam@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Brian Norris,

> On Wed, Nov 6, 2013 at 10:42 AM, Fabio Estevam <festevam@gmail.com> wrote:
> > On Wed, Nov 6, 2013 at 4:08 PM, Brian Norris
> > 
> > <computersforpeace@gmail.com> wrote:
> >> I seriously doubt that a total revert is the correct answer to this
> >> problem. Can you pick up the discussion with Huang on the mailing
> > 
> > Agree that it would be better to come up with a better localized fix
> > rather than the complete revert, but I currently don't have the time
> > to spend on debugging this issue.
> 
> OK. And if Huang doesn't have the time to clean up his mess, then we
> will have to revert things.

I have an MX23EVK here, don't make me use it! ;-)

> > On the other hand, I would not like to see mx23 broken in 3.12 because
> > of this. It can't even reach the prompt.
> 
> 3.12 is already out the door, so we now have some time to get a proper
> fix into -stable.
> 
> >> list, or at least explain what the actual root cause is? Have you been
> >> going through some private communication on this issue? A proper
> >> bugfix with an identified issue is preferable to a blind revert.
> > 
> > No private communication. I reported this issue in the mailing list:
> > http://lists.infradead.org/pipermail/linux-mtd/2013-November/049641.html
> 
> Right. But this ended with you pointing Huang to the right U-boot
> setup, then everything went silent. And today, I get a blunt revert
> request from you as well as an independent DMA fix from Huang. Since
> you guys are both from Freescale, I wasn't sure if there was any
> coordination/correlation, or if this is really as uncoordinated as it
> looks.

Left hand doesn't know what the right one does in such big companies :(

Best regards,
Marek Vasut
