Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UFlTt-0006N7-8z
 for linux-mtd@lists.infradead.org; Wed, 13 Mar 2013 13:12:33 +0000
Message-ID: <1363180395.11441.57.camel@sauron.fi.intel.com>
Subject: Re: [PATCH V4 1/3] mtd: add new fields to nand_flash_dev{}
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
To: Huang Shijie <shijie8@gmail.com>
Date: Wed, 13 Mar 2013 15:13:15 +0200
In-Reply-To: <CAMiH66HyH7tQG96UMKed6prpqBa=sgyntdO1pf0yG+=qyigY0Q@mail.gmail.com>
References: <1362653364-29993-1-git-send-email-b32955@freescale.com>
 <1362653364-29993-2-git-send-email-b32955@freescale.com>
 <1363172096.11441.11.camel@sauron.fi.intel.com>
 <CAMiH66HyH7tQG96UMKed6prpqBa=sgyntdO1pf0yG+=qyigY0Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Huang Shijie <b32955@freescale.com>, computersforpeace@gmail.com,
 dwmw2@infradead.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
Reply-To: artem.bityutskiy@linux.intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2013-03-13 at 21:04 +0800, Huang Shijie wrote:
> On Wed, Mar 13, 2013 at 6:54 PM, Artem Bityutskiy
> <artem.bityutskiy@linux.intel.com> wrote:
> > On Thu, 2013-03-07 at 18:49 +0800, Huang Shijie wrote:
> >> diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
> >> index 591eeeb..f0a9d93 100644
> >> --- a/include/linux/mtd/nand.h
> >> +++ b/include/linux/mtd/nand.h
> >> @@ -578,6 +578,8 @@ struct nand_chip {
> >>   * @erasesize: eraseblock size in bytes (determined from the extended ID if 0)
> >>   * @chipsize: total chip size in MiB
> >>   * @options: stores various chip bit options
> >> + * @id_len: The valid length of the @id.
> >> + * @oobsize: OOB size
> >>   */
> >>  struct nand_flash_dev {
> >>       char *name;
> >> @@ -592,6 +594,8 @@ struct nand_flash_dev {
> >>       unsigned long chipsize;
> >>       unsigned long erasesize;
> >>       unsigned long options;
> >> +     unsigned long id_len;
> >> +     unsigned long oobsize;
> >>  };
> >
> > Why are these of type 'long', which is 64 bits in 64-bit architectures,
> > which seems to be unnecessarily big. Wouldn't 'unsigned int' be enough?
> >
> Frankly speaking, "uint16_t" is enough.
> "unsigned int" is too long for both the fields.

Adding a single uint16_t is useless because GCC will pad it to 32 bits
anyway. I send a patch which turns all the longs to ints. Just add
another int. And yes, do not add id_len unless you need it. Thanks!

-- 
Best Regards,
Artem Bityutskiy
