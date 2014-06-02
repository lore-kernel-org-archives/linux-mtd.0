Received: from mail-qg0-x22e.google.com ([2607:f8b0:400d:c04::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WrO1x-0000nA-Hh
 for linux-mtd@lists.infradead.org; Mon, 02 Jun 2014 08:55:46 +0000
Received: by mail-qg0-f46.google.com with SMTP id q108so9962100qgd.19
 for <linux-mtd@lists.infradead.org>; Mon, 02 Jun 2014 01:55:22 -0700 (PDT)
MIME-Version: 1.0
Sender: christian.riesch@gmail.com
In-Reply-To: <20140528064628.GE5241@norris-Latitude-E6410>
References: <1399270469-31022-1-git-send-email-christian.riesch@omicron.at>
 <1d461044-07e9-48f2-a863-aa1920524b31@mary.at.omicron.at>
 <20140528064628.GE5241@norris-Latitude-E6410>
Date: Mon, 2 Jun 2014 10:55:22 +0200
Message-ID: <CABkLObowSTc=Av8pv_o35bSGhvBiGQM09LYb-ki9RWdkVK5N_g@mail.gmail.com>
Subject: Re: [RESEND PATCH v4 2/4] mtd: cfi_cmdset_0002: Invalidate cache
 after entering/exiting OTP memory
From: Christian Riesch <christian.riesch@omicron.at>
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,
Thank you for your comments!

On Wed, May 28, 2014 at 8:46 AM, Brian Norris
<computersforpeace@gmail.com> wrote:
>
> On Mon, May 05, 2014 at 08:14:27AM +0200, Christian Riesch wrote:
> > --- a/drivers/mtd/chips/cfi_cmdset_0002.c
> > +++ b/drivers/mtd/chips/cfi_cmdset_0002.c
> > @@ -1157,11 +1157,42 @@ static int cfi_amdstd_read (struct mtd_info *mtd, loff_t from, size_t len, size_
> >  typedef int (*otp_op_t)(struct map_info *map, struct flchip *chip,
> >                       loff_t adr, size_t len, u_char *buf);
> >
> > +static inline void otp_enter(struct map_info *map, struct flchip *chip,
>
> Why is this function marked 'inline'? Is this to satisfy the comments
> regarding CONFIG_MTD_XIP and inlining functions? That all looks highly
> fragile ('inline' is not a guarantee, for instance).

I really don't remember why I marked it inline, it was more than a
year ago. Yes, probably due to the comments regarding CONFIG_MTD_XIP.
Christian

> And does anyone
> use CONFIG_MTD_XIP=y these days?

http://thread.gmane.org/gmane.linux.drivers.mtd/47127
It doesn't look like if there were lots of users. This is the only
thread mentioning the use of CONFIG_MTD_XIP on the mailing list in the
last years...

>
> If there are no good reasons otherwise, I'd say this trips over Chapter
> 15 of Documentation/CodingStyle.
>
> But if this is the only issue, then I'm OK taking the series as-is -- it
> has been pending for a long time, as you note...

If you would like me to change it, I'll send an update. But up to now
it seems to be the only issue.
Christian

>
> > +                          loff_t adr, size_t len)
> > +{
> > +     struct cfi_private *cfi = map->fldrv_priv;
> > +
> > +     cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi,
> > +                      cfi->device_type, NULL);
> > +     cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi,
> > +                      cfi->device_type, NULL);
> > +     cfi_send_gen_cmd(0x88, cfi->addr_unlock1, chip->start, map, cfi,
> > +                      cfi->device_type, NULL);
> > +
> > +     INVALIDATE_CACHED_RANGE(map, chip->start + adr, len);
> > +}
> > +
> > +static inline void otp_exit(struct map_info *map, struct flchip *chip,
>
> Same here.
>
> > +                         loff_t adr, size_t len)
> > +{
> > +     struct cfi_private *cfi = map->fldrv_priv;
> > +
> > +     cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi,
> > +                      cfi->device_type, NULL);
> > +     cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi,
> > +                      cfi->device_type, NULL);
> > +     cfi_send_gen_cmd(0x90, cfi->addr_unlock1, chip->start, map, cfi,
> > +                      cfi->device_type, NULL);
> > +     cfi_send_gen_cmd(0x00, cfi->addr_unlock1, chip->start, map, cfi,
> > +                      cfi->device_type, NULL);
> > +
> > +     INVALIDATE_CACHED_RANGE(map, chip->start + adr, len);
> > +}
> > +
> >  static inline int do_read_secsi_onechip(struct map_info *map, struct flchip *chip, loff_t adr, size_t len, u_char *buf)
> >  {
> >       DECLARE_WAITQUEUE(wait, current);
> >       unsigned long timeo = jiffies + HZ;
> > -     struct cfi_private *cfi = map->fldrv_priv;
> >
> >   retry:
> >       mutex_lock(&chip->mutex);
>
> Brian
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
