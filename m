Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YdgCI-0007R2-HD
 for linux-mtd@lists.infradead.org; Thu, 02 Apr 2015 14:34:19 +0000
Message-ID: <551D5352.8060305@nod.at>
Date: Thu, 02 Apr 2015 16:33:54 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] mtd: Add simple read disturb test
References: <1427984026-31100-1-git-send-email-richard@nod.at>
 <CAOMZO5AeuCJB5anOt9Rq_H-HsLhXR9VZz0PDkN=R6aRPZN=+0g@mail.gmail.com>
In-Reply-To: <CAOMZO5AeuCJB5anOt9Rq_H-HsLhXR9VZz0PDkN=R6aRPZN=+0g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
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

Am 02.04.2015 um 16:32 schrieb Fabio Estevam:
> On Thu, Apr 2, 2015 at 11:13 AM, Richard Weinberger <richard@nod.at> wrote:
> 
>> +       err = -ENOMEM;
>> +       iobuf = kmalloc(mtd->erasesize, GFP_KERNEL);
>> +       if (!iobuf)
>> +               goto out;
> 
> The error handling here does not look right.
> 
>> +
>> +       iobuf_orig = kmalloc(mtd->erasesize, GFP_KERNEL);
>> +       if (!iobuf_orig)
>> +               goto out;
>> +
>> +       prandom_bytes_state(&rnd_state, iobuf_orig, mtd->erasesize);
>> +
>> +       bit_flips = kcalloc(ebcnt, sizeof(unsigned long), GFP_KERNEL);
>> +       if (!bit_flips)
>> +               goto out;
>> +
>> +       bbt = kzalloc(ebcnt, GFP_KERNEL);
>> +       if (!bbt)
>> +               goto out;
>> +
>> +       err = mtdtest_scan_for_bad_eraseblocks(mtd, bbt, 0, ebcnt);
>> +       if (err)
>> +               goto out;
>> +
>> +       pr_info("erasing and programming flash\n");
>> +       for (i = 0; i < ebcnt; ++i) {
>> +               if (skip_blocks && i % skip_blocks != 0)
>> +                       continue;
>> +
>> +               if (bbt[i])
>> +                       continue;
>> +
>> +               ret = mtdtest_erase_eraseblock(mtd, i);
>> +               if (ret) {
>> +                       err = ret;
>> +                       goto out;
>> +               }
>> +
>> +               ret = mtdtest_write(mtd, i * mtd->erasesize, mtd->erasesize,
>> +                                   iobuf_orig);
>> +               if (ret) {
>> +                       err = ret;
>> +                       goto out;
>> +               }
>> +
>> +               ret = mtdtest_relax();
>> +               if (ret)
>> +                       goto out;
>> +       }
>> +
>> +       pr_info("starting read disturb test on every %ith block\n",
>> +               skip_blocks);
>> +       while (!ret) {
>> +               for (i = 0; i < ebcnt; ++i) {
>> +                       if (skip_blocks && i % skip_blocks != 0)
>> +                               continue;
>> +
>> +                       if (bbt[i])
>> +                               continue;
>> +
>> +                       ret = read_eraseblock_by_page(i, iteration);
>> +
>> +                       ret = mtdtest_relax();
>> +                       if (ret)
>> +                               goto out;
>> +               }
>> +
>> +               iteration++;
>> +               if (iteration % 1000 == 0)
>> +                       pr_info("iteration %lu started\n", iteration);
>> +       }
>> +
>> +       if (err)
>> +               pr_info("finished with errors\n");
>> +       else
>> +               pr_info("finished\n");
>> +
>> +out:
>> +
>> +       kfree(bit_flips);
>> +       kfree(iobuf);
>> +       kfree(iobuf_orig);
>> +       kfree(bbt);
> 
> ,as you have a single label to handle all the free's.

Why? Free()ing a NULL pointer is perfectly fine.
What did I miss? :)

Thanks,
//richard
