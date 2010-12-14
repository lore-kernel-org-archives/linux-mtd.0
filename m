Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PSIaa-00025k-OS
	for linux-mtd@lists.infradead.org; Tue, 14 Dec 2010 00:17:58 +0000
Received: by wwb17 with SMTP id 17so41929wwb.18
	for <linux-mtd@lists.infradead.org>;
	Mon, 13 Dec 2010 16:17:54 -0800 (PST)
MIME-Version: 1.0
Sender: kyungmin78@gmail.com
In-Reply-To: <20101213122057.20685.68480.sendpatchset@ahunter-work.research.nokia.com>
References: <20101213122042.20685.52929.sendpatchset@ahunter-work.research.nokia.com>
	<20101213122057.20685.68480.sendpatchset@ahunter-work.research.nokia.com>
Date: Tue, 14 Dec 2010 09:17:54 +0900
Message-ID: <AANLkTi=0W8NuF3SNhWwjwDZtuCzyOM8219_pXG=9pU6O@mail.gmail.com>
Subject: Re: [PATCH 2/7] mtd: OneNAND: add enable / disable methods to
	onenand_chip
From: Kyungmin Park <kyungmin.park@samsung.com>
To: Adrian Hunter <adrian.hunter@nokia.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: Tony Lindgren <tony@atomide.com>,
	linux-mtd Mailing List <linux-mtd@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Now I'm used the clock gating for OneNAND instead of regulator.
so I think the mechanism is similar.

On Mon, Dec 13, 2010 at 9:20 PM, Adrian Hunter <adrian.hunter@nokia.com> wr=
ote:
> From 16b760999cb79f9cf71728c9253f1399717be63a Mon Sep 17 00:00:00 2001
> From: Adrian Hunter <adrian.hunter@nokia.com>
> Date: Fri, 19 Feb 2010 15:39:52 +0100
> Subject: [PATCH 2/7] mtd: OneNAND: add enable / disable methods to onenan=
d_chip
>
> Add enable / disable methods called from get_device() / release_device().
> These can be used, for example, to allow the driver to prevent the voltag=
e
> regulator from being put to sleep while OneNAND is in use.
>
> Signed-off-by: Adrian Hunter <adrian.hunter@nokia.com>
> ---
> =A0drivers/mtd/onenand/onenand_base.c | =A0 =A04 ++++
> =A0include/linux/mtd/onenand.h =A0 =A0 =A0 =A0| =A0 =A02 ++
> =A02 files changed, 6 insertions(+), 0 deletions(-)
>
> diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/one=
nand_base.c
> index c38bf9c..bde274f 100644
> --- a/drivers/mtd/onenand/onenand_base.c
> +++ b/drivers/mtd/onenand/onenand_base.c
> @@ -948,6 +948,8 @@ static int onenand_get_device(struct mtd_info *mtd, i=
nt new_state)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (this->state =3D=3D FL_READY) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0this->state =3D new_state;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0spin_unlock(&this->chip_lo=
ck);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (this->enable)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 this->enabl=
e(mtd);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (new_state =3D=3D FL_PM_SUSPENDED) {

I put the code the end of function like:

static int onenand_get_device(struct mtd_info *mtd, int new_state)
{
        struct onenand_chip *this =3D mtd->priv;
        DECLARE_WAITQUEUE(wait, current);

        /*
         * Grab the lock and see if the device is available
         */
        while (1) {
                spin_lock(&this->chip_lock);
                if (this->state =3D=3D FL_READY) {
                        this->state =3D new_state;
                        spin_unlock(&this->chip_lock);
                        break;
                }
                if (new_state =3D=3D FL_PM_SUSPENDED) {
                        spin_unlock(&this->chip_lock);
                        return (this->state =3D=3D FL_PM_SUSPENDED) ? 0 : -=
EAGAIN;
                }
                set_current_state(TASK_UNINTERRUPTIBLE);
                add_wait_queue(&this->wq, &wait);
                spin_unlock(&this->chip_lock);
                schedule();
                remove_wait_queue(&this->wq, &wait);
        }

        if (this->clk)
                clk_enable(this->clk);

        return 0;
}


> @@ -974,6 +976,8 @@ static void onenand_release_device(struct mtd_info *m=
td)
> =A0{
> =A0 =A0 =A0 =A0struct onenand_chip *this =3D mtd->priv;
>
> + =A0 =A0 =A0 if (this->state !=3D FL_PM_SUSPENDED && this->disable)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 this->disable(mtd);
Need to check the SUSPENDED at here? when enter the suspend get_device
is called.
release device is called when resume. so no need to check
FL_PM_SUSPENDED in my case.

> =A0 =A0 =A0 =A0/* Release the chip */
> =A0 =A0 =A0 =A0spin_lock(&this->chip_lock);
> =A0 =A0 =A0 =A0this->state =3D FL_READY;

and put the same as like:

static void onenand_release_device(struct mtd_info *mtd)
{
        struct onenand_chip *this =3D mtd->priv;

        /* Release the chip */
        spin_lock(&this->chip_lock);
        this->state =3D FL_READY;
        wake_up(&this->wq);
        spin_unlock(&this->chip_lock);

        if (this->clk)
                clk_disable(this->clk);
}

Thank you,
Kyungmin Park

> diff --git a/include/linux/mtd/onenand.h b/include/linux/mtd/onenand.h
> index 6da3fe3..ae418e4 100644
> --- a/include/linux/mtd/onenand.h
> +++ b/include/linux/mtd/onenand.h
> @@ -118,6 +118,8 @@ struct onenand_chip {
> =A0 =A0 =A0 =A0int (*chip_probe)(struct mtd_info *mtd);
> =A0 =A0 =A0 =A0int (*block_markbad)(struct mtd_info *mtd, loff_t ofs);
> =A0 =A0 =A0 =A0int (*scan_bbt)(struct mtd_info *mtd);
> + =A0 =A0 =A0 int (*enable)(struct mtd_info *mtd);
> + =A0 =A0 =A0 int (*disable)(struct mtd_info *mtd);
>
> =A0 =A0 =A0 =A0struct completion =A0 =A0 =A0 complete;
> =A0 =A0 =A0 =A0int =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 irq;
> --
> 1.7.0.4
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
