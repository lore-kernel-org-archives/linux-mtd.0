Received: from mail-pf0-x22d.google.com ([2607:f8b0:400e:c00::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b2qEY-0007ut-Fk
 for linux-mtd@lists.infradead.org; Wed, 18 May 2016 01:25:10 +0000
Received: by mail-pf0-x22d.google.com with SMTP id y69so12411410pfb.1
 for <linux-mtd@lists.infradead.org>; Tue, 17 May 2016 18:24:49 -0700 (PDT)
Date: Tue, 17 May 2016 18:24:45 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Michal Suchanek <hramrach@gmail.com>
Cc: MTD Maling List <linux-mtd@lists.infradead.org>,
 Heiner Kallweit <hkallweit1@gmail.com>, Han Xu <han.xu@nxp.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Javier Martinez Canillas <javier@osg.samsung.com>,
 Rafal Milecki <zajec5@gmail.com>, Jagan Teki <jteki@openedev.com>,
 "Andrew F. Davis" <afd@ti.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Gabor Juhos <juhosg@openwrt.org>, Bean Huo <beanhuo@micron.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Bayi Cheng <bayi.cheng@mediatek.com>,
 Joachim Eastwood <manabian@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Subject: Re: [PATCH v7 00/10] Add error checking to spi-nor read and write
Message-ID: <20160518012445.GA74128@google.com>
References: <1462494716-95312-1-git-send-email-computersforpeace@gmail.com>
 <CAOMqctQLichyA3g_6K9UY8N8CY3GLvvP=_zqz+kUphRw3vxqZA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOMqctQLichyA3g_6K9UY8N8CY3GLvvP=_zqz+kUphRw3vxqZA@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, May 16, 2016 at 09:47:20PM +0200, Michal Suchanek wrote:
> Hello,
> 
> On 6 May 2016 at 02:31, Brian Norris <computersforpeace@gmail.com> wrote:
> > Hi,
> >
> > I'm picking up Michal's patch set, since he dropped it on the floor, and it's
> > useful for others. My additions:
> >
> >  * rebased on latest
> >  * added fixes for drivers that have been merged in the meantime
> >  * addressed most of Heiner's comments
> >
> 
> Since that offset error slipped into the previous rebase I was
> planning to do some more thorough testing before resubmit but did not
> get to it yet.
> 
> Thanks for picking this up.

No problem. If you get the chance, one or more of
{Reviewed,Tested,Acked}-by would be helpful.

Brian
