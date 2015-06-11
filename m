Received: from mail-vn0-x236.google.com ([2607:f8b0:400c:c0f::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z2wA0-0003Q8-NV
 for linux-mtd@lists.infradead.org; Thu, 11 Jun 2015 06:40:21 +0000
Received: by vnbg7 with SMTP id g7so11461176vnb.1
 for <linux-mtd@lists.infradead.org>; Wed, 10 Jun 2015 23:39:59 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAC7eWMVyEyy3Y_qWU5qxOY4m9bm15u7Ga3sZrUyLqY_zgy=a8Q@mail.gmail.com>
References: <CAC7eWMUvdiNFiiGqSkmv1qwFDUa52VZCCQds_BdnqocoskN+Qg@mail.gmail.com>
 <CAC7eWMVyEyy3Y_qWU5qxOY4m9bm15u7Ga3sZrUyLqY_zgy=a8Q@mail.gmail.com>
Date: Thu, 11 Jun 2015 08:39:59 +0200
Message-ID: <CAFLxGvwGZAT1cLVX_Q5sdkoUEs=EhVGr0cknWLXuxFfW-biFmQ@mail.gmail.com>
Subject: Re: Trouble with UBIFS
From: Richard Weinberger <richard.weinberger@gmail.com>
To: Smitha Rathnam <rathnam.smitha@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jun 11, 2015 at 6:58 AM, Smitha Rathnam
<rathnam.smitha@gmail.com> wrote:
> Hi,
>
> With respect to the UBIFS issue.. How do I come to a conclusion that
> it is a hardware fault and not a software one?

By analyzing the issue you're facing.

> We are using Micron nand devices in our system.
> The UBI rootfs is put on /dev/mtd4 and the ubi logfs is put on
> /dev/mtd5. The mtd5 partition shows corruption. When we format the
> device and reinstall, the corruption goes away. Of course, we have
> lost data.
> So should this be enough to conclude that this is an issue with
> software and not the actual NAND device?

No way. At least share the full kernel log, including the issue with us.

> I ran the nandtest from the mtd_utils set. Before the format the test
> showed a lot of ECC errors. After the format and reinstall, the test
> showed no ECC failures although there were 4 bad blocks.
> How do we understand this? Is this enough to conclude that the issue
> is a software one related to the file system?

Please verify your MTD driver by running mtd-tests (from kernel source),
and UBI tests (from mtd-utils source).

-- 
Thanks,
//richard
