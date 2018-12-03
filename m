Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gTjLa-0002fy-EV
 for linux-mtd@lists.infradead.org; Mon, 03 Dec 2018 08:12:55 +0000
Received: by mail-wm1-x344.google.com with SMTP id z18so4689917wmc.4
 for <linux-mtd@lists.infradead.org>; Mon, 03 Dec 2018 00:12:43 -0800 (PST)
MIME-Version: 1.0
References: <CGME20181128080244eucas1p15d9478c4fdbb0609005a12d24703d6d8@eucas1p1.samsung.com>
 <1543392134-1443-1-git-send-email-huijin.park@samsung.com>
In-Reply-To: <1543392134-1443-1-git-send-email-huijin.park@samsung.com>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Date: Mon, 3 Dec 2018 09:12:30 +0100
Message-ID: <CACna6rxstGQNmr-9Bi=BEcYgcXV9QqOiXLGfNFC4Y7DmFMVryw@mail.gmail.com>
Subject: Re: [PATCH v3] mtd: spi-nor: cast to u64 to avoid uint overflows
To: huijin.park@samsung.com
Cc: Boris Brezillon <boris.brezillon@bootlin.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-mtd@lists.infradead.org,
 bbanghj.park@gmail.com
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 28 Nov 2018 at 09:03, Huijin Park <huijin.park@samsung.com> wrote:
> From: "huijin.park" <huijin.park@samsung.com>
>
> The "params->size" is defined as "u64".
> And "info->sector_size" and "info->n_sectors" are defined as
> unsigned int and u16.
> Thus, u64 data might have strange data(loss data) if the result
> overflows an unsigned int.
> This patch casts "info->sector_size" to an u64.
>
> Signed-off-by: huijin.park <huijin.park@samsung.com>

You may want to adjust your git's "user.name" config to avoid
"malforming" your name (From and Signed-off-by) in the further
contributions :)

Something like
git config --global user.name "John Foo"
