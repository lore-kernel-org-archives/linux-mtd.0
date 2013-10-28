Received: from mail-out.m-online.net ([212.18.0.9])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VaiUS-0006ki-UN
 for linux-mtd@lists.infradead.org; Mon, 28 Oct 2013 08:48:02 +0000
From: Marek Vasut <marex@denx.de>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 1/5] mtd: m25p80: fix allocation size
Date: Mon, 28 Oct 2013 08:54:15 +0100
References: <1382583503-13748-1-git-send-email-computersforpeace@gmail.com>
 <201310271730.12065.marex@denx.de>
 <CAN8TOE-LWj7+6NRZbKJDz=fvVgMVtRvA5UqJ5AvLAwG+jRpgpw@mail.gmail.com>
In-Reply-To: <CAN8TOE-LWj7+6NRZbKJDz=fvVgMVtRvA5UqJ5AvLAwG+jRpgpw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201310280854.15268.marex@denx.de>
Cc: Sourav Poddar <sourav.poddar@ti.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 stable@vger.kernel.org, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,

> On Sun, Oct 27, 2013 at 9:30 AM, Marek Vasut <marex@denx.de> wrote:
> > Hi Brian,
> > 
> > [...]
> > 
> >> @@ -1137,14 +1135,10 @@ static int m25p_probe(struct spi_device *spi)
> >> 
> >>  static int m25p_remove(struct spi_device *spi)
> >>  {
> >>  
> >>       struct m25p     *flash = spi_get_drvdata(spi);
> >> 
> >> -     int             status;
> >> 
> >>       /* Clean up MTD stuff. */
> >> 
> >> -     status = mtd_device_unregister(&flash->mtd);
> >> -     if (status == 0) {
> >> -             kfree(flash->command);
> >> -             kfree(flash);
> >> -     }
> >> +     mtd_device_unregister(&flash->mtd);
> >> +
> >> 
> >>       return 0;
> >>  
> >>  }
> > 
> > I wonder if we shouldn't return "status" in here in case
> > mtd_device_unregister() failed.
> 
> Sure, I thought of that earlier actually. I may send a trivial
> follow-up patch for this.

Sounds good, certainly better than mixing two things into one patch. Thanks!

Best regards,
Marek Vasut
