Received: from mail-pa0-x236.google.com ([2607:f8b0:400e:c03::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XgrrT-0007S6-CP
 for linux-mtd@lists.infradead.org; Wed, 22 Oct 2014 09:05:43 +0000
Received: by mail-pa0-f54.google.com with SMTP id rd3so2597143pab.13
 for <linux-mtd@lists.infradead.org>; Wed, 22 Oct 2014 02:05:21 -0700 (PDT)
Date: Wed, 22 Oct 2014 02:05:17 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: Re: [PATCH] mtd: bcm47xxpart: only register partitions if the trx
 header was filled
Message-ID: <20141022090517.GQ16128@brian-ubuntu>
References: <1411338793-21245-1-git-send-email-hauke@hauke-m.de>
 <CACna6rw+DmGzKhg-YKot8n+w-cYt9XoPzcUc5eK42WnDbPU39g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACna6rw+DmGzKhg-YKot8n+w-cYt9XoPzcUc5eK42WnDbPU39g@mail.gmail.com>
Cc: Hauke Mehrtens <hauke@hauke-m.de>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Woodhouse,
 David" <David.Woodhouse@intel.com>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Sep 23, 2014 at 02:27:59PM +0200, Rafał Miłecki wrote:
> On 22 September 2014 00:33, Hauke Mehrtens <hauke@hauke-m.de> wrote:
> > diff --git a/drivers/mtd/bcm47xxpart.c b/drivers/mtd/bcm47xxpart.c
> > index 8057f52..c3f4454 100644
> > --- a/drivers/mtd/bcm47xxpart.c
> > +++ b/drivers/mtd/bcm47xxpart.c
> > @@ -168,18 +168,22 @@ static int bcm47xxpart_parse(struct mtd_info *master,
> >                                 i++;
> >                         }
> >
> > -                       bcm47xxpart_add_part(&parts[curr_part++], "linux",
> > -                                            offset + trx->offset[i], 0);
> > -                       i++;
> > +                       if (trx->offset[i]) {
> > +                               bcm47xxpart_add_part(&parts[curr_part++], "linux",
> > +                                                    offset + trx->offset[i], 0);
> 
> You may at least move "linux" to the next line to don't exceed 80
> chars limit. Same for "rootfs" below.

Rewrapped and pushed to l2-mtd.git.

Brian
