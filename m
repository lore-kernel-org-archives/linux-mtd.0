Received: from mail-ie0-x234.google.com ([2607:f8b0:4001:c03::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WmJfC-0007YB-29
 for linux-mtd@lists.infradead.org; Mon, 19 May 2014 09:15:18 +0000
Received: by mail-ie0-f180.google.com with SMTP id tp5so2150771ieb.39
 for <linux-mtd@lists.infradead.org>; Mon, 19 May 2014 02:14:56 -0700 (PDT)
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <5379C2E8.5040000@huawei.com>
References: <1400488570-20288-1-git-send-email-zhenzhang.zhang@huawei.com>
 <5379C2E8.5040000@huawei.com>
Date: Mon, 19 May 2014 11:14:56 +0200
Message-ID: <CAMuHMdVyVyKifhntPBeFS893MfkugYsMpKOizfDD8CqzPP96vQ@mail.gmail.com>
Subject: Re: [PATCH] ubi: replace simple_strtoul() with kstrtoul()
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Zhang Zhen <zhenzhang.zhang@huawei.com>
Content-Type: text/plain; charset=UTF-8
Cc: Hu Jianyang <hujianyang@huawei.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>, adrian.hunter@intel.com,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Please don't add mindless casts!

On Mon, May 19, 2014 at 10:38 AM, Zhang Zhen <zhenzhang.zhang@huawei.com> wrote:
> --- a/drivers/mtd/ubi/build.c
> +++ b/drivers/mtd/ubi/build.c
> @@ -1190,10 +1190,13 @@ static struct mtd_info * __init open_mtd_by_chdev(const char *mtd_dev)
>  static struct mtd_info * __init open_mtd_device(const char *mtd_dev)
>  {
>         struct mtd_info *mtd;
> -       int mtd_num;
> +       int mtd_num, ret;
>         char *endp;
>
> -       mtd_num = simple_strtoul(mtd_dev, &endp, 0);
> +       endp = (char *)mtd_dev;
> +       ret = kstrtoul(endp, 0, (unsigned long *)&mtd_num);

On 64-bit, long is 64-bit, hence this will write beyond mtd_num and will corrupt
the stack.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
