MIME-Version: 1.0
In-Reply-To: <1327306361-9803-2-git-send-email-shubhrajyoti@ti.com>
References: <1327306361-9803-1-git-send-email-shubhrajyoti@ti.com>
 <1327306361-9803-2-git-send-email-shubhrajyoti@ti.com>
Date: Fri, 27 Jan 2012 11:08:01 -0800
Message-ID: <CAN8TOE9a=OUcs-37RtDJE6ig-aZdFkSmfOrzL2PAyEgbQ+dJjw@mail.gmail.com>
Subject: Re: [PATCH RFC 1/2] mtd : Prevent the NULL pointer access
From: Brian Norris <computersforpeace@gmail.com>
To: Shubhrajyoti D <shubhrajyoti@ti.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: David Woodhouse <dwmw2@infradead.org>, linux-omap@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jan 23, 2012 at 12:12 AM, Shubhrajyoti D <shubhrajyoti@ti.com> wrot=
e:
> This patch intends to fix the null pointer access.
>
> Signed-off-by: Shubhrajyoti D <shubhrajyoti@ti.com>
> ---
> =A0drivers/mtd/mtdcore.c | =A0 =A05 +++--
> =A01 files changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
> index 6ae9ca0..2b3bda7 100644
> --- a/drivers/mtd/mtdcore.c
> +++ b/drivers/mtd/mtdcore.c
> @@ -118,8 +118,9 @@ static void mtd_release(struct device *dev)
> =A0static int mtd_cls_suspend(struct device *dev, pm_message_t state)
> =A0{
> =A0 =A0 =A0 =A0struct mtd_info *mtd =3D dev_get_drvdata(dev);
> -
> - =A0 =A0 =A0 return mtd_suspend(mtd);
> + =A0 =A0 =A0 if (mtd)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return mtd_suspend(mtd);
> + =A0 =A0 =A0 return 0;
> =A0}
>
> =A0static int mtd_cls_resume(struct device *dev)

Forgot this patch was here; this fix is also covered in
l2-mtd-2.6.git, waiting for inclusion in the 3.3-rcX release cycle.
Thanks for the work though!

Brian
