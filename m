Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P5H6z-0000M7-N9
	for linux-mtd@lists.infradead.org; Mon, 11 Oct 2010 12:04:14 +0000
Received: by wwd20 with SMTP id 20so2850132wwd.18
	for <linux-mtd@lists.infradead.org>;
	Mon, 11 Oct 2010 05:04:10 -0700 (PDT)
MIME-Version: 1.0
Sender: kyungmin78@gmail.com
In-Reply-To: <1286797652-13610-1-git-send-email-roman.tereshonkov@nokia.com>
References: <1286797652-13610-1-git-send-email-roman.tereshonkov@nokia.com>
Date: Mon, 11 Oct 2010 21:04:10 +0900
Message-ID: <AANLkTi=ZvB_5eWJyJW2s4DQpt1emASrxZGGnxyhw3KFm@mail.gmail.com>
Subject: Re: [PATCH] mtd: onenand: fix 4KB page onenand chip recognition
From: Kyungmin Park <kmpark@infradead.org>
To: Roman Tereshonkov <roman.tereshonkov@nokia.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: rohit.hs@samsung.com, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Good catch. I didn't know that.
My 4KiB pagesize has 0x0102
and 2KiB pagesize has 0x0202

Acked-by: Kyungmin Park <kyungmin.park@samsung.com>

On Mon, Oct 11, 2010 at 8:47 PM, Roman Tereshonkov
<roman.tereshonkov@nokia.com> wrote:
> For 4Gb non-DDP chip it does not follow that it is always 4KB page chip.
> The number of data buffers is checked and if it is equal to 1
> we suppose that it is 4KB page onenand chip.
>
> Signed-off-by: Roman Tereshonkov <roman.tereshonkov@nokia.com>
> ---
> =A0drivers/mtd/onenand/onenand_base.c | =A0 =A05 +++--
> =A01 files changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/one=
nand_base.c
> index a2bb520..3684313 100644
> --- a/drivers/mtd/onenand/onenand_base.c
> +++ b/drivers/mtd/onenand/onenand_base.c
> @@ -3365,18 +3365,19 @@ static int onenand_lock_user_prot_reg(struct mtd_=
info *mtd, loff_t from,
> =A0static void onenand_check_features(struct mtd_info *mtd)
> =A0{
> =A0 =A0 =A0 =A0struct onenand_chip *this =3D mtd->priv;
> - =A0 =A0 =A0 unsigned int density, process;
> + =A0 =A0 =A0 unsigned int density, process, numbufs;
>
> =A0 =A0 =A0 =A0/* Lock scheme depends on density and process */
> =A0 =A0 =A0 =A0density =3D onenand_get_density(this->device_id);
> =A0 =A0 =A0 =A0process =3D this->version_id >> ONENAND_VERSION_PROCESS_SH=
IFT;
> + =A0 =A0 =A0 numbufs =3D this->read_word(this->base + ONENAND_REG_NUM_BU=
FFERS) >> 8;
>
> =A0 =A0 =A0 =A0/* Lock scheme */
> =A0 =A0 =A0 =A0switch (density) {
> =A0 =A0 =A0 =A0case ONENAND_DEVICE_DENSITY_4Gb:
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (ONENAND_IS_DDP(this))
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0this->options |=3D ONENAND=
_HAS_2PLANE;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 else
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 else if (numbufs =3D=3D 1)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0this->options |=3D ONENAND=
_HAS_4KB_PAGE;
>
> =A0 =A0 =A0 =A0case ONENAND_DEVICE_DENSITY_2Gb:
> --
> 1.7.0.4
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
