Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UCpJN-0005ME-Lk
 for linux-mtd@lists.infradead.org; Tue, 05 Mar 2013 10:41:34 +0000
Message-ID: <1362480128.2943.51.camel@sauron>
Subject: Re: [PATCH 12/12] mtd: nand: provision full ID support
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Huang Shijie <shijie8@gmail.com>
Date: Tue, 05 Mar 2013 12:42:08 +0200
In-Reply-To: <CAMiH66GvpQZ36wLvB_cyiSk79sPPJ+vBKba1Z6WZvi5UD4X=2g@mail.gmail.com>
References: <1362415349-7107-1-git-send-email-dedekind1@gmail.com>
 <1362415349-7107-13-git-send-email-dedekind1@gmail.com>
 <CAMiH66GvpQZ36wLvB_cyiSk79sPPJ+vBKba1Z6WZvi5UD4X=2g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Huang Shijie <b32955@freescale.com>,
 Brian Norris <computersforpeace@gmail.com>, Mike Dunn <mikedunn@newsguy.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2013-03-05 at 14:08 +0800, Huang Shijie wrote:
> >  struct nand_flash_dev {
> >         char *name;
> > -       int dev_id;
> > +       union {
> > +               struct {
> > +                       uint8_t mfr_id;
> > +                       uint8_t dev_id;
> > +               };
> > +               uint8_t id[8];
> > +       };
> >
> We can add a new helper like compare_nand_with_devid() to remove the
> mfr_id and dev_id, only left the id[8].

Huang, did you miss the "union { ... }" part or you think using 'id[N]'
directly is readable enough?

-- 
Best Regards,
Artem Bityutskiy
