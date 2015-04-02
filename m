Received: from mail-lb0-x22a.google.com ([2a00:1450:4010:c04::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ydgdr-0002k0-1n
 for linux-mtd@lists.infradead.org; Thu, 02 Apr 2015 15:02:48 +0000
Received: by lbdc10 with SMTP id c10so61260939lbd.2
 for <linux-mtd@lists.infradead.org>; Thu, 02 Apr 2015 08:02:24 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1427984026-31100-1-git-send-email-richard@nod.at>
References: <1427984026-31100-1-git-send-email-richard@nod.at>
Date: Thu, 2 Apr 2015 12:02:24 -0300
Message-ID: <CAOMZO5A8im4c126wZyD8tv1B0-2mvsgh5bfZ1mJWyMhG0fNM_Q@mail.gmail.com>
Subject: Re: [PATCH] mtd: Add simple read disturb test
From: Fabio Estevam <festevam@gmail.com>
To: Richard Weinberger <richard@nod.at>
Content-Type: text/plain; charset=UTF-8
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Apr 2, 2015 at 11:13 AM, Richard Weinberger <richard@nod.at> wrote:

> +               ret = mtdtest_erase_eraseblock(mtd, i);
> +               if (ret) {
> +                       err = ret;
> +                       goto out;
> +               }

Why not just do like this instead?

              err = mtdtest_erase_eraseblock(mtd, i);
              if (err)
                 goto out;

> +
> +               ret = mtdtest_write(mtd, i * mtd->erasesize, mtd->erasesize,
> +                                   iobuf_orig);
> +               if (ret) {
> +                       err = ret;
> +                       goto out;
> +               }

Same here.

> +               ret = mtdtest_relax();
> +               if (ret)
> +                       goto out;

Here you propagate the wrong error. You test for 'ret' and propagate 'err'.
