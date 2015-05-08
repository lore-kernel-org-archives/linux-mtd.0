Received: from mail-wg0-x234.google.com ([2a00:1450:400c:c00::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yqf6i-0007S2-JH
 for linux-mtd@lists.infradead.org; Fri, 08 May 2015 10:02:13 +0000
Received: by wgic8 with SMTP id c8so41214366wgi.1
 for <linux-mtd@lists.infradead.org>; Fri, 08 May 2015 03:01:49 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1425418844-25177-3-git-send-email-fransklaver@gmail.com>
References: <1425418844-25177-1-git-send-email-fransklaver@gmail.com>
 <1425418844-25177-3-git-send-email-fransklaver@gmail.com>
Date: Fri, 8 May 2015 12:01:49 +0200
Message-ID: <CAH6sp9Ng2VUUS62eOR-KRjq5CcPeZQL9BMF1nGCD6fkiJa173w@mail.gmail.com>
Subject: Re: [PATCH 02/60] mtd: core: set some defaults when dev.parent is set
From: Frans Klaver <fransklaver@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: linux-mtd@lists.infradead.org, Frans Klaver <fransklaver@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Mar 3, 2015 at 10:39 PM, Frans Klaver <fransklaver@gmail.com> wrote:
> If a parent device is set, add_mtd_device() has enough knowledge to fill
> in some sane default values for the module name and owner. Do so if they
> aren't already set.
>
> Signed-off-by: Frans Klaver <fransklaver@gmail.com>
> ---
>  drivers/mtd/mtdcore.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
> index 2093676..487e467 100644
> --- a/drivers/mtd/mtdcore.c
> +++ b/drivers/mtd/mtdcore.c
> @@ -412,6 +412,15 @@ int add_mtd_device(struct mtd_info *mtd)
>         mtd->erasesize_mask = (1 << mtd->erasesize_shift) - 1;
>         mtd->writesize_mask = (1 << mtd->writesize_shift) - 1;
>
> +       if (mtd->dev.parent) {
> +               if (!mtd->owner)
> +                       mtd->owner = mtd->dev.parent->driver->owner;

Turns out that driver pointer is not guaranteed to be set. I don't
have the overview on whether this is something that only occurs with
nandsim, or whether it is possible to have an actual device without a
driver.

It is of course easy to prevent the NULL dereference, but that does
mean the requirement for owner becomes slightly more complex than
"only necessary if you don't have a parent device". Unless someone has
objections, I'll probably resend the series with this bit looking more
like

+ if (mtd->dev.parent) {
+        if (!mtd->owner && mtd->dev.parent->driver)
+                mtd->owner = ...

Nandsim seems to not have any issues with this.The drivers I've
changed to rely on this seem to all have driver set.

Thanks,
Frans
