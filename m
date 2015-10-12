Received: from mail-pa0-x235.google.com ([2607:f8b0:400e:c03::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZlgIC-0007Qo-Jh
 for linux-mtd@lists.infradead.org; Mon, 12 Oct 2015 16:49:45 +0000
Received: by pabve7 with SMTP id ve7so100578410pab.2
 for <linux-mtd@lists.infradead.org>; Mon, 12 Oct 2015 09:49:23 -0700 (PDT)
Date: Mon, 12 Oct 2015 09:49:21 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Jagan Teki <jteki@openedev.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Marek Vasut <marex@denx.de>
Subject: Re: [PATCH 07/10] mtd: spi-nor: add mtd_is_locked() support
Message-ID: <20151012164921.GK107187@google.com>
References: <1441137435-52862-1-git-send-email-computersforpeace@gmail.com>
 <1441137435-52862-8-git-send-email-computersforpeace@gmail.com>
 <CAD6G_RSNEgg4s8pmUk0tEywOpNB1eD5kLXfyOv9=WPjsUa-+bw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD6G_RSNEgg4s8pmUk0tEywOpNB1eD5kLXfyOv9=WPjsUa-+bw@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Oct 01, 2015 at 02:30:40PM +0530, Jagan Teki wrote:
> On 2 September 2015 at 01:27, Brian Norris <computersforpeace@gmail.com> wrote:
> > This enables ioctl(MEMISLOCKED). Status can now be reported in the
> > mtdinfo or flash_lock utilities found in mtd-utils.
> >
> > Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> > ---
> >  drivers/mtd/spi-nor/spi-nor.c | 37 ++++++++++++++++++++++++++++++++++++-
> >  include/linux/mtd/spi-nor.h   |  3 +++
> >  2 files changed, 39 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> > index 62fa1b4ff3c0..c4fb1205f1d3 100644
> > --- a/drivers/mtd/spi-nor/spi-nor.c
> > +++ b/drivers/mtd/spi-nor/spi-nor.c
[...]
> > @@ -1151,11 +1184,13 @@ int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
> >         if (JEDEC_MFR(info) == SNOR_MFR_MICRON) {
> >                 nor->flash_lock = stm_lock;
> >                 nor->flash_unlock = stm_unlock;
> > +               nor->flash_is_locked = stm_is_locked;
> >         }
> >
> > -       if (nor->flash_lock && nor->flash_unlock) {
> > +       if (nor->flash_lock && nor->flash_unlock && nor->flash_is_locked) {
> >                 mtd->_lock = spi_nor_lock;
> >                 mtd->_unlock = spi_nor_unlock;
> > +               mtd->_is_locked = spi_nor_is_locked;
> 
> Need some understanding here, is this lock status call will be re-used
> at the time of _erase and _write calls for skipping locked area or
> sectors, if so how it re-used? Idea here is if user erase an area
> out-of which some part is locked and other unlocked the erase call
> should print the locked area and erase only unlocked area.

You can review the existing lock support in MTD to answer most of
this...

Currently, the lock APIs (mtd_lock(), mtd_unlock(), mtd_is_locked())
aren't automatically used for anything. They are mostly just supported
to provide an ioctl() interface, via MEMLOCK, MEMUNLOCK, MEMISLOCKED.
See mtdchar.c. These ioctls are supported in mtd-utils, so user programs
can handle the locking aspects on their own, if their system design
requires it. (e.g., this allows boot ROMs to be protected, while still
allowing unlock/reflash under specific circumstances.)

As it stands now, no one checks or reports errors if a block is locked
when the user tries to erase it. I guess it's up to the user to figure
that out right now.

I don't have a plan to change this right now, but if you had a good
proposal, then we could discuss. At first glance, I don't like the
suggestion to "print the locked area." That's not the right (primary)
way to report I/O errors. Anyway, that's all orthogonal to this patch.
The interface is already there; it's just not implemented in this
driver.

Brian
