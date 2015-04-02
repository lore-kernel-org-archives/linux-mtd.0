Received: from mail-lb0-x22f.google.com ([2a00:1450:4010:c04::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YdgAZ-0006KU-31
 for linux-mtd@lists.infradead.org; Thu, 02 Apr 2015 14:32:31 +0000
Received: by lbdc10 with SMTP id c10so60594102lbd.2
 for <linux-mtd@lists.infradead.org>; Thu, 02 Apr 2015 07:32:08 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1427984026-31100-1-git-send-email-richard@nod.at>
References: <1427984026-31100-1-git-send-email-richard@nod.at>
Date: Thu, 2 Apr 2015 11:32:08 -0300
Message-ID: <CAOMZO5AeuCJB5anOt9Rq_H-HsLhXR9VZz0PDkN=R6aRPZN=+0g@mail.gmail.com>
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

> +       err = -ENOMEM;
> +       iobuf = kmalloc(mtd->erasesize, GFP_KERNEL);
> +       if (!iobuf)
> +               goto out;

The error handling here does not look right.

> +
> +       iobuf_orig = kmalloc(mtd->erasesize, GFP_KERNEL);
> +       if (!iobuf_orig)
> +               goto out;
> +
> +       prandom_bytes_state(&rnd_state, iobuf_orig, mtd->erasesize);
> +
> +       bit_flips = kcalloc(ebcnt, sizeof(unsigned long), GFP_KERNEL);
> +       if (!bit_flips)
> +               goto out;
> +
> +       bbt = kzalloc(ebcnt, GFP_KERNEL);
> +       if (!bbt)
> +               goto out;
> +
> +       err = mtdtest_scan_for_bad_eraseblocks(mtd, bbt, 0, ebcnt);
> +       if (err)
> +               goto out;
> +
> +       pr_info("erasing and programming flash\n");
> +       for (i = 0; i < ebcnt; ++i) {
> +               if (skip_blocks && i % skip_blocks != 0)
> +                       continue;
> +
> +               if (bbt[i])
> +                       continue;
> +
> +               ret = mtdtest_erase_eraseblock(mtd, i);
> +               if (ret) {
> +                       err = ret;
> +                       goto out;
> +               }
> +
> +               ret = mtdtest_write(mtd, i * mtd->erasesize, mtd->erasesize,
> +                                   iobuf_orig);
> +               if (ret) {
> +                       err = ret;
> +                       goto out;
> +               }
> +
> +               ret = mtdtest_relax();
> +               if (ret)
> +                       goto out;
> +       }
> +
> +       pr_info("starting read disturb test on every %ith block\n",
> +               skip_blocks);
> +       while (!ret) {
> +               for (i = 0; i < ebcnt; ++i) {
> +                       if (skip_blocks && i % skip_blocks != 0)
> +                               continue;
> +
> +                       if (bbt[i])
> +                               continue;
> +
> +                       ret = read_eraseblock_by_page(i, iteration);
> +
> +                       ret = mtdtest_relax();
> +                       if (ret)
> +                               goto out;
> +               }
> +
> +               iteration++;
> +               if (iteration % 1000 == 0)
> +                       pr_info("iteration %lu started\n", iteration);
> +       }
> +
> +       if (err)
> +               pr_info("finished with errors\n");
> +       else
> +               pr_info("finished\n");
> +
> +out:
> +
> +       kfree(bit_flips);
> +       kfree(iobuf);
> +       kfree(iobuf_orig);
> +       kfree(bbt);

,as you have a single label to handle all the free's.
