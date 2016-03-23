Received: from mail-wm0-x229.google.com ([2a00:1450:400c:c09::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aipqQ-0000LA-UI
 for linux-mtd@lists.infradead.org; Wed, 23 Mar 2016 20:57:36 +0000
Received: by mail-wm0-x229.google.com with SMTP id l68so40210581wml.1
 for <linux-mtd@lists.infradead.org>; Wed, 23 Mar 2016 13:57:13 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1457923684-13505-1-git-send-email-peterpandong@micron.com>
References: <1457923684-13505-1-git-send-email-peterpandong@micron.com>
Date: Wed, 23 Mar 2016 17:57:12 -0300
Message-ID: <CAAEAJfCtjSrSgqDFs_F67Kqm6=7TOZ-p3x1gYRL5_hRdTsDfZg@mail.gmail.com>
Subject: Re: [PATCH 00/11] mtd: nand_bbt: introduce independent nand BBT
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Peter Pan <peterpansjtu@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Jiancheng Xue <xuejiancheng@huawei.com>,
 beanhuo@micron.com, karlzhang@micron.com, Peter Pan <peterpandong@micron.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

On 13 March 2016 at 23:47, Peter Pan <peterpansjtu@gmail.com> wrote:
> Sorry for send the v3 out late. I went through a busy time in the past
> two month.
>
> Currently nand_bbt.c is tied with struct nand_chip, and it makes other
> NAND family chips hard to use nand_bbt.c. Maybe it's the reason why
> onenand has own bbt(onenand_bbt.c).
>
> Separate struct nand_chip from BBT code can make current BBT shareable.
> We create struct nand_bbt to take place of nand_chip in nand_bbt.c.
> Struct nand_bbt contains all the information BBT needed from outside and
> it should be embedded into NAND family chip struct (such as struct nand_c=
hip).
>
> Below is mtd folder structure we want:
>         drivers/mtd/nand/<all-nand-core-code>
>         drivers/mtd/nand/raw/<raw-nand-controller-drivers>
>         drivers/mtd/nand/spi/<spi-nand-code>
>         drivers/mtd/nand/onenand/<onenand-code>
>         drivers/mtd/nand/chips/<manufacturer-spcific-code>
>

You mention this structure, but nothing in the current patchset is actually
enforcing it. This is more the future direction we are going.

> Most of the patch is borrowed from Brian Norris <computersforpeace@gmail.=
com>.
> http://git.infradead.org/users/norris/linux-mtd.git/shortlog/refs/heads/n=
and-bbt
> I decided the authorship of each patch by contribution. Please let me kno=
w if
> there is something unproper.
> Based on Brian's suggestion and Boris's comments, I make 11 independent
> patches. Previous patch is http://patchwork.ozlabs.org/patch/492066/
> After discussion with Boris and Ezequiel, I realized above structure is b=
etter,
> so I drop the patch to move nand_bbt.c to mtd folder.
>

I have reviewed this patchset, and it looks mostly good to me. I can
spot trivial style comments, or comments related to the commit logs, or the
way commits are splitted.

Boris will probably have more insightful comments to make.

However, before starting my silly bikeshedding I'd like to know if we all
agree with the patchset's overall scheme.

It would be good to finally move forward with this, to take mt29f out
of staging and also support other SPI NAND vendors.

Thanks!
--=20
Ezequiel Garc=C3=ADa, VanguardiaSur
www.vanguardiasur.com.ar
